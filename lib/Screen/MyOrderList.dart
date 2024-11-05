import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/DeliveredOrderModal.dart';
import 'package:ecommerce/Modal/MyOrderListModal.dart';
import 'package:ecommerce/Modal/OrderCancelModal.dart';
import 'package:ecommerce/Modal/PaidOrderModel.dart';
import 'package:ecommerce/Modal/PendingOrderModal.dart';
import 'package:ecommerce/Modal/PlacedOrderModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/ShippedOrderModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/OrderSummary.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderList extends StatefulWidget {
  const MyOrderList({super.key});

  @override
  State<MyOrderList> createState() => _MyOrderListState();
}

bool isLoading = true;

final GlobalKey<ScaffoldState> _scaffoldKeyodlt = GlobalKey<ScaffoldState>();

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
  'paid',
  'Shipped',
  'placed',
  'pending',
  'completed',
  'cancelled',
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
      orderpaidap();
      ordershippedap();
      orderplacedap();
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeyodlt,
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
                    // App bar
                    Container(
                      width: MediaQuery.of(context).size.width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                              onPressed: () {
                                _scaffoldKeyodlt.currentState?.openDrawer();
                              },
                              icon: Icon(
                                Icons.menu,
                                size: 20.sp,
                              )),
                          Text(
                            "Orders",
                            style: TextStyle(
                              fontSize: 16.sp,
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
                                          color: Color(0xff0061b0),
                                          fontFamily: 'task',
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14.sp,
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
                                        vertical: 1.h, horizontal: 7.w),
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        border: Border.all(
                                            width: 0.5, color: Colors.grey),
                                        color: sel == index
                                            ? Color(0xff0061b0)
                                            : Colors.white,
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    margin:
                                        EdgeInsets.symmetric(horizontal: 2.w),
                                    child: Text(cate[index],
                                        style: TextStyle(
                                            fontSize: 11.sp,
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
                        ? myorderlistmodal?.data?.length == 0 ||
                                myorderlistmodal?.data?.length == null
                            ? Container(
                                height: 75.h,
                                alignment: Alignment.center,
                                child: Text(
                                  'No Products Available',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'task',
                                      fontSize: 13.sp,
                                      color: Colors.black),
                                ),
                              )
                            : Column(
                                children: [
                                  Container(
                                    height: 75.h,
                                    child: ListView.builder(
                                      padding: EdgeInsets.only(top: 1.h),
                                      itemCount:
                                          myorderlistmodal?.data?.length,
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
                                                          stuts: myorderlistmodal
                                                              ?.data?[
                                                          index]
                                                              .orderStatus,
                                                            iteamid: myorderlistmodal
                                                                ?.data?[
                                                                    index]
                                                                .orderId)));
                                          },
                                          child: Card(

                                            child: Container(
                                              decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white
                                              ),
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
                                                              Radius.circular(10),
                                                            ),
                                                            ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsets.symmetric(horizontal: 1.w),
                                                          child:
                                                              CachedNetworkImage(
                                                            imageUrl: myorderlistmodal
                                                                    ?.data?[
                                                                        index]
                                                                    .firstImage ??
                                                                '',
                                                            height: 25.w,
                                                            width: 25.w,
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
                                                                  child: Row(
                                                                    children: [
                                                                      Text(
                                                                        maxLines: 1,
                                                                      "Order Number:- ",
                                                                        style: TextStyle(
                                                                            overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: 11
                                                                                .sp,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                            fontFamily:
                                                                            "task"),
                                                                      ),

                                                                      Text(
                                                                        maxLines: 1,
                                                                        myorderlistmodal?.data?[index].orderNumber ==
                                                                                    '' ||
                                                                                myorderlistmodal?.data?[index].orderNumber ==
                                                                                    null
                                                                            ? 'N/A'
                                                                            : "# "+(myorderlistmodal?.data?[index].orderNumber).toString(),
                                                                        style: TextStyle(
                                                                            overflow:
                                                                                TextOverflow
                                                                                    .ellipsis,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: 10
                                                                                .sp,
                                                                            fontWeight:
                                                                                FontWeight
                                                                                    .w600,
                                                                            fontFamily:
                                                                                "task"),
                                                                      ),
                                                                    ],
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
                                                                        maxLines: 1,
                                                                        "Total Amount :- ",
                                                                        style: TextStyle(
                                                                            overflow:
                                                                            TextOverflow
                                                                                .ellipsis,
                                                                            color: Colors
                                                                                .black,
                                                                            fontSize: 11
                                                                                .sp,
                                                                            fontWeight:
                                                                            FontWeight
                                                                                .normal,
                                                                            fontFamily:
                                                                            "task"),
                                                                      ),
                                                                      Text(
                                                                        myorderlistmodal?.data?[index].totalAmount == "" ||
                                                                                myorderlistmodal?.data?[index].totalAmount ==
                                                                                    null
                                                                            ? "N/A"
                                                                            : '₹' +
                                                                                (myorderlistmodal?.data?[index].totalAmount).toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              11.sp,
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
                                                                    Text(
                                                                      myorderlistmodal?.data?[index].orderStatus ==
                                                                          'Pending'
                                                                          ? 'Pending'
                                                                          :  myorderlistmodal?.data?[index].orderStatus == "Cancelled"
                                                                          ? 'Cancelled'
                                                                          :  myorderlistmodal?.data?[index].orderStatus == "Completed"
                                                                          ? 'Completed'
                                                                          : myorderlistmodal?.data?[index].orderStatus == "Placed"
                                                                          ? "Placed"
                                                                          : myorderlistmodal?.data?[index].orderStatus == "Paid"
                                                                          ? "Paid"
                                                                          : "Shipped",
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize:
                                                                        12.sp,
                                                                        fontFamily:
                                                                        'task',
                                                                        fontWeight:
                                                                        FontWeight
                                                                            .bold,
                                                                        color:  myorderlistmodal?.data?[index].orderStatus =='Pending'
                                                                            ? Colors.orange
                                                                            : myorderlistmodal?.data?[index].orderStatus == "Cancelled"
                                                                            ? Colors.red
                                                                            : myorderlistmodal?.data?[index].orderStatus == "Completed"
                                                                            ? Colors.green :
                                                                             myorderlistmodal?.data?[index].orderStatus == "Placed"
                                                                             ?Colors.green
                                                                            :  myorderlistmodal?.data?[index].orderStatus == "Paid"
                                                                                 ?Colors.green:AppColors.primary
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                      2.5.w,
                                                                    ),
                                                                    GestureDetector(
                                                                      onTap: () {
                                                                        Navigator.of(
                                                                                context)
                                                                            .push(
                                                                                MaterialPageRoute(builder: (context) => OrderSummary(iteamid: myorderlistmodal?.data?[index].orderId)));
                                                                      },
                                                                      child: Container(
                                                                          alignment: Alignment.center,
                                                                        padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 0.5.h),
                                                                          width: 11.w,
                                                                          decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,border: Border.all(width: 0.5,color: AppColors.primary)),

                                                                          child: Icon(Icons.visibility,color: Color(0xff0061b0),size: 15.sp,)
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                      2.5.w,
                                                                    ),
                                                                    // GestureDetector(
                                                                    //   onTap: () {
                                                                    //     // Navigator.of(
                                                                    //     //     context)
                                                                    //     //     .push(
                                                                    //     //     MaterialPageRoute(builder: (context) => cha(iteamid: myorderlistmodal?.data?[index].orderitemid)));
                                                                    //   },
                                                                    //   child: Container(
                                                                    //       alignment: Alignment.center,
                                                                    //      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.6.h),
                                                                    //       width: 11.w,
                                                                    //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white,border: Border.all(width: 0.5,color: AppColors.primary)),
                                                                    //       child: InkWell(
                                                                    //         onTap: () {
                                                                    //           Navigator.of(context).push(
                                                                    //             MaterialPageRoute(builder: (context) => Chatscreen(
                                                                    //               orderId: myorderlistmodal?.data?[index].orderId??"",
                                                                    //             ),)
                                                                    //           );
                                                                    //         },
                                                                    //         child: Icon(
                                                                    //           CupertinoIcons.chat_bubble_fill,
                                                                    //           size: 13.sp,
                                                                    //           color: Color(0xff0061b0),
                                                                    //           //weight: 20,
                                                                    //         ),
                                                                    //       )
                                                                    //   ),
                                                                    // ),
                                                                    // SizedBox(
                                                                    //   width: 4.w,
                                                                    // ),
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
                                          ),
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              )
                        : sel == 1
                            ? paidorderModel?.data?.length == 0 ||
                        paidorderModel?.data?.length ==
                                        null||paidorderModel?.data?.length == ""
                                ? Container(
                                    height: 75.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Products Available",
                                      style: TextStyle(
                                          fontFamily: "task",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 13.sp,
                                          color: Colors.black),
                                    ))
                                : Column(
                                    children: [
                                      Container(
                                        height: 75.h,
                                        child: ListView.builder(
                                          padding: EdgeInsets.only(top: 1.h),
                                          itemCount: paidorderModel
                                              ?.data?.length,
                                          // The number of items in the grid
                                          itemBuilder: (BuildContext context,
                                              int index) {
                                            // Build each item in the grid
                                            return GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) => OrderSummary(
                                                            iteamid: paidorderModel
                                                                ?.data?[
                                                                    index]
                                                                .orderId)));
                                              },
                                              child: Card(
                                                color: Color(0xffffffff),
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius: BorderRadius.circular(10),
                                                      color: Colors.white
                                                  ),
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
                                                                imageUrl: paidorderModel
                                                                        ?.data?[
                                                                            index]
                                                                        .firstImage ??
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
                                                                            Row(
                                                                              children: [

                                                                                Text(
                                                                                  maxLines: 1,
                                                                                  "Order Number:- ",
                                                                                  style: TextStyle(
                                                                                      overflow:
                                                                                      TextOverflow
                                                                                          .ellipsis,
                                                                                      color: Colors
                                                                                          .black,
                                                                                      fontSize: 11
                                                                                          .sp,
                                                                                      fontWeight:
                                                                                      FontWeight
                                                                                          .normal,
                                                                                      fontFamily:
                                                                                      "task"),
                                                                                ),
                                                                                Text(
                                                                                  maxLines:
                                                                                  1,
                                                                                  paidorderModel?.data?[index].orderNumber == '' || paidorderModel?.data?[index].orderNumber == null
                                                                                  ? 'N/A'
                                                                                  : paidorderModel?.data?[index].orderNumber ??
                                                                                      '',
                                                                                  style: TextStyle(
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  color: Colors.black,
                                                                                  fontSize: 10.sp,
                                                                                  fontWeight: FontWeight.w600,
                                                                                  fontFamily: "task"),
                                                                                                                                                        ),
                                                                              ],
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
                                                                            maxLines: 1,
                                                                            "Total Amount :- ",
                                                                            style: TextStyle(
                                                                                overflow:
                                                                                TextOverflow
                                                                                    .ellipsis,
                                                                                color: Colors
                                                                                    .black,
                                                                                fontSize: 11
                                                                                    .sp,
                                                                                fontWeight:
                                                                                FontWeight
                                                                                    .normal,
                                                                                fontFamily:
                                                                                "task"),
                                                                          ),
                                                                          Text(
                                                                            paidorderModel?.data?[index].totalAmount == "" || paidorderModel?.data?[index].totalAmount == null
                                                                                ? "N/A"
                                                                                : '₹' + (paidorderModel?.data?[index].totalAmount).toString(),
                                                                            style:
                                                                                TextStyle(
                                                                              fontSize:
                                                                                  12.sp,
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
                                                                        Text(
                                                                          "Paid",
                                                                          style:
                                                                          TextStyle(
                                                                            fontSize:
                                                                            12.sp,
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
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.of(context)
                                                                                .push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: paidorderModel?.data?[index].orderId)));
                                                                          },
                                                                          child: Container(
                                                                              alignment: Alignment.center,
                                                                            padding: EdgeInsets.symmetric(horizontal: 1.w,vertical: 1.h),
                                                                              width: 13.w,
                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(30),color: Colors.white,border: Border.all(width: 0.5,color: AppColors.primary
                                                                              )),
                                                                              child: Icon(Icons.visibility, color: Color(0xff0061b0),size: 15.sp,)
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          width:
                                                                          4.w,
                                                                        ),
                                                                        // GestureDetector(
                                                                        //   onTap:
                                                                        //       () {
                                                                        //     Navigator.of(context).push(
                                                                        //       MaterialPageRoute(builder: (context) => Chatscreen(
                                                                        //         orderId: paidorderModel?.data?[index].orderId??"",
                                                                        //       ),)
                                                                        //     );
                                                                        //    // Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: deliveredordermodal?.cartDetails?[index].orderitemid)));
                                                                        //   },
                                                                        //   child: Container(
                                                                        //       alignment: Alignment.center,
                                                                        //       height: 4.h,
                                                                        //       width: 13.w,
                                                                        //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(30), color: Colors.white),
                                                                        //       child:  Icon(
                                                                        //         CupertinoIcons.chat_bubble_fill,
                                                                        //         size: 13.sp,
                                                                        //         color: Color(0xff0061b0),
                                                                        //      )
                                                                        //   ),
                                                                        // ),
                                                                        // SizedBox(
                                                                        //   width:
                                                                        //       4.w,
                                                                        // ),
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
                                              ),
                                            );
                                          },
                                        ),
                                      ),
                                    ],
                                  )
                            : sel == 2
                                ? shippedorderModel?.data?.length == 0 ||
                        shippedorderModel
                                                ?.data?.length ==
                                            null||
                        shippedorderModel
                            ?.data?.length ==
                                   ""
                                    ? Container(
                                        height: 75.h,
                                        alignment: Alignment.center,
                                        child: Text(
                                          "No Products Available",
                                          style: TextStyle(
                                              fontFamily: "task",
                                              fontWeight: FontWeight.bold,
                                              fontSize: 13.sp,
                                              color: Colors.black),
                                        ))
                                    : Column(
                                        children: [

                                          Container(
                                            height: 75.h,
                                            child: ListView.builder(
                                              padding:
                                                  EdgeInsets.only(top: 1.h),
                                              itemCount: shippedorderModel
                                                  ?.data?.length,
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
                                                                iteamid: shippedorderModel
                                                                    ?.data?[
                                                                        index]
                                                                    .orderId)));
                                                  },
                                                  child: Card(

                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius: BorderRadius.circular(10),
                                                          color: Colors.white
                                                      ),
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
                                                                        // color: Colors
                                                                        //     .grey
                                                                        //     .shade200
                                                                    ),
                                                                child: Padding(
                                                                  padding:
                                                                      EdgeInsets
                                                                          .all(
                                                                              3.0),
                                                                  child:
                                                                      CachedNetworkImage(
                                                                    imageUrl: shippedorderModel
                                                                            ?.data?[
                                                                                index]
                                                                            .firstImage ??
                                                                        '',
                                                                    height: 25.w,
                                                                    width: 25.w,
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
                                                                                Row(
                                                                                  children: [
                                                                                    Text(
                                                                                      maxLines: 1,
                                                                                      "Order Number:- ",
                                                                                      style: TextStyle(
                                                                                          overflow:
                                                                                          TextOverflow
                                                                                              .ellipsis,
                                                                                          color: Colors
                                                                                              .black,
                                                                                          fontSize: 11
                                                                                              .sp,
                                                                                          fontWeight:
                                                                                          FontWeight
                                                                                              .normal,
                                                                                          fontFamily:
                                                                                          "task"),
                                                                                    ),
                                                                                    Text(
                                                                                                                                                                  maxLines:
                                                                                      1,
                                                                                      shippedorderModel?.data?[index].orderNumber == '' || shippedorderModel?.data?[index].orderNumber == null
                                                                                      ? 'N/A'
                                                                                      : "# "+(shippedorderModel?.data?[index].orderNumber ).toString(),
                                                                                                                                                                  style: TextStyle(
                                                                                      overflow: TextOverflow.ellipsis,
                                                                                      color: Colors.black,
                                                                                      fontSize: 10.sp,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontFamily: "task"),
                                                                                                                                                                ),
                                                                                  ],
                                                                                ),
                                                                          ),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              0.2.h,
                                                                        ),
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
                                                                                maxLines: 1,
                                                                                "Total Amount :- ",
                                                                                style: TextStyle(
                                                                                    overflow:
                                                                                    TextOverflow
                                                                                        .ellipsis,
                                                                                    color: Colors
                                                                                        .black,
                                                                                    fontSize: 11
                                                                                        .sp,
                                                                                    fontWeight:
                                                                                    FontWeight
                                                                                        .normal,
                                                                                    fontFamily:
                                                                                    "task"),
                                                                              ),
                                                                              Text(
                                                                                shippedorderModel?.data?[index].totalAmount == "" || shippedorderModel?.data?[index].totalAmount == null ? "N/A" : '₹' + (shippedorderModel?.data?[index].totalAmount).toString(),
                                                                                style: TextStyle(
                                                                                  fontSize: 12.sp,
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
                                                                            Text(
                                                                              "shipped",
                                                                              style:
                                                                              TextStyle(
                                                                                fontSize: 11.sp,
                                                                                fontFamily: 'task',
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1,
                                                                                color: AppColors.primary
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                              4.w,
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: shippedorderModel?.data?[index].orderId)));
                                                                              },
                                                                              child: Container(
                                                                                  alignment: Alignment.center,
                                                                                 padding: EdgeInsets.symmetric(
                                                                                   horizontal: 1.w,vertical: 0.5.h
                                                                                 ),
                                                                                  width: 13.w,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                                                  child: Icon(Icons.visibility,color: Color(0xff0061b0),size: 15.sp,)
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                              2.5.w,
                                                                            ),
                                                                            // GestureDetector(
                                                                            //   onTap: () {
                                                                            //     Navigator.of(context).push(
                                                                            //       MaterialPageRoute(builder: (context) => Chatscreen(
                                                                            //         orderId: shippedorderModel?.data?[index].orderId??"",
                                                                            //       ),)
                                                                            //     );
                                                                            //     // Navigator.of(
                                                                            //     //     context)
                                                                            //     //     .push(
                                                                            //     //     MaterialPageRoute(builder: (context) => cha(iteamid: myorderlistmodal?.cartDetails?[index].orderitemid)));
                                                                            //   },
                                                                            //   child: Container(
                                                                            //       alignment: Alignment.center,
                                                                            //       padding: EdgeInsets.symmetric(
                                                                            //           horizontal: 1.w,vertical: 0.8.h
                                                                            //       ),
                                                                            //       width: 13.w,
                                                                            //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                                            //       child: Icon(
                                                                            //         CupertinoIcons.chat_bubble_fill,
                                                                            //         size: 13.sp,
                                                                            //         color: Color(0xff0061b0),
                                                                            //       )
                                                                            //   ),
                                                                            // ),
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
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                        ],
                                      )
                        : sel == 3
                        ? placedorderModel?.data?.length == 0 ||
                        placedorderModel
                            ?.data?.length ==
                            null||placedorderModel?.data?.length== ""
                        ? Container(
                        height: 75.h,
                        alignment: Alignment.center,
                        child: Text(
                          "No Products Available",
                          style: TextStyle(
                              fontFamily: "task",
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Colors.black),
                        ))
                        : Column(
                      children: [

                        Container(
                          height: 75.h,
                          child: ListView.builder(
                            padding:
                            EdgeInsets.only(top: 1.h),
                            itemCount: placedorderModel
                                ?.data?.length,
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
                                              iteamid: placedorderModel
                                                  ?.data?[
                                              index]
                                                  .orderId)));
                                },
                                child: Card(

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                    ),
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
                                                // color: Colors
                                                //     .grey
                                                //     .shade200
                                              ),
                                              child: Padding(
                                                padding:
                                                EdgeInsets
                                                    .all(
                                                    3.0),
                                                child:
                                                CachedNetworkImage(
                                                  imageUrl: placedorderModel
                                                      ?.data?[
                                                  index]
                                                      .firstImage ??
                                                      '',
                                                  height: 25.w,
                                                  width: 25.w,
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
                                                          Row(
                                                            children: [
                                                              Text(
                                                                maxLines: 1,
                                                                "Order Number:- ",
                                                                style: TextStyle(
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 11
                                                                        .sp,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    fontFamily:
                                                                    "task"),
                                                              ),
                                                              Text(
                                                                maxLines:
                                                                1,
                                                                placedorderModel?.data?[index].orderNumber == '' || placedorderModel?.data?[index].orderNumber == null
                                                                    ? 'N/A'
                                                                    : placedorderModel?.data?[index].orderNumber ?? '',
                                                                style: TextStyle(
                                                                    overflow: TextOverflow.ellipsis,
                                                                    color: Colors.black,
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontFamily: "task"),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                      SizedBox(
                                                        height:
                                                        0.2.h,
                                                      ),
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
                                                              maxLines: 1,
                                                              "Total Amount :- ",
                                                              style: TextStyle(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 11
                                                                      .sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  fontFamily:
                                                                  "task"),
                                                            ),
                                                            Text(
                                                              placedorderModel?.data?[index].totalAmount == "" || placedorderModel?.data?[index].totalAmount == null ? "N/A" : '₹' + (placedorderModel?.data?[index].totalAmount).toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                          Text(
                                                            "placed",
                                                            style:
                                                            TextStyle(
                                                              fontSize: 11.sp,
                                                              fontFamily: 'task',
                                                              fontWeight: FontWeight.bold,
                                                              letterSpacing: 1,
                                                              color:Colors.green
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            4.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap:
                                                                () {
                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: placedorderModel?.data?[index].orderId)));
                                                            },
                                                            child: Container(
                                                                alignment: Alignment.center,
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: 1.w,vertical: 0.5.h
                                                                ),
                                                                width: 13.w,
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                                child: Icon(Icons.visibility,color: Color(0xff0061b0),size: 15.sp,)
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            2.5.w,
                                                          ),
                                                          // GestureDetector(
                                                          //   onTap: () {
                                                          //     Navigator.of(context).push(
                                                          //         MaterialPageRoute(builder: (context) => Chatscreen(
                                                          //           orderId: placedorderModel?.data?[index].orderId??"",
                                                          //         ),)
                                                          //     );
                                                          //     // Navigator.of(
                                                          //     //     context)
                                                          //     //     .push(
                                                          //     //     MaterialPageRoute(builder: (context) => cha(iteamid: myorderlistmodal?.cartDetails?[index].orderitemid)));
                                                          //   },
                                                          //   child: Container(
                                                          //       alignment: Alignment.center,
                                                          //       padding: EdgeInsets.symmetric(
                                                          //           horizontal: 1.w,vertical: 0.8.h
                                                          //       ),
                                                          //       width: 13.w,
                                                          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                          //       child: Icon(
                                                          //         CupertinoIcons.chat_bubble_fill,
                                                          //         size: 13.sp,
                                                          //         color: Color(0xff0061b0),
                                                          //       )
                                                          //   ),
                                                          // ),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                        : sel == 4
                        ? pendingordermodal?.data?.length == 0 ||
                        pendingordermodal
                            ?.data?.length ==
                            null
                        ? Container(
                        height: 75.h,
                        alignment: Alignment.center,
                        child: Text(
                          "No Products Available",
                          style: TextStyle(
                              fontFamily: "task",
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Colors.black),
                        ))
                        : Column(
                      children: [

                        Container(
                          height: 75.h,
                          child: ListView.builder(
                            padding:
                            EdgeInsets.only(top: 1.h),
                            itemCount: pendingordermodal
                                ?.data?.length,
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
                                                  ?.data?[
                                              index]
                                                  .orderId)));
                                },
                                child: Card(

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                    ),
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
                                                // color: Colors
                                                //     .grey
                                                //     .shade200
                                              ),
                                              child: Padding(
                                                padding:
                                                EdgeInsets
                                                    .all(
                                                    3.0),
                                                child:
                                                CachedNetworkImage(
                                                  imageUrl: pendingordermodal
                                                      ?.data?[
                                                  index]
                                                      .firstImage ??
                                                      '',
                                                  height: 25.w,
                                                  width: 25.w,
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
                                                          Row(
                                                            children: [
                                                              Text(
                                                                maxLines: 1,
                                                                "Order Number:- ",
                                                                style: TextStyle(
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 11
                                                                        .sp,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    fontFamily:
                                                                    "task"),
                                                              ),
                                                              Text(
                                                                maxLines:
                                                                1,
                                                                pendingordermodal?.data?[index].orderNumber == '' || pendingordermodal?.data?[index].orderNumber == null
                                                                    ? 'N/A'
                                                                    : pendingordermodal?.data?[index].orderNumber ?? '',
                                                                style: TextStyle(
                                                                    overflow: TextOverflow.ellipsis,
                                                                    color: Colors.black,
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontFamily: "task"),
                                                              ),
                                                            ],
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
                                                              maxLines: 1,
                                                              "Total Amount :- ",
                                                              style: TextStyle(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 11
                                                                      .sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  fontFamily:
                                                                  "task"),
                                                            ),
                                                            Text(
                                                              pendingordermodal?.data?[index].totalAmount == "" || pendingordermodal?.data?[index].totalAmount == null ? "N/A" : '₹' + (pendingordermodal?.data?[index].totalAmount).toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                          Text(
                                                            "Pending",
                                                            style:
                                                            TextStyle(
                                                              fontSize: 11.sp,
                                                              fontFamily: 'task',
                                                              fontWeight: FontWeight.bold,
                                                              letterSpacing: 1,
                                                              color: Color(0xfff7941d),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            4.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap:
                                                                () {
                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: pendingordermodal?.data?[index].orderId)));
                                                            },
                                                            child: Container(
                                                                alignment: Alignment.center,
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: 1.w,vertical: 0.5.h
                                                                ),
                                                                width: 13.w,
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                                child: Icon(Icons.visibility,color: Color(0xff0061b0),size: 15.sp,)
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            2.5.w,
                                                          ),
                                                          // GestureDetector(
                                                          //   onTap: () {
                                                          //     Navigator.of(context).push(
                                                          //         MaterialPageRoute(builder: (context) => Chatscreen(
                                                          //           orderId: pendingordermodal?.data?[index].orderId??"",
                                                          //         ),)
                                                          //     );
                                                          //     // Navigator.of(
                                                          //     //     context)
                                                          //     //     .push(
                                                          //     //     MaterialPageRoute(builder: (context) => cha(iteamid: myorderlistmodal?.cartDetails?[index].orderitemid)));
                                                          //   },
                                                          //   child: Container(
                                                          //       alignment: Alignment.center,
                                                          //       padding: EdgeInsets.symmetric(
                                                          //           horizontal: 1.w,vertical: 0.8.h
                                                          //       ),
                                                          //       width: 13.w,
                                                          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                          //       child: Icon(
                                                          //         CupertinoIcons.chat_bubble_fill,
                                                          //         size: 13.sp,
                                                          //         color: Color(0xff0061b0),
                                                          //       )
                                                          //   ),
                                                          // ),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                        : sel == 5
                        ? deliveredordermodal?.data?.length == 0 ||
                        deliveredordermodal
                            ?.data?.length ==
                            null||deliveredordermodal?.data?.length==""
                        ? Container(
                        height: 75.h,
                        alignment: Alignment.center,
                        child: Text(
                          "No Products Available",
                          style: TextStyle(
                              fontFamily: "task",
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Colors.black),
                        ))
                        : Column(
                      children: [

                        Container(
                          height: 75.h,
                          child: ListView.builder(
                            padding:
                            EdgeInsets.only(top: 1.h),
                            itemCount: deliveredordermodal
                                ?.data?.length,
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
                                              iteamid: deliveredordermodal
                                                  ?.data?[
                                              index]
                                                  .orderId)));
                                },
                                child: Card(

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                    ),
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
                                                // color: Colors
                                                //     .grey
                                                //     .shade200
                                              ),
                                              child: Padding(
                                                padding:
                                                EdgeInsets
                                                    .all(
                                                    3.0),
                                                child:
                                                CachedNetworkImage(
                                                  imageUrl: deliveredordermodal
                                                      ?.data?[
                                                  index]
                                                      .firstImage ??
                                                      '',
                                                  height: 25.w,
                                                  width: 25.w,
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
                                                          Row(
                                                            children: [
                                                              Text(
                                                                maxLines: 1,
                                                                "Order Number:- ",
                                                                style: TextStyle(
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 11
                                                                        .sp,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    fontFamily:
                                                                    "task"),
                                                              ),
                                                              Text(
                                                                maxLines:
                                                                1,
                                                                deliveredordermodal?.data?[index].orderNumber == '' || deliveredordermodal?.data?[index].orderNumber == null
                                                                    ? 'N/A'
                                                                    : deliveredordermodal?.data?[index].orderNumber ?? '',
                                                                style: TextStyle(
                                                                    overflow: TextOverflow.ellipsis,
                                                                    color: Colors.black,
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontFamily: "task"),
                                                              ),
                                                            ],
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
                                                              maxLines: 1,
                                                              "Total Amount :- ",
                                                              style: TextStyle(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 11
                                                                      .sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  fontFamily:
                                                                  "task"),
                                                            ),
                                                            Text(
                                                              deliveredordermodal?.data?[index].totalAmount == "" || deliveredordermodal?.data?[index].totalAmount == null ? "N/A" : '₹' + (deliveredordermodal?.data?[index].totalAmount).toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                          Text(
                                                            "completed",
                                                            style:
                                                            TextStyle(
                                                              fontSize: 11.sp,
                                                              fontFamily: 'task',
                                                              fontWeight: FontWeight.bold,
                                                              letterSpacing: 1,
                                                              color: Colors.green
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            4.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap:
                                                                () {
                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: deliveredordermodal?.data?[index].orderId)));
                                                            },
                                                            child: Container(
                                                                alignment: Alignment.center,
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: 1.w,vertical: 0.5.h
                                                                ),
                                                                width: 13.w,
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                                child: Icon(Icons.visibility,color: Color(0xff0061b0),size: 15.sp,)
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            2.5.w,
                                                          ),
                                                          // GestureDetector(
                                                          //   onTap: () {
                                                          //     Navigator.of(context).push(
                                                          //         MaterialPageRoute(builder: (context) => Chatscreen(
                                                          //           orderId: deliveredordermodal?.data?[index].orderId??"",
                                                          //         ),)
                                                          //     );
                                                          //     // Navigator.of(
                                                          //     //     context)
                                                          //     //     .push(
                                                          //     //     MaterialPageRoute(builder: (context) => cha(iteamid: myorderlistmodal?.cartDetails?[index].orderitemid)));
                                                          //   },
                                                          //   child: Container(
                                                          //       alignment: Alignment.center,
                                                          //       padding: EdgeInsets.symmetric(
                                                          //           horizontal: 1.w,vertical: 0.8.h
                                                          //       ),
                                                          //       width: 13.w,
                                                          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                          //       child: Icon(
                                                          //         CupertinoIcons.chat_bubble_fill,
                                                          //         size: 13.sp,
                                                          //         color: Color(0xff0061b0),
                                                          //       )
                                                          //   ),
                                                          // ),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
                        : ordercancelmodal ?.data?.length == 0 ||
                        ordercancelmodal
                            ?.data?.length ==
                            null||ordercancelmodal?.data?.length==""
                        ? Container(
                        height: 75.h,
                        alignment: Alignment.center,
                        child: Text(
                          "No Products Available",
                          style: TextStyle(
                              fontFamily: "task",
                              fontWeight: FontWeight.bold,
                              fontSize: 13.sp,
                              color: Colors.black),
                        ))
                        : Column(
                      children: [

                        Container(
                          height: 75.h,
                          child: ListView.builder(
                            padding:
                            EdgeInsets.only(top: 1.h),
                            itemCount: ordercancelmodal
                                ?.data?.length,
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
                                                  ?.data?[
                                              index]
                                                  .orderId)));
                                },
                                child: Card(

                                  child: Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white
                                    ),
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
                                                // color: Colors
                                                //     .grey
                                                //     .shade200
                                              ),
                                              child: Padding(
                                                padding:
                                                EdgeInsets
                                                    .all(
                                                    3.0),
                                                child:
                                                CachedNetworkImage(
                                                  imageUrl: ordercancelmodal
                                                      ?.data?[
                                                  index]
                                                      .firstImage ??
                                                      '',
                                                  height: 25.w,
                                                  width: 25.w,
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
                                                          Row(
                                                            children: [
                                                              Text(
                                                                maxLines: 1,
                                                                "Order Number:- ",
                                                                style: TextStyle(
                                                                    overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                    color: Colors
                                                                        .black,
                                                                    fontSize: 11
                                                                        .sp,
                                                                    fontWeight:
                                                                    FontWeight
                                                                        .normal,
                                                                    fontFamily:
                                                                    "task"),
                                                              ),
                                                              Text(
                                                                maxLines:
                                                                1,
                                                                ordercancelmodal?.data?[index].orderNumber == '' || ordercancelmodal?.data?[index].orderNumber == null
                                                                    ? 'N/A'
                                                                    : ordercancelmodal?.data?[index].orderNumber ?? '',
                                                                style: TextStyle(
                                                                    overflow: TextOverflow.ellipsis,
                                                                    color: Colors.black,
                                                                    fontSize: 10.sp,
                                                                    fontWeight: FontWeight.w600,
                                                                    fontFamily: "task"),
                                                              ),
                                                            ],
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
                                                              maxLines: 1,
                                                              "Total Amount :- ",
                                                              style: TextStyle(
                                                                  overflow:
                                                                  TextOverflow
                                                                      .ellipsis,
                                                                  color: Colors
                                                                      .black,
                                                                  fontSize: 11
                                                                      .sp,
                                                                  fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                                  fontFamily:
                                                                  "task"),
                                                            ),
                                                            Text(
                                                              ordercancelmodal?.data?[index].totalAmount == "" || ordercancelmodal?.data?[index].totalAmount == null ? "N/A" : '₹' + (ordercancelmodal?.data?[index].totalAmount).toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                          Text(
                                                            "cancelled",
                                                            style:
                                                            TextStyle(
                                                              fontSize: 11.sp,
                                                              fontFamily: 'task',
                                                              fontWeight: FontWeight.bold,
                                                              letterSpacing: 1,
                                                              color: Colors.red
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            4.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap:
                                                                () {
                                                              Navigator.of(context).push(MaterialPageRoute(builder: (context) => OrderSummary(iteamid: ordercancelmodal?.data?[index].orderId)));
                                                            },
                                                            child: Container(
                                                                alignment: Alignment.center,
                                                                padding: EdgeInsets.symmetric(
                                                                    horizontal: 1.w,vertical: 0.5.h
                                                                ),
                                                                width: 13.w,
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                                child: Icon(Icons.visibility,color: Color(0xff0061b0),size: 15.sp,)
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            width:
                                                            2.5.w,
                                                          ),
                                                          // GestureDetector(
                                                          //   onTap: () {
                                                          //     Navigator.of(context).push(
                                                          //         MaterialPageRoute(builder: (context) => Chatscreen(
                                                          //           orderId: ordercancelmodal?.data?[index].orderId??"",
                                                          //         ),)
                                                          //     );
                                                          //     // Navigator.of(
                                                          //     //     context)
                                                          //     //     .push(
                                                          //     //     MaterialPageRoute(builder: (context) => cha(iteamid: myorderlistmodal?.cartDetails?[index].orderitemid)));
                                                          //   },
                                                          //   child: Container(
                                                          //       alignment: Alignment.center,
                                                          //       padding: EdgeInsets.symmetric(
                                                          //           horizontal: 1.w,vertical: 0.8.h
                                                          //       ),
                                                          //       width: 13.w,
                                                          //       decoration: BoxDecoration(borderRadius: BorderRadius.circular(10),color: Colors.white,border: Border.all(color: AppColors.primary,width: 0.5) ),
                                                          //       child: Icon(
                                                          //         CupertinoIcons.chat_bubble_fill,
                                                          //         size: 13.sp,
                                                          //         color: Color(0xff0061b0),
                                                          //       )
                                                          //   ),
                                                          // ),
                                                          // SizedBox(
                                                          //   width:
                                                          //   4.w,
                                                          // ),
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
                                ),
                              );
                            },
                          ),
                        ),
                      ],
                    )
    ]),
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
      print("my order");
      if (internet) {
        authprovider().cancelorderapi(data).then((response) async {
          ordercancelmodal =
              OrderCancelModal.fromJson(json.decode(response.body));
          print(ordercancelmodal?.status);
          if (response.statusCode == 200 &&
              ordercancelmodal?.status == "success") {
            print("my order 55555" );

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


  orderplacedap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().orderplacedapi(data).then((response) async {
          placedorderModel =
              PlacedOrderModel.fromJson(json.decode(response.body));
          print(placedorderModel?.status);
          if (response.statusCode == 200 &&
              placedorderModel?.status == "success") {
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

  orderpaidap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().orderpaidapi(data).then((response) async {
          paidorderModel =
              PaidOrderModel.fromJson(json.decode(response.body));
          print(paidorderModel?.status);
          if (response.statusCode == 200 &&
              paidorderModel?.status == "success") {
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


  ordershippedap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ordershippedapi(data).then((response) async {
          shippedorderModel =
              ShippedOrderModel.fromJson(json.decode(response.body));
          print(shippedorderModel?.status);
          if (response.statusCode == 200 &&
              shippedorderModel?.status == "success") {
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
