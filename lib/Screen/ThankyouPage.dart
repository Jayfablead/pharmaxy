import 'dart:convert';

import 'package:ecommerce/Modal/CheckOutModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/pdfscreen.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class ThankyouPage extends StatefulWidget {
  String? uid;

  String? url;

  ThankyouPage({super.key, this.uid, this.url});

  @override
  State<ThankyouPage> createState() => _ThankyouPageState();
}

class _ThankyouPageState extends State<ThankyouPage> {
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.uid);
    checkoutpayap();
    // Timer(
    //     Duration(seconds: 5),
    //         () =>  Navigator.pushReplacement(
    //         context,
    //         MaterialPageRoute(
    //           builder: (context) =>  HomePage(sel: 0),
    //         )));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: EdgeInsets.symmetric(
          horizontal: 3.w,
        ),
        child: Column(
          children: [
            SizedBox(
              height: 4.h,
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [],
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
              height: 3.h,
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
                  fontFamily: 'task',
                  fontWeight: FontWeight.normal),
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
              height: 3.h,
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
            SizedBox(
              height: 2.h,
            ),
            Text(
              'If You Have Any Issue With The Order Kindly Contact',
              style: TextStyle(
                  fontSize: 10.sp,
                  // color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'task'),
            ),
            SizedBox(
              height: 1.h,
            ),
            Container(
              height: 40,
              width: 43.w, // Height of the button
              decoration: BoxDecoration(
                color: AppColors.primary, // Button background color
                borderRadius: BorderRadius.circular(10), // Rounded corners
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.call, color: Colors.white, size: 20.sp),
                  SizedBox(width: 8),
                  GestureDetector(
                    onTap: () {
                      _makePhoneCall(
                          '9051294444'); // Replace with the actual phone number
                    },
                    child: Text(
                      "Call Us",
                      style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontSize: 12.sp,
                        fontFamily: 'task',
                      ),
                    ),
                  ),
                ],
              ),
            ),
            // GestureDetector(
            //   onTap: () {
            //     _makePhoneCall(
            //         '9051294444'); // Replace with the actual phone number
            //   },
            //   child: Text(
            //     "Call Us",
            //     style: TextStyle(
            //       color: AppColors.primary,
            //       fontWeight: FontWeight.bold,
            //       fontSize: 12.sp,
            //       fontFamily: 'task',
            //     ),
            //   ),
            // ),
            // Center(
            //     child: InkWell(
            //       onTap: () {
            //         _makePhoneCall('9051294444');
            //       },
            //         child: Text('Click',style: TextStyle(
            //           decoration: TextDecoration.underline,
            //             fontSize: 12.sp,
            //             // color: Colors.white,
            //             fontWeight: FontWeight.bold,
            //             fontFamily: 'task'
            //         ),)
            //     )
            // ),
            Padding(
              padding: EdgeInsets.only(left: 70.w, top: 5.h),
              child: FloatingActionButton(
                onPressed: () async {
                  var file = await OpenPdfUtil()
                      .loadPdfFromNetwork(widget.url.toString());
                  String url1 = widget.url.toString();
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
                backgroundColor: AppColors.primary, // Customize button color
                child: Icon(
                  Icons.picture_as_pdf,
                  color: Colors.white,
                ), // Use an icon for PDF, e.g., a PDF icon
              ),
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
            print("Reti na dhagala ni jay hooo......");
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
