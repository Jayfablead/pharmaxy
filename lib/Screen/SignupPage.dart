import 'dart:convert';
import 'package:ecommerce/Modal/SignupModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

TextEditingController firstname = TextEditingController();
TextEditingController lastname = TextEditingController();
TextEditingController email = TextEditingController();
TextEditingController _password = TextEditingController();
TextEditingController _confirmpassword = TextEditingController();
TextEditingController phone = TextEditingController();
final _formKey = GlobalKey<FormState>();

bool secure = false;
bool visible = false;
bool visible1 = false;

class _SignupPageState extends State<SignupPage> {
  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: Scaffold(
        resizeToAvoidBottomInset: false,
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
                        "Register",
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'task',
                            fontSize: 30.sp,
                            color: Colors.white),
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 3.h,
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
                                return "Please Enter The First Name";
                              }
                              return null;
                            },
                            controller: firstname,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
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
                              hintText: 'FirstName',
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
                                return "Please Enter The Last Name";
                              }
                              return null;
                            },
                            controller: lastname,
                            keyboardType: TextInputType.name,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.person,
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
                              hintText: 'LastName',
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
                            controller: email,
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
                                return "Please Enter The Phone";
                              }
                              return null;
                            },
                            controller: phone,
                            keyboardType: TextInputType.phone,
                            decoration: InputDecoration(
                              prefixIcon: Icon(
                                Icons.phone_android_rounded,
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
                              hintText: 'Phone',
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
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The  Password";
                              }
                              return null;
                            },
                            obscureText: visible1,
                            controller: _password,
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
                              hintText: 'Password',
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
                            keyboardType: TextInputType.text,
                            validator: (value) {
                              if (value!.isEmpty) {
                                return "Please Enter The Confirm Password ";
                              }
                              return null;
                            },
                            obscureText: visible,
                            controller: _confirmpassword,
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
                              hintText: 'Confirm Password',
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
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  GestureDetector(
                    onTap: () {
                      sinap();
                    },
                    child: Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        width: 75.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xfff7941d)),
                        child: Text(
                          "Register",
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
            ],
          ),
        ),
      ),
    );
  }

  sinap() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['firstName'] = firstname.text.trim().toString();
      data['lastName'] = lastname.text.trim().toString();
      data['email'] = email.text.trim().toString();
      data['phone'] = phone.text.trim().toString();
      data['password'] = _password.text.trim().toString();
      print(data);
      if (_password.text == _confirmpassword.text) {
        checkInternet().then((internet) async {
          if (internet) {
            authprovider().signupapi(data).then((response) async {
              signupmodal = SignupModal.fromJson(json.decode(response.body));
              if (response.statusCode == 200 &&
                  signupmodal?.status == "success") {
                firstname.clear();
                lastname.clear();
                email.clear();
                _password.clear();
                phone.clear();

                print('EE Thay Gyu Hooooo ! ^_^');
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => LoginPage2()));
                setState(() {
                  // isLoading = false;
                });
              } else {
                buildErrorDialog(context, 'Error', signupmodal?.message ?? "");
              }
            });
          } else {
            setState(() {});
            buildErrorDialog(context, 'Error', "Internet Required");
          }
        });
      } else {
        buildErrorDialog(
            context, 'Error', "Password And Confirmpassword does Not Match");
      }
    }
  }
}
