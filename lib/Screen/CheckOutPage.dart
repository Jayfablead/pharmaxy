import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CheckOutPage extends StatefulWidget {
  const CheckOutPage({super.key});

  @override
  State<CheckOutPage> createState() => _CheckOutPageState();
}

class _CheckOutPageState extends State<CheckOutPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {},
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 25.sp,
                      )),
                  Text(
                    "Payment Method",
                    style: TextStyle(
                      fontSize: 20.sp,
                      fontFamily: "task",
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(onPressed: () {}, icon: Icon(null)),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Divider(
                    indent: 4.w,
                    endIndent: 7.w,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Image.network(
                      "https://freepngimg.com/save/13626-paypal-logo-png/2272x864 ",
                      width: 50.w,
                    ),
                  ),
                  Divider(
                    indent: 4.w,
                    endIndent: 7.w,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Padding(
                    padding: EdgeInsets.only(left: 4.w),
                    child: Image.network(
                      "https://freepngimg.com/thumb/credit_card/25826-5-major-credit-card-logo-image.png",
                      width: 60.w,
                    ),
                  ),
                  Divider(
                    indent: 4.w,
                    endIndent: 7.w,
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          width: 85.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Holder Name",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "task",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                style: TextStyle(height: 1),
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Please Enter Email";
                                //   } else {
                                //     bool emailValid = RegExp(
                                //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                //         .hasMatch(value);
                                //     if (!emailValid) {
                                //       return "Invalid Email";
                                //     }
                                //   }
                                //   return null;
                                // },
                                // controller: _email,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  hintText: 'Abc To ',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14.sp,
                                      fontFamily: "task"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    width: 90.w,
                    child: Row(
                      children: [
                        SizedBox(
                          width: 3.w,
                        ),
                        Container(
                          width: 85.w,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                "Card Number",
                                style: TextStyle(
                                    color: Colors.black87,
                                    fontFamily: "task",
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                              TextFormField(
                                style: TextStyle(height: 1),
                                // validator: (value) {
                                //   if (value!.isEmpty) {
                                //     return "Please Enter Email";
                                //   } else {
                                //     bool emailValid = RegExp(
                                //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                //         .hasMatch(value);
                                //     if (!emailValid) {
                                //       return "Invalid Email";
                                //     }
                                //   }
                                //   return null;
                                // },
                                // controller: _email,
                                decoration: InputDecoration(
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  hintText: '64545465169',
                                  hintStyle: TextStyle(
                                      color: Colors.black.withOpacity(0.6),
                                      fontSize: 14.sp,
                                      fontFamily: "task"),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 45.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              width: 40.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Exp.",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    style: TextStyle(height: 1),
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Please Enter Email";
                                    //   } else {
                                    //     bool emailValid = RegExp(
                                    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    //         .hasMatch(value);
                                    //     if (!emailValid) {
                                    //       return "Invalid Email";
                                    //     }
                                    //   }
                                    //   return null;
                                    // },
                                    // controller: _email,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Month/Year',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      SizedBox(
                        width: 45.w,
                        child: Row(
                          children: [
                            SizedBox(
                              width: 3.w,
                            ),
                            Container(
                              width: 40.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Cvv",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    style: TextStyle(height: 1),
                                    // validator: (value) {
                                    //   if (value!.isEmpty) {
                                    //     return "Please Enter Email";
                                    //   } else {
                                    //     bool emailValid = RegExp(
                                    //         r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    //         .hasMatch(value);
                                    //     if (!emailValid) {
                                    //       return "Invalid Email";
                                    //     }
                                    //   }
                                    //   return null;
                                    // },
                                    // controller: _email,
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: '...',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 10.h,
                  ),
                  Container(
                      margin: EdgeInsets.only(right: 7.w, left: 7.w),
                      alignment: Alignment.center,
                      height: 6.h,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30),
                          color: Color(0xfff7941d)),
                      child: Text(
                        "Add Card",
                        style: TextStyle(
                            fontSize: 17.sp,
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                            fontFamily: "task"),
                      )),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
