import 'dart:async';

import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/sharedpreferance.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:sizer/sizer.dart';

class SpleshScreen extends StatefulWidget {
  const SpleshScreen({super.key});

  @override
  State<SpleshScreen> createState() => _SpleshScreenState();
}

class _SpleshScreenState extends State<SpleshScreen> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getdata();
    Timer(
        Duration(seconds: 5),
        () =>  Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) =>  HomePage(sel: 0),
                )));
  }

  getdata() async {
    usermodal = await SaveDataLocal.getDataFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
          Image.asset(
                "assets/mylogo.png",color: Colors.white,
              ),
            SizedBox(
              height: 5.h,
            ),
            Column(
              children: [
                Container(
                  height: 35.h,
                  child: Image.asset(
                    "assets/logo1.png",
                    fit: BoxFit.cover,
                  ),
                ),

                Column(
                  children: [
                    RichText(
                      textAlign: TextAlign.center,
                      text: TextSpan(
                        children: [
                          TextSpan(
                            text: 'Welcome to ',
                            style: TextStyle(
                                fontFamily: "task",
                                letterSpacing: 1,
                                color:Colors.white,
                                fontSize: 15.sp,
                                fontWeight: FontWeight.normal),
                          ),
                          TextSpan(
                            text: 'Pharmaxy',
                            style: TextStyle(
                              fontFamily: "task",
                              letterSpacing: 1,
                              color:Colors.white,
                              fontWeight: FontWeight.bold,
                              fontSize: 15.sp,
                            ),
                          ),
                        ],
                      ),
                    ),
                    SizedBox(
                      height: 1.h,
                    ),
                    Text(
                      'Search And Get Medicine',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontFamily: "task",
                          letterSpacing: 1,
                          color:Colors.white,
                          fontSize: 13.sp,
                          fontWeight: FontWeight.normal),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
