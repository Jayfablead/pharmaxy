import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

import '../Modal/CityModal.dart';
import '../Modal/CountryModal.dart';
import '../Modal/EditShippingAdd.dart';
import '../Modal/ShippingAddModal.dart';
import '../Modal/StateModal.dart';
import '../Modal/UserSelectAddModal.dart';
import '../Provider/Authprovider.dart';
import '../Widget/Const.dart';
import '../Widget/buildErrorDialog.dart';
import '../Widget/loder.dart';
import 'AllAddpage.dart';

class editshippingadress extends StatefulWidget {
  String? addid;

  editshippingadress({super.key, this.addid});

  @override
  State<editshippingadress> createState() => _editshippingadressState();
}

class test {
  String title;
  String id;

  test(this.title, this.id);
}

class test1 {
  String title;
  String id;

  test1(this.title, this.id);
}

class test2 {
  String title;
  String id;

  test2(this.title, this.id);
}

bool isLoading = true;
bool back1 = true;
String? address = "";
test? selected;
test1? selected1;

test2? selected2;

class _editshippingadressState extends State<editshippingadress> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _ZipCode = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _cuontry = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  String? countryValue;

  String? stateValue;

  String? cityValue;

  List<test> items = [];
  List<test1> items1 = [];
  List<test2> items2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isLoading = true;
    });

    contryap();
    userselectaddap();
  }

  final GlobalKey<ScaffoldState> _scaffoldKeyshipedit =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
      key: _formKey,
      child: commanScreen(
        key: _scaffoldKeyshipedit,
        isLoading: isLoading,
        scaffold: Scaffold(
          backgroundColor: Colors.white,
          body: SingleChildScrollView(
            child: isLoading
                ? Container()
                : Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                        SizedBox(
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.of(context).pushReplacement(
                                      MaterialPageRoute(
                                          builder: (context) => AllAddpage()));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 18.sp,
                                )),
                            Text(
                              "Edit Address",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            IconButton(onPressed: () {}, icon: Icon(null)),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Container(
                                  width: 85.w,
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "First Name",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "task",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter The First Name";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        style: TextStyle(height: 1),
                                        controller: _firstname,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          hintText: 'Enter Your First Name',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 13.sp,
                                              fontFamily: "task"),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Last Name",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The Last Name";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _lastname,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your Last Name',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 13.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Email",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value == null || value.isEmpty) {
                                        return "Please enter the email";
                                      }
                                      // Regular expression for email validation
                                      final emailRegex = RegExp(
                                          r'^[\w-\.]+@([\w-]+\.)+[\w-]{2,4}$');
                                      if (!emailRegex.hasMatch(value)) {
                                        return "Please enter a valid email";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _email,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your Email',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 13.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Address",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The Address 1";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _Address,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your Address ',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 13.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Phone",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The Phone";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.phone,
                                    controller: _phone,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Phone number',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 13.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),

                            //            Container(
                            //   width: 85.w,
                            //   child: Column(
                            //     crossAxisAlignment: CrossAxisAlignment.start,
                            //     children: [
                            //       Text(
                            //         "Country",
                            //         style: TextStyle(
                            //           color: Colors.black87,
                            //           fontFamily: "task",
                            //           fontSize: 12.sp,
                            //           fontWeight: FontWeight.bold,
                            //         ),
                            //       ),
                            //       Container(
                            //         width: MediaQuery.of(context).size.width,
                            //         decoration: BoxDecoration(
                            //           border: Border.all(width: 1, color: Colors.grey),
                            //           borderRadius: BorderRadius.circular(10),
                            //         ),
                            //         padding: EdgeInsets.only(top: 0.5.h, bottom: 0.5.h, right: 5.w),
                            //         child: DropdownButtonHideUnderline(
                            //           child: DropdownButton2(
                            //             hint: Text(
                            //               'Select Country',
                            //               style: TextStyle(
                            //                 color: Colors.black.withOpacity(0.4),
                            //                 fontSize: 13.sp,
                            //                 fontFamily: "task",
                            //               ),
                            //             ),
                            //             value: countryValue,
                            //             onChanged: (newValue) {
                            //               setState(() {
                            //                 countryValue = newValue.toString();
                            //                 print(countryValue);
                            //                 stateap(countryValue ?? '');
                            //               });
                            //             },
                            //             items: countrymodal?.countries?.map((location) {
                            //               // Print each location's countryID to check for duplicates
                            //               print('Country ID: ${location.countryID}, Country Name: ${location.countryName}');
                            //               return DropdownMenuItem(
                            //                 child: Text(
                            //                   location.countryName ?? '',
                            //                   style: TextStyle(
                            //                     color: Colors.black87,
                            //                     fontFamily: 'task',
                            //                     fontSize: 14.sp,
                            //                   ),
                            //                 ),
                            //                 value: location.countryID,
                            //               );
                            //             }).toList(),
                            //           ),
                            //         ),
                            //       ),
                            //     ],
                            //   ),
                            // ),
                            //                 SizedBox(
                            //                   height: 2.5.h,
                            //                 ),
                            //                 Container(
                            //                   width: 85.w,
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text(
                            //                         "State",
                            //                         style: TextStyle(
                            //                             color: Colors.black87,
                            //                             fontFamily: "task",
                            //                             fontSize: 12.sp,
                            //                             fontWeight: FontWeight.bold),
                            //                       ),
                            //                       Container(
                            //                         width: MediaQuery.of(context).size.width,
                            //                         decoration: BoxDecoration(
                            //                           border: Border.all(
                            //                               width: 1, color: Colors.grey),
                            //                           borderRadius: BorderRadius.circular(10),
                            //                         ),
                            //                         padding: EdgeInsets.only(
                            //                             top: 0.5.h, bottom: 0.5.h, right: 5.w),
                            //                         child: DropdownButtonHideUnderline(
                            //                           child: DropdownButton2(
                            //                             hint: Text(
                            //                               'Select State',
                            //                               style: TextStyle(
                            //                                   color:
                            //                                       Colors.black.withOpacity(0.4),
                            //                                   fontSize: 13.sp,
                            //                                   fontFamily: "task"),
                            //                             ),
                            //                             // Not necessary for Option 1
                            //                             value: stateValue,
                            //                             onChanged: (newValue) {
                            //                               setState(() {
                            //                                 stateValue = newValue.toString();
                            //                                 print(stateValue);
                            //                                 cityap(stateValue ?? '');
                            //                               });
                            //                             },
                            //                             items:
                            //                                 statemodal?.states?.map((location) {
                            //                               return DropdownMenuItem(
                            //                                 child: Text(
                            //                                   location.stateName ?? '',
                            //                                   style: TextStyle(
                            //                                       color: Colors.black87,
                            //                                       fontFamily: 'task',
                            //                                       fontSize: 14.sp),
                            //                                 ),
                            //                                 value: location.stateID,
                            //                               );
                            //                             }).toList(),
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ),
                            //                 SizedBox(
                            //                   height: 2.5.h,
                            //                 ),
                            //                 Container(
                            //                   width: 85.w,
                            //                   child: Column(
                            //                     crossAxisAlignment: CrossAxisAlignment.start,
                            //                     children: [
                            //                       Text(
                            //                         "City",
                            //                         style: TextStyle(
                            //                             color: Colors.black87,
                            //                             fontFamily: "task",
                            //                             fontSize: 12.sp,
                            //                             fontWeight: FontWeight.bold),
                            //                       ),
                            //                       Container(
                            //                         width: MediaQuery.of(context).size.width,
                            //                         decoration: BoxDecoration(
                            //                           border: Border.all(
                            //                               width: 1, color: Colors.grey),
                            //                           borderRadius: BorderRadius.circular(10),
                            //                         ),
                            //                         padding: EdgeInsets.only(
                            //                             top: 0.5.h, bottom: 0.5.h, right: 5.w),
                            //                         child: DropdownButtonHideUnderline(
                            //                           child: DropdownButton2(
                            //                             hint: Text(
                            //                               'Select City',
                            //                               style: TextStyle(
                            //                                   color:
                            //                                       Colors.black.withOpacity(0.4),
                            //                                   fontSize: 13.sp,
                            //                                   fontFamily: "task"),
                            //                             ),
                            //                             // Not necessary for Option 1
                            //                             value: cityValue,
                            //                             onChanged: (newValue) {
                            //                               setState(() {
                            //                                 cityValue = newValue.toString();
                            //                                 print(cityValue);
                            //                               });
                            //                             },
                            //                             items:
                            //                                 citymodal?.cities?.map((location) {
                            //                               return DropdownMenuItem(
                            //                                 child: Text(
                            //                                   location.cityName ?? '',
                            //                                   style: TextStyle(
                            //                                       color: Colors.black87,
                            //                                       fontFamily: 'task',
                            //                                       fontSize: 12.sp),
                            //                                 ),
                            //                                 value: location.cityID,
                            //                               );
                            //                             }).toList(),
                            //                           ),
                            //                         ),
                            //                       ),
                            //                     ],
                            //                   ),
                            //                 ),

                            SizedBox(
                              height: 2.5.h,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "State",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The State";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _state,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your State',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 11.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 2.5.h,
                            ),
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "City",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 11.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The city";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.text,
                                    controller: _city,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your City',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 11.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 2.5.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              width: 85.w,
                              child: Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    "Zip Code(PostalCode)",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  TextFormField(
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter The Zip Code";
                                      }
                                      return null;
                                    },
                                    keyboardType: TextInputType.number,
                                    controller: _ZipCode,
                                    style: TextStyle(height: 1),
                                    decoration: InputDecoration(
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Zip code',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.4),
                                          fontSize: 13.sp,
                                          fontFamily: "task"),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 5.h,
                        ),
                        GestureDetector(
                          onTap: () {
                            if (_formKey.currentState!.validate()) {
                              editshippingap();
                            }
                          },
                          child: Row(
                            children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(right: 7.w, left: 7.w),
                                  alignment: Alignment.center,
                                  height: 6.h,
                                  width: 85.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Color(0xff0061b0)),
                                  child: Text(
                                    "Save Address",
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "task"),
                                  )),
                            ],
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                      ]),
          ),
        ),
      ),
    );
  }

  shippingap() async {
    if (_formKey.currentState?.validate() ?? false) {
      final Map<String, String> data = {};
      data['userId'] = (usermodal?.userId).toString();
      data['first_name'] = _firstname.text.toString();
      data['last_name'] = _lastname.text.toString();
      data['city'] = selected2?.title ?? "";
      data['state'] = selected1?.title ?? "";
      data['email'] = _email.text.toString();
      data['country'] = selected?.title ?? "";
      data['zipcode'] = _ZipCode.text.toString();
      data['address'] = _Address.text.toString();
      data['phone'] = _phone.text.toString();
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().shippingaddapi(data).then((response) async {
            shippingaddmodal =
                ShippingAddModal.fromJson(json.decode(response.body));
            print(shippingaddmodal?.status);
            if (response.statusCode == 200 &&
                shippingaddmodal?.status == "success") {
              update(context, 'Profile', 'Address Save Successfully',
                  callback: () {
                Navigator.of(context).pushReplacement(
                    MaterialPageRoute(builder: (context) => AllAddpage()));
              });
              print('EE Thay Gyu Hooooo ! ^_^');
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

  editshippingap() async {
    EasyLoading.show(status: 'Please Wait');
    if (_formKey.currentState?.validate() ?? false) {
      final Map<String, String> data = {};
      data['first_name'] = _firstname.text.toString();
      data['last_name'] = _lastname.text.toString();
      data['city'] = _city.text.toString();
      data['email'] = _email.text.toString();
      data['state'] = _state.text.toString();
      data['country'] = "india";
      data['zipcode'] = _ZipCode.text.toString();
      data['address'] = _Address.text.toString();
      data['phone'] = _phone.text.toString();
      data['shipping_address_id'] = widget.addid.toString();
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().editshippingapi(data).then((response) async {
            editshippingadd =
                EditShippingAdd.fromJson(json.decode(response.body));
            print(editshippingadd?.status);
            if (response.statusCode == 200 &&
                editshippingadd?.status == "success") {
              EasyLoading.dismiss();
              update(context, '', 'Address Updated Successfully', callback: () {
                Navigator.pop(context);
                setState(() {
                  back1 = true;
                });
                back1
                    ? Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => AllAddpage()))
                    : null;
              });
              print('EE Thay Gyu Hooooo ! ^_^');

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

  userselectaddap() async {
    final Map<String, String> data = {};
    data['shipping_address_id'] = widget.addid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userselectapi(data).then((response) async {
          userselectaddmodal =
              UserSelectAddModal.fromJson(json.decode(response.body));
          print(userselectaddmodal?.status);
          if (response.statusCode == 200 &&
              userselectaddmodal?.status == "success") {
            contryap();
            stateap(countryValue ?? '');
            cityap(stateValue ?? '');
            setState(() {
              _firstname.text =
                  userselectaddmodal?.selectShippingAddress?.firstName ?? "";
              _lastname.text =
                  userselectaddmodal?.selectShippingAddress?.lastName ?? "";

              _email.text =
                  userselectaddmodal?.selectShippingAddress?.email ?? "";
              _Address.text =
                  userselectaddmodal?.selectShippingAddress?.address ?? "";
              _phone.text =
                  userselectaddmodal?.selectShippingAddress?.number ?? "";
              _ZipCode.text =
                  userselectaddmodal?.selectShippingAddress?.zipcode ?? "";
              _city.text =
                  userselectaddmodal?.selectShippingAddress?.city ?? "";
              _state.text =
                  userselectaddmodal?.selectShippingAddress?.state ?? "";
              isLoading = false;
              print('coutntry ${countryValue}');
              print(' state ${stateValue}');
              print('city ${cityValue}');
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

  contryap() async {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().contryapi().then((response) async {
          countrymodal = CountryModal.fromJson(json.decode(response.body));
          print(countrymodal?.status);
          if (response.statusCode == 200 && countrymodal?.status == "success") {
            print("test");
            print('country : ${countrymodal?.countries?.length}');

            setState(() {
              stateap(countryValue ?? '');
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

  stateap(String conId) async {
    final Map<String, String> data = {};
    data['countryID'] = conId;
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().stateapi(data).then((response) async {
          statemodal = StateModal.fromJson(json.decode(response.body));

          if (response.statusCode == 200 && statemodal?.status == "success") {
            setState(() {
              cityap(stateValue ?? '');
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

  cityap(String sId) async {
    final Map<String, String> data = {};
    data['stateID'] = sId;
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().cityapi(data).then((response) async {
          citymodal = CityModal.fromJson(json.decode(response.body));
          print(citymodal?.status);
          if (response.statusCode == 200 && citymodal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
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
