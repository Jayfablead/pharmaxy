import 'dart:convert';

import 'package:ecommerce/Modal/CheckOutModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ThankyouPage extends StatefulWidget {
  String? uid;

  ThankyouPage({super.key, this.uid});

  @override
  State<ThankyouPage> createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.uid);
    checkoutpayap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding:  EdgeInsets.symmetric(horizontal: 3.w,),
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
                        size: 19.sp,
                      )),
                  IconButton(
                    onPressed: () {},
                    icon: Icon(null),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 8.h,
            ),
            Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: Image.asset(
                  "assets/bags.png",
                  height: 35.h,
                  width: 90.w,
                )),
            SizedBox(
              height: 5.h,
            ),
            Text(
              "Success!",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 20.sp,
                fontFamily: 'task',
                fontWeight: FontWeight.bold,
              ),
            ),
            Text(
              "Your order will be delivered soon Thank you for choosing our app",
              textAlign: TextAlign.center,
              style: TextStyle(
                fontSize: 15.sp,
                fontFamily: 'task',fontWeight: FontWeight.normal
              ),
            ),
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Row(
                      children: [
                        Text(
                          "Order ID :  ",
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontFamily: 'task',
                              fontSize: 13.sp,
                              color: Colors.black),
                        ),
                        Text(
                          widget.uid.toString(),
                          textAlign: TextAlign.center,
                          style: TextStyle(
                              fontWeight: FontWeight.normal,
                              fontFamily: 'task',
                              fontSize: 14.sp,
                              color: Colors.black),
                        ),
                      ],
                    ),
                  ],
                ),
              ],
            ),
            SizedBox(
              height: 8.h,
            ),
            GestureDetector(
              onTap: () {
                Navigator.of(context).pushReplacement(MaterialPageRoute(
                    builder: (context) => HomePage(
                          sel: 0,
                        )));
              },
              child: Container(
                  margin: EdgeInsets.only(right: 7.w, left: 7.w),
                  alignment: Alignment.center,
                  height: 6.h,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColors.primary),
                  child: Text(
                    "Continue Shopping",
                    style: TextStyle(
                        fontSize: 14.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: 'task'),
                  )),
            ),
          ],
        ),
      ),
    );
  }

  checkoutpayap() {
    final Map<String, String> data = {};
    data['user_id'] = widget.uid.toString();
    data['payment'] = 'cod';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().checkoutapi(data).then((response) async {
          checkoutmodal = CheckOutModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              checkoutmodal?.status == "success") {
            Navigator.of(context)
                .push(MaterialPageRoute(builder: (context) => ThankyouPage()));
            print(checkoutmodal?.status);
            print("  Reti na dhagala ni jay hooo.......");
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
