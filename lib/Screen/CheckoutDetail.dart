import 'dart:convert';

import 'package:ecommerce/Modal/CheckOutModal.dart';
import 'package:ecommerce/Modal/ChekOutDetailModal.dart';
import 'package:ecommerce/Modal/PaymentMthodsModal.dart';
import 'package:ecommerce/Modal/PaypalModal.dart';
import 'package:ecommerce/Modal/UserSelectAddModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/Adressform.dart';
import 'package:ecommerce/Screen/AllAddpage.dart';
import 'package:ecommerce/Screen/CartPage.dart';
import 'package:ecommerce/Screen/PaypalThanks.dart';
import 'package:ecommerce/Screen/ThankyouPage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:flutter_paypal/flutter_paypal.dart';
import 'package:sizer/sizer.dart';

class CheckoutDetail extends StatefulWidget {
  String? address;
  String? firstname;
  String? lastname;
  String? addid;
  String? page;

  CheckoutDetail(
      {super.key,
      this.page,
      this.address,
      this.firstname,
      this.lastname,
      required this.addid});

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

var selected = "i1";

int selected1 = 0;

bool isLoading = true;

List<String> genderOptions = ["Male", "Female"];

class _CheckoutDetailState extends State<CheckoutDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Paymethod();
    checkoutap();
    userselectaddap();
    print(paymethodmodal?.data?.cod?.status);
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade50,
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(
                    horizontal: 2.w,
                    vertical: 2.h,
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => CartPage()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 25.sp,
                                )),
                            Text(
                              "CheckOut",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(
                              onPressed: () {},
                              icon: Icon(null),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 3.w),
                        child: Text(
                          "Shipping Address",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: "task",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(
                            horizontal: 2.w, vertical: 1.h),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Column(
                              children: [
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 2.h),
                                    child: Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisSize: MainAxisSize.min,
                                      children: [
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Row(
                                              children: [
                                                Text(
                                                  widget.page == "1"
                                                      ? (userselectaddmodal
                                                              ?.selectShippingAddress
                                                              ?.firstName)
                                                          .toString()
                                                      : widget.firstname
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "task"),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text(
                                                  widget.page == "1"
                                                      ? (userselectaddmodal
                                                              ?.selectShippingAddress
                                                              ?.lastName)
                                                          .toString()
                                                      : widget.lastname
                                                          .toString(),
                                                  style: TextStyle(
                                                      fontSize: 16.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "task"),
                                                ),
                                              ],
                                            ),
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            Adressform()));
                                              },
                                              child: Text(
                                                "Add New",
                                                style: TextStyle(
                                                    fontSize: 16.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xfff7941d),
                                                    fontFamily: "task"),
                                              ),
                                            ),
                                          ],
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 75.w,
                                              child: Text(
                                                widget.page == "1"
                                                    ? userselectaddmodal
                                                                    ?.selectShippingAddress
                                                                    ?.address ==
                                                                '' ||
                                                            userselectaddmodal
                                                                    ?.selectShippingAddress
                                                                    ?.address ==
                                                                null
                                                        ? 'N/A'
                                                        : (userselectaddmodal
                                                                ?.selectShippingAddress
                                                                ?.address)
                                                            .toString()
                                                    : widget.address == '' ||
                                                            widget.address ==
                                                                null
                                                        ? 'N/A'
                                                        : widget.address
                                                            .toString(),
                                                style: TextStyle(
                                                    fontSize: 15.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "task"),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              AllAddpage()));
                                                },
                                                child: Icon(
                                                    Icons.arrow_forward_ios))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 1.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Methods",
                                      style: TextStyle(
                                        fontSize: 20.sp,
                                        fontFamily: "task",
                                        fontWeight: FontWeight.bold,
                                      ),
                                    )
                                  ],
                                ),
                                SizedBox(
                                  height: 1.80.h,
                                ),
                                Container(
                                  width: 110.w,
                                  height: 23.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Padding(
                                    padding:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        paymethodmodal?.data?.paypal?.status ==
                                                false
                                            ? GestureDetector(
                                                onTap: () {
                                                  buildErrorDialog(
                                                      context,
                                                      'Sorry',
                                                      'Paypal is Not Available for this Product');
                                                },
                                                child: Container(
                                                  padding: EdgeInsets.all(2.w),
                                                  width: 80.w,
                                                  decoration: BoxDecoration(
                                                    color: Colors.grey
                                                        .withOpacity(0.2),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.sp),
                                                    border: Border.all(
                                                      color: Colors.black12,
                                                      // Border color
                                                      width:
                                                          2.0, // Border width
                                                    ),
                                                  ),
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment.start,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Image.asset(
                                                        "assets/paypal2.png",
                                                        height: 5.h,
                                                        width: 20.w,
                                                      ),
                                                      SizedBox(
                                                        width: 5.w,
                                                      ),
                                                      Text("Pay Using PayPal",
                                                          style: TextStyle(
                                                            color: Colors.grey,
                                                            fontSize: 17.sp,
                                                            fontFamily: 'match',
                                                          )),
                                                    ],
                                                  ),
                                                ),
                                              )
                                            : GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    selected1 = 1;
                                                  });
                                                },
                                                child: Container(
                                                  width: 80.w,
                                                  padding: EdgeInsets.all(2.w),
                                                  decoration: BoxDecoration(
                                                    color: selected1 == 1
                                                        ? Color(0xfff7941d)
                                                            .withOpacity(0.06)
                                                        : Colors.white
                                                            .withOpacity(0.04),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            15.sp),
                                                    border: Border.all(
                                                      color: selected1 == 1
                                                          ? Color(0xfff7941d)
                                                          : Colors.black12,
                                                      // Border color
                                                      width:
                                                          2.0, // Border width
                                                    ),
                                                  ),
                                                  child: Center(
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          "assets/paypal.png",
                                                          height: 5.h,
                                                          width: 20.w,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text("Pay Using PayPal",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 17.sp,
                                                              fontFamily:
                                                                  'task',
                                                            )),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                              ),
                                        SizedBox(
                                          height: 2.h,
                                        ),
                                        Column(
                                          children: [
                                            paymethodmodal?.data?.cod?.status ==
                                                    false
                                                ? GestureDetector(
                                                    onTap: () {
                                                      buildErrorDialog(
                                                          context,
                                                          'Sorry',
                                                          'Cash on Delivery is Not Available for this Product');
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(2.w),
                                                      width: 80.w,
                                                      decoration: BoxDecoration(
                                                        color: Colors.grey
                                                            .withOpacity(0.2),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.sp),
                                                        border: Border.all(
                                                          color: Colors.black12,
                                                          // Border color
                                                          width:
                                                              2.0, // Border width
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/cod2.png",
                                                            height: 5.h,
                                                            width: 20.w,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                              "Cash On Delivery",
                                                              style: TextStyle(
                                                                color:
                                                                    Colors.grey,
                                                                fontSize: 17.sp,
                                                                fontFamily:
                                                                    'match',
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  )
                                                : GestureDetector(
                                                    onTap: () {
                                                      print(paymethodmodal
                                                          ?.data?.cod?.status);
                                                      setState(() {
                                                        selected1 = 2;
                                                      });
                                                    },
                                                    child: Container(
                                                      padding:
                                                          EdgeInsets.all(2.w),
                                                      width: 80.w,
                                                      decoration: BoxDecoration(
                                                        color: selected1 == 2
                                                            ? Color(0xfff7941d)
                                                                .withOpacity(
                                                                    0.06)
                                                            : Colors.white
                                                                .withOpacity(
                                                                    0.04),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(
                                                                    15.sp),
                                                        border: Border.all(
                                                          color: selected1 == 2
                                                              ? Color(
                                                                  0xfff7941d)
                                                              : Colors.black12,
                                                          // Border color
                                                          width:
                                                              2.0, // Border width
                                                        ),
                                                      ),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          Image.asset(
                                                            "assets/cod1.png",
                                                            height: 5.h,
                                                            width: 20.w,
                                                          ),
                                                          SizedBox(
                                                            width: 5.w,
                                                          ),
                                                          Text(
                                                              "Cash On Delivery",
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 17.sp,
                                                                fontFamily:
                                                                    'match',
                                                              )),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                            SizedBox(
                                              height: 2.h,
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: 95.w,
                              height: 13.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffffffff),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                child: Column(
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sub Total',
                                          style: TextStyle(
                                              fontFamily: 'task',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          (chekoutdetailmodal?.finalTotal) ==
                                                  null
                                              ? "N/A"
                                              : '₹' +
                                                  (viewcartmodal?.finalTotal)
                                                      .toString(),
                                          style: TextStyle(
                                              fontFamily: 'task',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Tax(10%)',
                                          style: TextStyle(
                                              fontFamily: 'task',
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                              color: Colors.black),
                                        ),
                                        Text(
                                          (chekoutdetailmodal?.totalTax) == null
                                              ? "N/A"
                                              : '₹' +
                                                  (viewcartmodal?.totalTax)
                                                      .toString(),
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 15.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: 93.w,
                              height: 8.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffffffff),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Total Amount',
                                      style: TextStyle(
                                        fontFamily: 'task',
                                        fontSize: 17.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      (chekoutdetailmodal?.finalTotalWithTax) ==
                                              null
                                          ? "N/A"
                                          : '₹' +
                                              (viewcartmodal?.finalTotalWithTax)
                                                  .toString(),
                                      style: TextStyle(
                                        fontFamily: 'task',
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 5.h,
                      ),
                      GestureDetector(
                        onTap: selected1 == 2
                            ? () {
                                checkoutcodap();
                              }
                            : selected1 == 1
                                ? () {
                                    double total = double.parse(
                                        (viewcartmodal?.finalTotalWithTax)
                                            .toString());
                                    String add = widget.page == "1"
                                        ? (userselectaddmodal
                                                ?.selectShippingAddress
                                                ?.address)
                                            .toString()
                                        : widget.address.toString();
                                    String name = widget.page == "1"
                                        ? (userselectaddmodal
                                                ?.selectShippingAddress
                                                ?.firstName)
                                            .toString()
                                        : widget.firstname.toString();
                                    String formattedNumber =
                                        total.toStringAsFixed(2);

                                    print(total);
                                    print(formattedNumber);

                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => UsePaypal(
                                              sandboxMode: true,
                                              clientId: paymethodmodal?.data
                                                      ?.paypal?.clientID ??
                                                  '',
                                              secretKey: paymethodmodal?.data
                                                      ?.paypal?.secretKey ??
                                                  '',
                                              returnURL:
                                                  "https://samplesite.com/return",
                                              cancelURL:
                                                  "https://samplesite.com/cancel",
                                              transactions: [
                                                {
                                                  "amount": {
                                                    "total": formattedNumber,
                                                    "currency": "USD",
                                                    "details": {
                                                      "subtotal":
                                                          formattedNumber,
                                                      "shipping": '0',
                                                      "shipping_discount": 0
                                                    }
                                                  },
                                                  "description":
                                                      "The payment transaction description.",
                                                  "item_list": {
                                                    "items": [],
                                                    "shipping_address": {
                                                      "recipient_name": name,
                                                      "line1": add,
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
                                              note:
                                                  "Contact us for any questions on your order.",
                                              onSuccess: (Map params) async {
                                                EasyLoading.show(
                                                    status:
                                                        'Processing Your Payment ..',
                                                    indicator:
                                                        CircularProgressIndicator(
                                                      backgroundColor:
                                                          Color(0xfff7941d),
                                                      color: Colors.white,
                                                    ));
                                                print(
                                                    "onSuccess:- Uid: ${usermodal?.userId} , Add Id: ${widget.addid} , PaymenId: ${params['paymentId']} , type : paypal");
                                                checkoutpaypalap(
                                                    params['paymentId']);
                                              },
                                              onError: (error) {
                                                EasyLoading.show(
                                                    status:
                                                        'Processing Your Payment ..',
                                                    indicator:
                                                        CircularProgressIndicator(
                                                      backgroundColor:
                                                          Color(0xfff7941d),
                                                      color: Colors.white,
                                                    ));
                                                checkoutpaypalap('');
                                                print("onError: $error");
                                                EasyLoading.showError(
                                                  "Payment Error",
                                                );
                                                Navigator.pop(context);
                                              },
                                              onCancel: (params) {
                                                EasyLoading.show(
                                                    status:
                                                        'Processing Your Payment ..',
                                                    indicator:
                                                        CircularProgressIndicator(
                                                      backgroundColor:
                                                          Color(0xfff7941d),
                                                      color: Colors.white,
                                                    ));

                                                print('cancelled: $params');
                                                EasyLoading.showError(
                                                  "Payment Cancelled",
                                                );
                                              }),
                                        ));
                                  }
                                : paymethodmodal?.data?.cod?.status == false &&
                                        paymethodmodal?.data?.paypal?.status ==
                                            false
                                    ? () {
                                        buildErrorDialog(context, '',
                                            "No payment method available at this time");
                                      }
                                    : () {
                                        buildErrorDialog(context, '',
                                            "Please choose your payment method");
                                      },
                        child: Container(
                            margin: EdgeInsets.only(right: 7.w, left: 7.w),
                            alignment: Alignment.center,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xfff7941d)),
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                  fontSize: 20.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "task"),
                            )),
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  checkoutap() {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutapi(data).then((response) async {
          chekoutdetailmodal =
              ChekOutDetailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              chekoutdetailmodal?.status == "success") {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  checkoutcodap() {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['payment'] = 'cod';
    data['shipping_address_id'] = widget.addid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutcodapi(data).then((response) async {
          checkoutmodal = CheckOutModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              checkoutmodal?.status == "success") {
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ThankyouPage(
                      uid: (checkoutmodal?.cartDetails?.orderNumber).toString(),
                    )));
            print(checkoutmodal?.status);
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  checkoutpaypalap(String payId) {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['paymentID'] = payId;
    data['type'] = 'paypal';
    data['shipping_address_id'] = widget.addid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutpaypalapi(data).then((response) async {
          paypalmodal = PaypalModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && paypalmodal?.status == "success") {
            EasyLoading.showSuccess(
              "Payment Done",
            );
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (context) => PaypalThanks(
                  uid: payId,
                ),
              ),
            );
            print(checkoutmodal?.status);
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  Paymethod() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().PaymethodApi().then((response) async {
          paymethodmodal = PaymethodModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && paymethodmodal?.status == true) {
            print(paymethodmodal?.data);
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  userselectaddap() async {
    final Map<String, String> data = {};
    data['shipping_address_id'] = widget.addid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userselectapi(data).then((response) async {
          userselectaddmodal =
              UserSelectAddModal.fromJson(json.decode(response.body));
          print(userselectaddmodal?.status);
          if (response.statusCode == 200 &&
              userselectaddmodal?.status == "success") {
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
