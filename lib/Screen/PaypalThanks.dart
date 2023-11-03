import 'dart:convert';

import 'package:ecommerce/Screen/HomePage.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class PaypalThanks extends StatefulWidget {
  String? uid;

  PaypalThanks({super.key, this.uid});

  @override
  State<PaypalThanks> createState() => _PaypalThanksState();
}

class _PaypalThanksState extends State<PaypalThanks> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
print(widget.uid);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
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
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        size: 25.sp,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(null),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/bags.png",
                  height: 40.h,
                  width: 90.w,
                )),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Success!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 30.sp,
                fontFamily: 'task',
              ),
            ),
            Text(
              "Your order will be delivered soon Thank you for choosing our app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 19.sp,
                fontFamily: 'task',
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Order ID :",
                  textAlign: TextAlign.center,
                  style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontFamily: 'task',
                      fontSize: 15.sp,
                      color: Colors.black),
                ),
                Text(
                  widget.uid.toString(),
                  textAlign: TextAlign.start,maxLines: 3,
                  style: TextStyle(
                      fontWeight: FontWeight.normal,
                      fontFamily: 'task',
                      fontSize: 15.sp,
                      color: Colors.black),
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => HomePage(sel: 0,)));
              },
              child: Container(
                  margin: EdgeInsets.only(right: 7.w, left: 7.w),
                  alignment: Alignment.center,
                  height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30),
                      color: Color(0xfff7941d)),
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "task"),
                  )),
            ),
          ],
        ),
      ),
    );
  }


}
