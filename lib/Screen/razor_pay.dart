import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

class razor_pay extends StatefulWidget {
  const razor_pay({super.key});

  @override
  State<razor_pay> createState() => _razor_payState();
}

class _razor_payState extends State<razor_pay> {
  Razorpay? _razorpay;

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Fluttertoast.showToast(
        msg: "SUCCESS PAYMENT:${response.paymentId}", timeInSecForIosWeb: 4);
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Fluttertoast.showToast(
        msg: "ERROR HERE:${response.code} - ${response.message}",
        timeInSecForIosWeb: 4);
  }

  void _handlePaymentWallet(ExternalWalletResponse response) {
    Fluttertoast.showToast(
        msg: "EXTERNAL_WALLET IS:${response.walletName}",
        timeInSecForIosWeb: 4);
  }

  void MakePayment() async {
    var options = {
      'key': 'rzp_test_PpcP4lRqMy1lGK',
      'amount': 100,
      'name': 'Acme Corp.',
      'description': 'Fine T-Shirt',
      'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
    };
    try {
      _razorpay?.open(options);
    } catch (e) {
      debugPrint(e.toString());
    }
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          SizedBox(
            height: 5.h,
          ),
          Center(
            child: ElevatedButton(
              onPressed: () {
                MakePayment();
              },
              child: Text("BUY"),
            ),
          ),
        ],
      ),
    );
  }
}
