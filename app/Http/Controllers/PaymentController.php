<?php

namespace App\Http\Controllers;

use App\Models\Order;
use App\Models\User;
use Illuminate\Http\Request;

class PaymentController extends Controller
{
    public function payment(Request $request)
    {
        if ($request->has('callback')) {
            Order::where(['id' => $request->order_id])->update(['callback' => $request['callback']]);
        }

        session()->put('customer_id', $request['customer_id']);
        session()->put('order_id', $request->order_id);

        $customer = User::find($request['customer_id']);

        $order = Order::where(['id' => $request->order_id, 'user_id' => $request['customer_id']])->first();

        if (isset($customer) && isset($order)) {
            // \Midtrans\Config::$serverKey = 'SB-Mid-server-Cdm_DmRCzJ94n43T77l3ChZK';
            // \Midtrans\Config::$isProduction = false;
            // \Midtrans\Config::$isSanitized = true;
            // \Midtrans\Config::$is3ds = true;

            $data = [
                'name' => $customer['f_name'],
                'email' => $customer['email'],
                'phone' => $customer['phone'],
            ];

            // $orderDetails = Order::with(['details'])->where(['id' => $request->order_id])->first();

            // if ($order->order_type == 'take_away') {
            //     $orderDetails->order_amount = $orderDetails->order_amount - $order->delivery_charge;
            // }

            // $products = [];
            // foreach ($orderDetails->details as $detail) {
            //     array_push($products, [
            //         'id' => $detail->food_id,
            //         'quantity' => $detail->quantity,
            //         'price' => $detail->price,
            //         'name' => $detail->food ? $detail->food['name'] : $detail->campaign['name'],
            //     ]);
            // }

            // $params = array(
            //     'transaction_details' => array(
            //         'order_id' => session('order_id'),
            //         'gross_amount' => $orderDetails->order_amount,
            //     ),
            //     'item_details' => $products,
            //     'customer_details' => array(
            //         'first_name' => $customer['f_name'],
            //         'last_name' => $customer['l_name'],
            //         'email' => $customer['email'],
            //         'phone' => $customer['phone'],
            //     ),
            // );


            // $snapToken = \Midtrans\Snap::getSnapToken($params);

            session()->put('data', $data);
            // return view('payment-view', ['snap_token' => $snapToken]);
            return view('payment-view');
        }

        return response()->json(['errors' => ['code' => 'order-payment', 'message' => 'Data not found']], 403);
    }

    public function success()
    {
        $callback = null;

        $order = Order::where(['id' => session('order_id'), 'user_id' => session('customer_id')])->first();

        if (isset($order)) $callback = $order->callback;

        if ($callback != null) {
            return redirect($order->callback . '&status=success');
        }
        return response()->json(['message' => 'Payment succeeded'], 200);
    }

    public function fail()
    {
        $callback = null;

        $order = Order::where(['id' => session('order_id'), 'user_id' => session('customer_id')])->first();

        if (isset($order)) $callback = $order->callback;

        if ($callback != null) {
            return redirect($order->callback . '&status=fail');
        }
        return response()->json(['message' => 'Payment failed'], 403);
    }
}
