import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/DeleteUserModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/CartPage.dart';
import 'package:ecommerce/Screen/CategoryPage.dart';
import 'package:ecommerce/Screen/ChangePassword.dart';
import 'package:ecommerce/Screen/CompanyInfo.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/MyOrderList.dart';
import 'package:ecommerce/Screen/PrescriptionForm.dart';
import 'package:ecommerce/Screen/ProductList4.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/Refill_Alert.dart';
import 'package:ecommerce/Screen/RequestDoctorForm.dart';
import 'package:ecommerce/Screen/Request_Medicine.dart';
import 'package:ecommerce/Screen/ReturnPolicyPage.d.dart';
import 'package:ecommerce/Screen/Terms&ConditionPage.dart';
import 'package:ecommerce/Screen/WishListPage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/sharedpreferance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

class drawer1 extends StatefulWidget {
  const drawer1({Key? key}) : super(key: key);

  @override
  State<drawer1> createState() => _drawer1State();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool isloading = true;

class _drawer1State extends State<drawer1> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewap();
  }

  Widget build(BuildContext context) {
    double widthDrawer = MediaQuery.of(context).size.width * 0.85;
    return Drawer(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width: widthDrawer,
        color: Colors.white,
        child: usermodal?.userId == "" || usermodal?.userId == null
            ? ListView(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      padding: EdgeInsets.all(3.w),
                      width: widthDrawer,
                      // color: Colors.black.withOpacity(0.3),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 2.h,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(sel: 0),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.home,
                                          size: 14.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Home",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CategoryPage(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category_rounded,
                                          size: 14.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Medicine",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Prescriptionform(),
                              ));
                          // setState(() async {
                          //
                          // });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category_rounded,
                                          size: 14.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Request Prescription",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Requestdoctorform(),
                              ));
                          // setState(() async {
                          //
                          // });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category_rounded,
                                          size: 14.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Request Doctor",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Refill_Alert(),
                              ));
                          // setState(() async {
                          //
                          // });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category_rounded,
                                          size: 14.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Refill Alert",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      // request medicine
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => Request_Medicine(),
                              ));
                          // setState(() async {
                          //
                          // });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category_rounded,
                                          size: 14.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Request Medicine",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Companyinfo(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.co_present_outlined,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Company Info",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TermCondition(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.description,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Term & Condition",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReturnPolicy(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.return_icon,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Refund Policy",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => LoginPage2(),
                              ));
                          // setState(() async {
                          //
                          // });
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 32.w,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: AppColors.primary,
                                          size: 20.sp,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Login",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: AppColors.primary,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).pop();
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => CartPage(),
                      //     )
                      //     );
                      //   },
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         SizedBox(
                      //           width: 6.w,
                      //         ),
                      //         Container(
                      //           width: 64.w,
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Icon(
                      //                     CupertinoIcons.cart,
                      //                     size: 25.sp,
                      //                     color: AppColors.primary,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 2.w,
                      //                   ),
                      //                   Text(
                      //                     "My Cart",
                      //                     style: TextStyle(
                      //                       fontSize: 17.sp,
                      //                       fontWeight: FontWeight.w500,
                      //                       fontFamily: 'task',
                      //                       color: Colors.black,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               Icon(
                      //                 Icons.chevron_right_rounded,
                      //                 color: Colors.black,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ],
              )
            : ListView(
                children: [
                  InkWell(
                    onTap: () {},
                    child: Container(
                      height: 15.h,
                      padding: EdgeInsets.all(3.w),
                      width: widthDrawer,
                      // color: Colors.black.withOpacity(0.3),
                      child: Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Container(
                            margin: EdgeInsets.symmetric(horizontal: 1.w),
                            height: 19.w,
                            width: 19.w,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(90),
                              child: CachedNetworkImage(
                                  fit: BoxFit.cover,
                                  imageUrl: profilemodal
                                          ?.profileDetails?.profileimage ??
                                      '',
                                  progressIndicatorBuilder:
                                      (context, url, progress) =>
                                          CircularProgressIndicator(),
                                  errorWidget: (context, url, error) =>
                                      Icon(Icons.error)),
                            ),
                          ),
                          // CircleAvatar(
                          //     radius: 9.w,
                          //     backgroundImage: NetworkImage(
                          //         "https://icdn.football-espana.net/wp-content/uploads/2022/06/Neymar-Junior2.jpeg")),
                          SizedBox(
                            width: 2.w,
                          ),
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                height: 0.5.h,
                              ),
                              Padding(
                                padding: EdgeInsets.only(left: 2.w),
                                child: Row(
                                  children: [
                                    Text(
                                      profilemodal?.profileDetails
                                                      ?.userFirstName ==
                                                  '' ||
                                              profilemodal?.profileDetails
                                                      ?.userFirstName ==
                                                  null
                                          ? 'N/A'
                                          : profilemodal?.profileDetails
                                                  ?.userFirstName ??
                                              '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                          letterSpacing: 0.5,
                                          fontFamily: 'task',
                                          fontWeight: FontWeight.w600),
                                    ),
                                    SizedBox(
                                      width: 1.w,
                                    ),
                                    Text(
                                      profilemodal?.profileDetails
                                                      ?.userLastName ==
                                                  '' ||
                                              profilemodal?.profileDetails
                                                      ?.userLastName ==
                                                  null
                                          ? 'N/A'
                                          : profilemodal?.profileDetails
                                                  ?.userLastName ??
                                              '',
                                      style: TextStyle(
                                          color: Colors.black,
                                          fontSize: 11.sp,
                                          letterSpacing: 0.5,
                                          fontFamily: 'task',
                                          fontWeight: FontWeight.w600),
                                    ),
                                  ],
                                ),
                              ),
                              SizedBox(
                                width: 40.w,
                                child: Padding(
                                  padding: const EdgeInsets.only(left: 8.0),
                                  child: Text(
                                      profilemodal?.profileDetails?.userEmail ==
                                                  '' ||
                                              profilemodal?.profileDetails
                                                      ?.userEmail ==
                                                  null
                                          ? 'N/A'
                                          : profilemodal
                                                  ?.profileDetails?.userEmail ??
                                              '',
                                      maxLines: 2,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                          // color: primary,
                                          fontFamily: 'task',
                                          fontSize: 11.sp,
                                          fontWeight: FontWeight.w600)),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Divider(
                    color: Colors.grey,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // HOME
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => HomePage(sel: 0),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.home,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("Home",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),

                      SizedBox(
                        height: 2.h,
                      ),
                      // Order
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => MyOrderList(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.option,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("My Orders",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // all medicine
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProductList4(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.category_rounded,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text("All Medicines",
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).pop();
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => CheckOutPage(),
                      //     ));
                      //   },
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         SizedBox(
                      //           width: 6.w,
                      //         ),
                      //         Container(
                      //           width: 64.w,
                      //           child: Row(
                      //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Icon(
                      //                     Icons.payment_sharp,
                      //                     size: 19.sp,
                      //                     color: AppColors.primary,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 2.w,
                      //                   ),
                      //                   Text(
                      //                     "Payment Method ",
                      //                     style: TextStyle(
                      //                       fontSize: 17.sp,
                      //                       fontWeight: FontWeight.w500,
                      //                       fontFamily: 'task',
                      //                       color: Colors.black,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               Icon(
                      //                 Icons.chevron_right_rounded,
                      //                 color: Colors.black,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // PROFILE
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ProfilePage(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.person_outline_rounded,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Profile",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // WISHLIST
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => WishListPage(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.favorite,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text('WishList',
                                            style: TextStyle(
                                              fontSize: 12.sp,
                                              fontWeight: FontWeight.w500,
                                              fontFamily: 'task',
                                              color: Colors.black,
                                            )),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // MY CART
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).pop();
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CartPage(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.cart,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "My Cart",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Chat
                      // SizedBox(
                      //   height: 2.h,
                      // ),
                      // InkWell(
                      //   onTap: () {
                      //     Navigator.of(context).push(MaterialPageRoute(
                      //       builder: (context) => Chatscreen(orderId: "",),
                      //     ));
                      //   },
                      //   child: Container(
                      //     child: Row(
                      //       children: [
                      //         SizedBox(
                      //           width: 6.w,
                      //         ),
                      //         Container(
                      //           width: 64.w,
                      //           child: Row(
                      //             mainAxisAlignment:
                      //             MainAxisAlignment.spaceBetween,
                      //             children: [
                      //               Row(
                      //                 children: [
                      //                   Icon(
                      //                     CupertinoIcons.chat_bubble_fill,
                      //                     size: 16.sp,
                      //                     color: AppColors.primary,
                      //                   ),
                      //                   SizedBox(
                      //                     width: 2.w,
                      //                   ),
                      //                   Text(
                      //                     "Chat",
                      //                     style: TextStyle(
                      //                       fontSize: 12.sp,
                      //                       fontWeight: FontWeight.w500,
                      //                       fontFamily: 'task',
                      //                       color: Colors.black,
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //               Icon(
                      //                 Icons.chevron_right_rounded,
                      //                 color: Colors.black,
                      //               )
                      //             ],
                      //           ),
                      //         ),
                      //       ],
                      //     ),
                      //   ),
                      // ),
                      // Change Password
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ChangePassword(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.lock_rotation_open,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Change Password",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // term and codition
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Companyinfo(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.co_present_outlined,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Company Info",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => TermCondition(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.description,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Term & Condition",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // Refund policy
                      SizedBox(
                        height: 2.h,
                      ),
                      InkWell(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => ReturnPolicy(),
                          ));
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.return_icon,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Refund Policy",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      // delete account
                      SizedBox(
                        height: 2.h,
                      ),
                      // delete user
                      InkWell(
                        onTap: () {
                          Deleteuser();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 64.w,
                                child: Row(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          CupertinoIcons.delete,
                                          size: 16.sp,
                                          color: AppColors.primary,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Delete Account",
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.black,
                                          ),
                                        ),
                                      ],
                                    ),
                                    Icon(
                                      Icons.chevron_right_rounded,
                                      color: Colors.black,
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      SizedBox(
                        height: 3.h,
                      ),
                      InkWell(
                        onTap: () {
                          setState(() async {
                            await SaveDataLocal.clearUserData();
                            usermodal = await SaveDataLocal.getDataFromLocal();
                            Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => LoginPage2(),
                                ));
                          });
                          Navigator.of(context).pop();
                        },
                        child: Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 6.w,
                              ),
                              Container(
                                width: 32.w,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceAround,
                                  children: [
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.logout,
                                          color: Colors.red,
                                          size: 20.sp,
                                        ),
                                        SizedBox(
                                          width: 2.w,
                                        ),
                                        Text(
                                          "Logout",
                                          style: TextStyle(
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.w500,
                                            fontFamily: 'task',
                                            color: Colors.red,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
      ),
    );
  }

  TextStyle textStyle = TextStyle(
      color: Colors.black,
      fontSize: 12.sp,
      fontFamily: 'task',
      fontWeight: FontWeight.w600);

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
            // setState(() {
            //   // isLoading = false;
            // });
          } else {
            // setState(() {
            //   // isLoading = false;
            // });
          }
        });
      } else {
        // setState(() {
        //   // isLoading = false;
        // });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  Deleteuser() {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().deleteuserap(data).then((response) async {
          deleteuserModel =
              DeleteUserModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              deleteuserModel?.status == "success") {
            await EasyLoading.showSuccess(deleteuserModel!.message.toString());
            setState(() {
              // isLoading = false;
            });
          } else {
            await EasyLoading.showError(deleteuserModel!.message.toString());
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
