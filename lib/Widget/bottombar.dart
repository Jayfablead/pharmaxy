import 'dart:io';

import 'package:ecommerce/Screen/CartPage.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductList4.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/sharedpreferance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class bottombar extends StatefulWidget {
  int? selected;

  bottombar({super.key, required this.selected});

  @override
  State<bottombar> createState() => _bottombarState();
}

class Sachen {
  Icon? image;
  String? name;

  Sachen(this.name);
}

List<Sachen> data = [
  Sachen("Home"),
  Sachen("Shop"),
  Sachen("Bag"),
  Sachen("favorite"),
  Sachen("Profile"),
];

int selectindex1 = 1;
int selected = 1;

class _bottombarState extends State<bottombar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: Platform.isAndroid ? 8.7.h : 9.8.h,
      margin: EdgeInsets.only(
        right: 1.w,
        left: 1.w,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 2.h),
      child: usermodal?.userId == "" || usermodal?.userId == null
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => HomePage(
                                sel: 0,
                              )));
                      selected = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.home,
                          size: 22.sp,
                          color: widget.selected == 1
                              ? AppColors.primary
                              : Colors.black),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task",
                          color: widget.selected == 1
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.selected == 1
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),

                      // Text("Home",
                      //   style: TextStyle(
                      //     fontSize: 13.sp,
                      //     fontWeight: FontWeight.normal,
                      //     fontFamily: "task",
                      //     color: selected == 1
                      //         ? AppColors.primary
                      //         :  Colors.grey.shade500,
                      //
                      //   ),
                      // ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => CartPage()));
                      widget.selected = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.shopping_cart,
                          size: 22.sp,
                          color: widget.selected == 2
                              ? AppColors.primary
                              : Colors.black),
                      Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task",
                          color: widget.selected == 2
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.selected == 2
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),

                      // Text("Shop",
                      //   style: TextStyle(
                      //     fontSize: 13.sp,
                      //     fontWeight: FontWeight.normal,
                      //     fontFamily: "task",
                      //     color: selected == 2
                      //         ? AppColors.primary
                      //         :  Colors.grey.shade500,
                      //
                      //   ),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => ProductList4()));
                      widget.selected = 3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.local_offer_outlined,
                          size: 22.sp,
                          color: widget.selected == 3
                              ? AppColors.primary
                              : Colors.black),
                      // Icon(
                      //   CupertinoIcons.heart,
                      //   size: 22.sp,
                      //   color: selected == 4
                      //       ? AppColors.primary
                      //       : Colors.black
                      // ),
                      Text(
                        "Offer",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task",
                          color: widget.selected == 3
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.selected == 3
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),

                      // Text("Favorite",
                      //   style: TextStyle(
                      //     fontSize: 13.sp,
                      //     fontWeight: FontWeight.normal,
                      //     fontFamily: "task",
                      //     color: selected == 4
                      //         ? AppColors.primary
                      //         :  Colors.grey.shade500,
                      //
                      //   ),
                      // ),
                    ],
                  ),
                ),
                GestureDetector(
                    onTap: () {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                          builder: (context) => LoginPage2()));
                    },
                    child: Padding(
                      padding: Platform.isAndroid
                          ? EdgeInsets.only(bottom: 1.h)
                          : EdgeInsets.only(bottom: 1.h),
                      child: Column(
                        children: [
                          Icon(CupertinoIcons.person_add,
                              size: 21.sp,
                              color: widget.selected == 5
                                  ? AppColors.primary
                                  : Colors.black),
                          Text(
                            "Login",
                            style: TextStyle(
                              fontSize: 10.sp,
                              fontWeight: FontWeight.bold,
                              fontFamily: "task",
                              color: widget.selected == 5
                                  ? AppColors.primary
                                  : Colors.black,
                            ),
                          ),
                        ],
                      ),
                    ))
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => HomePage(sel: 0),
                      ));
                      widget.selected = 1;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.home,
                        size: 22.sp,
                        color: widget.selected == 1
                            ? AppColors.primary
                            : Colors.black,
                      ),
                      Text(
                        "Home",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task",
                          color: widget.selected == 1
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.selected == 1
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    setState(() {
                      Navigator.of(context).pushReplacement(
                          MaterialPageRoute(builder: (context) => CartPage()));
                      widget.selected = 2;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(CupertinoIcons.shopping_cart,
                          size: 22.sp,
                          color: widget.selected == 2
                              ? AppColors.primary
                              : Colors.black),
                      Text(
                        "Cart",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task",
                          color: widget.selected == 2
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),

                      Container(
                        height: 0.5.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.selected == 2
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),

                      // Text("Shop",
                      //   style: TextStyle(
                      //     fontSize: 13.sp,
                      //     fontWeight: FontWeight.normal,
                      //     fontFamily: "task",
                      //     color: selected == 2
                      //         ? AppColors.primary
                      //         :  Colors.grey.shade500,
                      //
                      //   ),),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () async {
                    setState(() {
                      usermodal?.userId == "" || usermodal?.userId == null
                          ? Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage2()))
                          : Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => ProductList4()));
                      widget.selected = 3;
                    });
                  },
                  child: Column(
                    children: [
                      Icon(Icons.local_offer_outlined,
                          // CupertinoIcons.heart,
                          size: 22.sp,
                          color: widget.selected == 3
                              ? AppColors.primary
                              : Colors.black),
                      Text(
                        "Offer",
                        style: TextStyle(
                          fontSize: 9.sp,
                          fontWeight: FontWeight.bold,
                          fontFamily: "task",
                          color: widget.selected == 3
                              ? AppColors.primary
                              : Colors.black,
                        ),
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 6.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: widget.selected == 3
                              ? AppColors.primary
                              : Colors.transparent,
                        ),
                      ),

                      // Text("Favorite",
                      //   style: TextStyle(
                      //     fontSize: 13.sp,
                      //     fontWeight: FontWeight.normal,
                      //     fontFamily: "task",
                      //     color: selected == 4
                      //         ? AppColors.primary
                      //         :  Colors.grey.shade500,
                      //
                      //   ),
                      // ),
                    ],
                  ),
                ),
                usermodal?.userId == "" || usermodal?.userId == null
                    ? GestureDetector(
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(
                                  builder: (context) => LoginPage2()));
                        },
                        child: Padding(
                          padding: Platform.isAndroid
                              ? EdgeInsets.only(bottom: 1.h)
                              : EdgeInsets.only(bottom: 3.5.h),
                          child: Text(
                            "Login",
                            style: TextStyle(
                              color: AppColors.primary,
                              fontFamily: 'task',
                              fontWeight: FontWeight.bold,
                              fontSize: 14.sp,
                            ),
                          ),
                        ))
                    : GestureDetector(
                        onTap: () async {
                          setState(() {
                            usermodal?.userId == "" || usermodal?.userId == null
                                ? Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => LoginPage2()))
                                : Navigator.of(context).pushReplacement(
                                    MaterialPageRoute(
                                        builder: (context) => ProfilePage()));
                            widget.selected = 4;
                          });
                          // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                        },
                        child: Column(
                          children: [
                            Icon(CupertinoIcons.person,
                                size: 22.sp,
                                color: widget.selected == 4
                                    ? AppColors.primary
                                    : Colors.black),
                            Text(
                              "Profile",
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "task",
                                color: widget.selected == 4
                                    ? AppColors.primary
                                    : Colors.black,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              height: 0.5.h,
                              width: 5.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                                color: widget.selected == 4
                                    ? AppColors.primary
                                    : Colors.transparent,
                              ),
                            ),
                          ],
                        ),
                      ),
                usermodal?.userId == "" || usermodal?.userId == null
                    ? Text(
                        "",
                      )
                    : GestureDetector(
                        onTap: () {
                          showBottomSheet(
                            context: context,
                            builder: (context) {
                              return Stack(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white),
                                    height: 15.h,
                                    width: double.infinity,
                                    // Customize the bottom sheet content here
                                    child: Padding(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 3.w, vertical: 2.h),
                                      child: Column(
                                        // mainAxisAlignment:
                                        //     MainAxisAlignment.start,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
                                            children: [
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(left: 2.w),
                                                child: Text(
                                                  "Are You Sure Want To Logout ?",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontFamily: 'task'),
                                                ),
                                              ),
                                            ],
                                          ),

                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Row(
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              GestureDetector(
                                                onTap: () {
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    height: 5.h,
                                                    width: 35.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color: Colors.white70,
                                                        border: Border.all(
                                                            width: 0.5,
                                                            color:
                                                                Colors.grey)),
                                                    child: Text(
                                                      "Cancel",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: Colors.black,
                                                          fontFamily: "task",
                                                          fontWeight:
                                                              FontWeight.bold),
                                                    )),
                                              ),
                                              GestureDetector(
                                                onTap: () {
                                                  setState(() async {
                                                    await SaveDataLocal
                                                        .clearUserData();
                                                    usermodal =
                                                        await SaveDataLocal
                                                            .getDataFromLocal();
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                          builder: (context) =>
                                                              LoginPage2(),
                                                        ));
                                                  });
                                                  Navigator.of(context).pop();
                                                },
                                                child: Container(
                                                    alignment: Alignment.center,
                                                    height: 5.h,
                                                    width: 35.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            AppColors.primary),
                                                    child: Text(
                                                      "Logout",
                                                      style: TextStyle(
                                                          fontSize: 13.sp,
                                                          color: Colors.white,
                                                          fontFamily: "task"),
                                                    )),
                                              ),
                                            ],
                                          ),
                                          // Add more options as needed
                                        ],
                                      ),
                                    ),
                                  ),
                                  Positioned(
                                    left: 86.w,
                                    child: IconButton(
                                        icon: Icon(
                                          Icons.highlight_remove,
                                          size: 22.sp,
                                          color: Colors.grey,
                                        ), // Icon to open the menu
                                        onPressed: () {
                                          Navigator.of(context).pop();
                                        } // We set onPressed to null to disable the button
                                        ),
                                  ),
                                ],
                              );
                            },
                          );
                        },

                        // onTap: (){
                        //   setState(() async {
                        //     await SaveDataLocal.clearUserData();
                        //     Navigator.pushReplacement(
                        //         context,
                        //         MaterialPageRoute(
                        //           builder: (context) => LoginPage2(),
                        //         ));
                        // });},

                        child: Column(
                          children: [
                            Icon(
                              Icons.logout,
                              color: Colors.red.shade400,
                              size: 22.sp,
                            ),
                            Text(
                              "LogOut",
                              style: TextStyle(
                                fontSize: 9.sp,
                                fontWeight: FontWeight.bold,
                                fontFamily: "task",
                                color: widget.selected == 5
                                    ? AppColors.primary
                                    : Colors.red,
                              ),
                            ),
                            SizedBox(
                              height: 0.5.h,
                            ),
                            Container(
                              height: 0.5.h,
                              width: 4.h,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(100),
                              ),
                            ),
                          ],
                        ),
                      ),
              ],
            ),
    );
  }
}
