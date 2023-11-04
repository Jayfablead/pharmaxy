import 'dart:io';

import 'package:ecommerce/Screen/CartPage.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/WishListPage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/sharedpreferance.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class bottombar extends StatefulWidget {
  int? selected;

  bottombar({super.key, this.selected});

  @override
  State<bottombar> createState() => _bottombarState();
}

class Sachen {
  Icon? image;
  String? name;

  Sachen(this.name);
}

List<Sachen> data = [
  Sachen("Home "),
  Sachen("Shop"),
  Sachen("Bag"),
  Sachen("favorite"),
  Sachen("Profile"),
];

int selectindex1 = 1;
int? selected;

class _bottombarState extends State<bottombar> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.white),
      height: Platform.isAndroid ? 6.h : 8.h,
      margin: EdgeInsets.only(
        right: 1.w,
        left: 1.w,
      ),
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.only(left: 4.w, right: 4.w, top: 0.7.h),
      child:          usermodal?.userId == "" || usermodal?.userId == null ?
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(
                      sel: 0,
                    )));
                selected = 1;
              });
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.home,
                  size: 25.sp,
                  color:
                  selected == 1 ? Color(0xfff7941d) : Colors.grey.shade300,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 0.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                    selected == 1 ? Color(0xfff7941d) : Colors.transparent,
                  ),
                ),

                // Text("Home",
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: "task",
                //     color: selected == 1
                //         ? Color(0xfff7941d)
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
                selected = 2;
              });
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.shopping_cart,
                  size: 25.sp,
                  color:
                  selected == 2 ? Color(0xfff7941d) : Colors.grey.shade300,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 0.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                    selected == 2 ? Color(0xfff7941d) : Colors.transparent,
                  ),
                ),

                // Text("Shop",
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: "task",
                //     color: selected == 2
                //         ? Color(0xfff7941d)
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
                    ? Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage2()))
                    : Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => WishListPage()));
                selected = 4;
              });
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.heart,
                  size: 25.sp,
                  color:
                  selected == 4 ? Color(0xfff7941d) : Colors.grey.shade300,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 0.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                    selected == 4 ? Color(0xfff7941d) : Colors.transparent,
                  ),
                ),

                // Text("Favorite",
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: "task",
                //     color: selected == 4
                //         ? Color(0xfff7941d)
                //         :  Colors.grey.shade500,
                //
                //   ),
                // ),
              ],
            ),
          ),

               GestureDetector(
              onTap: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage2()));
              },
              child: Padding(
                padding: Platform.isAndroid
                    ? EdgeInsets.only(bottom: 1.h)
                    : EdgeInsets.only(bottom: 3.5.h),
                child: Text(
                  "Login",
                  style: TextStyle(
                    color: Color(0xfff7941d),
                    fontFamily: 'task',
                    fontWeight: FontWeight.bold,
                    fontSize: 19.sp,
                  ),
                ),
              ))

        ],
      ):
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          GestureDetector(
            onTap: () {
              setState(() {
                Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => HomePage(
                          sel: 0,
                        )));
                selected = 1;
              });
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.home,
                  size: 25.sp,
                  color:
                      selected == 1 ? Color(0xfff7941d) : Colors.grey.shade300,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 0.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                        selected == 1 ? Color(0xfff7941d) : Colors.transparent,
                  ),
                ),

                // Text("Home",
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: "task",
                //     color: selected == 1
                //         ? Color(0xfff7941d)
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
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => CartPage()));
                selected = 2;
              });
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.shopping_cart,
                  size: 25.sp,
                  color:
                      selected == 2 ? Color(0xfff7941d) : Colors.grey.shade300,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 0.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                        selected == 2 ? Color(0xfff7941d) : Colors.transparent,
                  ),
                ),

                // Text("Shop",
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: "task",
                //     color: selected == 2
                //         ? Color(0xfff7941d)
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
                    ? Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage2()))
                    : Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => WishListPage()));
                selected = 4;
              });
            },
            child: Column(
              children: [
                Icon(
                  CupertinoIcons.heart,
                  size: 25.sp,
                  color:
                      selected == 4 ? Color(0xfff7941d) : Colors.grey.shade300,
                ),
                SizedBox(
                  height: 0.5.h,
                ),
                Container(
                  height: 0.5.h,
                  width: 4.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(100),
                    color:
                        selected == 4 ? Color(0xfff7941d) : Colors.transparent,
                  ),
                ),

                // Text("Favorite",
                //   style: TextStyle(
                //     fontSize: 13.sp,
                //     fontWeight: FontWeight.normal,
                //     fontFamily: "task",
                //     color: selected == 4
                //         ? Color(0xfff7941d)
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
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (context) => LoginPage2()));
                  },
                  child: Padding(
                    padding: Platform.isAndroid
                        ? EdgeInsets.only(bottom: 1.h)
                        : EdgeInsets.only(bottom: 3.5.h),
                    child: Text(
                      "Login",
                      style: TextStyle(
                        color: Color(0xfff7941d),
                        fontFamily: 'task',
                        fontWeight: FontWeight.bold,
                        fontSize: 19.sp,
                      ),
                    ),
                  ))
              : GestureDetector(
                  onTap: () async {
                    setState(() {
                      usermodal?.userId == "" || usermodal?.userId == null
                          ? Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => LoginPage2()))
                          : Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => ProfilePage()));
                      selected = 5;
                    });
                    // Navigator.pushReplacement(context, MaterialPageRoute(builder: (context) => LoginPage(),));
                  },
                  child: Column(
                    children: [
                      Icon(
                        CupertinoIcons.person,
                        size: 25.sp,
                        color: selected == 5
                            ? Color(0xfff7941d)
                            : Colors.grey.shade300,
                      ),
                      SizedBox(
                        height: 0.5.h,
                      ),
                      Container(
                        height: 0.5.h,
                        width: 4.h,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(100),
                          color: selected == 5
                              ? Color(0xfff7941d)
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
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Text(
                                          "Are You Sure Want To Logout ?",
                                          style: TextStyle(
                                              fontSize: 15.sp,
                                              fontFamily: 'task'),
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
                                                      BorderRadius.circular(30),
                                                  color: Colors.white70,
                                                  border: Border.all(
                                                      width: 0.5,
                                                      color: Colors.grey)),
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
                                              usermodal = await SaveDataLocal
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
                                                      BorderRadius.circular(30),
                                                  color: Color(0xfff7941d)),
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
                              left: 89.w,
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
                        size: 23.sp,
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
