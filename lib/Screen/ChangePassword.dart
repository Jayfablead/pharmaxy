import 'dart:convert';

import 'package:ecommerce/Modal/ChangePasswordModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({super.key});

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

TextEditingController _oldpassword = TextEditingController();
TextEditingController _newpassword = TextEditingController();
TextEditingController _confirmpassword = TextEditingController();

bool secure = false;
bool visible = false;
bool visible1 = false;
bool visible2 = false;

bool isLoading = true;
final _formKey = GlobalKey<FormState>();

class _ChangePasswordState extends State<ChangePassword> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visible = true;
  }

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
                      color: Color(0xff0061b0),
                    ),
                    height: 37.h,
                    width: double.infinity,
                    child: Padding(
                      padding: EdgeInsets.only(right: 9.w, bottom: 2.h),
                      child: Text(
                        "Change Password",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'task',
                            fontSize:20.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 10.h,
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
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Old Password";
                              }
                              return null;
                            },
                            obscureText: visible,
                            controller: _oldpassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible = !visible;
                                    print(visible);
                                  });
                                },
                                icon: visible
                                    ? Icon(
                                        Icons.visibility,
                                        size: 15.sp,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        size: 15.sp,
                                        color: Colors.black,
                                      ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_reset_outlined,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: 'Old Password',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 12.sp,
                                  fontFamily: "task"),
                            ),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The New Password";
                              }
                              return null;
                            },
                            obscureText: visible1,
                            controller: _newpassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible1 = !visible1;
                                    print(visible1);
                                  });
                                },
                                icon: visible1
                                    ? Icon(
                                        Icons.visibility,
                                        size: 15.sp,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        size: 15.sp,
                                        color: Colors.black,
                                      ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_reset_outlined,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: 'New Password',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 12.sp,
                                  fontFamily: "task"),
                            ),
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
                          child: TextFormField(
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Confirm Password ";
                              }
                              return null;
                            },
                            obscureText: visible2,
                            controller: _confirmpassword,
                            decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  setState(() {
                                    visible2 = !visible2;
                                    print(visible2);
                                  });
                                },
                                icon: visible2
                                    ? Icon(
                                        Icons.visibility,
                                        size: 15.sp,
                                        color: Colors.black,
                                      )
                                    : Icon(
                                        Icons.visibility_off,
                                        size: 15.sp,
                                        color: Colors.black,
                                      ),
                              ),
                              prefixIcon: Icon(
                                Icons.lock_reset_outlined,
                                color: Colors.black.withOpacity(0.6),
                              ),
                              enabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              disabledBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              focusedBorder: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(10),
                                  borderSide: BorderSide(color: Colors.grey)),
                              hintText: 'Confirm Password ',
                              hintStyle: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 12.sp,
                                  fontFamily: "task"),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 4.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      changepasswordap();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xff0061b0)),
                        child: Text(
                          "Change Password",
                          style: TextStyle(
                              fontSize: 14.sp,
                              color: Colors.white,
                              fontFamily: "task"),
                        )),
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
                        height: 25.w,
                        width: 25.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(100),
                            color: Colors.white),
                        child: Icon(Icons.person,
                            size: 30.sp, color: Color(0xff0061b0)),
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
                              size: 15.sp, color: Color(0xff0061b0)),
                        ),
                        onTap: () {
                          Navigator.of(context).pushReplacement(
                              MaterialPageRoute(builder: (context) => HomePage(sel: 1,),)
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

  changepasswordap() {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['user_id'] = (usermodal?.userId).toString();
      data['current_password'] = _oldpassword.text.trim().toString();
      data['new_password'] = _newpassword.text.trim().toString();
      data['confirm_password'] = _confirmpassword.text.trim().toString();

      checkInternet().then((internet) async {
        print(internet);
        if (internet) {
          authprovider().ChangePasswordapi(data).then((response) async {
            changepasswordmodal =
                ChangePasswordModal.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                changepasswordmodal?.status == "success") {
              _oldpassword.clear();
              _newpassword.clear();
              _confirmpassword.clear();
              print('Password Change  Thay Gyo Hooooo ! ^_^');
              update(context, 'Success', 'Password Changed Successfully',
                  callback: () {
                Navigator.of(context).push(
                    MaterialPageRoute(builder: (context) => LoginPage2()));
              });

              setState(() {
                isLoading = false;
              });
            } else {
              _newpassword.text == _confirmpassword.text
                  ? buildErrorDialog(
                      context, 'Error', "Old Password is Invalid")
                  : buildErrorDialog(context, 'Error',
                      "Password And Confirmpassword does Not Match");
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
}
