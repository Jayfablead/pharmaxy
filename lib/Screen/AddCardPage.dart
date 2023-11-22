import 'dart:io' show Platform;

import 'package:ecommerce/Screen/CheckoutDetail.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:sizer/sizer.dart';

import '../Widget/buildErrorDialog.dart';
import '../Widget/const.dart';

class AddCardPage extends StatefulWidget {
  String? address;
  String? firstname;
  String? lastname;
  String? addid;

  AddCardPage({
    super.key,
    this.addid,
    this.address,
    this.firstname,
    this.lastname,
  });

  @override
  State<AddCardPage> createState() => _AddCardPageState();
}

TextEditingController _name = TextEditingController();
TextEditingController _num = TextEditingController();
TextEditingController _ed = TextEditingController();
TextEditingController _ey = TextEditingController();
TextEditingController _cvv = TextEditingController();
bool isLoading = false;
String? name;

String? selmonth;
GlobalKey<FormState> _formKey = GlobalKey<FormState>();

class _AddCardPageState extends State<AddCardPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print('Add Id : ${widget.addid}');
    print('Add name : ${widget.firstname}');
    print('Add name2 : ${widget.lastname}');
    print('Address : ${widget.address}');

    _name.clear();
    _ey.clear();
    _cvv.clear();
    _num.clear();
    _ed.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: bgcolor,
      // appBar: appbar1(
      //     title1: 'Add Card',
      //     press: () {
      //       Get.back();
      //     },
      //     icn: Icon(Icons.arrow_back_ios_new_outlined),
      //     act: () {},
      //     icn1: Icon(null)),
      body: SingleChildScrollView(
        child: isLoading
            ? Container()
            : Column(
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => CheckoutDetail(
                                    addid: widget.addid,
                                    address: widget.address,
                                    lastname: widget.lastname,
                                    firstname: widget.firstname,
                                  ),
                                ),
                              );
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 25.sp,
                            )),
                        Text(
                          "Add Card",
                          style: TextStyle(
                            fontSize: 20.sp,
                            fontFamily: "task",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        IconButton(
                          onPressed: () {},
                          icon: Icon(null),
                        ),
                      ],
                    ),
                  ),
                  Center(
                    child: Container(
                      height: 15.h,
                      width: 95.w,
                      child: Image.asset('assets/stp.png'),
                    ),
                  ),
                  Platform.isAndroid
                      ? SizedBox(
                          height: 5.h,
                        )
                      : SizedBox(
                          height: 0.h,
                        ),
                  Container(
                    padding: EdgeInsets.all(5.w),
                    width: 90.w,
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(20.0),
                        border: Border.all(color: Colors.grey)),
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            height: 7.5.h,
                            alignment: Alignment.center,
                            child: TextFormField(
                              inputFormatters: [
                                FilteringTextInputFormatter.digitsOnly,
                                LengthLimitingTextInputFormatter(19),
                              ],
                              onChanged: (value) {
                                setState(() {
                                  value = _num.text;
                                });
                              },
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'task',
                                  letterSpacing: 2,
                                  fontSize: 13.sp),
                              controller: _num,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Card Number";
                                } else if (value.length != 16) {
                                  return 'You Can Only Enter 16 Digits';
                                }

                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 1.5.h),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.numbers,
                                    color: Colors.black,
                                  ),
                                  hintText: "Card Number",
                                  errorStyle: TextStyle(
                                      fontFamily: 'task',
                                      letterSpacing: 1,
                                      fontSize: 13.sp),
                                  hintStyle: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'task',
                                      letterSpacing: 2,
                                      fontSize: 13.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            height: 7.5.h,
                            alignment: Alignment.center,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  value = _name.text;
                                });
                              },
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'task',
                                  letterSpacing: 2,
                                  fontSize: 13.sp),
                              controller: _name,
                              keyboardType: TextInputType.emailAddress,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Name on Card ";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 1.5.h),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.person_outline_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: "Name On Card",
                                  errorStyle: TextStyle(
                                      fontFamily: 'task',
                                      letterSpacing: 1,
                                      fontSize: 13.sp),
                                  hintStyle: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'task',
                                      letterSpacing: 2,
                                      fontSize: 13.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Container(
                            padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.grey,
                                ),
                                borderRadius: BorderRadius.circular(20)),
                            height: 7.5.h,
                            alignment: Alignment.center,
                            child: TextFormField(
                              onChanged: (value) {
                                setState(() {
                                  value = _cvv.text;
                                });
                              },
                              style: TextStyle(
                                  color: Colors.black,
                                  fontFamily: 'task',
                                  letterSpacing: 2,
                                  fontSize: 13.sp),
                              controller: _cvv,
                              keyboardType: TextInputType.number,
                              validator: (value) {
                                if (value!.isEmpty) {
                                  return "Please enter the Card CVV";
                                }
                                return null;
                              },
                              decoration: InputDecoration(
                                  contentPadding: EdgeInsets.only(top: 1.5.h),
                                  errorBorder: const UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  enabledBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  focusedBorder: UnderlineInputBorder(
                                    borderSide:
                                        BorderSide(color: Colors.transparent),
                                  ),
                                  suffixIcon: Icon(
                                    Icons.privacy_tip_outlined,
                                    color: Colors.black,
                                  ),
                                  hintText: "CVV",
                                  errorStyle: TextStyle(
                                      fontFamily: 'task',
                                      letterSpacing: 1,
                                      fontSize: 13.sp),
                                  hintStyle: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: 'task',
                                      letterSpacing: 2,
                                      fontSize: 13.sp)),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Row(
                            children: [
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.5.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 7.5.h,
                                width: 37.w,
                                alignment: Alignment.center,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      value = _ed.text;
                                    });
                                  },
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'task',
                                      letterSpacing: 2,
                                      fontSize: 13.sp),
                                  controller: _ed,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter the password";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 1.5.h),
                                      errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.date_range_outlined,
                                        color: Colors.black,
                                      ),
                                      hintText: "MM",
                                      errorStyle: TextStyle(
                                          fontFamily: 'task',
                                          letterSpacing: 1,
                                          fontSize: 13.sp),
                                      hintStyle: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          fontSize: 13.sp)),
                                ),
                              ),
                              SizedBox(
                                width: 4.w,
                              ),
                              Container(
                                padding:
                                    EdgeInsets.symmetric(horizontal: 2.5.w),
                                decoration: BoxDecoration(
                                    border: Border.all(
                                      color: Colors.grey,
                                    ),
                                    borderRadius: BorderRadius.circular(20)),
                                height: 7.5.h,
                                width: 37.w,
                                alignment: Alignment.center,
                                child: TextFormField(
                                  onChanged: (value) {
                                    setState(() {
                                      value = _ey.text;
                                    });
                                  },
                                  style: TextStyle(
                                      color: Colors.black,
                                      fontFamily: 'task',
                                      letterSpacing: 2,
                                      fontSize: 13.sp),
                                  controller: _ey,
                                  keyboardType: TextInputType.number,
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please enter the confirm password";
                                    }
                                    return null;
                                  },
                                  decoration: InputDecoration(
                                      contentPadding:
                                          EdgeInsets.only(top: 1.5.h),
                                      errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      focusedBorder: UnderlineInputBorder(
                                        borderSide: BorderSide(
                                            color: Colors.transparent),
                                      ),
                                      suffixIcon: Icon(
                                        Icons.calendar_month,
                                        color: Colors.black,
                                      ),
                                      hintText: "YYYY",
                                      errorStyle: TextStyle(
                                          fontFamily: 'task',
                                          letterSpacing: 1,
                                          fontSize: 13.sp),
                                      hintStyle: TextStyle(
                                          color: Colors.black87,
                                          fontFamily: 'task',
                                          letterSpacing: 2,
                                          fontSize: 13.sp)),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 5.h,
                          ),
                          GestureDetector(
                            onTap: () {
                              print("clicked on Add Card");
                              if (_formKey.currentState!.validate()) {
                                int.parse(_ed.text) <= 12
                                    ? Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => CheckoutDetail(
                                            addid: widget.addid,
                                            address: widget.address,
                                            lastname: widget.lastname,
                                            firstname: widget.firstname,
                                            cn: _num.text,
                                            cvv: _cvv.text,
                                            em: _ed.text,
                                            ey: _ey.text,
                                            name: _name.text,
                                          ),
                                        ),
                                      )
                                    : buildErrorDialog(context, 'Month Error',
                                        'Please Use Valid Month');
                              }
                            },
                            child: Container(
                              alignment: Alignment.center,
                              height: 6.5.h,
                              width: 70.w,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(900),
                                  color: Color(0xfff7941d)),
                              child: Text('Add Card',
                                  style: TextStyle(
                                      color: Colors.white,
                                      fontFamily: 'task',
                                      letterSpacing: 2,
                                      fontWeight: FontWeight.bold,
                                      fontSize: 13.sp)),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 5.h,
                  )
                ],
              ),
      ),
    );
  }
}
