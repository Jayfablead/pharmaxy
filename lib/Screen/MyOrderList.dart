import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/DeliveredOrderModal.dart';
import 'package:ecommerce/Modal/MyOrderListModal.dart';
import 'package:ecommerce/Modal/OrderCancelModal.dart';
import 'package:ecommerce/Modal/PendingOrderModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/OrderSummary.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderList extends StatefulWidget {
  const MyOrderList({super.key});

  @override
  State<MyOrderList> createState() => _MyOrderListState();
}

bool isLoading = true;

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

class wish {
  String? image;
  String? price;
  String? name;
  String? bestprice;
  String? detail;

  wish(this.image, this.name, this.price, this.bestprice, this.detail);
}

int sel = 0;

List cate = [
  'All',
  'Delivered',
  'Pending',
  'Cancelled',
];

List<wish> fav = [
  wish(
      'https://static.vecteezy.com/system/resources/thumbnails/024/125/097/small/plain-navy-t-shirt-mockup-template-with-views-front-and-back-isolated-on-transparent-background-generative-ai-png.png',
      "Black Long Stylish Dress Shirt high quality garment ",
      "300",
      "380",
      "Vivo T2 Pro 5G is teased to feature power and the "),
  wish(
      'https://freepngimg.com/save/12846-dress-shirt-png-hd/480x480',
      "men's blue shirt Shirt high quality garment",
      "1,000",
      "1,140",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  wish(
      'https://www.pngmart.com/files/6/Bluetooth-Headset-PNG-Background-Image.png',
      "boAt Rockerz 103 Pro Bluetooth in Ear Neckband",
      "1,950",
      "2,140",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  wish(
      'https://cdn.shopify.com/s/files/1/0057/8938/4802/products/back_4b76a852-bc9e-4196-b901-bc102ea6b447.png?v=1658534328',
      "Tron Basspods P181 Bluetooth 5.1 True Wireless Earbuds",
      "3,540",
      "3,650",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  wish(
      'https://www.pngkey.com/png/full/8-85077_bluetooth-speakers-png-jbl-charge-3-blue-bluetooth.png',
      "boAt Stone 1200 14W Bluetooth Speaker",
      "5,120",
      "5,480",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  wish(
      'https://detec.in/cdn/shop/products/6_03b4b8f8-5b5c-4330-836f-a97ad4e64b00.png?v=1628233386',
      "nhance productivity with this expertly designed mouse, powered by one ",
      "380",
      "420",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  wish(
      'https://storage.sg.content-cdn.io/cdn-cgi/image/%7Bwidth%7D,%7Bheight%7D,quality=75,format=auto/in-resources/7f703506-689d-4b4e-b482-c32d60769d33/Images/ProductImages/Source/sw1pro-hd-display.png',
      "Black & Gold Black Dial Stainless Steel Strap Watch",
      "788",
      "900",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  wish(
      'https://www.connectednj.com/wp-content/uploads/2019/08/BSI-04-DK-FRONT.png',
      "Step up your style game with our all-new Funky Pent! Available in sizes 2",
      "1,250",
      "1,450",
      "Featuring a modern tapered fit, reduced bulk, and added breathability, ."),
];

class _MyOrderListState extends State<MyOrderList> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      myorderap();
      deliveredap();
      pendingorderap();
      ordercancelledap();
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(

        key: _scaffoldKey,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
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
                                _scaffoldKey.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                size: 25.sp,
                              )),
                          Text(
                            "Orders",
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
                      height: 2.h,
                    ),
                    SizedBox(
                      height: 6.h,
                      child: ListView.builder(
                        scrollDirection: Axis.horizontal,
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return Center(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                InkWell(
                                  onTap: () {
                                    setState(() {
                                      sel = index;
                                    });
                                  },
                                  child: Container(
                                    height: 5.h,
                                    padding: EdgeInsets.symmetric(
                                        vertical: 1.h, horizontal: 8.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.grey),
                                        color: sel == index
                                            ? Color(0xfff7941d)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(20)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(cate[index],
                                        style: TextStyle(
                                            fontSize: 12.5.sp,
                                            color: sel == index
                                                ? Colors.white
                                                : Colors.black,
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            letterSpacing: 1)),
                                  ),
                                ),
                              ],
                            ),
                          );
                        },
                        itemCount: cate.length,
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    sel == 0
                        ? myorderlistmodal?.cartDetails?.length == 0 ||
                                myorderlistmodal?.cartDetails?.length == null
                            ? Container(
                                height: 75.h,
                                alignment: Alignment.center,
                                child: Text(
                                  'No Products Available',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'task',
                                      fontSize: 20.sp,
                                      color: Colors.black),
                                ),
                              )
                            : Column(
                                children: [
                                  // Padding(
                                  //    padding: EdgeInsets.only(left: 1.w),
                                  //    child: Row(
                                  //      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                  //      children: [
                                  //        Padding(
                                  //          padding: EdgeInsets.only(left: 1.w),
                                  //          child: Column(
                                  //            children: [
                                  //              Row(
                                  //                children: [
                                  //
                                  //                ],
                                  //              ),
                                  //            ],
                                  //          ),
                                  //        ),
                                  //        // Container(
                                  //        //   alignment: Alignment.center,
                                  //        //   height: 4.h,
                                  //        //   width: 22.w,
                                  //        //   decoration: BoxDecoration(
                                  //        //       color: Colors.white,
                                  //        //       border: Border.all(color: Colors.grey),
                                  //        //       borderRadius: BorderRadius.circular(15)),
                                  //        //   child: Column(
                                  //        //     mainAxisAlignment: MainAxisAlignment.center,
                                  //        //     children: [
                                  //        //       Row(
                                  //        //         mainAxisAlignment: MainAxisAlignment.center,
                                  //        //         children: [
                                  //        //           Icon(
                                  //        //             Icons.filter_list_sharp,
                                  //        //             color: Color(0xfff7941d),
                                  //        //             size: 19.sp,
                                  //        //           ),
                                  //        //           SizedBox(
                                  //        //             width: 1.w,
                                  //        //           ),
                                  //        //           Text(
                                  //        //             "Filter",
                                  //        //             style: TextStyle(
                                  //        //               fontWeight: FontWeight.bold,
                                  //        //               fontFamily: 'task',
                                  //        //               fontSize: 13.sp,
                                  //        //             ),
                                  //        //           ),
                                  //        //         ],
                                  //        //       ),
                                  //        //     ],
                                  //        //   ),
                                  //        // ),
                                  //      ],
                                  //    ),
                                  //  ),

                                  Container(
                                    height: 75.h,
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(top: 1.h),
                                      itemCount:
                                          myorderlistmodal?.cartDetails?.length,
                                      // The number of items in the grid
                                      itemBuilder:
                                          (BuildContext context, int index) {
                                        // Build each item in the grid
                                        return GestureDetector(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        OrderSummary(
                                                            iteamid: myorderlistmodal
                                                                ?.cartDetails?[
                                                                    index]
                                                                .orderitemid)));
                                          },
                                          child: Card(
                                            color: Color(0xffffffff),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.center,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 2.w,
                                                    ),
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius.all(
                                                            Radius.circular(20),
                                                          ),
                                                          color: Colors
                                                              .grey.shade200),
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(3.0),
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: myorderlistmodal
                                                                  ?.cartDetails?[
                                                                      index]
                                                                  .imgData ??
                                                              '',
                                                          height: 30.w,
                                                          width: 27.w,
                                                          imageBuilder: (context,
                                                                  imageProvider) =>
                                                              Container(
                                                            decoration:
                                                                BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                25,
                                                              ),
                                                              image:
                                                                  DecorationImage(
                                                                image:
                                                                    imageProvider,
                                                                // fit: BoxFit.cover,
                                                              ),
                                                            ),
                                                          ),
                                                          placeholder: (context,
                                                                  url) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Icon(Icons.error),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: 1.w,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              vertical: 1.h,
                                                              horizontal: 1.w),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .start,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          Column(
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 1
                                                                            .w),
                                                                child: SizedBox(
                                                                  width: 55.w,
                                                                  child: Text(
                                                                    maxLines: 1,
                                                                    myorderlistmodal?.cartDetails?[index].productName ==
                                                                                '' ||
                                                                            myorderlistmodal?.cartDetails?[index].productName ==
                                                                                null
                                                                        ? 'N/A'
                                                                        : myorderlistmodal?.cartDetails?[index].productName ??
                                                                            '',
                                                                    style: TextStyle(
                                                                        overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                        color: Colors
                                                                            .black,
                                                                        fontSize: 12
                                                                            .sp,
                                                                        fontWeight:
                                                                            FontWeight
                                                                                .w600,
                                                                        fontFamily:
                                                                            "task"),
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 0.2.h,
                                                              ),
                                                              // Padding(
                                                              //   padding: EdgeInsets.only(left: 1.w),
                                                              //   child: Text(
                                                              //     "Delivered On 10 Sep",
                                                              //     style: TextStyle(
                                                              //       fontSize: 13.sp,
                                                              //       fontFamily: 'task',
                                                              //       fontWeight: FontWeight.normal,
                                                              //       letterSpacing: 1,
                                                              //       color: Colors.black,
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              SizedBox(
                                                                height: 0.2.h,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        left: 1
                                                                            .w),
                                                                child: Row(
                                                                  children: [
                                                                    Text(
                                                                      myorderlistmodal?.cartDetails?[index].singleProductPrice == "" ||
                                                                              myorderlistmodal?.cartDetails?[index].singleProductPrice ==
                                                                                  null
                                                                          ? "N/A"
                                                                          : '₹' +
                                                                              (myorderlistmodal?.cartDetails?[index].singleProductPrice).toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            13.sp,
                                                                        fontFamily:
                                                                            'task',
                                                                        fontWeight:
                                                                            FontWeight.bold,
                                                                        letterSpacing:
                                                                            1,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                    //
                                                                  ],
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 0.5.h,
                                                              ),
                                                              Row(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.of(
                                                                              context)
                                                                          .push(
                                                                              MaterialPageRoute(builder: (context) => OrderSummary(iteamid: myorderlistmodal?.cartDetails?[index].orderitemid)));
                                                                    },
                                                                    child: Container(
                                                                        alignment: Alignment.center,
                                                                        height: 4.h,
                                                                        width: 30.w,
                                                                        decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xfff7941d)),
                                                                        child: Text(
                                                                          "View Detail",
                                                                          style: TextStyle(
                                                                              fontSize: 13.sp,
                                                                              color: Colors.white,
                                                                              fontFamily: "task"),
                                                                        )),
                                                                  ),
                                                                  SizedBox(
                                                                    width:
                                                                        2.5.w,
                                                                  ),
                                                                  Text(
                                                                    myorderlistmodal?.cartDetails?[index].orderStatus ==
                                                                                '' ||
                                                                            myorderlistmodal?.cartDetails?[index].orderStatus ==
                                                                                null
                                                                        ? 'N/A'
                                                                        : myorderlistmodal?.cartDetails?[index].orderStatus == 'Pending order cancelled' ||
                                                                                myorderlistmodal?.cartDetails?[index].orderStatus == 'Order Cancelled'
                                                                            ? "Cancelled"
                                                                            : myorderlistmodal?.cartDetails?[index].orderStatus ?? '',
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          13.sp,
                                                                      fontFamily:
                                                                          'task',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      color: myorderlistmodal?.cartDetails?[index].orderStatus == 'Pending order cancelled' ||
                                                                              myorderlistmodal?.cartDetails?[index].orderStatus ==
                                                                                  'Order Cancelled'
                                                                          ? Colors
                                                                              .red
                                                                          : myorderlistmodal?.cartDetails?[index].orderStatus == 'Pending'
                                                                              ? Colors.deepOrange
                                                                              : Colors.green,
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    width: 4.w,
                                                                  ),
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                        ],
                                                      ),
                                                    )
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                        : sel == 1
                            ? deliveredordermodal?.cartDetails?.length == 0 ||
                                    deliveredordermodal?.cartDetails?.length ==
                                        null
                                ? Container(
                                    height: 75.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Products Available",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 20.sp,
                                          color: Colors.black),
                                    ))
                                : Column(
                                    children: [
                                      // Padding(
                                      //   padding: EdgeInsets.only(left: 1.w),
                                      //   child: Row(
                                      //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                      //     children: [
                                      //       Padding(
                                      //         padding: EdgeInsets.only(left: 1.w),
                                      //         child: Column(
                                      //           children: [
                                      //             Row(
                                      //               children: [
                                      //                 Text(
                                      //                   "Order ID :",
                                      //                   style: TextStyle(
                                      //                       fontWeight: FontWeight.normal,
                                      //                       fontFamily: 'task',
                                      //                       fontSize: 15.sp,
                                      //                       color: Colors.black45),
                                      //                 ),
                                      //                 Text(
                                      //                   deliveredordermodal?.cartDetails?[0].orderid == '' ||
                                      //                       deliveredordermodal
                                      //                           ?.cartDetails?[0].orderid ==
                                      //                           null
                                      //                       ? 'N/A'
                                      //                       : deliveredordermodal?.cartDetails?[0].orderid ??
                                      //                       '',
                                      //                   style: TextStyle(
                                      //                       fontWeight: FontWeight.bold,
                                      //                       fontFamily: 'task',
                                      //                       fontSize: 15.sp,
                                      //                       color: Colors.grey),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //       Container(
                                      //         alignment: Alignment.center,
                                      //         height: 4.h,
                                      //         width: 22.w,
                                      //         decoration: BoxDecoration(
                                      //             color: Colors.white,
                                      //             border: Border.all(color: Colors.grey),
                                      //             borderRadius: BorderRadius.circular(15)),
                                      //         child: Column(
                                      //           mainAxisAlignment: MainAxisAlignment.center,
                                      //           children: [
                                      //             Row(
                                      //               mainAxisAlignment: MainAxisAlignment.center,
                                      //               children: [
                                      //                 Icon(
                                      //                   Icons.filter_list_sharp,
                                      //                   color: Color(0xfff7941d),
                                      //                   size: 19.sp,
                                      //                 ),
                                      //                 SizedBox(
                                      //                   width: 1.w,
                                      //                 ),
                                      //                 Text(
                                      //                   "Filter",
                                      //                   style: TextStyle(
                                      //                     fontWeight: FontWeight.bold,
                                      //                     fontFamily: 'task',
                                      //                     fontSize: 13.sp,
                                      //                   ),
                                      //                 ),
                                      //               ],
                                      //             ),
                                      //           ],
                                      //         ),
                                      //       ),
                                      //     ],
                                      //   ),
                                      // ),
                                      Container(
                                        height: 75.h,
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(top: 1.h),
                                          itemCount: deliveredordermodal
                                              ?.cartDetails?.length,
                                          // The number of items in the grid
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // Build each item in the grid
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => OrderSummary(
                                                            iteamid: deliveredordermodal
                                                                ?.cartDetails?[
                                                                    index]
                                                                .orderitemid)));
                                              },
                                              child: Card(
                                                color: Color(0xffffffff),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        SizedBox(
                                                          width: 2.w,
                                                        ),
                                                        Container(
                                                          decoration:
                                                              BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .all(
                                                                    Radius
                                                                        .circular(
                                                                            20),
                                                                  ),
                                                                  color: Colors
                                                                      .grey
                                                                      .shade200),
                                                          child: Padding(
                                                            padding:
                                                                EdgeInsets.all(
                                                                    3.0),
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: myorderlistmodal
                                                                      ?.cartDetails?[
                                                                          index]
                                                                      .imgData ??
                                                                  '',
                                                              height: 30.w,
                                                              width: 27.w,
                                                              imageBuilder:
                                                                  (context,
                                                                          imageProvider) =>
                                                                      Container(
                                                                decoration:
                                                                    BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                    25,
                                                                  ),
                                                                  image:
                                                                      DecorationImage(
                                                                    image:
                                                                        imageProvider,
                                                                    // fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 1.w,
                                                        ),
                                                        Padding(
                                                          padding: EdgeInsets
                                                              .symmetric(
                                                                  vertical: 1.h,
                                                                  horizontal:
                                                                      1.w),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .start,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .start,
                                                            children: [
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),
                                                              Column(
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 1
                                                                            .w),
                                                                    child:
                                                                        SizedBox(
                                                                      width:
                                                                          55.w,
                                                                      child:
                                                                          Text(
                                                                        maxLines:
                                                                            1,
                                                                        deliveredordermodal?.cartDetails?[index].productName == '' || deliveredordermodal?.cartDetails?[index].productName == null
                                                                            ? 'N/A'
                                                                            : deliveredordermodal?.cartDetails?[index].productName ??
                                                                                '',
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            color: Colors.black,
                                                                            fontSize: 12.sp,
                                                                            fontWeight: FontWeight.w600,
                                                                            fontFamily: "task"),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.2.h,
                                                                  ),
                                                                  // Padding(
                                                                  //   padding: EdgeInsets.only(left: 1.w),
                                                                  //   child: Text(
                                                                  //     "Delivered On 10 Sep",
                                                                  //     style: TextStyle(
                                                                  //       fontSize: 13.sp,
                                                                  //       fontFamily: 'task',
                                                                  //       fontWeight: FontWeight.normal,
                                                                  //       letterSpacing: 1,
                                                                  //       color: Colors.black,
                                                                  //     ),
                                                                  //   ),
                                                                  // ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.2.h,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        left: 1
                                                                            .w),
                                                                    child: Row(
                                                                      children: [
                                                                        Text(
                                                                          deliveredordermodal?.cartDetails?[index].singleProductPrice == "" || deliveredordermodal?.cartDetails?[index].singleProductPrice == null
                                                                              ? "N/A"
                                                                              : '₹' + (deliveredordermodal?.cartDetails?[index].singleProductPrice).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                13.sp,
                                                                            fontFamily:
                                                                                'task',
                                                                            fontWeight:
                                                                                FontWeight.bold,
                                                                            letterSpacing:
                                                                                1,
                                                                            color:
                                                                                Colors.black,
                                                                          ),
                                                                        ),
                                                                        //
                                                                      ],
                                                                    ),
                                                                  ),
                                                                  SizedBox(
                                                                    height:
                                                                        0.5.h,
                                                                  ),
                                                                  Row(
                                                                    children: [
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context)
                                                                              .push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: deliveredordermodal?.cartDetails?[index].orderitemid)));
                                                                        },
                                                                        child: Container(
                                                                            alignment: Alignment.center,
                                                                            height: 4.h,
                                                                            width: 30.w,
                                                                            decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xfff7941d)),
                                                                            child: Text(
                                                                              "View Detail",
                                                                              style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                                                                            )),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.w,
                                                                      ),
                                                                      Text(
                                                                        "Delivered",
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              13.sp,
                                                                          fontFamily:
                                                                              'task',
                                                                          fontWeight:
                                                                              FontWeight.bold,
                                                                          letterSpacing:
                                                                              1,
                                                                          color: Colors
                                                                              .green
                                                                              .shade400,
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        width:
                                                                            4.w,
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ],
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                            ],
                                                          ),
                                                        )
                                                      ],
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                            : sel == 2
                                ? pendingordermodal?.cartDetails?.length == 0 ||
                                        pendingordermodal
                                                ?.cartDetails?.length ==
                                            null
                                    ? Container(
                                        height: 75.h,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "No Products Available",
                                          style: TextStyle(
                                              fontFamily: "task",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                        ))
                                    : Column(
                                        children: [
                                          // Padding(
                                          //   padding: EdgeInsets.only(left: 1.w),
                                          //   child: Row(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Padding(
                                          //         padding: EdgeInsets.only(left: 1.w),
                                          //         child: Column(
                                          //           children: [
                                          //             Row(
                                          //               children: [
                                          //                 Text(
                                          //                   "Order ID :",
                                          //                   style: TextStyle(
                                          //                       fontWeight: FontWeight.normal,
                                          //                       fontFamily: 'task',
                                          //                       fontSize: 15.sp,
                                          //                       color: Colors.black45),
                                          //                 ),
                                          //                 Text(
                                          //                   pendingordermodal?.cartDetails?[0].orderid == '' ||
                                          //                       pendingordermodal
                                          //                           ?.cartDetails?[0].orderid ==
                                          //                           null
                                          //                       ? 'N/A'
                                          //                       : pendingordermodal?.cartDetails?[0].orderid ??
                                          //                       '',
                                          //                   style: TextStyle(
                                          //                       fontWeight: FontWeight.bold,
                                          //                       fontFamily: 'task',
                                          //                       fontSize: 15.sp,
                                          //                       color: Colors.grey),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         alignment: Alignment.center,
                                          //         height: 4.h,
                                          //         width: 22.w,
                                          //         decoration: BoxDecoration(
                                          //             color: Colors.white,
                                          //             border: Border.all(color: Colors.grey),
                                          //             borderRadius: BorderRadius.circular(15)),
                                          //         child: Column(
                                          //           mainAxisAlignment: MainAxisAlignment.center,
                                          //           children: [
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.center,
                                          //               children: [
                                          //                 Icon(
                                          //                   Icons.filter_list_sharp,
                                          //                   color: Color(0xfff7941d),
                                          //                   size: 19.sp,
                                          //                 ),
                                          //                 SizedBox(
                                          //                   width: 1.w,
                                          //                 ),
                                          //                 Text(
                                          //                   "Filter",
                                          //                   style: TextStyle(
                                          //                     fontWeight: FontWeight.bold,
                                          //                     fontFamily: 'task',
                                          //                     fontSize: 13.sp,
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          Container(
                                            height: 75.h,
                                            child: ListView.builder(
                                              padding:
                                                  EdgeInsets.only(top: 1.h),
                                              itemCount: pendingordermodal
                                                  ?.cartDetails?.length,
                                              // The number of items in the grid
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                // Build each item in the grid
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) => OrderSummary(
                                                                iteamid: pendingordermodal
                                                                    ?.cartDetails?[
                                                                        index]
                                                                    .orderitemid)));
                                                  },
                                                  child: Card(
                                                    color: Color(0xffffffff),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            20),
                                                                      ),
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: pendingordermodal
                                                                          ?.cartDetails?[
                                                                              index]
                                                                          .imgData ??
                                                                      '',
                                                                  height: 30.w,
                                                                  width: 27.w,
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        25,
                                                                      ),
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        // fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      Center(
                                                                          child:
                                                                              CircularProgressIndicator()),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 1.w,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          1.h,
                                                                      horizontal:
                                                                          1.w),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 1.w),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              55.w,
                                                                          child:
                                                                              Text(
                                                                            maxLines:
                                                                                1,
                                                                            pendingordermodal?.cartDetails?[index].productName == '' || pendingordermodal?.cartDetails?[index].productName == null
                                                                                ? 'N/A'
                                                                                : pendingordermodal?.cartDetails?[index].productName ?? '',
                                                                            style: TextStyle(
                                                                                overflow: TextOverflow.ellipsis,
                                                                                color: Colors.black,
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontFamily: "task"),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            0.2.h,
                                                                      ),
                                                                      // Padding(
                                                                      //   padding: EdgeInsets.only(left: 1.w),
                                                                      //   child: Text(
                                                                      //     "Delivered On 10 Sep",
                                                                      //     style: TextStyle(
                                                                      //       fontSize: 13.sp,
                                                                      //       fontFamily: 'task',
                                                                      //       fontWeight: FontWeight.normal,
                                                                      //       letterSpacing: 1,
                                                                      //       color: Colors.black,
                                                                      //     ),
                                                                      //   ),
                                                                      // ),
                                                                      SizedBox(
                                                                        height:
                                                                            0.2.h,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 1.w),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              pendingordermodal?.cartDetails?[index].singleProductPrice == "" || pendingordermodal?.cartDetails?[index].singleProductPrice == null ? "N/A" : '₹' + (pendingordermodal?.cartDetails?[index].singleProductPrice).toString(),
                                                                              style: TextStyle(
                                                                                fontSize: 13.sp,
                                                                                fontFamily: 'task',
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                            //
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            0.5.h,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: pendingordermodal?.cartDetails?[index].orderitemid)));
                                                                            },
                                                                            child: Container(
                                                                                alignment: Alignment.center,
                                                                                height: 4.h,
                                                                                width: 30.w,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xfff7941d)),
                                                                                child: Text(
                                                                                  "View Detail",
                                                                                  style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4.w,
                                                                          ),
                                                                          Text(
                                                                            "Pending",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 13.sp,
                                                                              fontFamily: 'task',
                                                                              fontWeight: FontWeight.bold,
                                                                              letterSpacing: 1,
                                                                              color: Colors.deepOrange,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4.w,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 1.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                                : ordercancelmodal?.cartDetails?.length == 0 ||
                                        ordercancelmodal?.cartDetails?.length ==
                                            null
                                    ? Container(
                                        height: 75.h,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "No Products Available",
                                          style: TextStyle(
                                              fontFamily: "task",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 20.sp,
                                              color: Colors.black),
                                        ))
                                    : Column(
                                        children: [
                                          // Padding(
                                          //   padding: EdgeInsets.only(left: 1.w),
                                          //   child: Row(
                                          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                          //     children: [
                                          //       Padding(
                                          //         padding: EdgeInsets.only(left: 1.w),
                                          //         child: Column(
                                          //           children: [
                                          //             Row(
                                          //               children: [
                                          //                 Text(
                                          //                   "Order ID :",
                                          //                   style: TextStyle(
                                          //                       fontWeight: FontWeight.normal,
                                          //                       fontFamily: 'task',
                                          //                       fontSize: 15.sp,
                                          //                       color: Colors.black45),
                                          //                 ),
                                          //                 Text(
                                          //                   pendingordermodal?.cartDetails?[0].orderid == '' ||
                                          //                       pendingordermodal
                                          //                           ?.cartDetails?[0].orderid ==
                                          //                           null
                                          //                       ? 'N/A'
                                          //                       : pendingordermodal?.cartDetails?[0].orderid ??
                                          //                       '',
                                          //                   style: TextStyle(
                                          //                       fontWeight: FontWeight.bold,
                                          //                       fontFamily: 'task',
                                          //                       fontSize: 15.sp,
                                          //                       color: Colors.grey),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //       Container(
                                          //         alignment: Alignment.center,
                                          //         height: 4.h,
                                          //         width: 22.w,
                                          //         decoration: BoxDecoration(
                                          //             color: Colors.white,
                                          //             border: Border.all(color: Colors.grey),
                                          //             borderRadius: BorderRadius.circular(15)),
                                          //         child: Column(
                                          //           mainAxisAlignment: MainAxisAlignment.center,
                                          //           children: [
                                          //             Row(
                                          //               mainAxisAlignment: MainAxisAlignment.center,
                                          //               children: [
                                          //                 Icon(
                                          //                   Icons.filter_list_sharp,
                                          //                   color: Color(0xfff7941d),
                                          //                   size: 19.sp,
                                          //                 ),
                                          //                 SizedBox(
                                          //                   width: 1.w,
                                          //                 ),
                                          //                 Text(
                                          //                   "Filter",
                                          //                   style: TextStyle(
                                          //                     fontWeight: FontWeight.bold,
                                          //                     fontFamily: 'task',
                                          //                     fontSize: 13.sp,
                                          //                   ),
                                          //                 ),
                                          //               ],
                                          //             ),
                                          //           ],
                                          //         ),
                                          //       ),
                                          //     ],
                                          //   ),
                                          // ),
                                          Container(
                                            height: 75.h,
                                            child: ListView.builder(
                                              padding:
                                                  EdgeInsets.only(top: 1.h),
                                              itemCount: ordercancelmodal
                                                  ?.cartDetails?.length,
                                              // The number of items in the grid
                                              itemBuilder:
                                                  (BuildContext context,
                                                      int index) {
                                                // Build each item in the grid
                                                return GestureDetector(
                                                  onTap: () {
                                                    Navigator.of(context).push(
                                                        MaterialPageRoute(
                                                            builder: (context) => OrderSummary(
                                                                iteamid: ordercancelmodal
                                                                    ?.cartDetails?[
                                                                        index]
                                                                    .orderitemid)));
                                                  },
                                                  child: Card(
                                                    color: Color(0xffffffff),
                                                    child: Column(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .start,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            SizedBox(
                                                              width: 2.w,
                                                            ),
                                                            Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .all(
                                                                        Radius.circular(
                                                                            20),
                                                                      ),
                                                                      color: Colors
                                                                          .grey
                                                                          .shade200),
                                                              child: Padding(
                                                                padding:
                                                                    EdgeInsets
                                                                        .all(
                                                                            3.0),
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: ordercancelmodal
                                                                          ?.cartDetails?[
                                                                              index]
                                                                          .imgData ??
                                                                      '',
                                                                  height: 30.w,
                                                                  width: 27.w,
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius
                                                                              .circular(
                                                                        25,
                                                                      ),
                                                                      image:
                                                                          DecorationImage(
                                                                        image:
                                                                            imageProvider,
                                                                        // fit: BoxFit.cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      Center(
                                                                          child:
                                                                              CircularProgressIndicator()),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error),
                                                                ),
                                                              ),
                                                            ),
                                                            SizedBox(
                                                              width: 1.w,
                                                            ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .symmetric(
                                                                      vertical:
                                                                          1.h,
                                                                      horizontal:
                                                                          1.w),
                                                              child: Column(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .start,
                                                                children: [
                                                                  SizedBox(
                                                                    height: 2.h,
                                                                  ),
                                                                  Column(
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .start,
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 1.w),
                                                                        child:
                                                                            SizedBox(
                                                                          width:
                                                                              55.w,
                                                                          child:
                                                                              Text(
                                                                            maxLines:
                                                                                1,
                                                                            ordercancelmodal?.cartDetails?[index].productName == '' || ordercancelmodal?.cartDetails?[index].productName == null
                                                                                ? 'N/A'
                                                                                : ordercancelmodal?.cartDetails?[index].productName ?? '',
                                                                            style: TextStyle(
                                                                                overflow: TextOverflow.ellipsis,
                                                                                color: Colors.black,
                                                                                fontSize: 12.sp,
                                                                                fontWeight: FontWeight.w600,
                                                                                fontFamily: "task"),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            0.2.h,
                                                                      ),
                                                                      // Padding(
                                                                      //   padding: EdgeInsets.only(left: 1.w),
                                                                      //   child: Text(
                                                                      //     "Delivered On 10 Sep",
                                                                      //     style: TextStyle(
                                                                      //       fontSize: 13.sp,
                                                                      //       fontFamily: 'task',
                                                                      //       fontWeight: FontWeight.normal,
                                                                      //       letterSpacing: 1,
                                                                      //       color: Colors.black,
                                                                      //     ),
                                                                      //   ),
                                                                      // ),
                                                                      SizedBox(
                                                                        height:
                                                                            0.2.h,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(left: 1.w),
                                                                        child:
                                                                            Row(
                                                                          children: [
                                                                            Text(
                                                                              ordercancelmodal?.cartDetails?[index].singleProductPrice == "" || ordercancelmodal?.cartDetails?[index].singleProductPrice == null ? "N/A" : '₹' + (ordercancelmodal?.cartDetails?[index].singleProductPrice).toString(),
                                                                              style: TextStyle(
                                                                                fontSize: 13.sp,
                                                                                fontFamily: 'task',
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1,
                                                                                color: Colors.black,
                                                                              ),
                                                                            ),
                                                                            //
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            0.5.h,
                                                                      ),
                                                                      Row(
                                                                        children: [
                                                                          GestureDetector(
                                                                            onTap:
                                                                                () {
                                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: ordercancelmodal?.cartDetails?[index].orderitemid)));
                                                                            },
                                                                            child: Container(
                                                                                alignment: Alignment.center,
                                                                                height: 4.h,
                                                                                width: 30.w,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Color(0xfff7941d)),
                                                                                child: Text(
                                                                                  "View Detail",
                                                                                  style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4.w,
                                                                          ),
                                                                          Text(
                                                                            "Cancelled",
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize: 13.sp,
                                                                              fontFamily: 'task',
                                                                              fontWeight: FontWeight.bold,
                                                                              letterSpacing: 1,
                                                                              color: Colors.red.shade400,
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width:
                                                                                4.w,
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ],
                                                                  ),
                                                                  SizedBox(
                                                                    height: 1.h,
                                                                  ),
                                                                ],
                                                              ),
                                                            )
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                  ],
                ),
              ),
      ),
    );
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

  myorderap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().myorderlistapi(data).then((response) async {
          myorderlistmodal =
              MyOrderListModal.fromJson(json.decode(response.body));
          print(myorderlistmodal?.status);
          if (response.statusCode == 200 &&
              myorderlistmodal?.status == "success") {
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

  deliveredap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().deliveredapi(data).then((response) async {
          deliveredordermodal =
              DeliveredOrderModal.fromJson(json.decode(response.body));
          print(deliveredordermodal?.status);
          if (response.statusCode == 200 &&
              deliveredordermodal?.status == "success") {
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

  pendingorderap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().pendingorderapi(data).then((response) async {
          pendingordermodal =
              PendingOrderModal.fromJson(json.decode(response.body));
          print(pendingordermodal?.status);
          if (response.statusCode == 200 &&
              pendingordermodal?.status == "success") {
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

  ordercancelledap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().cancelorderapi(data).then((response) async {
          ordercancelmodal =
              OrderCancelModal.fromJson(json.decode(response.body));
          print(ordercancelmodal?.status);
          if (response.statusCode == 200 &&
              ordercancelmodal?.status == "success") {
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
}
