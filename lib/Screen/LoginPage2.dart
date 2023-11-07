import 'dart:convert';

import 'package:ecommerce/Modal/AddCartModal.dart';
import 'package:ecommerce/Modal/UserModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/ForgotPassword.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/SignupPage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/sharedpreferance.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';

import '../Databasehandler.dart';
import '../Modal/Cartmodal.dart';
import '../Provider/cartProvider.dart';

class LoginPage2 extends StatefulWidget {
  const LoginPage2({super.key});

  @override
  State<LoginPage2> createState() => _LoginPage2State();
}

TextEditingController _password = TextEditingController();
TextEditingController _email = TextEditingController();

bool secure = false;
bool visible = false;
bool visible1 = false;
final _formKey = GlobalKey<FormState>();
List<CartItem> carti = [];
DatabaseHelper databaseHelper = DatabaseHelper();

class _LoginPage2State extends State<LoginPage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    visible = true;
  }

  @override
  Widget build(BuildContext context) {
    final cart = Provider.of<CartProvider>(context);

    return Form(
      key: _formKey,
      child: Scaffold(
        body: SingleChildScrollView(
            child: FutureBuilder(
          future: cart.getdata(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Stack(
                children: [
                  Column(
                    children: [
                      Container(
                        alignment: Alignment.bottomRight,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.only(
                              bottomLeft: Radius.circular(100)),
                          color: Color(0xfff7941d),
                        ),
                        height: 37.h,
                        width: double.infinity,
                        child: Padding(
                          padding: EdgeInsets.only(right: 9.w, bottom: 2.h),
                          child: Text(
                            "Login",
                            style: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'task',
                                fontSize: 30.sp,
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
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
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
                                keyboardType: TextInputType.emailAddress,
                                validator: (value) {
                                  if (value!.isEmpty) {
                                    return "Please Enter The Password";
                                  }
                                  return null;
                                },
                                obscureText: visible,
                                controller: _password,
                                decoration: InputDecoration(
                                  prefixIcon: Icon(
                                    Icons.lock,
                                    color: Colors.black.withOpacity(0.6),
                                  ),
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
                                  enabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  disabledBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
                                  border: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(25),
                                      borderSide:
                                          BorderSide(color: Colors.grey)),
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
                      Padding(
                        padding: EdgeInsets.only(right: 22),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => ForgotPassword()));
                              },
                              child: Text(
                                "Forgot Password?",
                                style: TextStyle(
                                    color: Color(0xfff7941d),
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "task",
                                    fontSize: 15.sp),
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
                          loginap();
                          setState(() {
                            carti = snapshot.data!;
                          });
                        },
                        child: Container(
                            alignment: Alignment.center,
                            height: 6.h,
                            width: 75.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(30),
                                color: Color(0xfff7941d)),
                            child: Text(
                              "Login",
                              style: TextStyle(
                                  fontSize: 23.5.sp,
                                  color: Colors.white,
                                  fontFamily: "task"),
                            )),
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            "Don't have an account?",
                            style: TextStyle(
                                fontSize: 13.sp,
                                fontFamily: 'task',
                                fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          GestureDetector(
                            onTap: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => SignupPage(),
                                  ));
                            },
                            child: Text(
                              "Create",
                              style: TextStyle(
                                fontSize: 14.sp,
                                fontFamily: 'task',
                                fontWeight: FontWeight.bold,
                                color: Color(0xfff7941d),
                              ),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 6.h,
                      ),
                      GestureDetector(
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => HomePage(
                                    sel: 0,
                                  )));
                        },
                        child: Padding(
                          padding: EdgeInsets.only(right: 8.w),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                  alignment: Alignment.center,
                                  height: 4.h,
                                  width: 30.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xfff7941d)),
                                  child: Text(
                                    "Skip..",
                                    style: TextStyle(
                                        fontSize: 15.sp,
                                        color: Colors.white,
                                        fontFamily: "task"),
                                  )),
                            ],
                          ),
                        ),
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
              );
            }
            return Text('helloo');
          },
        )),
      ),
    );
  }

  loginap() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['email'] = _email.text.trim().toString();
      data['password'] = _password.text.trim().toString();
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().loginapi(data).then((response) async {
            print(response.body);
            usermodal = UserModal.fromJson(json.decode(response.body));
            print(usermodal?.status);
            if (response.statusCode == 200 && usermodal?.status == "success") {
              _email.clear();
              _password.clear();
              print(carti.length);
              if (carti.length != 0) {
                print('batli Bhareli');
                for (int index = 0; index <= carti.length; index++) {
                  addcartap(index);
                }
              } else {
                print('batli Khali');
              }

              print('EE Thay Gyu Hooooo ! ^_^');
              Navigator.of(context).pushReplacement(MaterialPageRoute(
                  builder: (context) => HomePage(
                        sel: 0,
                      )));
              SaveDataLocal.saveLogInData(usermodal!);
              setState(() {});
            } else {
              buildErrorDialog(context, 'Error', "Email Or Password Is Wrong");
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  addcartap(int ind) async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['productID'] = (carti[ind].productId).toString();
    data['variation_tbl_id'] = (carti[ind].VariationTblId).toString();
    data['product_color'] = (carti[ind].Color).toString();
    data['product_size'] = (carti[ind].Size).toString();
    data['product_price'] = (carti[ind].initialPrice).toString();
    data['product_quantity'] = (carti[ind].productQuantity).toString();
    print('Add to Cart');
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addcartapi(data).then((response) async {
          addcartmodal = AddCartModal.fromJson(json.decode(response.body));
          print(addcartmodal?.status);
          if (response.statusCode == 200 && addcartmodal?.status == "success") {
            print('batli added ! ^_^');
            databaseHelper.delete(
              int.parse(carti[ind].id.toString()),
            );
            print('itemdeleted');
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
