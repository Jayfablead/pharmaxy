import 'package:flutter/material.dart';
import 'package:flutter_paypal/flutter_paypal.dart';

class paypal extends StatefulWidget {
  const paypal({Key? key}) : super(key: key);

  @override
  State<paypal> createState() => _paypalState();
}

class _paypalState extends State<paypal> {
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      resizeToAvoidBottomInset: false,
      body: Center(
        child: TextButton(
            onPressed: () => {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) =>
                      UsePaypal(
                      sandboxMode: true,
                      clientId:
                      "ATL1N-TdcwUidsaRFnpY8qX66_pHvRPNM8QoAGA2zJ9DdwoMyGTxr9DaGuq3LmUWT9uDqlDtaqW7V91s",
                      secretKey:
                      "ECwRQ-E4nkepD4xE79mTlIGiwbrsx5vuJu4ZA3Def84bFnxkKB8VynD8c5bik4zwHnY5VORGczAb4Q0q",
                      returnURL: "https://samplesite.com/return",
                      cancelURL: "https://samplesite.com/cancel",
                      transactions: const [
                        {
                          "amount": {
                            "total": '10.12',
                            "currency": "USD",
                            "details": {
                              "subtotal": '10.12',
                              "shipping": '0',
                              "shipping_discount": 0
                            }
                          },
                          "description":
                          "The payment transaction description.",
                          // "payment_options": {
                          //   "allowed_payment_method":
                          //       "INSTANT_FUNDING_SOURCE"
                          // },
                          "item_list": {
                            "items": [

                            ],

                            // shipping address is not required though
                            "shipping_address": {
                              "recipient_name": "Jane Foster",
                              "line1": "Travis County",
                              "line2": "",
                              "city": "Austin",
                              "country_code": "US",
                              "postal_code": "73301",
                              "phone": "+00000000",
                              "state": "Texas"
                            },
                          }
                        }
                      ],
                      note: "Contact us for any questions on your order.",
                      onSuccess: (Map params) async {
                        print("onSuccess: $params");
                      },
                      onError: (error) {
                        print("onError: $error");
                      },
                      onCancel: (params) {
                        print('cancelled: $params');

                      }),
                ),
              )
            },
            child: const Text("Make Payment")),
      ),
    );
  }
}
