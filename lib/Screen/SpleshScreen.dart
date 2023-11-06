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
        () => (usermodal == null)
            ? Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => LoginPage2(),
                ))
            : Navigator.pushReplacement(
                context,
                MaterialPageRoute(
                  builder: (context) => HomePage(sel: 0),
                )));
  }

  getdata() async {
    usermodal = await SaveDataLocal.getDataFromLocal();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              child:
                  Lottie.asset('assets/ecom2.json', width: 50.w, height: 60.w),
            ),
            Column(
              children: [
                Container(
                  child: Lottie.asset('assets/lo.json', height: 19.h),
                ),
                Text(
                  'Please Wait ...',
                  style: TextStyle(
                      fontSize: 15.sp,
                      fontFamily: 'task',
                      fontWeight: FontWeight.bold),
                )
              ],
            ),
          ],
        ),
      ),
    );
  }
}
