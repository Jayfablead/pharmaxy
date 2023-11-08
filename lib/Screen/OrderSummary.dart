import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/MyOederDetailModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class OrderSummary extends StatefulWidget {
  String? iteamid;

  OrderSummary({super.key, this.iteamid});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class order {
  String? image;
  String? name;
  String? dec;
  String? price;

  order(this.image, this.name, this.price, this.dec);
}

List<order> orderdetail = [
  order(
    'https://www.transparentpng.com/thumb/-iphone-x/dO1Aqf-apple-iphone-caracteru-edsticas-especificaciones.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.transparentpng.com/thumb/computer/6o4Q2H-png-windows-desktop-set-software-game-coding-.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://pngimg.com/d/book_PNG51058.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.transparentpng.com/thumb/watch/dOleGR-skin-watch-clipart-transparent.png',
    'Samsung Mobile ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png',
    'Toys',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png',
    'Toys',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
];

bool isLoading = true;
final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class _OrderSummaryState extends State<OrderSummary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    myorderdetailap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKey,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: Column(
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
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 25.sp,
                                )),
                            Text(
                              "OrderDetail",
                              style: TextStyle(
                                fontSize: 20.sp,
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    usermodal?.userId == "" ||
                                            usermodal?.userId == null
                                        ? Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    LoginPage2()))
                                        : Navigator.of(context).push(
                                            MaterialPageRoute(
                                                builder: (context) =>
                                                    ProfilePage()));
                                  },
                                  child: usermodal?.userId == "" ||
                                          usermodal?.userId == null
                                      ? Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Color(0xfff7941d),
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.sp,
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 1.w),
                                          height: 12.2.w,
                                          width: 12.2.w,
                                          padding: EdgeInsets.all(1.w),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(90),
                                            child: CachedNetworkImage(
                                                fit: BoxFit.cover,
                                                imageUrl: profilemodal
                                                        ?.profileDetails
                                                        ?.profileimage ??
                                                    '',
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Icon(Icons
                                                        .error_outline_rounded)),
                                          ),
                                        ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Padding(
                        padding: EdgeInsets.only(left: 1.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Padding(
                              padding: EdgeInsets.only(left: 1.w),
                              child: Column(
                                children: [
                                  Row(
                                    children: [
                                      Text(
                                        "Order ID :",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontFamily: 'task',
                                            fontSize: 15.sp,
                                            color: Colors.black45),
                                      ),
                                      Text(
                                        myoederdetailmodal?.orderDetails
                                                        ?.orderNumber ==
                                                    '' ||
                                                myoederdetailmodal?.orderDetails
                                                        ?.orderNumber ==
                                                    null
                                            ? 'N/A'
                                            : myoederdetailmodal?.orderDetails
                                                    ?.orderNumber ??
                                                '',
                                        style: TextStyle(
                                            fontWeight: FontWeight.normal,
                                            fontFamily: 'task',
                                            fontSize: 15.sp,
                                            color: Colors.grey),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 23.h,
                        child: Card(
                            color: Colors.white,
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      width: 2.w,
                                    ),
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(20)),
                                          color: Colors.grey.shade200),
                                      child: Padding(
                                        padding: EdgeInsets.all(3.0),
                                        child: CachedNetworkImage(
                                          imageUrl: myoederdetailmodal
                                                  ?.orderDetails?.imgData ??
                                              '',
                                          fit: BoxFit.cover,
                                          height: 31.w,
                                          width: 31.w,
                                          imageBuilder:
                                              (context, imageProvider) =>
                                                  Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(25),
                                              image: DecorationImage(
                                                image: imageProvider,
                                                // fit: BoxFit.cover,
                                              ),
                                            ),
                                          ),
                                          placeholder: (context, url) => Center(
                                              child:
                                                  CircularProgressIndicator()),
                                          errorWidget: (context, url, error) =>
                                              Icon(Icons.error),
                                        ),
                                      ),
                                    ),
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 1.w),
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: SizedBox(
                                                  width: 45.w,
                                                  child: Text(
                                                    myoederdetailmodal
                                                                    ?.orderDetails
                                                                    ?.productName ==
                                                                '' ||
                                                            myoederdetailmodal
                                                                    ?.orderDetails
                                                                    ?.productName ==
                                                                null
                                                        ? 'N/A'
                                                        : myoederdetailmodal
                                                                ?.orderDetails
                                                                ?.productName ??
                                                            '',
                                                    style: TextStyle(
                                                        color: Colors.black,
                                                        fontSize: 12.sp,
                                                        fontWeight:
                                                            FontWeight.w600,
                                                        fontFamily: "task"),
                                                  ),
                                                ),
                                              ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: Text(
                                                  myoederdetailmodal
                                                                  ?.orderDetails
                                                                  ?.orderStatus ==
                                                              '' ||
                                                          myoederdetailmodal
                                                                  ?.orderDetails
                                                                  ?.orderStatus ==
                                                              null
                                                      ? 'N/A'
                                                      : myoederdetailmodal
                                                              ?.orderDetails
                                                              ?.orderStatus ??
                                                          '',
                                                  style: TextStyle(
                                                    fontSize: 13.sp,
                                                    fontFamily: 'task',
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                              // Padding(
                                              //   padding: EdgeInsets.only(left: 1.w),
                                              //   child: Text(
                                              //     "Delivered On 10 Sep",
                                              //       style: TextStyle(
                                              //       fontSize: 13.sp,
                                              //       fontFamily: 'task',
                                              //       fontWeight: FontWeight.normal,
                                              //       letterSpacing: 1,
                                              //       color: Colors.black,
                                              //     ),
                                              //   ),
                                              // ),
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 1.w),
                                                child: Text(
                                                  myoederdetailmodal
                                                                  ?.orderDetails
                                                                  ?.price ==
                                                              "" ||
                                                          myoederdetailmodal
                                                                  ?.orderDetails
                                                                  ?.price ==
                                                              null
                                                      ? "N/A"
                                                      : '₹' +
                                                          (myoederdetailmodal
                                                                  ?.orderDetails
                                                                  ?.price)
                                                              .toString(),
                                                  style: TextStyle(
                                                    fontSize: 15.sp,
                                                    fontFamily: 'task',
                                                    fontWeight: FontWeight.bold,
                                                    letterSpacing: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(left: 2.3.w),
                            child: Text(
                              "Shipping Address",
                              style: TextStyle(
                                fontSize: 15.sp,
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 0.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Column(
                                  children: [
                                    Container(
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.white),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 3.w, vertical: 2.h),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            SizedBox(
                                              width: 72.w,
                                              child: Column(
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    children: [
                                                      Text(
                                                        myoederdetailmodal
                                                                        ?.orderDetails
                                                                        ?.firstname ==
                                                                    '' ||
                                                                myoederdetailmodal
                                                                        ?.orderDetails
                                                                        ?.firstname ==
                                                                    null
                                                            ? 'N/A'
                                                            : myoederdetailmodal
                                                                    ?.orderDetails
                                                                    ?.firstname ??
                                                                '',
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: "task"),
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        myoederdetailmodal
                                                                        ?.orderDetails
                                                                        ?.lastname ==
                                                                    '' ||
                                                                myoederdetailmodal
                                                                        ?.orderDetails
                                                                        ?.lastname ==
                                                                    null
                                                            ? 'N/A'
                                                            : myoederdetailmodal
                                                                    ?.orderDetails
                                                                    ?.lastname ??
                                                                '',
                                                        style: TextStyle(
                                                            fontSize: 15.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: "task"),
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                    height: 1.h,
                                                  ),
                                                  Text(
                                                    myoederdetailmodal
                                                                    ?.orderDetails
                                                                    ?.address1 ==
                                                                '' ||
                                                            myoederdetailmodal
                                                                    ?.orderDetails
                                                                    ?.address1 ==
                                                                null
                                                        ? 'N/A'
                                                        : myoederdetailmodal
                                                                ?.orderDetails
                                                                ?.address1 ??
                                                            '',
                                                    style: TextStyle(
                                                        fontSize: 13.5.sp,
                                                        color: Colors.black,
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        fontFamily: "task"),
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Icon(Icons.arrow_forward_ios)
                                          ],
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 1.h,
                                ),
                                myoederdetailmodal?.orderDetails?.orderStatus ==
                                        'Order Cancelled'
                                    ? Container()
                                    : Padding(
                                        padding: EdgeInsets.only(left: 2.w),
                                        child: Text(
                                          "Payment Method",
                                          style: TextStyle(
                                            fontSize: 15.sp,
                                            fontFamily: "task",
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                myoederdetailmodal?.orderDetails?.payment ==
                                        'cod'
                                    ? Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Colors.white),
                                        child:
                                            myoederdetailmodal?.orderDetails
                                                        ?.orderStatus ==
                                                    'Order Cancelled'
                                                ? Container()
                                                : Padding(
                                                    padding:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 3.w,
                                                            vertical: 2.h),
                                                    child: Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .spaceBetween,
                                                      children: [
                                                        Column(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Column(
                                                              children: [
                                                                GestureDetector(
                                                                  onTap: () {},
                                                                  child:
                                                                      Container(
                                                                    padding: EdgeInsets
                                                                        .all(2
                                                                            .w),
                                                                    width: 80.w,
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white
                                                                          .withOpacity(
                                                                              0.04),
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              15.sp),
                                                                      border:
                                                                          Border
                                                                              .all(
                                                                        color: Colors
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
                                                                        Image
                                                                            .asset(
                                                                          "assets/cod1.png",
                                                                          height:
                                                                              5.h,
                                                                          width:
                                                                              20.w,
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                              5.w,
                                                                        ),
                                                                        Text(
                                                                            "Cash On Delivery",
                                                                            style:
                                                                                TextStyle(
                                                                              color: Colors.black,
                                                                              fontSize: 17.sp,
                                                                              fontFamily: 'match',
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
                                                      ],
                                                    ),
                                                  ),
                                      )
                                    : myoederdetailmodal
                                                ?.orderDetails?.orderStatus ==
                                            'Order Cancelled'
                                        ? Container()
                                        : Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.w),
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                GestureDetector(
                                                  onTap: () {
                                                    setState(() {});
                                                  },
                                                  child: Container(
                                                    width: 80.w,
                                                    padding:
                                                        EdgeInsets.all(2.w),
                                                    decoration: BoxDecoration(
                                                      color: Colors.white
                                                          .withOpacity(0.04),
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
                                                          Text("Pay PayPal",
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
                                                ),
                                                SizedBox(
                                                  height: 2.h,
                                                ),

                                                // Column(
                                                //   children: [
                                                //     GestureDetector(
                                                //       onTap: () {},
                                                //       child: Container(
                                                //         padding: EdgeInsets.all(2.w),
                                                //         width: 80.w,
                                                //         decoration: BoxDecoration(
                                                //           color: Colors.white
                                                //               .withOpacity(0.04),
                                                //           borderRadius:
                                                //               BorderRadius.circular(15.sp),
                                                //           border: Border.all(
                                                //             color: Colors.black12,
                                                //             // Border color
                                                //             width: 2.0, // Border width
                                                //           ),
                                                //         ),
                                                //         child: Row(
                                                //           mainAxisAlignment:
                                                //               MainAxisAlignment.start,
                                                //           crossAxisAlignment:
                                                //               CrossAxisAlignment.center,
                                                //           children: [
                                                //             Image.asset(
                                                //               "assets/cod1.png",
                                                //               height: 5.h,
                                                //               width: 20.w,
                                                //             ),
                                                //             SizedBox(
                                                //               width: 5.w,
                                                //             ),
                                                //             Text("Cash On Delivery",
                                                //                 style: TextStyle(
                                                //                   color: Colors.black,
                                                //                   fontSize: 17.sp,
                                                //                   fontFamily: 'match',
                                                //                 )),
                                                //           ],
                                                //         ),
                                                //       ),
                                                //     ),
                                                //     SizedBox(
                                                //       height: 2.h,
                                                //     ),
                                                //   ],
                                                // ),
                                              ],
                                            ),
                                          ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  myorderdetailap() async {
    final Map<String, String> data = {};
    data['order_item_id'] = widget.iteamid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().myorderdetailapi(data).then((response) async {
          myoederdetailmodal =
              MyOederDetailModal.fromJson(json.decode(response.body));
          print(myoederdetailmodal?.status);
          if (response.statusCode == 200 &&
              myoederdetailmodal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
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

  viewap() {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ViewProfile(data).then((response) async {
          profilemodal = ProfileModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && profilemodal?.status == "success") {
            print(profilemodal?.status);
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
