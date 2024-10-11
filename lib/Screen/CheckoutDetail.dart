// import 'dart:convert';
//
// import 'package:ecommerce/Modal/CheckOutModal.dart';
// import 'package:ecommerce/Modal/ChekOutDetailModal.dart';
// import 'package:ecommerce/Modal/PaymentMthodsModal.dart';
// import 'package:ecommerce/Modal/PaypalModal.dart';
// import 'package:ecommerce/Modal/StripeModal.dart';
// import 'package:ecommerce/Modal/UserSelectAddModal.dart';
// import 'package:ecommerce/Provider/Authprovider.dart';
// import 'package:ecommerce/Screen/AddCardPage.dart';
// import 'package:ecommerce/Screen/Adressform.dart';
// import 'package:ecommerce/Screen/AllAddpage.dart';
// import 'package:ecommerce/Screen/CartPage.dart';
// import 'package:ecommerce/Screen/PaypalThanks.dart';
// import 'package:ecommerce/Screen/ThankyouPage.dart';
// import 'package:ecommerce/Widget/Const.dart';
// import 'package:ecommerce/Widget/buildErrorDialog.dart';
// import 'package:ecommerce/Widget/loder.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_easyloading/flutter_easyloading.dart';
// import 'package:flutter_paypal/flutter_paypal.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:razorpay_flutter/razorpay_flutter.dart';
// import 'package:sizer/sizer.dart';
//
// class CheckoutDetail extends StatefulWidget {
//   String? address;
//   String? firstname;
//   String? lastname;
//   String? addid;
//   String? page;
//
//   String? name;
//   String? cvv;
//   String? em;
//   String? ey;
//   String? cn;
//
//   CheckoutDetail(
//       {super.key,
//       this.page,
//       this.address,
//       this.firstname,
//       this.lastname,
//       this.name,
//       this.cvv,
//       this.em,
//       this.ey,
//       this.cn,
//       required this.addid});
//
//   @override
//   State<CheckoutDetail> createState() => _CheckoutDetailState();
// }
//
// Razorpay? _razorpay;
// var selected = "i1";
// String name = '';
// String name1 = '';
// int selectedpayment = 0;
//
// bool isLoading = true;
//
// List<String> genderOptions = ["Male", "Female"];
//
// void MakePayment(String fname, String lname) async {
//   var options = {
//     'key': paymethodmodal?.data?.razorpayData?.keyId ?? '',
//     'amount': double.parse((viewcartmodal?.finalTotalWithTax).toString()) * 100,
//     'name': '${fname} ${lname}',
//     'description': 'Fine T-Shirt',
//     'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
//   };
//   try {
//     _razorpay?.open(options);
//   } catch (e) {
//     debugPrint(e.toString());
//   }
// }
//
// class _CheckoutDetailState extends State<CheckoutDetail> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     void _handlePaymentSuccess(PaymentSuccessResponse response) {
//       Fluttertoast.showToast(
//           msg: "SUCCESS PAYMENT:${response.paymentId}", timeInSecForIosWeb: 4);
//       checkoutpaypalap(response.paymentId ?? '');
//     }
//
//     void _handlePaymentError(PaymentFailureResponse response) {
//       Fluttertoast.showToast(
//           msg: "ERROR HERE:${response.code} - ${response.message}",
//           timeInSecForIosWeb: 4);
//     }
//
//     void _handlePaymentWallet(ExternalWalletResponse response) {
//       Fluttertoast.showToast(
//           msg: "EXTERNAL_WALLET IS:${response.walletName}",
//           timeInSecForIosWeb: 4);
//     }
//
//     _razorpay = Razorpay();
//     _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
//     _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
//     _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);
//
//     setState(() {
//       selectedpayment = 0;
//       name = widget.page == "1"
//           ? (userselectaddmodal?.selectShippingAddress?.firstName).toString()
//           : widget.firstname.toString();
//       name1 = widget.page == "1"
//           ? (userselectaddmodal?.selectShippingAddress?.lastName).toString()
//           : widget.lastname.toString();
//     });
//
//     print('Page : ${widget.page}');
//     print('Add Id : ${widget.addid}');
//     print('Add name : ${widget.firstname}');
//     print('Add name2 : ${widget.lastname}');
//     print('Address : ${widget.address}');
//     Paymethod();
//     checkoutap();
//     userselectaddap();
//   }
//
//   @override
//   Widget build(BuildContext context) {
//     return commanScreen(
//       isLoading: isLoading,
//       scaffold: Scaffold(
//         resizeToAvoidBottomInset: false,
//         backgroundColor: Colors.grey.shade50,
//         body: SingleChildScrollView(
//           child: isLoading
//               ? Container()
//               : Padding(
//                   padding: EdgeInsets.symmetric(
//                     horizontal: 2.w,
//                     vertical: 2.h,
//                   ),
//                   child: Column(
//                     mainAxisAlignment: MainAxisAlignment.start,
//                     crossAxisAlignment: CrossAxisAlignment.start,
//                     children: [
//                       SizedBox(
//                         height: 3.h,
//                       ),
//                       Container(
//                         width: MediaQuery.of(context).size.width,
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                           children: [
//                             IconButton(
//                                 onPressed: () {
//                                   Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => CartPage(),
//                                     ),
//                                   );
//                                 },
//                                 icon: Icon(
//                                   Icons.arrow_back_ios_new_outlined,
//                                   size: 18.sp,
//                                 )),
//                             Text(
//                               "Checkout",
//                               style: TextStyle(
//                                 fontSize: 16.sp,
//                                 fontFamily: "task",
//                                 fontWeight: FontWeight.bold,
//                               ),
//                             ),
//                             IconButton(
//                               onPressed: () {},
//                               icon: Icon(null),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 3.h,
//                       ),
//                       Padding(
//                         padding: EdgeInsets.only(left: 3.w),
//                         child: Text(
//                           "Shipping Address",
//                           style: TextStyle(
//                             fontSize: 13.sp,
//                             fontFamily: "task",
//                             fontWeight: FontWeight.bold,
//                           ),
//                         ),
//                       ),
//                       SizedBox(height: 1.h,),
//                       Padding(
//                         padding: EdgeInsets.symmetric(
//                             horizontal: 2.w, vertical: 1.h),
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           children: [
//                             Column(
//                               children: [
//                                 Container(
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white),
//                                   child: Padding(
//                                     padding: EdgeInsets.symmetric(
//                                         horizontal: 3.w, vertical: 2.h),
//                                     child: Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       mainAxisSize: MainAxisSize.min,
//                                       children: [
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             Row(
//                                               children: [
//                                                 Text(
//                                                   widget.page == "1"
//                                                       ? (userselectaddmodal
//                                                               ?.selectShippingAddress
//                                                               ?.firstName)
//                                                           .toString()
//                                                       : widget.firstname
//                                                           .toString(),
//                                                   style: TextStyle(
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily: "task"),
//                                                 ),
//                                                 SizedBox(
//                                                   width: 1.w,
//                                                 ),
//                                                 Text(
//                                                   widget.page == "1"
//                                                       ? (userselectaddmodal
//                                                               ?.selectShippingAddress
//                                                               ?.lastName)
//                                                           .toString()
//                                                       : widget.lastname
//                                                           .toString(),
//                                                   style: TextStyle(
//                                                       fontSize: 12.sp,
//                                                       fontWeight:
//                                                           FontWeight.bold,
//                                                       fontFamily: "task"),
//                                                 ),
//                                               ],
//                                             ),
//                                             GestureDetector(
//                                               onTap: () {
//                                                 Navigator.of(context).push(
//                                                     MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             Adressform()));
//                                               },
//                                               child: Text(
//                                                 "Add New",
//                                                 style: TextStyle(
//                                                     fontSize: 12.sp,
//                                                     fontWeight:
//                                                         FontWeight.normal,
//                                                     color: Color(0xff0061b0),
//                                                     fontFamily: "task"),
//                                               ),
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         Row(
//                                           mainAxisAlignment:
//                                               MainAxisAlignment.spaceBetween,
//                                           children: [
//                                             SizedBox(
//                                               width: 75.w,
//                                               child: Text(
//                                                 widget.page == "1"
//                                                     ? userselectaddmodal
//                                                                     ?.selectShippingAddress
//                                                                     ?.address ==
//                                                                 '' ||
//                                                             userselectaddmodal
//                                                                     ?.selectShippingAddress
//                                                                     ?.address ==
//                                                                 null
//                                                         ? 'N/A'
//                                                         : (userselectaddmodal
//                                                                 ?.selectShippingAddress
//                                                                 ?.address)
//                                                             .toString()
//                                                     : widget.address == '' ||
//                                                             widget.address ==
//                                                                 null
//                                                         ? 'N/A'
//                                                         : widget.address
//                                                             .toString(),
//                                                 style: TextStyle(
//                                                     fontSize: 14.sp,
//                                                     color: Colors.black,
//                                                     fontWeight:
//                                                         FontWeight.normal,
//                                                     fontFamily: "task"),
//                                               ),
//                                             ),
//                                             GestureDetector(
//                                                 onTap: () {
//                                                   Navigator.of(context)
//                                                       .pushReplacement(
//                                                           MaterialPageRoute(
//                                                               builder: (context) =>
//                                                                   AllAddpage()));
//                                                 },
//                                                 child: Icon(Icons.arrow_forward_ios,size: 15.sp,))
//                                           ],
//                                         ),
//                                       ],
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(
//                                   height: 2.h,
//                                 ),
//                                 Row(
//                                   mainAxisAlignment: MainAxisAlignment.start,
//                                   children: [
//                                     Text(
//                                       "Payment Methods",
//                                       style: TextStyle(
//                                         fontSize: 13.sp,
//                                         fontFamily: "task",
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     )
//                                   ],
//                                 ),
//                                 SizedBox(
//                                   height: 1.80.h,
//                                 ),
//                                 Container(
//                                   width: 110.w,
//                                   padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 2.h),
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Colors.white),
//                                   child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.center,
//                                     mainAxisAlignment:
//                                         MainAxisAlignment.center,
//                                     children: [
//                                       paymethodmodal?.data?.paypal?.status ==
//                                               false
//                                           ? GestureDetector(
//                                               onTap: () {
//                                                 buildErrorDialog(
//                                                     context,
//                                                     'Sorry',
//                                                     'Paypal is Not Available at this time');
//                                               },
//                                               child: Container(
//                                                 // width: 80.w,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.2),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.sp),
//                                                   border: Border.all(
//                                                     color: Colors.black12,
//                                                     // Border color
//                                                     width:
//                                                         2.0, // Border width
//                                                   ),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/paypal2.png",
//                                                       height: 5.h,
//                                                       width: 20.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     Text("Pay Using PayPal",
//                                                         style: TextStyle(
//                                                           color: Colors.grey,
//                                                           fontSize: 17.sp,
//                                                           fontFamily: 'match',
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                             )
//                                           : GestureDetector(
//                                               onTap: () {
//                                                 setState(() {
//                                                   selectedpayment = 1;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 width: 80.w,
//                                                 padding: EdgeInsets.all(2.w),
//                                                 decoration: BoxDecoration(
//                                                   color: selectedpayment == 1
//                                                       ? Color(0xfff7941d)
//                                                           .withOpacity(0.06)
//                                                       : Colors.white
//                                                           .withOpacity(0.04),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.sp),
//                                                   border: Border.all(
//                                                     color: selectedpayment ==
//                                                             1
//                                                         ? Color(0xfff7941d)
//                                                         : Colors.black12,
//                                                     // Border color
//                                                     width:
//                                                         2.0, // Border width
//                                                   ),
//                                                 ),
//                                                 child: Center(
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Image.asset(
//                                                         "assets/paypal.png",
//                                                         height: 5.h,
//                                                         width: 19.w,
//                                                       ),
//                                                       SizedBox(
//                                                         width: 5.w,
//                                                       ),
//                                                       Text("Pay Using PayPal",
//                                                           style: TextStyle(
//                                                             color:
//                                                                 Colors.black,
//                                                             fontSize: 13.sp,
//                                                             fontFamily:
//                                                                 'task',
//                                                           )),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                       SizedBox(
//                                         height: 2.h,
//                                       ),
//                                       Column(
//                                         children: [
//                                           paymethodmodal?.data?.cod?.status ==
//                                                   false
//                                               ? GestureDetector(
//                                                   onTap: () {
//                                                     buildErrorDialog(
//                                                         context,
//                                                         'Sorry',
//                                                         'Cash on Delivery is Not Available at this time');
//                                                   },
//                                                   child: Container(
//                                                     padding:
//                                                         EdgeInsets.all(2.w),
//                                                     width: 80.w,
//                                                     decoration: BoxDecoration(
//                                                       color: Colors.grey
//                                                           .withOpacity(0.2),
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                                   15.sp),
//                                                       border: Border.all(
//                                                         color: Colors.black12,
//                                                         // Border color
//                                                         width:
//                                                             2.0, // Border width
//                                                       ),
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Image.asset(
//                                                           "assets/cod2.png",
//                                                           height: 5.h,
//                                                           width: 20.w,
//                                                         ),
//                                                         SizedBox(
//                                                           width: 5.w,
//                                                         ),
//                                                         Text(
//                                                             "Cash On Delivery",
//                                                             style: TextStyle(
//                                                               color:
//                                                                   Colors.grey,
//                                                               fontSize: 13.sp,
//                                                               fontFamily:
//                                                                   'match',
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 )
//                                               : GestureDetector(
//                                                   onTap: () {
//                                                     print(paymethodmodal
//                                                         ?.data?.cod?.status);
//                                                     setState(() {
//                                                       selectedpayment = 2;
//                                                     });
//                                                   },
//                                                   child: Container(
//                                                     padding:
//                                                         EdgeInsets.all(2.w),
//                                                     width: 80.w,
//                                                     decoration: BoxDecoration(
//                                                       color: selectedpayment ==
//                                                               2
//                                                           ? Color(0xfff7941d)
//                                                               .withOpacity(
//                                                                   0.06)
//                                                           : Colors.white
//                                                               .withOpacity(
//                                                                   0.04),
//                                                       borderRadius:
//                                                           BorderRadius
//                                                               .circular(
//                                                                   15.sp),
//                                                       border: Border.all(
//                                                         color:
//                                                             selectedpayment ==
//                                                                     2
//                                                                 ? Color(
//                                                                     0xfff7941d)
//                                                                 : Colors
//                                                                     .black12,
//                                                         // Border color
//                                                         width:
//                                                             2.0, // Border width
//                                                       ),
//                                                     ),
//                                                     child: Row(
//                                                       mainAxisAlignment:
//                                                           MainAxisAlignment
//                                                               .start,
//                                                       crossAxisAlignment:
//                                                           CrossAxisAlignment
//                                                               .center,
//                                                       children: [
//                                                         Image.asset(
//                                                           "assets/cod1.png",
//                                                           height: 5.h,
//                                                           width: 19.w,
//                                                         ),
//                                                         SizedBox(
//                                                           width: 5.w,
//                                                         ),
//                                                         Text(
//                                                             "Cash On Delivery",
//                                                             style: TextStyle(
//                                                               color: Colors
//                                                                   .black,
//                                                               fontSize: 13.sp,
//                                                               fontFamily:
//                                                                   'match',
//                                                               fontWeight: FontWeight.normal
//                                                             )),
//                                                       ],
//                                                     ),
//                                                   ),
//                                                 ),
//                                           SizedBox(
//                                             height: 2.h,
//                                           ),
//                                         ],
//                                       ),
//                                       paymethodmodal?.data?.stripe?.status ==
//                                               false
//                                           ? GestureDetector(
//                                               onTap: () {
//                                                 buildErrorDialog(
//                                                     context,
//                                                     'Sorry',
//                                                     'Stripe is Not Available at this time');
//                                               },
//                                               child: Container(
//                                                 padding: EdgeInsets.all(2.w),
//                                                 width: 80.w,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.2),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.sp),
//                                                   border: Border.all(
//                                                     color: Colors.black12,
//                                                     // Border color
//                                                     width:
//                                                         2.0, // Border width
//                                                   ),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/sglogo.png",
//                                                       height: 5.h,
//                                                       width: 15.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 5.w,
//                                                     ),
//                                                     Text("Pay Using Stripe",
//                                                         style: TextStyle(
//                                                           color: Colors.grey,
//                                                           fontSize: 13.sp,
//                                                           fontFamily: 'match',
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                             )
//                                           : GestureDetector(
//                                               onTap: () {
//                                                 setState(() {
//                                                   selectedpayment = 3;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 width: 80.w,
//                                                 padding: EdgeInsets.all(2.w),
//                                                 decoration: BoxDecoration(
//                                                   color: selectedpayment == 3
//                                                       ? Color(0xfff7941d)
//                                                           .withOpacity(0.06)
//                                                       : Colors.white
//                                                           .withOpacity(0.04),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.sp),
//                                                   border: Border.all(
//                                                     color: selectedpayment ==
//                                                             3
//                                                         ? Color(0xfff7941d)
//                                                         : Colors.black12,
//                                                     // Border color
//                                                     width:
//                                                         2.0, // Border width
//                                                   ),
//                                                 ),
//                                                 child: Center(
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .start,
//                                                     crossAxisAlignment:
//                                                         CrossAxisAlignment
//                                                             .center,
//                                                     children: [
//                                                       Image.asset(
//                                                         "assets/slogo.png",
//                                                         height: 5.h,
//                                                         width: 17.w,
//                                                       ),
//                                                       SizedBox(
//                                                         width: 5.w,
//                                                       ),
//                                                       Text("Pay Using Stirpe",
//                                                           style: TextStyle(
//                                                             color:
//                                                                 Colors.black,
//                                                             fontSize: 13.sp,
//                                                             fontFamily:
//                                                                 'task',
//                                                           )),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ),
//                                             ),
//                                       SizedBox(
//                                         height: 2.h,
//                                       ),
//                                       paymethodmodal?.data?.razorpayData
//                                                   ?.status ==
//                                               false
//                                           ? GestureDetector(
//                                               onTap: () {
//                                                 buildErrorDialog(
//                                                     context,
//                                                     'Sorry',
//                                                     'Razorpay is Not Available at this time');
//                                               },
//                                               child: Container(
//                                                 padding: EdgeInsets.all(2.w),
//                                                 width: 80.w,
//                                                 decoration: BoxDecoration(
//                                                   color: Colors.grey
//                                                       .withOpacity(0.2),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.sp),
//                                                   border: Border.all(
//                                                     color: Colors.black12,
//                                                     // Border color
//                                                     width:
//                                                         2.0, // Border width
//                                                   ),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/razorpayoff.png",
//                                                       height: 5.h,
//                                                       width: 20.w,
//                                                     ),
//                                                     Text("Pay Using Razorpay",
//                                                         style: TextStyle(
//                                                           color: Colors.grey,
//                                                           fontSize: 13.sp,
//                                                           fontFamily: 'match',
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                             )
//                                           : GestureDetector(
//                                               onTap: () {
//                                                 print(paymethodmodal?.data
//                                                     ?.razorpayData?.status);
//                                                 setState(() {
//                                                   selectedpayment = 4;
//                                                 });
//                                               },
//                                               child: Container(
//                                                 padding: EdgeInsets.all(2.w),
//                                                 width: 80.w,
//                                                 decoration: BoxDecoration(
//                                                   color: selectedpayment == 4
//                                                       ? Color(0xfff7941d)
//                                                           .withOpacity(0.06)
//                                                       : Colors.white
//                                                           .withOpacity(0.04),
//                                                   borderRadius:
//                                                       BorderRadius.circular(
//                                                           15.sp),
//                                                   border: Border.all(
//                                                     color: selectedpayment ==
//                                                             4
//                                                         ? Color(0xfff7941d)
//                                                         : Colors.black12,
//                                                     // Border color
//                                                     width:
//                                                         2.0, // Border width
//                                                   ),
//                                                 ),
//                                                 child: Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment.start,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment
//                                                           .center,
//                                                   children: [
//                                                     Image.asset(
//                                                       "assets/razorpay.png",
//                                                       height: 5.h,
//                                                       width: 19.w,
//                                                     ),
//                                                     SizedBox(
//                                                       width: 3.w,
//                                                     ),
//                                                     Text("Pay Using Razorpay",
//                                                         style: TextStyle(
//                                                           color: Colors.black,
//                                                           fontSize: 13.sp,
//                                                           fontFamily: 'match',
//                                                         )),
//                                                   ],
//                                                 ),
//                                               ),
//                                             ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 1.80.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.start,
//                               children: [
//                                 Text(
//                                   "Amount",
//                                   style: TextStyle(
//                                     fontSize: 13.sp,
//                                     fontFamily: "task",
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 )
//                               ],
//                             ),
//                             SizedBox(
//                               height: 1.80.h,
//                             ),
//                             Container(
//                               width: 95.w,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Color(0xffffffff),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 3.w, vertical: 2.h),
//                                 child: Column(
//                                   mainAxisSize: MainAxisSize.min,
//                                   children: [
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'Sub Total : ',
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             color: Colors.grey.shade800,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//
//                                           // "\$50",
//                                           chekoutdetailmodal?.finalTotal == null||chekoutdetailmodal?.finalTotal == ""
//                                               ? "N/A"
//                                               : '₹' + (chekoutdetailmodal?.finalTotal).toString(),
//                                           style: TextStyle(
//                                               fontFamily: 'task',
//                                               fontSize: 12.sp,
//                                               fontWeight: FontWeight.normal,
//                                               color: Colors.black),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 1.h,
//                                     ),
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'Tax : ',
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             color: Colors.grey.shade800,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           "\$10",
//                                           // chekoutdetailmodal?.totalTax == null||chekoutdetailmodal?.totalTax == ""
//                                           //     ? "N/A"
//                                           //     : '₹' +
//                                           //         (chekoutdetailmodal?.totalTax)
//                                           //             .toString(),
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.normal,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 1.h,
//                                     ),
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'Shipping Fees : ',
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             color: Colors.grey.shade800,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           "\$10",
//                                           // (chekoutdetailmodal?.shippingRate) == null || (chekoutdetailmodal?.shippingRate) == ''
//                                           //     ? "N/A"
//                                           //     : '₹' + (chekoutdetailmodal?.shippingRate).toString()
//                                           //            ,
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.normal,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 1.h,
//                                     ),
//                                     Row(
//                                       mainAxisSize: MainAxisSize.max,
//                                       mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                       children: [
//                                         Text(
//                                           'Discount Applied: ',
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             color: Colors.grey.shade800,
//                                             fontWeight: FontWeight.bold,
//                                           ),
//                                         ),
//                                         Text(
//                                           "\$10",
//                                           // (chekoutdetailmodal?.shippingRate) == null || (chekoutdetailmodal?.shippingRate) == ''
//                                           //     ? "N/A"
//                                           //     : '₹' + (chekoutdetailmodal?.shippingRate).toString()
//                                           //            ,
//                                           style: TextStyle(
//                                             fontFamily: 'task',
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.normal,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//
//                                   ],
//                                 ),
//                               ),
//                             ),
//                             SizedBox(
//                               height: 1.h,
//                             ),
//                             Container(
//                               width: 93.w,
//                               height: 8.h,
//                               alignment: Alignment.center,
//                               decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(10),
//                                 color: Color(0xffffffff),
//                               ),
//                               child: Padding(
//                                 padding: EdgeInsets.symmetric(
//                                     horizontal: 3.w, vertical: 2.h),
//                                 child: Row(
//                                   mainAxisSize: MainAxisSize.max,
//                                   mainAxisAlignment:
//                                       MainAxisAlignment.spaceBetween,
//                                   children: [
//                                     Text(
//                                       'Total Amount : ',
//                                       style: TextStyle(
//                                         fontFamily: 'task',
//                                         fontSize: 12.sp,
//                                         color: Colors.grey.shade800,
//                                         fontWeight: FontWeight.bold,
//                                       ),
//                                     ),
//                                     Text(
//                                       // "\$100",
//                                       (chekoutdetailmodal?.totalWithTaxShip) ==
//                                               null
//                                           ? "N/A"
//                                           : '₹' +
//                                               (chekoutdetailmodal?.totalWithTaxShip)
//                                                   .toString(),
//                                       style: TextStyle(
//                                         fontFamily: 'task',
//                                         fontSize: 12.sp,
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ),
//                           ],
//                         ),
//                       ),
//                       SizedBox(
//                         height: 3.h,
//                       ),
//                       userselectaddmodal?.selectShippingAddress?.address == '' || userselectaddmodal?.selectShippingAddress?.address == null ||
//                               widget.address == '' ||
//                               widget.address == null
//                           ? GestureDetector(
//                               onTap: () {
//                                 buildErrorDialog(
//                                     context, '', "Please use valid Address");
//                               },
//                               child: Container(
//                                   margin:
//                                       EdgeInsets.only(right: 7.w, left: 7.w),
//                                   alignment: Alignment.center,
//                                   height: 6.h,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Color(0xff0061b0)),
//                                   child: Text(
//                                     "Pay Now",
//                                     style: TextStyle(
//                                         fontSize: 12.sp,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: "task"),
//                                   )),
//                             )
//                           : GestureDetector(
//                               onTap: selectedpayment == 4
//                                   ? () {
//                                       MakePayment(name, name1);
//                                     }
//                                   : selectedpayment == 3
//                                       ? () {
//                                           widget.name == '' ||
//                                                   widget.name == null &&
//                                                       widget.cvv == '' ||
//                                                   widget.cvv == null &&
//                                                       widget.em == '' ||
//                                                   widget.em == null &&
//                                                       widget.ey == '' ||
//                                                   widget.ey == null &&
//                                                       widget.cn == '' ||
//                                                   widget.cn == null
//                                               ? Navigator.push(
//                                                   context,
//                                                   MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         AddCardPage(
//                                                             addid: widget.addid,
//                                                             firstname: widget.page == "1"
//                                                                 ? (userselectaddmodal?.selectShippingAddress?.firstName)
//                                                                     .toString()
//                                                                 : widget.firstname
//                                                                     .toString(),
//                                                             address: widget.page ==
//                                                                     "1"
//                                                                 ? userselectaddmodal?.selectShippingAddress?.address == '' ||
//                                                                         userselectaddmodal?.selectShippingAddress?.address ==
//                                                                             null
//                                                                     ? 'N/A'
//                                                                     : (userselectaddmodal?.selectShippingAddress?.address)
//                                                                         .toString()
//                                                                 : widget.address == '' ||
//                                                                         widget.address ==
//                                                                             null
//                                                                     ? 'N/A'
//                                                                     : widget.address
//                                                                         .toString(),
//                                                             lastname: widget.page == "1"
//                                                                 ? (userselectaddmodal
//                                                                         ?.selectShippingAddress
//                                                                         ?.lastName)
//                                                                     .toString()
//                                                                 : widget.lastname.toString()),
//                                                   ))
//                                               : checkoutStipeap();
//                                         }
//                                       : selectedpayment == 2
//                                           ? () {
//                                               checkoutcodap();
//                                             }
//                                           : selectedpayment == 1
//                                               ? () {
//                                                   double total = double.parse(
//                                                       (chekoutdetailmodal?.totalWithTaxShip)
//                                                           .toString());
//                                                   String formattedNumber =
//                                                       total.toStringAsFixed(2);
//                                                   String add = widget.page ==
//                                                           "1"
//                                                       ? (userselectaddmodal
//                                                               ?.selectShippingAddress
//                                                               ?.address)
//                                                           .toString()
//                                                       : widget.address
//                                                           .toString();
//                                                   String name = widget.page ==
//                                                           "1"
//                                                       ? (userselectaddmodal
//                                                               ?.selectShippingAddress
//                                                               ?.firstName)
//                                                           .toString()
//                                                       : widget.firstname
//                                                           .toString();
//
//                                                   print(total);
//                                                   print(formattedNumber);
//                                                   Navigator.push(
//                                                       context,
//                                                       MaterialPageRoute(
//                                                         builder: (context) =>
//                                                             UsePaypal(
//                                                                 sandboxMode: paymethodmodal
//                                                                             ?.data
//                                                                             ?.paypal
//                                                                             ?.liveSts ==
//                                                                         "1"
//                                                                     ? false
//                                                                     : true,
//                                                                 clientId: paymethodmodal
//                                                                         ?.data
//                                                                         ?.paypal
//                                                                         ?.clientID ??
//                                                                     '',
//                                                                 secretKey: paymethodmodal
//                                                                         ?.data
//                                                                         ?.paypal
//                                                                         ?.secretKey ??
//                                                                     '',
//                                                                 returnURL:
//                                                                     "https://samplesite.com/return",
//                                                                 cancelURL:
//                                                                     "https://samplesite.com/cancel",
//                                                                 transactions: [
//                                                                   {
//                                                                     "amount": {
//                                                                       "total":
//                                                                           formattedNumber,
//                                                                       "currency":
//                                                                           "USD",
//                                                                       "details":
//                                                                           {
//                                                                         "subtotal":
//                                                                             formattedNumber,
//                                                                         "shipping":
//                                                                             '0',
//                                                                         "shipping_discount":
//                                                                             0
//                                                                       }
//                                                                     },
//                                                                     "description":
//                                                                         "The payment transaction description.",
//                                                                     "item_list":
//                                                                         {
//                                                                       "items":
//                                                                           [],
//                                                                       "shipping_address":
//                                                                           {
//                                                                         "recipient_name":
//                                                                             name,
//                                                                         "line1":
//                                                                             add,
//                                                                         "line2":
//                                                                             "",
//                                                                         "city":
//                                                                             "Austin",
//                                                                         "country_code":
//                                                                             "US",
//                                                                         "postal_code":
//                                                                             "73301",
//                                                                         "phone":
//                                                                             "+00000000",
//                                                                         "state":
//                                                                             "Texas"
//                                                                       },
//                                                                     }
//                                                                   }
//                                                                 ],
//                                                                 note:
//                                                                     "Contact us for any questions on your order.",
//                                                                 onSuccess: (Map
//                                                                     params) async {
//                                                                   EasyLoading
//                                                                       .show(
//                                                                           status:
//                                                                               'Processing Your Payment ..',
//                                                                           indicator:
//                                                                               CircularProgressIndicator(
//                                                                             backgroundColor:
//                                                                                 Color(0xfff7941d),
//                                                                             color:
//                                                                                 Colors.white,
//                                                                           ));
//                                                                   print(
//                                                                       "onSuccess:- Uid: ${usermodal?.userId} , Add Id: ${widget.addid} , PaymenId: ${params['paymentId']} , type : paypal");
//                                                                   checkoutpaypalap(
//                                                                       params[
//                                                                           'paymentId']);
//                                                                 },
//                                                                 onError:
//                                                                     (error) {
//                                                                   EasyLoading
//                                                                       .show(
//                                                                           status:
//                                                                               'Processing Your Payment ..',
//                                                                           indicator:
//                                                                               CircularProgressIndicator(
//                                                                             backgroundColor:
//                                                                                 Color(0xfff7941d),
//                                                                             color:
//                                                                                 Colors.white,
//                                                                           ));
//                                                                   checkoutpaypalap(
//                                                                       '');
//                                                                   print(
//                                                                       "onError: $error");
//                                                                   EasyLoading
//                                                                       .showError(
//                                                                     "Payment Error",
//                                                                   );
//                                                                   Navigator.pop(
//                                                                       context);
//                                                                 },
//                                                                 onCancel:
//                                                                     (params) {
//                                                                   EasyLoading
//                                                                       .show(
//                                                                           status:
//                                                                               'Processing Your Payment ..',
//                                                                           indicator:
//                                                                               CircularProgressIndicator(
//                                                                             backgroundColor:
//                                                                                 Color(0xfff7941d),
//                                                                             color:
//                                                                                 Colors.white,
//                                                                           ));
//
//                                                                   print(
//                                                                       'cancelled: $params');
//                                                                   EasyLoading
//                                                                       .showError(
//                                                                     "Payment Cancelled",
//                                                                   );
//                                                                 }),
//                                                       ));
//                                                 }
//                                               : paymethodmodal?.data?.cod
//                                                               ?.status ==
//                                                           false &&
//                                                       paymethodmodal
//                                                               ?.data
//                                                               ?.paypal
//                                                               ?.status ==
//                                                           false
//                                                   ? () {
//                                                       buildErrorDialog(
//                                                           context,
//                                                           '',
//                                                           "No payment method available at this time");
//                                                     }
//                                                   : () {
//                                                       buildErrorDialog(
//                                                           context,
//                                                           '',
//                                                           "Please choose your payment method");
//                                                     },
//                               child: Container(
//                                   margin:
//                                       EdgeInsets.only(right: 7.w, left: 7.w),
//                                   alignment: Alignment.center,
//                                   height: 6.h,
//                                   decoration: BoxDecoration(
//                                       borderRadius: BorderRadius.circular(10),
//                                       color: Color(0xff0061b0)),
//                                   child: Text(
//                                     "Pay Now",
//                                     style: TextStyle(
//                                         fontSize: 12.sp,
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         fontFamily: "task"),
//                                   )),
//                             ),
//                     ],
//                   ),
//                 ),
//         ),
//       ),
//     );
//   }
//
//   checkoutap() {
//     final Map<String, String> data = {};
//     data['user_id'] = (usermodal?.userId).toString();
//     data['shipphing_id'] = widget.addid.toString();
//     print("banga${data}");
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().checkoutapi(data).then((response) async {
//           chekoutdetailmodal = ChekOutDetailModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 && chekoutdetailmodal?.status == "success") {
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   checkoutcodap() {
//     final Map<String, String> data = {};
//     data['user_id'] = (usermodal?.userId).toString();
//     data['payment'] = 'cod';
//     data['shipping_address_id'] = widget.addid.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().checkoutcodapi(data).then((response) async {
//           checkoutmodal = CheckOutModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 &&
//               checkoutmodal?.status == "success") {
//             Navigator.of(context).push(MaterialPageRoute(
//                 builder: (context) => ThankyouPage(
//                       uid: (checkoutmodal?.cartDetails?.orderNumber).toString(),
//                     )));
//             print(checkoutmodal?.status);
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   checkoutpaypalap(String payId) {
//     final Map<String, String> data = {};
//     data['userId'] = (usermodal?.userId).toString();
//     data['paymentID'] = payId;
//     data['type'] = selectedpayment == 4
//         ? 'razorpay'
//         : selectedpayment == 3
//             ? 'stripe'
//             : 'paypal';
//     data['shipping_address_id'] = widget.addid.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().checkoutpaypalapi(data).then((response) async {
//           paypalmodal = PaypalModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 && paypalmodal?.status == "success") {
//             EasyLoading.showSuccess(
//               "Payment Done",
//             );
//             Navigator.of(context).push(
//               MaterialPageRoute(
//                 builder: (context) => PaypalThanks(
//                   uid: payId,
//                 ),
//               ),
//             );
//             print('Status:${checkoutmodal?.status}');
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   checkoutStipeap() {
//     EasyLoading.show(
//         status: 'Processing Your Payment ..',
//         indicator: CircularProgressIndicator(
//           backgroundColor: Color(0xfff7941d),
//           color: Colors.white,
//         ));
//     final Map<String, String> data = {};
//     data['number'] = widget.cn ?? '';
//     data['expiry_month'] = widget.em ?? '';
//     data['expiry_year'] = widget.ey ?? '';
//     data['cvv'] = widget.cvv ?? '';
//     data['name'] = widget.name ?? '';
//     data['amt'] = (viewcartmodal?.finalTotalWithTax).toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().checkoutstripeapi(data).then((response) async {
//           strpiepay = StripeModal.fromJson(json.decode(response.body));
//           print(strpiepay?.status);
//           if (response.statusCode == 200 && strpiepay?.status == "success") {
//             print(strpiepay?.status);
//             setState(() {
//               String payid = strpiepay?.paymentID ?? '';
//               checkoutpaypalap(payid);
//               isLoading = false;
//             });
//           } else {
//             print(strpiepay?.message);
//             EasyLoading.showError(
//               strpiepay?.message ?? '',
//             );
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         EasyLoading.showError(
//           "Payment Error",
//         );
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   Paymethod() {
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().PaymethodApi().then((response) async {
//           paymethodmodal = PaymethodModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 && paymethodmodal?.status == true) {
//             print(paymethodmodal?.data);
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   userselectaddap() async {
//     final Map<String, String> data = {};
//     data['shipping_address_id']= widget.addid.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().userselectapi(data).then((response) async {
//           userselectaddmodal =
//               UserSelectAddModal.fromJson(json.decode(response.body));
//           print(userselectaddmodal?.status);
//           if (response.statusCode == 200 && userselectaddmodal?.status == "success") {
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
// }
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Modal/CheckOutModal.dart';
import 'package:ecommerce/Modal/ChekOutDetailModal.dart';
import 'package:ecommerce/Modal/PaymentMthodsModal.dart';
import 'package:ecommerce/Modal/PaypalModal.dart';
import 'package:ecommerce/Modal/PrescriptionModel.dart';
import 'package:ecommerce/Modal/StripeModal.dart';
import 'package:ecommerce/Modal/UserSelectAddModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/AddCardPage.dart';
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
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';
import 'package:sizer/sizer.dart';

class CheckoutDetail extends StatefulWidget {
  String? address;
  String? firstname;
  String? lastname;
  String? addid;
  String? page;

  String? name;
  String? cvv;
  String? em;
  String? ey;
  String? cn;

  CheckoutDetail(
      {super.key,
      this.page,
      this.address,
      this.firstname,
      this.lastname,
      this.name,
      this.cvv,
      this.em,
      this.ey,
      this.cn,
      required this.addid});

  @override
  State<CheckoutDetail> createState() => _CheckoutDetailState();
}

Razorpay? _razorpay;
var selected = "option1";
String name = '';
String name1 = '';
int selectedpayment = 0;

String? deviceName;
String? deviceOS;

bool isLoading = true;

var Options = "option1";

void MakePayment(String fname, String lname) async {
  var options = {
    'key': paymethodmodal?.data?.razorpayData?.keyId ?? '',
    'amount':
        double.parse((viewcartmodal?.finalTotalWithCharge).toString()) * 100,
    'name': '${fname} ${lname}',
    'description': 'Fine T-Shirt',
    'prefill': {'contact': '8888888888', 'email': 'test@razorpay.com'}
  };
  try {
    _razorpay?.open(options);
  } catch (e) {
    debugPrint(e.toString());
  }
}

class _CheckoutDetailState extends State<CheckoutDetail> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceInfoandStore();
    void _handlePaymentSuccess(PaymentSuccessResponse response) {
      Fluttertoast.showToast(
          msg: "SUCCESS PAYMENT:${response.paymentId}", timeInSecForIosWeb: 4);
      checkoutpaypalap(response.paymentId ?? '');
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

    _razorpay = Razorpay();
    _razorpay?.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay?.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
    _razorpay?.on(Razorpay.EVENT_EXTERNAL_WALLET, _handlePaymentWallet);

    setState(() {
      selectedpayment = 0;
      name = widget.page == "1"
          ? (userselectaddmodal?.selectShippingAddress?.firstName).toString()
          : widget.firstname.toString();
      name1 = widget.page == "1"
          ? (userselectaddmodal?.selectShippingAddress?.lastName).toString()
          : widget.lastname.toString();
    });

    print('Page : ${widget.page}');
    print('Add Id : ${widget.addid}');
    print('Add name : ${widget.firstname}');
    print('Add name2 : ${widget.lastname}');
    print('Address : ${widget.address}');
    Paymethod();

    userselectaddap();
  }

  selectfile() {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      alignment: Alignment.center,
      backgroundColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            _pickedFile = File(photo!.path);
                          });
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 15.sp,
                          color: Color(0xff0061b0),
                        )),
                    Text(
                      "Camera",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _pickedFile = File(photo!.path);
                          setState(() {
                            _pickedFile = File(photo!.path);
                          });
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.browse_gallery,
                          size: 15.sp,
                          color: Color(0xff0061b0),
                        )),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;

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
                        height: 3.h,
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
                                      builder: (context) => CartPage(),
                                    ),
                                  );
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 18.sp,
                                )),
                            Text(
                              "Checkout",
                              style: TextStyle(
                                fontSize: 16.sp,
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
                            fontSize: 13.sp,
                            fontFamily: "task",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
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
                                                      ? userselectaddmodal
                                                                      ?.selectShippingAddress
                                                                      ?.firstName ==
                                                                  '' ||
                                                              userselectaddmodal
                                                                      ?.selectShippingAddress
                                                                      ?.firstName ==
                                                                  null
                                                          ? ''
                                                          : (userselectaddmodal
                                                                  ?.selectShippingAddress
                                                                  ?.firstName)
                                                              .toString()
                                                      : widget.address == '' ||
                                                              widget.address ==
                                                                  null
                                                          ? ''
                                                          : widget.page == "1"
                                                              ? (userselectaddmodal
                                                                      ?.selectShippingAddress
                                                                      ?.firstName)
                                                                  .toString()
                                                              : widget.firstname
                                                                  .toString(),
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontFamily: "task"),
                                                ),
                                                SizedBox(
                                                  width: 1.w,
                                                ),
                                                Text(
                                                  widget.page == "1"
                                                      ? userselectaddmodal
                                                                      ?.selectShippingAddress
                                                                      ?.lastName ==
                                                                  '' ||
                                                              userselectaddmodal
                                                                      ?.selectShippingAddress
                                                                      ?.lastName ==
                                                                  null
                                                          ? 'Please Select Shipping Address'
                                                          : (userselectaddmodal
                                                                  ?.selectShippingAddress
                                                                  ?.lastName)
                                                              .toString()
                                                      : widget.address == '' ||
                                                              widget.address ==
                                                                  null
                                                          ? 'Please Select Shipping Address'
                                                          : widget.page == "1"
                                                              ? (userselectaddmodal
                                                                      ?.selectShippingAddress
                                                                      ?.lastName)
                                                                  .toString()
                                                              : widget.lastname
                                                                  .toString(),
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
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
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    color: Color(0xff0061b0),
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
                                                    fontSize: 14.sp,
                                                    color: Colors.black,
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    fontFamily: "task"),
                                              ),
                                            ),
                                            GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context)
                                                      .pushReplacement(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  AllAddpage()));
                                                },
                                                child: Icon(
                                                  Icons.arrow_forward_ios,
                                                  size: 15.sp,
                                                ))
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/paybill.png",
                                        height: 5.h,
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "I have a prescription",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "What is valid prescription?",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "Add Photos",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          _pickedFile == null
                                              ? SizedBox(
                                                  height: 0.h,
                                                )
                                              : Container(
                                                  width: 6.h,
                                                  height: 6.h,
                                                  child: _pickedFile == null
                                                      ? Container()
                                                      : Image.file(
                                                          _pickedFile!,
                                                          fit: BoxFit.cover,
                                                        ),
                                                ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          InkWell(
                                            onTap: () {
                                              selectfile();
                                            },
                                            child: Container(
                                              width: 50.w,
                                              height: 5.h,
                                              alignment: Alignment.center,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  border: Border.all(
                                                      style: BorderStyle.solid,
                                                      color:
                                                          AppColors.primary)),
                                              child: Text(
                                                "Upload Prescription",
                                                style: TextStyle(
                                                    color: AppColors.primary,
                                                    fontFamily: "task",
                                                    fontSize: 13.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Container(
                                          //       width: 50,
                                          //       height: 15,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(10)
                                          //       ),
                                          //
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 5.w,
                                      ),
                                      Radio(
                                        value: "option1",
                                        groupValue: Options,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          setState(() {
                                            Options = value!;
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              padding: EdgeInsets.symmetric(vertical: 10),
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Image.asset(
                                        "assets/paybill.png",
                                        height: 5.h,
                                        width: 20.w,
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "I don't have a prescription",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.black,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "Get a FREE consultation ",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily: "task"),
                                          ),
                                          Text(
                                            "by a licensed third-party doctor",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Text(
                                            "You will receive call by",
                                            style: TextStyle(
                                                fontSize: 10.sp,
                                                fontWeight: FontWeight.bold,
                                                color: Colors.grey,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            "8.22 PM Today",
                                            style: TextStyle(
                                                fontSize: 12.sp,
                                                fontWeight: FontWeight.bold,
                                                color: AppColors.primary,
                                                fontFamily: "task"),
                                          ),
                                          // Row(
                                          //   children: [
                                          //     Container(
                                          //       width: 50,
                                          //       height: 15,
                                          //       decoration: BoxDecoration(
                                          //         borderRadius: BorderRadius.circular(10)
                                          //       ),
                                          //
                                          //     )
                                          //   ],
                                          // )
                                        ],
                                      ),
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Radio(
                                        value: "option2",
                                        groupValue: Options,
                                        activeColor: Colors.blue,
                                        onChanged: (value) {
                                          setState(() {
                                            Options = value!;
                                            log('Opions :$Options');
                                          });
                                        },
                                      )
                                    ],
                                  )
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                SizedBox(
                                  height: 2.h,
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text(
                                      "Payment Methods",
                                      style: TextStyle(
                                        fontSize: 13.sp,
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
                                  padding: EdgeInsets.symmetric(
                                      horizontal: 3.w, vertical: 2.h),
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      // paymethodmodal?.data?.paypal?.status ==
                                      //         false
                                      //     ? GestureDetector(
                                      //         onTap: () {
                                      //           buildErrorDialog(
                                      //               context,
                                      //               'Sorry',
                                      //               'Paypal is Not Available at this time');
                                      //         },
                                      //         child: Container(
                                      //           // width: 80.w,
                                      //           decoration: BoxDecoration(
                                      //             color: Colors.grey
                                      //                 .withOpacity(0.2),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     15.sp),
                                      //             border: Border.all(
                                      //               color: Colors.black12,
                                      //               // Border color
                                      //               width:
                                      //                   2.0, // Border width
                                      //             ),
                                      //           ),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment
                                      //                     .center,
                                      //             children: [
                                      //               Image.asset(
                                      //                 "assets/paypal2.png",
                                      //                 height: 5.h,
                                      //                 width: 20.w,
                                      //               ),
                                      //               SizedBox(
                                      //                 width: 5.w,
                                      //               ),
                                      //               Text("Pay Using PayPal",
                                      //                   style: TextStyle(
                                      //                     color: Colors.grey,
                                      //                     fontSize: 17.sp,
                                      //                     fontFamily: 'match',
                                      //                   )),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       )
                                      //     : GestureDetector(
                                      //         onTap: () {
                                      //           setState(() {
                                      //             selectedpayment = 1;
                                      //           });
                                      //         },
                                      //         child: Container(
                                      //           width: 80.w,
                                      //           padding: EdgeInsets.all(2.w),
                                      //           decoration: BoxDecoration(
                                      //             color: selectedpayment == 1
                                      //                 ? Color(0xfff7941d)
                                      //                     .withOpacity(0.06)
                                      //                 : Colors.white
                                      //                     .withOpacity(0.04),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     15.sp),
                                      //             border: Border.all(
                                      //               color: selectedpayment ==
                                      //                       1
                                      //                   ? Color(0xfff7941d)
                                      //                   : Colors.black12,
                                      //               // Border color
                                      //               width:
                                      //                   2.0, // Border width
                                      //             ),
                                      //           ),
                                      //           child: Center(
                                      //             child: Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .start,
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment
                                      //                       .center,
                                      //               children: [
                                      //                 Image.asset(
                                      //                   "assets/paypal.png",
                                      //                   height: 5.h,
                                      //                   width: 19.w,
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: 5.w,
                                      //                 ),
                                      //                 Text("Pay Using PayPal",
                                      //                     style: TextStyle(
                                      //                       color:
                                      //                           Colors.black,
                                      //                       fontSize: 13.sp,
                                      //                       fontFamily:
                                      //                           'task',
                                      //                     )),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
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
                                                        'Pay after bill generation   is Not Available at this time');
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(2.w),
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
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Image.asset(
                                                          "assets/paybill.png",
                                                          height: 5.h,
                                                          width: 20.w,
                                                        ),
                                                        SizedBox(
                                                          width: 5.w,
                                                        ),
                                                        Text(
                                                            "Pay after bill generation  ",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.grey,
                                                              fontSize: 13.sp,
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
                                                      selectedpayment = 2;
                                                    });
                                                  },
                                                  child: Container(
                                                    padding:
                                                        EdgeInsets.all(2.w),
                                                    width: 80.w,
                                                    decoration: BoxDecoration(
                                                      color: selectedpayment ==
                                                              2
                                                          ? AppColors.primary
                                                              .withOpacity(0.06)
                                                          : Colors.white
                                                              .withOpacity(
                                                                  0.04),
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              15.sp),
                                                      border: Border.all(
                                                        color:
                                                            selectedpayment == 2
                                                                ? AppColors
                                                                    .primary
                                                                : Colors
                                                                    .black12,
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
                                                          "assets/paybill.png",
                                                          height: 6.h,
                                                          width: 20.w,
                                                        ),
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Text(
                                                            "Pay after bill generation ",
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 13.sp,
                                                                fontFamily:
                                                                    'match',
                                                                fontWeight:
                                                                    FontWeight
                                                                        .normal)),
                                                      ],
                                                    ),
                                                  ),
                                                ),
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                        ],
                                      ),
                                      // paymethodmodal?.data?.stripe?.status ==
                                      //         false
                                      //     ? GestureDetector(
                                      //         onTap: () {
                                      //           buildErrorDialog(
                                      //               context,
                                      //               'Sorry',
                                      //               'Stripe is Not Available at this time');
                                      //         },
                                      //         child: Container(
                                      //           padding: EdgeInsets.all(2.w),
                                      //           width: 80.w,
                                      //           decoration: BoxDecoration(
                                      //             color: Colors.grey
                                      //                 .withOpacity(0.2),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     15.sp),
                                      //             border: Border.all(
                                      //               color: Colors.black12,
                                      //               // Border color
                                      //               width:
                                      //                   2.0, // Border width
                                      //             ),
                                      //           ),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment
                                      //                     .center,
                                      //             children: [
                                      //               Image.asset(
                                      //                 "assets/sglogo.png",
                                      //                 height: 5.h,
                                      //                 width: 15.w,
                                      //               ),
                                      //               SizedBox(
                                      //                 width: 5.w,
                                      //               ),
                                      //               Text("Pay Using Stripe",
                                      //                   style: TextStyle(
                                      //                     color: Colors.grey,
                                      //                     fontSize: 13.sp,
                                      //                     fontFamily: 'match',
                                      //                   )),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       )
                                      //     : GestureDetector(
                                      //         onTap: () {
                                      //           setState(() {
                                      //             selectedpayment = 3;
                                      //           });
                                      //         },
                                      //         child: Container(
                                      //           width: 80.w,
                                      //           padding: EdgeInsets.all(2.w),
                                      //           decoration: BoxDecoration(
                                      //             color: selectedpayment == 3
                                      //                 ? Color(0xfff7941d)
                                      //                     .withOpacity(0.06)
                                      //                 : Colors.white
                                      //                     .withOpacity(0.04),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     15.sp),
                                      //             border: Border.all(
                                      //               color: selectedpayment ==
                                      //                       3
                                      //                   ? Color(0xfff7941d)
                                      //                   : Colors.black12,
                                      //               // Border color
                                      //               width:
                                      //                   2.0, // Border width
                                      //             ),
                                      //           ),
                                      //           child: Center(
                                      //             child: Row(
                                      //               mainAxisAlignment:
                                      //                   MainAxisAlignment
                                      //                       .start,
                                      //               crossAxisAlignment:
                                      //                   CrossAxisAlignment
                                      //                       .center,
                                      //               children: [
                                      //                 Image.asset(
                                      //                   "assets/slogo.png",
                                      //                   height: 5.h,
                                      //                   width: 17.w,
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: 5.w,
                                      //                 ),
                                      //                 Text("Pay Using Stirpe",
                                      //                     style: TextStyle(
                                      //                       color:
                                      //                           Colors.black,
                                      //                       fontSize: 13.sp,
                                      //                       fontFamily:
                                      //                           'task',
                                      //                     )),
                                      //               ],
                                      //             ),
                                      //           ),
                                      //         ),
                                      //       ),
                                      // SizedBox(
                                      //   height: 2.h,
                                      // ),
                                      // paymethodmodal?.data?.razorpayData
                                      //             ?.status ==
                                      //         false
                                      //     ? GestureDetector(
                                      //         onTap: () {
                                      //           buildErrorDialog(
                                      //               context,
                                      //               'Sorry',
                                      //               'Razorpay is Not Available at this time');
                                      //         },
                                      //         child: Container(
                                      //           padding: EdgeInsets.all(2.w),
                                      //           width: 80.w,
                                      //           decoration: BoxDecoration(
                                      //             color: Colors.grey
                                      //                 .withOpacity(0.2),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     15.sp),
                                      //             border: Border.all(
                                      //               color: Colors.black12,
                                      //               // Border color
                                      //               width:
                                      //                   2.0, // Border width
                                      //             ),
                                      //           ),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment
                                      //                     .center,
                                      //             children: [
                                      //               Image.asset(
                                      //                 "assets/razorpayoff.png",
                                      //                 height: 5.h,
                                      //                 width: 20.w,
                                      //               ),
                                      //               Text("Pay Using Razorpay",
                                      //                   style: TextStyle(
                                      //                     color: Colors.grey,
                                      //                     fontSize: 13.sp,
                                      //                     fontFamily: 'match',
                                      //                   )),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       )
                                      //     : GestureDetector(
                                      //         onTap: () {
                                      //           print(paymethodmodal?.data
                                      //               ?.razorpayData?.status);
                                      //           setState(() {
                                      //             selectedpayment = 4;
                                      //           });
                                      //         },
                                      //         child: Container(
                                      //           padding: EdgeInsets.all(2.w),
                                      //           width: 80.w,
                                      //           decoration: BoxDecoration(
                                      //             color: selectedpayment == 4
                                      //                 ? Color(0xfff7941d)
                                      //                     .withOpacity(0.06)
                                      //                 : Colors.white
                                      //                     .withOpacity(0.04),
                                      //             borderRadius:
                                      //                 BorderRadius.circular(
                                      //                     15.sp),
                                      //             border: Border.all(
                                      //               color: selectedpayment ==
                                      //                       4
                                      //                   ? Color(0xfff7941d)
                                      //                   : Colors.black12,
                                      //               // Border color
                                      //               width:
                                      //                   2.0, // Border width
                                      //             ),
                                      //           ),
                                      //           child: Row(
                                      //             mainAxisAlignment:
                                      //                 MainAxisAlignment.start,
                                      //             crossAxisAlignment:
                                      //                 CrossAxisAlignment
                                      //                     .center,
                                      //             children: [
                                      //               Image.asset(
                                      //                 "assets/razorpay.png",
                                      //                 height: 5.h,
                                      //                 width: 19.w,
                                      //               ),
                                      //               SizedBox(
                                      //                 width: 3.w,
                                      //               ),
                                      //               Text("Pay Using Razorpay",
                                      //                   style: TextStyle(
                                      //                     color: Colors.black,
                                      //                     fontSize: 13.sp,
                                      //                     fontFamily: 'match',
                                      //                   )),
                                      //             ],
                                      //           ),
                                      //         ),
                                      //       ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 1.80.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              children: [
                                Text(
                                  "Amount",
                                  style: TextStyle(
                                    fontSize: 13.sp,
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
                              width: 95.w,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xffffffff),
                              ),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                child: Column(
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Sub Total : ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          // "\$50",
                                          chekoutdetailmodal?.checkoutData?[0]
                                                          .finalTotal ==
                                                      null ||
                                                  chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .finalTotal ==
                                                      ""
                                              ? "N/A"
                                              : '₹' +
                                                  (chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .finalTotal)
                                                      .toString(),
                                          style: TextStyle(
                                              fontFamily: 'task',
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.normal,
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Handling Charge : ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          chekoutdetailmodal?.checkoutData?[0]
                                                          .totalTax ==
                                                      null ||
                                                  chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .totalTax ==
                                                      ""
                                              ? "N/A"
                                              : '₹' +
                                                  (chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .totalTax)
                                                      .toString(),
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        )
                                        // Text(
                                        //   "\₹5",
                                        //   chekoutdetailmodal?.checkoutData?[0].totalTax == null||chekoutdetailmodal?.checkoutData?[0].totalTax == ""
                                        //       ? "N/A"
                                        //       : '₹' + (chekoutdetailmodal?.checkoutData?[0].totalTax).toString(),
                                        //   style: TextStyle(
                                        //     fontFamily: 'task',
                                        //     fontSize: 12.sp,
                                        //     fontWeight: FontWeight.normal,
                                        //   ),
                                        // ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Shipping Fees : ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          chekoutdetailmodal?.checkoutData?[0]
                                                          .shippingTax ==
                                                      null ||
                                                  chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .shippingTax ==
                                                      ""
                                              ? "N/A"
                                              : '₹' +
                                                  (chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .shippingTax)
                                                      .toString(),
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Text(
                                          'Discount Applied: ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        Text(
                                          chekoutdetailmodal?.checkoutData?[0]
                                                          .discount ==
                                                      null ||
                                                  chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .discount ==
                                                      ""
                                              ? "\₹ 0"
                                              : '₹' +
                                                  (chekoutdetailmodal
                                                          ?.checkoutData?[0]
                                                          .discount)
                                                      .toString(),
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.normal,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    usermodal?.userId == "" ||
                                            usermodal?.userId == null
                                        ? Container()
                                        : Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                            children: [
                                              Text(
                                                'Agent Discount: ',
                                                style: TextStyle(
                                                  fontFamily: 'task',
                                                  fontSize: 12.sp,
                                                  color: Colors.grey.shade800,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                              ),
                                              Text(
                                                chekoutdetailmodal
                                                                ?.checkoutData?[
                                                                    0]
                                                                .referral ==
                                                            null ||
                                                        chekoutdetailmodal
                                                                ?.checkoutData?[
                                                                    0]
                                                                .referral ==
                                                            ""
                                                    ? "N/A"
                                                    : '₹' +
                                                        (chekoutdetailmodal
                                                                ?.checkoutData?[
                                                                    0]
                                                                .referral)
                                                            .toString(),
                                                style: TextStyle(
                                                  fontFamily: 'task',
                                                  fontSize: 12.sp,
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
                              alignment: Alignment.center,
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
                                      'Total Amount : ',
                                      style: TextStyle(
                                        fontFamily: 'task',
                                        fontSize: 12.sp,
                                        color: Colors.grey.shade800,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    Text(
                                      chekoutdetailmodal?.checkoutData?[0]
                                                      .total ==
                                                  null ||
                                              chekoutdetailmodal
                                                      ?.checkoutData?[0]
                                                      .total ==
                                                  ""
                                          ? "N/A"
                                          : '₹' +
                                              (chekoutdetailmodal
                                                      ?.checkoutData?[0].total)
                                                  .toString(),
                                      style: TextStyle(
                                        fontFamily: 'task',
                                        fontSize: 12.sp,
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
                        height: 3.h,
                      ),
                      _pickedFile == '' || _pickedFile== null?GestureDetector(
                        onTap: () {
                          buildErrorDialog(
                              context, '', "Please Upload Prescription");
                        },
                        child: Container(
                            margin:
                            EdgeInsets.only(right: 7.w, left: 7.w),
                            alignment: Alignment.center,
                            height: 6.h,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Color(0xff0061b0)),
                            child: Text(
                              "Pay Now",
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  color: Colors.white,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: "task"),
                            )),
                      ):
                      userselectaddmodal?.selectShippingAddress?.address ==
                                  '' ||
                              userselectaddmodal
                                      ?.selectShippingAddress?.address ==
                                  null ||
                              widget.address == '' ||
                              widget.address == null
                          ? GestureDetector(
                              onTap: () {
                                buildErrorDialog(
                                    context, '', "Please use valid Address");
                              },
                              child: Container(
                                  margin:
                                      EdgeInsets.only(right: 7.w, left: 7.w),
                                  alignment: Alignment.center,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff0061b0)),
                                  child: Text(
                                    "Pay Now",
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "task"),
                                  )),
                            )
                          : GestureDetector(
                              onTap: selectedpayment == 4
                                  ? () {
                                      MakePayment(name, name1);
                                    }
                                  : selectedpayment == 3
                                      ? () {
                                          widget.name == '' ||
                                                  widget.name == null &&
                                                      widget.cvv == '' ||
                                                  widget.cvv == null &&
                                                      widget.em == '' ||
                                                  widget.em == null &&
                                                      widget.ey == '' ||
                                                  widget.ey == null &&
                                                      widget.cn == '' ||
                                                  widget.cn == null
                                              ? Navigator.push(
                                                  context,
                                                  MaterialPageRoute(
                                                    builder: (context) =>
                                                        AddCardPage(
                                                            addid: widget.addid,
                                                            firstname: widget.page == "1"
                                                                ? (userselectaddmodal?.selectShippingAddress?.firstName)
                                                                    .toString()
                                                                : widget.firstname
                                                                    .toString(),
                                                            address: widget.page ==
                                                                    "1"
                                                                ? userselectaddmodal?.selectShippingAddress?.address == '' ||
                                                                        userselectaddmodal?.selectShippingAddress?.address ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : (userselectaddmodal?.selectShippingAddress?.address)
                                                                        .toString()
                                                                : widget.address == '' ||
                                                                        widget.address ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : widget.address
                                                                        .toString(),
                                                            lastname: widget.page == "1"
                                                                ? (userselectaddmodal
                                                                        ?.selectShippingAddress
                                                                        ?.lastName)
                                                                    .toString()
                                                                : widget.lastname.toString()),
                                                  ))
                                              : checkoutStipeap();
                                        }
                                      : selectedpayment == 2
                                          ? () {
                                            if(_pickedFile == null){
                                             buildErrorDialog(context, '', "Please Upload Prescription");
                                            }
                                            else{
                                              checkoutcodap();
                                            }
                                            if(Options == null){
                                              buildErrorDialog(context, '', "Please Select Upload Prescription");

                                              }
                                            else{
                                              checkoutcodap();
                                            }


                                            }
                                          : selectedpayment == 1
                                              ? () {
                                                  double total = double.parse(
                                                      (chekoutdetailmodal
                                                              ?.checkoutData?[0]
                                                              .finalTotalWithTax)
                                                          .toString());
                                                  String formattedNumber =
                                                      total.toStringAsFixed(2);
                                                  String add = widget.page ==
                                                          "1"
                                                      ? (userselectaddmodal
                                                              ?.selectShippingAddress
                                                              ?.address)
                                                          .toString()
                                                      : widget.address
                                                          .toString();
                                                  String name = widget.page ==
                                                          "1"
                                                      ? (userselectaddmodal
                                                              ?.selectShippingAddress
                                                              ?.firstName)
                                                          .toString()
                                                      : widget.firstname
                                                          .toString();

                                                  print(total);
                                                  print(formattedNumber);
                                                  Navigator.push(
                                                      context,
                                                      MaterialPageRoute(
                                                        builder: (context) =>
                                                            UsePaypal(
                                                                sandboxMode: paymethodmodal
                                                                            ?.data
                                                                            ?.paypal
                                                                            ?.liveSts ==
                                                                        "1"
                                                                    ? false
                                                                    : true,
                                                                clientId: paymethodmodal
                                                                        ?.data
                                                                        ?.paypal
                                                                        ?.clientID ??
                                                                    '',
                                                                secretKey: paymethodmodal
                                                                        ?.data
                                                                        ?.paypal
                                                                        ?.secretKey ??
                                                                    '',
                                                                returnURL:
                                                                    "https://samplesite.com/return",
                                                                cancelURL:
                                                                    "https://samplesite.com/cancel",
                                                                transactions: [
                                                                  {
                                                                    "amount": {
                                                                      "total":
                                                                          formattedNumber,
                                                                      "currency":
                                                                          "USD",
                                                                      "details":
                                                                          {
                                                                        "subtotal":
                                                                            formattedNumber,
                                                                        "shipping":
                                                                            '0',
                                                                        "shipping_discount":
                                                                            0
                                                                      }
                                                                    },
                                                                    "description":
                                                                        "The payment transaction description.",
                                                                    "item_list":
                                                                        {
                                                                      "items":
                                                                          [],
                                                                      "shipping_address":
                                                                          {
                                                                        "recipient_name":
                                                                            name,
                                                                        "line1":
                                                                            add,
                                                                        "line2":
                                                                            "",
                                                                        "city":
                                                                            "Austin",
                                                                        "country_code":
                                                                            "US",
                                                                        "postal_code":
                                                                            "73301",
                                                                        "phone":
                                                                            "+00000000",
                                                                        "state":
                                                                            "Texas"
                                                                      },
                                                                    }
                                                                  }
                                                                ],
                                                                note:
                                                                    "Contact us for any questions on your order.",
                                                                onSuccess: (Map
                                                                    params) async {
                                                                  EasyLoading
                                                                      .show(
                                                                          status:
                                                                              'Processing Your Payment ..',
                                                                          indicator:
                                                                              CircularProgressIndicator(
                                                                            backgroundColor:
                                                                                Color(0xfff7941d),
                                                                            color:
                                                                                Colors.white,
                                                                          ));
                                                                  print(
                                                                      "onSuccess:- Uid: ${usermodal?.userId} , Add Id: ${widget.addid} , PaymenId: ${params['paymentId']} , type : paypal");
                                                                  checkoutpaypalap(
                                                                      params[
                                                                          'paymentId']);
                                                                },
                                                                onError:
                                                                    (error) {
                                                                  EasyLoading
                                                                      .show(
                                                                          status:
                                                                              'Processing Your Payment ..',
                                                                          indicator:
                                                                              CircularProgressIndicator(
                                                                            backgroundColor:
                                                                                Color(0xfff7941d),
                                                                            color:
                                                                                Colors.white,
                                                                          ));
                                                                  checkoutpaypalap(
                                                                      '');
                                                                  print(
                                                                      "onError: $error");
                                                                  EasyLoading
                                                                      .showError(
                                                                    "Payment Error",
                                                                  );
                                                                  Navigator.pop(
                                                                      context);
                                                                },
                                                                onCancel:
                                                                    (params) {
                                                                  EasyLoading
                                                                      .show(
                                                                          status:
                                                                              'Processing Your Payment ..',
                                                                          indicator:
                                                                              CircularProgressIndicator(
                                                                            backgroundColor:
                                                                                Color(0xfff7941d),
                                                                            color:
                                                                                Colors.white,
                                                                          ));

                                                                  print(
                                                                      'cancelled: $params');
                                                                  EasyLoading
                                                                      .showError(
                                                                    "Payment Cancelled",
                                                                  );
                                                                }),
                                                      ));
                                                }
                                              : paymethodmodal?.data?.cod
                                                              ?.status ==
                                                          false &&
                                                      paymethodmodal
                                                              ?.data
                                                              ?.paypal
                                                              ?.status ==
                                                          false
                                                  ? () {
                                                      buildErrorDialog(
                                                          context,
                                                          '',
                                                          "No payment method available at this time");
                                                    }
                                                  : () {
                                                      buildErrorDialog(context, '', "Please choose your payment method");
                                                    },

                                child: Container(
                                  margin:
                                      EdgeInsets.only(right: 7.w, left: 7.w),
                                  alignment: Alignment.center,
                                  height: 6.h,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff0061b0)),
                                  child: Text(
                                    "Pay Now",
                                    style: TextStyle(
                                        fontSize: 12.sp,
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
    data['user_id'] = usermodal?.userId == "" || usermodal?.userId == null
        ? deviceName.toString()
        : usermodal?.userId ?? "";
    data['shipphing_id'] = widget.addid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutapi(data).then((response) async {
          chekoutdetailmodal =
              ChekOutDetailModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              chekoutdetailmodal?.status == "success") {
            print("55555555${data}");
            setState(() {
              isLoading = false;
            });
          } else {
            print("55555555${data}");
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
    EasyLoading.show(status: 'Please Wait ...');
    data['user_id'] = usermodal?.userId == "" || usermodal?.userId == null
        ? deviceName.toString()
        : usermodal?.userId ?? "";
    data['payment'] = 'Pay after bill generation';
    data['shipping_address_id'] = widget.addid.toString();
    data['image'] = Options == 'option2' ? '' : _pickedFile == null ? '' : _pickedFile?.path ?? '';
    data['not_prescription'] = 'false';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutcodapi(data).then((response) async {
          checkoutmodal = CheckOutModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              checkoutmodal?.status == "success") {
            EasyLoading.showSuccess('success');
            Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => ThankyouPage(
                      uid: (checkoutmodal?.cartDetails?.orderNumber).toString(),
                      url: checkoutmodal?.invoicePdf.toString(),
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
    data['type'] = selectedpayment == 4
        ? 'razorpay'
        : selectedpayment == 3
            ? 'stripe'
            : 'paypal';
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
            print('Status:${checkoutmodal?.status}');
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

  checkoutStipeap() {
    EasyLoading.show(
        status: 'Processing Your Payment ..',
        indicator: CircularProgressIndicator(
          backgroundColor: Color(0xfff7941d),
          color: Colors.white,
        ));
    final Map<String, String> data = {};
    data['number'] = widget.cn ?? '';
    data['expiry_month'] = widget.em ?? '';
    data['expiry_year'] = widget.ey ?? '';
    data['cvv'] = widget.cvv ?? '';
    data['name'] = widget.name ?? '';
    data['amt'] = (viewcartmodal?.finalTotalWithCharge).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutstripeapi(data).then((response) async {
          strpiepay = StripeModal.fromJson(json.decode(response.body));
          print(strpiepay?.status);
          if (response.statusCode == 200 && strpiepay?.status == "success") {
            print(strpiepay?.status);
            setState(() {
              String payid = strpiepay?.paymentID ?? '';
              checkoutpaypalap(payid);
              isLoading = false;
            });
          } else {
            print(strpiepay?.message);
            EasyLoading.showError(
              strpiepay?.message ?? '',
            );
            setState(() {
              isLoading = false;
            });
          }
        });
      } else {
        EasyLoading.showError(
          "Payment Error",
        );
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

  Future<void> getDeviceInfoandStore() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceName = androidInfo.model; // Device name
        deviceOS = 'Android ${androidInfo.version.release}';
      });
      checkoutap();
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceName = iosInfo.name; // Device name
        deviceOS = 'iOS ${iosInfo.systemVersion}';
      });
    }
    print('Device Name: $deviceName');
    print('Device OS: $deviceOS');
  }
}
