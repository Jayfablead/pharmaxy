import 'dart:convert';
import 'package:ecommerce/Modal/CancelOrderModel.dart';
import 'package:ecommerce/Modal/OrderCancelModal.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/MyOederDetailModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/MyOrderList.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/pdfscreen.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

class OrderSummary extends StatefulWidget {
  String? iteamid;
  String? stuts;

  OrderSummary({super.key, this.iteamid,this.stuts});

  @override
  State<OrderSummary> createState() => _OrderSummaryState();
}

class order {
  String? image;
  String? name;
  String? dec;
  String? price;
  String? url;


  order( this.url,this.image, this.name, this.price, this.dec,);
}

bool isLoading = true;
final GlobalKey<ScaffoldState> _scaffoldKeyodsum = GlobalKey<ScaffoldState>();

class _OrderSummaryState extends State<OrderSummary> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    myorderdetailap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeyodsum,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: Stack(
                    children: [
                      Column(
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                          // App Bar
                          Container(
                            width: MediaQuery.of(context).size.width,
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                        MaterialPageRoute(builder: (context) =>MyOrderList(),)
                                      );
                                      //Navigator.of(context).pop();
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 17.sp,
                                    )),
                                Text(
                                  "OrderDetail",
                                  style: TextStyle(
                                    fontSize: 14.sp,
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
                                                fontSize: 13.sp,
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
                                                fontSize: 12.sp,
                                                color: Colors.black45),
                                          ),
                                          Text(myoederdetailmodal?.userDetail?.orderID == '' || myoederdetailmodal?.userDetail?.orderID == null ? 'N/A'
                                                : myoederdetailmodal?.userDetail?.orderID ?? '',
                                            style: TextStyle(
                                                fontWeight: FontWeight.normal,
                                                fontFamily: 'task',
                                                fontSize: 13.sp,
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
                          SizedBox(height: 2.h,),
                          Container(
                            height: myoederdetailmodal
                                ?.orderDetails?.length==1?20.h:30.h,
                            child: ListView.builder(
                              padding:
                              EdgeInsets.only(top: 1.h),
                              itemCount: myoederdetailmodal
                                  ?.orderDetails?.length,
                              // The number of items in the grid
                              itemBuilder:
                                  (BuildContext context,
                                  int index) {
                                // Build each item in the grid
                                return Container(
                                  child: Card(
                                      elevation: 00,
                                      color: Colors.white,
                                      child: Column(
                                        mainAxisSize: MainAxisSize.min,
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
                                                ),
                                                child: Padding(
                                                  padding: EdgeInsets.all(3.0),
                                                  child: CachedNetworkImage(
                                                    imageUrl: myoederdetailmodal
                                                        ?.orderDetails?[index].imgData ??
                                                        '',
                                                    fit: BoxFit.cover,
                                                    height: 23.w,
                                                    width: 23.w,
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
                                                    vertical: 0.h, horizontal: 1.w),
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
                                                            width: 50.w,
                                                            child: Text(
                                                              myoederdetailmodal
                                                                  ?.orderDetails
                                                                  ?[index].productName ==
                                                                  '' ||
                                                                  myoederdetailmodal
                                                                      ?.orderDetails
                                                                  ?[index].productName ==
                                                                      null
                                                                  ? 'N/A'
                                                                  : myoederdetailmodal
                                                                  ?.orderDetails
                                                              ?[index].productName ??
                                                                  '',
                                                              style: TextStyle(
                                                                  color: Colors.black,
                                                                  fontSize: 10.sp,
                                                                  fontWeight:
                                                                  FontWeight.w600,
                                                                  fontFamily: "task"),
                                                            ),
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(left: 1.w),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Price : ',
                                                                style: TextStyle(
                                                                  fontSize: 12.sp,
                                                                  fontFamily: 'task',
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  letterSpacing: 1,
                                                                  color: Colors
                                                                      .grey.shade800,
                                                                ),
                                                              ),
                                                              Text(
                                                                myoederdetailmodal
                                                                    ?.orderDetails
                                                                ?[index].price ==
                                                                    "" ||
                                                                    myoederdetailmodal
                                                                        ?.orderDetails
                                                                    ?[index].price ==
                                                                        null
                                                                    ? "N/A"
                                                                    : '₹' +
                                                                    (myoederdetailmodal
                                                                        ?.orderDetails
                                                                    ?[index].price)
                                                                        .toString(),
                                                                style: TextStyle(
                                                                  fontSize: 11.sp,
                                                                  fontFamily: 'task',
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  letterSpacing: 1,
                                                                  color: Colors.black,
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          height: 1.h,
                                                        ),
                                                        Padding(
                                                          padding:
                                                          EdgeInsets.only(left: 1.w),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                'Status : ',
                                                                style: TextStyle(
                                                                  fontSize: 11.sp,
                                                                  fontFamily: 'task',
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  letterSpacing: 1,
                                                                  color: Colors
                                                                      .grey.shade800,
                                                                ),
                                                              ),
                                                           Text(
                                                             myoederdetailmodal
                                                                 ?.orderDetails
                                                             ?[index].orderStatus ==
                                                                    '' ||
                                                                 myoederdetailmodal
                                                                     ?.orderDetails
                                                                 ?[index].orderStatus ==
                                                                        null
                                                                    ? 'N/A'
                                                                    : myoederdetailmodal
                                                                 ?.orderDetails
                                                             ?[index].orderStatus ?? '',
                                                                maxLines: 1,
                                                                overflow: TextOverflow.ellipsis,
                                                                style: TextStyle(
                                                                  fontSize: 11.sp,
                                                                  fontFamily: 'task',
                                                                  fontWeight:
                                                                  FontWeight.bold,
                                                                  color: myoederdetailmodal
                                                                      ?.orderDetails
                                                                  ?[index].orderStatus =='Pending'
                                                                      ? Colors.orange
                                                                      : myoederdetailmodal
                                                                      ?.orderDetails
                                                                  ?[index].orderStatus == "Cancelled"
                                                                      ? Colors.red
                                                                      : myoederdetailmodal
                                                                      ?.orderDetails
                                                                  ?[index].orderStatus == "Completed"
                                                                      ? Colors.green :
                                                                  myoederdetailmodal
                                                                      ?.orderDetails
                                                                  ?[index].orderStatus == "Placed"
                                                                      ?Colors.green
                                                                      :  myoederdetailmodal
                                                                      ?.orderDetails
                                                                  ?[index].orderStatus == "Paid"
                                                                      ?Colors.green:AppColors.primary
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                  ],
                                                ),
                                              )
                                            ],
                                          ),
                                        ],
                                      )),
                                );
                              },
                            ),
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
                                    fontSize: 12.sp,
                                    fontFamily: "task",
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                              SizedBox(
                                height: 1.h,
                              ),

                              // payment method
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
                                                                            ?.userDetail
                                                                            ?.fname ==
                                                                        '' ||
                                                                myoederdetailmodal
                                                                    ?.userDetail
                                                                    ?.fname ==
                                                                        null
                                                                ? 'N/A'
                                                                : myoederdetailmodal
                                                                ?.userDetail
                                                                ?.fname??
                                                                    '',
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
                                                            myoederdetailmodal
                                                                ?.userDetail
                                                                ?.lname ==
                                                                '' ||
                                                                myoederdetailmodal
                                                                    ?.userDetail
                                                                    ?.lname ==
                                                                    null
                                                                ? 'N/A'
                                                                : myoederdetailmodal
                                                                ?.userDetail
                                                                ?.lname??
                                                                '',
                                                            style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                            ?.userDetail
                                                            ?.address1 ==
                                                            '' ||
                                                            myoederdetailmodal
                                                                ?.userDetail
                                                                ?.address1 ==
                                                                null
                                                            ? 'N/A'
                                                            : myoederdetailmodal
                                                            ?.userDetail
                                                            ?.address1??
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
                                                Icon(Icons.arrow_forward_ios,size: 14.sp,)
                                              ],
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          height: 2.h,
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
                                                      myoederdetailmodal?.orderDetails?[0].subtotal ==
                                                          null ||
                                                          myoederdetailmodal
                                                              ?.orderDetails?[0]
                                                              .subtotal ==
                                                              ""
                                                          ? "N/A"
                                                          : '₹' +
                                                          (myoederdetailmodal
                                                              ?.orderDetails?[0]
                                                              .subtotal)
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
                                                      myoederdetailmodal?.userDetail?.totalTax
                                                           ==
                                                          null ||
                                                          myoederdetailmodal?.userDetail?.totalTax ==
                                                              ""
                                                          ? "N/A"
                                                          : '₹' +
                                                          (myoederdetailmodal?.userDetail?.totalTax)
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
                                                      myoederdetailmodal?.userDetail?.totalShipingCost
                                                          ==
                                                          null||
                                                          myoederdetailmodal?.userDetail?.totalShipingCost=="" ||  myoederdetailmodal?.userDetail?.totalShipingCost== "0.00"
                                                          ? "Free"
                                                          : '₹' +
                                                          (myoederdetailmodal
                                                              ?.userDetail?.totalShipingCost)
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
                                                  myoederdetailmodal?.userDetail?.totalDiscount == "0" ?SizedBox()
                                                      :Row(
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
                                                      myoederdetailmodal?.userDetail?.totalDiscount
                                                          ==
                                                          null||
                                                          myoederdetailmodal?.userDetail?.totalDiscount ==
                                                              ""
                                                          ? "\₹ 0"
                                                          : '₹' +
                                                          ( myoederdetailmodal?.userDetail?.totalDiscount)
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
                                                      'Referral Discount: ',
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 12.sp,
                                                        color: Colors.grey.shade800,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                    Text(
                                                      myoederdetailmodal?.userDetail?.referDis
                                                          ==
                                                          null||
                                                          myoederdetailmodal?.userDetail?.referDis==""
                                                          ? "\₹ 0 "
                                                          : '₹' +
                                                          (myoederdetailmodal
                                                              ?.userDetail?.referDis)
                                                              .toString(), style: TextStyle(
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
                                                  myoederdetailmodal ?.userDetail?.totalAmount
                                                      ==
                                                      null ||
                                                      myoederdetailmodal ?.userDetail?.totalAmount ==
                                                          ""
                                                      ? "N/A"
                                                      : '₹' +
                                                      (myoederdetailmodal ?.userDetail?.totalAmount)
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
                                        SizedBox(
                                          height: 2.h,
                                        ),



                                        if (myoederdetailmodal?.userDetail?.orderStatus =='Completed'||myoederdetailmodal?.userDetail?.orderStatus =='Cancelled') SizedBox() else
                                          InkWell(
                                          onTap: () {
                                            AlertDialog alertDialog = AlertDialog(
                                              title: Text("Cancel Order",style: TextStyle(
                                                  fontFamily: "task",
                                                fontSize: 13.sp,

                                              ),),
                                              content: Text("Are you sure want cancel this order?",style: TextStyle(
                                                  fontFamily: "task",
                                                fontSize: 12.sp,
                                              ),),
                                              backgroundColor: Colors.grey.shade100,
                                              // contentPadding: EdgeInsets.all(10.0),
                                              actions: [
                                               ElevatedButton(
                                                   onPressed: ()async{
                                                    await Ordercancelledap();
                                                    Navigator.of(context).pop();
                                                    setState(() {
                                                      myorderdetailap();
                                                    });
                                                    // myorderdetailap();

                                                   },
                                                   child: Text("Yes",style: TextStyle(
                                                     fontSize: 10.sp,
                                                     fontFamily: 'task',
                                                   ),),
                                                 style: ElevatedButton.styleFrom(
                                                   shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                   backgroundColor: Color(0xff0061b0),
                                                   foregroundColor: Colors.white
                                                 ),
                                               ),
                                                ElevatedButton(
                                                  onPressed: (){
                                                    Navigator.of(context).pop();
                                                  },
                                                  child: Text("No",style: TextStyle(
                                                    fontSize: 10.sp,
                                                    fontFamily: 'task',
                                                  ),),
                                                  style: ElevatedButton.styleFrom(
                                                      backgroundColor: Color(0xff0061b0),
                                                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
                                                      foregroundColor: Colors.white
                                                  ),
                                                ),
                                              ],
                                            );
                                            showDialog(context: context, builder: (context){
                                              return alertDialog;
                                            });
                                          },
                                          child: Card(
                                            elevation: 2.0,
                                            child: Container(
                                              width: MediaQuery.of(context).size.width,
                                              decoration: BoxDecoration(
                                                  color: Color(0xff0061b0),
                                                  borderRadius: BorderRadius.circular(10.0)
                                              ),
                                              height: 50,
                                              child: Center(child: Text("Cancel",style: TextStyle(
                                                  fontSize: 12.sp,
                                                  color: Colors.white,
                                                  //color: Colors.red,
                                                  fontWeight: FontWeight.bold
                                              ),)),
                                            ),
                                          ),
                                        )
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    myoederdetailmodal?.userDetail?.orderStatus ==
                                            'Cancelled'
                                        ? Container()
                                        : Padding(
                                            padding: EdgeInsets.only(left: 2.w),
                                            child: Text(
                                              "Payment Method",
                                              style: TextStyle(
                                                fontSize: 12.sp,
                                                fontFamily: "task",
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                    // myoederdetailmodal?.userDetail?.payment ==
                                    //         'cod'
                                    //     ?

                                    myoederdetailmodal?.userDetail
                                        ?.orderStatus ==
                                        'Cancelled'?SizedBox():Container(
                                      alignment: Alignment.center,
                                      height: 12.5.h,
                                            decoration: BoxDecoration(
                                                borderRadius: BorderRadius.circular(10),
                                                color: Colors.white),
                                            child:
                                                myoederdetailmodal?.userDetail
                                                            ?.orderStatus ==
                                                        'Cancelled'
                                                    ? Container()
                                                    : Padding(
                                                        padding:
                                                            EdgeInsets.symmetric(
                                                                horizontal: 5.w,
                                                                vertical: 1.h,
                                                               ),
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
                                                                        height: 7.h,
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
                                                                              "assets/paybill.png",
                                                                              height:
                                                                                  5.h,
                                                                              width:
                                                                                  20.w,
                                                                            ),
                                                                            SizedBox(
                                                                              width:
                                                                                  1.w,
                                                                            ),
                                                                            Text(
                                                                                "Pay after bill generation ",
                                                                                style:
                                                                                    TextStyle(
                                                                                  color: Colors.black,
                                                                                  fontSize: 14.sp,
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
                                                    ),

                                            // : Padding(
                                            //     padding: EdgeInsets.symmetric(
                                            //         horizontal: 2.w),
                                            //     child: Column(
                                            //       crossAxisAlignment:
                                            //           CrossAxisAlignment.center,
                                            //       mainAxisAlignment:
                                            //           MainAxisAlignment.center,
                                            //       children: [
                                            //         GestureDetector(
                                            //           onTap: () {
                                            //             setState(() {});
                                            //           },
                                            //           child: Container(
                                            //             width: 80.w,
                                            //             padding:
                                            //                 EdgeInsets.all(2.w),
                                            //             decoration: BoxDecoration(
                                            //               color: Colors.white
                                            //                   .withOpacity(0.04),
                                            //               borderRadius:
                                            //                   BorderRadius.circular(
                                            //                       15.sp),
                                            //               border: Border.all(
                                            //                 color: Colors.black12,
                                            //                 // Border color
                                            //                 width:
                                            //                     2.0, // Border width
                                            //               ),
                                            //             ),
                                            //             child: Center(
                                            //               child: Row(
                                            //                 mainAxisAlignment:
                                            //                     MainAxisAlignment
                                            //                         .start,
                                            //                 crossAxisAlignment:
                                            //                     CrossAxisAlignment
                                            //                         .center,
                                            //                 children: [
                                            //                   Image.asset(
                                            //                     "assets/paypal.png",
                                            //                     height: 5.h,
                                            //                     width: 20.w,
                                            //                   ),
                                            //                   SizedBox(
                                            //                     width: 5.w,
                                            //                   ),
                                            //                   Text("Pay PayPal",
                                            //                       style: TextStyle(
                                            //                         color: Colors
                                            //                             .black,
                                            //                         fontSize: 17.sp,
                                            //                         fontFamily:
                                            //                             'match',
                                            //                       )),
                                            //                 ],
                                            //               ),
                                            //             ),
                                            //           ),
                                            //         ),
                                            //
                                            //         // Column(
                                            //         //   children: [
                                            //         //     GestureDetector(
                                            //         //       onTap: () {},
                                            //         //       child: Container(
                                            //         //         padding: EdgeInsets.all(2.w),
                                            //         //         width: 80.w,
                                            //         //         decoration: BoxDecoration(
                                            //         //           color: Colors.white
                                            //         //               .withOpacity(0.04),
                                            //         //           borderRadius:
                                            //         //               BorderRadius.circular(15.sp),
                                            //         //           border: Border.all(
                                            //         //             color: Colors.black12,
                                            //         //             // Border color
                                            //         //             width: 2.0, // Border width
                                            //         //           ),
                                            //         //         ),
                                            //         //         child: Row(
                                            //         //           mainAxisAlignment:
                                            //         //               MainAxisAlignment.start,
                                            //         //           crossAxisAlignment:
                                            //         //               CrossAxisAlignment.center,
                                            //         //           children: [
                                            //         //             Image.asset(
                                            //         //               "assets/cod1.png",
                                            //         //               height: 5.h,
                                            //         //               width: 20.w,
                                            //         //             ),
                                            //         //             SizedBox(
                                            //         //               width: 5.w,
                                            //         //             ),
                                            //         //             Text("Cash On Delivery",
                                            //         //                 style: TextStyle(
                                            //         //                   color: Colors.black,
                                            //         //                   fontSize: 17.sp,
                                            //         //                   fontFamily: 'match',
                                            //         //                 )),
                                            //         //           ],
                                            //         //         ),
                                            //         //       ),
                                            //         //     ),
                                            //         //     SizedBox(
                                            //         //       height: 2.h,
                                            //         //     ),
                                            //         //   ],
                                            //         // ),
                                            //       ],
                                            //     ),
                                            //   ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              // Chat with us
                              // Padding(
                              //   padding: EdgeInsets.symmetric(horizontal: 2.w),
                              //   child: InkWell(
                              //     onTap: () {
                              //       Navigator.of(context).push(
                              //         MaterialPageRoute(builder: (context) => Chatscreen(
                              //            orderId: myoederdetailmodal?.userDetail?.orderID ?? '',
                              //         ),)
                              //       );
                              //     },
                              //     child: Card(
                              //       elevation: 2,
                              //       child: Container(
                              //         width: MediaQuery.of(context).size.width,
                              //         height: 50,
                              //         decoration: BoxDecoration(
                              //             color: Color(0xff0061b0),
                              //             borderRadius: BorderRadius.circular(8.0)
                              //         ),
                              //         child: Row(
                              //           mainAxisAlignment: MainAxisAlignment.center,
                              //           // crossAxisAlignment: CrossAxisAlignment.center,
                              //           children: [
                              //             Icon(
                              //               CupertinoIcons.chat_bubble_2,
                              //               size: 25.sp,
                              //               color: Colors.white,
                              //               // color: Color(0xfff7941d),
                              //             ),
                              //             SizedBox(width: 5.0,),
                              //             Text("Chats with us",style: TextStyle(
                              //               fontWeight: FontWeight.bold,
                              //               color: Colors.white,
                              //               fontSize: 11.sp,
                              //             ),)
                              //           ],
                              //         ),
                              //       ),
                              //     ),
                              //   ),
                              // ),
                            ],
                          ),
                          
                        ],
                      ),
                      myoederdetailmodal
                          ?.userDetail?.invoicePdf ==null||myoederdetailmodal
                          ?.userDetail?.invoicePdf ==""?Container():Positioned(
                        bottom: 5.h,
                        right: 0,
                        child:   FloatingActionButton(
                        onPressed: () async{
                          var file = await OpenPdfUtil().loadPdfFromNetwork(myoederdetailmodal
                              ?.userDetail?.invoicePdf ?? "");
                          String url1 = myoederdetailmodal ?.userDetail?.invoicePdf ?? "" ;
                          print("55555555${url1}");
                          Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => OpenPDF(
                                file: file,
                                url: url1,
                              ),
                            ),
                          );
                          print("PDF icon pressed");
                        },
                        backgroundColor:AppColors.primary, // Customize button color
                        child: Icon(Icons.picture_as_pdf,color: Colors.white,), // Use an icon for PDF, e.g., a PDF icon
                      ),)
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

  Ordercancelledap() async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['OrderID'] = myoederdetailmodal?.userDetail?.orderID ?? '';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Cancelorderapi(data).then((response) async {
          cancelOrderModel =
              CancelOrderModel.fromJson(json.decode(response.body));
          print(ordercancelmodal?.status);
          if (response.statusCode == 200 && cancelOrderModel?.status == "success") {
            EasyLoading.showSuccess(cancelOrderModel!.status.toString());
            print('EE Thay Gyu Hooooo !^_^! ');
            setState(() {
              isLoading = false;
            });
          } else {
            EasyLoading.showError(cancelOrderModel!.status.toString());
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
