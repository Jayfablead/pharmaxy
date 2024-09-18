import 'dart:async';
import 'dart:convert';

import 'package:ecommerce/Modal/ForgotModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

class ForgotPassword extends StatefulWidget {
  const ForgotPassword({super.key});

  @override
  State<ForgotPassword> createState() => _ForgotPasswordState();
}

final _formKey = GlobalKey<FormState>();

TextEditingController _email = TextEditingController();

class _ForgotPasswordState extends State<ForgotPassword> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
          child: Stack(
            children: [
              Column(
                children: [
                  Container(
                    alignment: Alignment.bottomRight,
                    decoration: BoxDecoration(
                      borderRadius:
                          BorderRadius.only(bottomLeft: Radius.circular(100)),
                      color: Color(0xfff7941d),
                    ),
                    height: 37.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 9.w, bottom: 2.h),
                      child: Text(
                        "Forgot Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'task',
                            fontSize: 25.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 22.h,
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
                          child: TextFormField(
                            controller: _email,
                            keyboardType: TextInputType.emailAddress,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter Email";
                              } else {
                                bool emailValid = RegExp(
                                        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                                    .hasMatch(value);
                                if (!emailValid) {
                                  return "Invalid Email";
                                }
                              }
                              return null;
                            },
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.alternate_email_rounded,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(25),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: 'Email',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 14.sp,
                                  fontFamily: "task"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      forgotap();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xfff7941d)),
                        child: Text(
                          "Send",
                          style: TextStyle(
                              fontSize: 23.5.sp,
                              color: Colors.white,
                              fontFamily: "task"),
                        )),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                ],
              ),
              Positioned(
                  top: 9.h,
                  right: 36.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Container(
                        alignment: Alignment.center,
                        height: 30.w,
                        width: 30.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Icon(Icons.person,
                            size: 45.sp, color: Color(0xfff7941d)),
                      ),
                    ],
                  )),
              Positioned(
                  top: 6.h,
                  left: 5.w,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      InkWell(
                        child: Container(
                          alignment: Alignment.center,
                          height: 10.w,
                          width: 10.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(100),
                              color: Colors.white),
                          child: Icon(Icons.arrow_back,
                              size: 20.sp, color: Color(0xfff7941d)),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => LoginPage2(),)
                          );
                        },
                      ),
                    ],
                  )),
            ],
          ),
        ),
      ),
    );
  }

  forgotap() {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Sending Email...');
      final Map<String, String> data = {};
      data['forgotEmail'] = _email.text.toString();
      print(data);
      checkInternet().then((internet) async {
        print(internet);
        if (internet) {
          authprovider().forgotapi(data).then((response) async {
            forgotmodal = ForgotModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 && forgotmodal?.status == "success") {
              _email.clear();
              print(forgotmodal?.status);

              EasyLoading.showSuccess(' Please Check Your Email For Reset Password.!');
              Timer(Duration(seconds: 2), () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage2()));
              });

              setState(() {
                // isLoading = false;
              });
            } else {
              EasyLoading.showError("Email Not Registered!!");

              // alert();
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, '', "Internet Required");
        }
      });
    }
  }
}
