import 'dart:convert';

import 'package:ecommerce/Modal/CompanyModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Companyinfo extends StatefulWidget {
  const Companyinfo({super.key});

  @override
  State<Companyinfo> createState() => _CompanyinfoState();
}

class _CompanyinfoState extends State<Companyinfo> {
   bool isLoading = true;
   final GlobalKey<ScaffoldState> _scaffoldKeycompanyinfo =GlobalKey<ScaffoldState>();
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });
    Companyinfo();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      key: _scaffoldKeycompanyinfo,
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: isLoading?Container():SingleChildScrollView(
          child:  Padding(
            padding:  EdgeInsets.symmetric(horizontal: 2.1.w,vertical: 1.h),
            child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  SizedBox(
                    height: 5.h,
                  ),
                  // app bar
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      IconButton(
                          onPressed: () {
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(sel: 1),
                                )
                            );
                          },
                          icon: Icon(
                            Icons.arrow_back_ios_new_outlined,
                            size: 18.sp,
                          )),
                      Text(
                        "Company Info",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      IconButton(onPressed: () {}, icon: Icon(null)),
                    ],
                  ),
                  SizedBox(
                   height: 3.h,
                  ),
                Column(
                    children: [
                      // name
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          width: 95.w,
                            height: 10.h,
                            padding: EdgeInsets.only(
                                left: 2.15.w),
                            decoration: BoxDecoration(
                              borderRadius:
                              BorderRadius
                                  .circular(15),
                              color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.person,
                                    color: Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Legal Name :',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    Text(companyModel?.companyInfo?.title==""||companyModel?.companyInfo?.title==null?"N/A"
                                        :companyModel?.companyInfo?.title??'',
                                      style: TextStyle(
                                          fontSize:
                                          12.sp,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                          fontFamily:
                                          'sofi',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      // address
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                            width: 95.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.location_city,
                                    color:Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Registered Address:',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        companyModel?.companyInfo?.address==""||companyModel?.companyInfo?.address==null?"N/A"
                                          :companyModel?.companyInfo?.address??'',
                                        style: TextStyle(
                                            fontSize:
                                            12.sp,
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                0.8),
                                            fontFamily:
                                            'sofi',
                                            letterSpacing:
                                            1,
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      // rno
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          width: 95.w,
                            height: 10.h,
                            padding: EdgeInsets.only(
                                left: 2.15.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.call,
                                    color:
                                    Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Registered No:',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    Text(companyModel?.companyInfo?.regNo==""||companyModel?.companyInfo?.regNo==null?"N/A"
                                        :companyModel?.companyInfo?.regNo??'',
                                      style: TextStyle(
                                          fontSize:
                                          12.sp,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                          fontFamily:
                                          'sofi',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      //officeno
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          width: 95.w,
                            height: 10.h,
                            padding: EdgeInsets.only(
                                left: 2.15.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.call,
                                    color:
                                    Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Office Number',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    Text(companyModel?.companyInfo?.phone==""||companyModel?.companyInfo?.phone==null?"N/A"
                                        :companyModel?.companyInfo?.phone??'',
                                      style: TextStyle(
                                          fontSize:
                                          12.sp,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                          fontFamily:
                                          'sofi',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      // gst
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          width: 95.w,
                            height: 10.h,
                            padding: EdgeInsets.only(
                                left: 2.15.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.confirmation_num_outlined,
                                    color:
                                   Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'GSTIN',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    Text(companyModel?.companyInfo?.gst==""||companyModel?.companyInfo?.gst==null?"N/A"
                                        :companyModel?.companyInfo?.gst??'',
                                      style: TextStyle(
                                          fontSize:
                                          12.sp,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                          fontFamily:
                                          'sofi',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      //dl
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                            width: 95.w,
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.credit_card,
                                    color:Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'DL Numbers:',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    SizedBox(
                                      width: 70.w,
                                      child: Text(
                                        companyModel?.companyInfo?.dlno==""||companyModel?.companyInfo?.dlno==null?"N/A"
                                            :companyModel?.companyInfo?.dlno??'',
                                        style: TextStyle(
                                            fontSize:
                                            12.sp,
                                            color: Colors
                                                .black
                                                .withOpacity(
                                                0.8),
                                            fontFamily:
                                            'sofi',
                                            letterSpacing:
                                            1,
                                            fontWeight:
                                            FontWeight
                                                .bold),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          // Container(
                          // width: 95.w,
                          //   padding: EdgeInsets.symmetric(vertical: 1.h,horizontal: 3.w),
                          //   height: 10.h,
                          //   // padding: EdgeInsets.only(
                          //   //     left: 2.15.w),
                          //   decoration: BoxDecoration(
                          //       borderRadius:
                          //       BorderRadius
                          //           .circular(15),
                          //       color:Colors.white
                          //   ),
                          //   child: Row(
                          //     // mainAxisAlignment: MainAxisAlignment.start,
                          //     // crossAxisAlignment: CrossAxisAlignment.center,
                          //     children: [
                          //       Container(
                          //         padding:
                          //         EdgeInsets.all(
                          //             3.w),
                          //         decoration: BoxDecoration(
                          //             borderRadius:
                          //             BorderRadius
                          //                 .circular(
                          //                 7),
                          //             color: AppColors.primary),
                          //         child: Icon(
                          //           Icons.credit_card_outlined,
                          //           color:
                          //          Colors.white,
                          //           size: 18.sp,
                          //         ),
                          //       ),
                          //       SizedBox(width: 5.w),
                          //       Column(
                          //         crossAxisAlignment:
                          //         CrossAxisAlignment
                          //             .start,
                          //         mainAxisAlignment:
                          //         MainAxisAlignment
                          //             .center,
                          //         children: [
                          //           Text(
                          //             'DL Numbers',
                          //             style: TextStyle(
                          //                 fontSize:
                          //                 14.sp,
                          //                 color:AppColors.primary,
                          //                 fontFamily:
                          //                 'task',
                          //                 letterSpacing:
                          //                 1,
                          //                 fontWeight:
                          //                 FontWeight
                          //                     .bold),
                          //           ),
                          //           SizedBox(
                          //               height:
                          //               0.5.h),
                          //           Text(companyModel?.companyInfo?.dlno==""||companyModel?.companyInfo?.dlno==null?"N/A"
                          //               :companyModel?.companyInfo?.dlno??'',
                          //             style: TextStyle(
                          //                 fontSize:
                          //                 12.sp,
                          //                 color: Colors
                          //                     .black
                          //                     .withOpacity(
                          //                     0.8),
                          //                 fontFamily:
                          //                 'sofi',
                          //                 letterSpacing:
                          //                 1,
                          //                 fontWeight:
                          //                 FontWeight
                          //                     .bold),
                          //           ),
                          //         ],
                          //       ),
                          //     ],
                          //   ),
                          // ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      // fssai
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          width: 95.w,
                            height: 10.h,
                            padding: EdgeInsets.only(
                                left: 2.15.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.credit_card_sharp,
                                    color:
                                    Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Fssai Number',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    Text(companyModel?.companyInfo?.fssai==""||companyModel?.companyInfo?.fssai==null?"N/A"
                                        :companyModel?.companyInfo?.fssai??'',
                                      style: TextStyle(
                                          fontSize:
                                          12.sp,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                          fontFamily:
                                          'sofi',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 1.5.h,
                      ),
                      // udyam
                      Row(
                        mainAxisAlignment:
                        MainAxisAlignment.start,
                        crossAxisAlignment:
                        CrossAxisAlignment.start,
                        children: [
                          Container(
                          width: 95.w,
                            height: 10.h,
                            padding: EdgeInsets.only(
                                left: 2.15.w),
                            decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius
                                    .circular(15),
                                color:Colors.white
                            ),
                            child: Row(
                              // mainAxisAlignment: MainAxisAlignment.start,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Container(
                                  padding:
                                  EdgeInsets.all(
                                      3.w),
                                  decoration: BoxDecoration(
                                      borderRadius:
                                      BorderRadius
                                          .circular(
                                          7),
                                      color: AppColors.primary),
                                  child: Icon(
                                    Icons.credit_card_outlined,
                                    color:
                                    Colors.white,
                                    size: 18.sp,
                                  ),
                                ),
                                SizedBox(width: 5.w),
                                Column(
                                  crossAxisAlignment:
                                  CrossAxisAlignment
                                      .start,
                                  mainAxisAlignment:
                                  MainAxisAlignment
                                      .center,
                                  children: [
                                    Text(
                                      'Udyam Number',
                                      style: TextStyle(
                                          fontSize:
                                          14.sp,
                                          color:AppColors.primary,
                                          fontFamily:
                                          'task',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                    SizedBox(
                                        height:
                                        0.5.h),
                                    Text(companyModel?.companyInfo?.udyamNum==""||companyModel?.companyInfo?.udyamNum==null?"N/A"
                                        :companyModel?.companyInfo?.udyamNum??'',
                                      style: TextStyle(
                                          fontSize:
                                          12.sp,
                                          color: Colors
                                              .black
                                              .withOpacity(
                                              0.8),
                                          fontFamily:
                                          'sofi',
                                          letterSpacing:
                                          1,
                                          fontWeight:
                                          FontWeight
                                              .bold),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),

                ]
            ),
          ),
        ),
      ),
    );

  }
  Companyinfo() async {
    final Map<String, String> data = {};
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().companyinfoap(data).then((response) async {
          companyModel = CompanyModel.fromJson(json.decode(response.body));
          print(companyModel?.status);
          if (response.statusCode == 200 && companyModel?.status == "success") {
            print("Mara Data aavi gaya");
            setState(() {
              isLoading = false;
            });
          } else {
            setState(() {
              isLoading = false;
            });
          }
        });
      }
      else {
        setState(() {
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
