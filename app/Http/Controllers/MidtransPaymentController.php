<?php

namespace App\Http\Controllers;

use Illuminate\Http\Request;
use Illuminate\Support\Str;
use App\Models\Order;
use App\CentralLogics\Helpers;
use Midtrans\Config as Midtrans;
use Illuminate\Support\Facades\Config;
use Illuminate\Support\Facades\Redirect;
use Midtrans\Notification;
use Brian2694\Toastr\Facades\Toastr;
use Illuminate\Support\Facades\DB;
// use Illuminate\Support\Facades\Session;



class MidtransPaymentController extends Controller
{

    public function payment(Request $request, $order_id)
    {
        $callback = $request['callback'];
        $amount = $request['amount'];

        return $request;
    }

    public function payWithMidtrans(Request $request)
    {
        Midtrans::$serverKey = 'SB-Mid-server-Cdm_DmRCzJ94n43T77l3ChZK';
        Midtrans::$isProduction = false;
        Midtrans::$isSanitized = true;
        Midtrans::$is3ds = true;

        $tr_ref = Str::random(6) . '-' . rand(1, 1000);
        $order = Order::with(['details'])->where(['id' => session('order_id')])->first();
        $customer = $order->customer;
        $delivery_address = json_decode($order->delivery_address);

        // dd($order);

        /// START INITIATE PAYLOAD SEND TO MIDTRANS
        $transaction_details = array(
            'order_id' => $order->id,
            'gross_amount' => intval($order->order_amount),
        );

        $products = [];
        foreach ($order->details as $detail) {
            // dd($order->details);
            $food_details = json_decode($detail->food_details);
            $add_ons = json_decode($detail->add_ons);
            array_push($products, [
                'id' => $detail->food_id,
                'price' => $detail->price,
                'quantity' => $detail->quantity,
                'name' => $food_details->name,
            ]);
            if (count($add_ons) != 0 && $add_ons != null) {
                foreach ($add_ons as $add_on) {
                    array_push($products, [
                        'id' => $add_on->id,
                        'price' => $add_on->price,
                        'quantity' => $add_on->quantity,
                        'name' => 'Add Ons(' . $add_on->name . ')',
                    ]);
                }
            }
        }
        
        // dd($products);

        if ($order->total_tax_amount != 0.00 || $order->total_tax_amount != 0) {
            array_push($products, [
                'id' => 'T01',
                'price' => $order->total_tax_amount,
                'quantity' => 1,
                'name' => 'Tax'
            ]);
        }

        if ($order->restaurant_discount_amount != 0.00 || $order->restaurant_discount_amount != 0) {
            array_push($products, [
                'id' => 'D01',
                'price' => -$order->restaurant_discount_amount,
                'quantity' => 1,
                'name' => 'Discount',
            ]);
        }

        if ($order->order_type != 'take_away') {
            array_push($products, [
                'id' => 0000001,
                'price' => $order->original_delivery_charge,
                'quantity' => 1,
                'name' => 'Delivery Fee',
            ]);
        }

        $shipping_address = array(
            'first_name'    => $customer['f_name'],
            'last_name'     => $customer['l_name'] == null ? '' : $customer['l_name'],
            'address'       => $delivery_address->address,
            'phone'         => $delivery_address->contact_person_number,
            'country_code'  => 'IDN'
        );

        $customer_details = array(
            'first_name'    => $customer->f_name,
            'last_name'     => $customer->l_name == null ? '' : $customer->l_name,
            'email'         => $customer->email,
            'phone'         => $customer->phone,
            'shipping_address' => $shipping_address
        );


        /// SAVE PAYLOAD IN PARAMS
        $params = array(
            'transaction_details' => $transaction_details,
            'customer_details' => $customer_details,
            'item_details' => $products,
        );

        // dd($params);

        DB::table('orders')->where('id', $order->id)->update([
            'transaction_reference' => $tr_ref,
            'payment_method' => 'midtrans',
            'order_status' => 'failed',
            'failed' => now(),
            'updated_at' => now(),
        ]);

        try {
            $paymentUrl = \Midtrans\Snap::createTransaction($params)->redirect_url;

            if (isset($paymentUrl)) {
                return Redirect::away($paymentUrl);
            }
        } catch (\Exception $e) {
            info($e);
            Toastr::error(trans('messages.misconfiguration_or_data_missing'));
            return back();
        }
    }

    public function getPaymentStatus(Request $request)
    {
        Midtrans::$serverKey = 'SB-Mid-server-Cdm_DmRCzJ94n43T77l3ChZK';
        Midtrans::$isProduction = false;

        try {
            $notif = new Notification();
        } catch (\Exception $e) {
            exit($e->getMessage());
        }

        $transaction = $notif->transaction_status;
        $type = $notif->payment_type;
        $order_id = $notif->order_id;
        $order = Order::where('id', $order_id)->first();

        if ($transaction == 'settlement') {
            try {
                $order->order_status = 'confirmed';
                $order->payment_method = $type;
                $order->transaction_reference = $order->transaction_reference;
                $order->payment_status = 'paid';
                $order->confirmed = now();
                $order->save();
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
                info($e);
                Order::where('id', $order_id)
                    ->update([
                        'payment_method' => 'midtrans',
                        'order_status' => 'failed',
                        'failed' => now(),
                        'updated_at' => now(),
                    ]);
            }
        } else if ($transaction == 'pending') {
            try {
                $order->order_status = 'pending';
                $order->payment_status = 'unpaid';
                $order->pending = now();
                $order->save();
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
                info($e);
            }
        } else if ($transaction == 'deny') {
            try {
                $order->order_status = 'failed';
                $order->payment_status = 'unpaid';
                $order->failed = now();
                $order->save();
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
                info($e);
            }
        } else if ($transaction == 'expire') {
            // TODO set payment status in merchant's database to 'expire'
            echo "Payment using " . $type . " for transaction order_id: " . $order_id . " is expired.";
        } else if ($transaction == 'cancel') {
            try {
                $order->order_status = 'canceled';
                $order->payment_status = 'unpaid';
                $order->canceled = now();
                $order->save();
                Helpers::send_order_notification($order);
            } catch (\Exception $e) {
                info($e);
            }
        }
    }
}
