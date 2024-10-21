import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Modal/PrescriptionModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/PrescriptionForm2.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import '../Widget/const.dart';


class Prescriptionform extends StatefulWidget {
  const Prescriptionform({super.key});

  @override
  State<Prescriptionform> createState() => _PrescriptionformState();
}

class _PrescriptionformState extends State<Prescriptionform> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  TextEditingController _firstname = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _email = TextEditingController();
  TextEditingController _age = TextEditingController();
  TextEditingController _doctorfname= TextEditingController();
  TextEditingController _medicine = TextEditingController();

  String selected = 'please select';
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  String? deviceName;
  String? deviceOS;
  void removeImage() {
    setState(() {
      _pickedFile = null;  // Clear the selected file
    });
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewap();
    getDeviceInfoandStore();
  }
  @override
  Widget build(BuildContext context) {
    return  Form(
        key: _formKey,
        child:commanScreen(
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
                      height: 5.h,
                    ),
                    // app bar
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => HomePage(sel: 1),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 18.sp,
                            )),
                        Text(
                          "Upload Prescription",
                          style: TextStyle(
                            fontSize: 13.sp,
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
                    // Row(
                    //   mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    //   children: [
                    //     Text('1',style: TextStyle(
                    //       fontSize: 16.sp,
                    //       fontFamily: "task",
                    //       fontWeight: FontWeight.bold,
                    //     ),),
                    //     Container(
                    //       height: 0.7.h,
                    //       width: 18.w,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           color: AppColors.primary),
                    //     ),
                    //     Container(
                    //       height: 0.7.h,
                    //       width: 18.w,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           color: AppColors.primary),
                    //     ),
                    //     Container(
                    //       height: 0.7.h,
                    //       width: 18.w,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           color: Colors.grey),
                    //     ),
                    //     Container(
                    //       height: 0.7.h,
                    //       width: 18.w,
                    //       decoration: BoxDecoration(
                    //           borderRadius: BorderRadius.circular(50),
                    //           color: Colors.grey),
                    //     ),
                    //     Text('2',style: TextStyle(
                    //       fontSize: 16.sp,
                    //       fontFamily: "task",
                    //       fontWeight: FontWeight.bold,
                    //     ),),
                    //   ],
                    // ),

                    Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              // Container(
                              //   width: 85.w,
                              //   child: Column(
                              //     crossAxisAlignment:
                              //     CrossAxisAlignment.start,
                              //     children: [
                              //       Text(
                              //         "Patient Name",
                              //         style: TextStyle(
                              //             color: Colors.black87,
                              //             fontFamily: "task",
                              //             fontSize: 11.sp,
                              //             fontWeight: FontWeight.bold),
                              //       ),
                              //       SizedBox(height: 0.5.h,),
                              //       TextFormField(
                              //         validator: (value) {
                              //           if (value!.isEmpty) {
                              //             return "Please Enter Your Name";
                              //           }
                              //           return null;
                              //         },
                              //         keyboardType: TextInputType.text,
                              //         style: TextStyle(height: 1),
                              //         controller: _firstname,
                              //         decoration: InputDecoration(
                              //           enabledBorder: OutlineInputBorder(
                              //               borderRadius:
                              //               BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                   color: Colors.grey)),
                              //           disabledBorder: OutlineInputBorder(
                              //               borderRadius:
                              //               BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                   color: Colors.grey)),
                              //           focusedBorder: OutlineInputBorder(
                              //               borderRadius:
                              //               BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                   color: Colors.grey)),
                              //           border: OutlineInputBorder(
                              //               borderRadius:
                              //               BorderRadius.circular(10),
                              //               borderSide: BorderSide(
                              //                   color: Colors.grey)),
                              //           hintText: 'Enter Your  Name',
                              //           hintStyle: TextStyle(
                              //               color:
                              //               Colors.black.withOpacity(0.4),
                              //               fontSize: 11.sp,
                              //               fontFamily: "task"),
                              //         ),
                              //       ),
                              //     ],
                              //   ),
                              // ),
                            ],
                          ),
                          SizedBox(
                            height: 2.5.h,
                          ),
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Patient Last Name",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter The Last Name";
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.text,
                          //         controller: _lastname,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter Your Last Name ',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 2.5.h,
                          // ),
                          // email
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Patient Email",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         keyboardType: TextInputType.emailAddress,
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter Your Email";
                          //           }
                          //           else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                          //
                          //           {
                          //             return "Please Enter valid email address";
                          //           }
                          //           return null;
                          //         },
                          //         controller: _email,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter Your Email ',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),

                          // SizedBox(
                          //   height: 2.5.h,
                          // ),
                          // Address
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Patient Address",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter Your Address";
                          //           }
                          //         },
                          //         keyboardType: TextInputType.text,
                          //         controller: _Address,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter Your Address ',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 2.5.h,
                          // ),
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "State",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 12.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter Statte";
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.text,
                          //         controller: _state,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter State',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 2.5.h,),
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "City",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter City";
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.text,
                          //         controller: _city,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter City',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 2.5.h,),
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Zip Code(PostalCode)",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter The Zip Code";
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.number,
                          //         controller: _ZipCode,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter Zip Code',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 2.5.h,),
                          // Phone
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Patient Phone",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter Phone Number";
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.phone,
                          //         controller: _phone,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter Your Phone Number',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(
                          //   height: 2.5.h,
                          // ),
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Gender",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       Container(
                          //         height: 8.h,
                          //         width: 85.w,
                          //         child: DropdownButtonFormField(
                          //           borderRadius: BorderRadius.circular(30),
                          //           decoration: InputDecoration(
                          //             contentPadding: EdgeInsets.symmetric(
                          //                 vertical: 2.h, horizontal: 4.w),
                          //             border: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(10),
                          //                 ),
                          //                 borderSide: BorderSide(color: Colors.grey)),
                          //             disabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(10.0),
                          //                 ),
                          //                 borderSide: BorderSide(color: Colors.grey)),
                          //             enabledBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(10.0),
                          //                 ),
                          //                 borderSide: BorderSide(color: Colors.grey)),
                          //             focusedBorder: OutlineInputBorder(
                          //                 borderRadius: BorderRadius.all(
                          //                   Radius.circular(10.0),
                          //                 ),
                          //                 borderSide: BorderSide(color: Colors.grey)),
                          //             // filled: true,
                          //             hintStyle: TextStyle(
                          //               // color: Colors.grey[800]
                          //             ),
                          //           ),
                          //           value: selected,
                          //           onChanged: (val) {
                          //             setState(() {
                          //               selected = val!;
                          //             });
                          //           },
                          //           items: [
                          //             DropdownMenuItem<String>(
                          //               child: Text("Please Select"),
                          //               value: "please select",
                          //             ),
                          //             DropdownMenuItem<String>(
                          //               child: Text("Male"),
                          //               value: "male",
                          //             ),
                          //             DropdownMenuItem<String>(
                          //               child: Text("Female"),
                          //               value: "female",
                          //             )
                          //           ],
                          //           // Initialize this variable with the selected value.
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          // SizedBox(height: 2.5.h,),
                          Container(
                            width: 85.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Patient Age",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "task",
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h,),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Age";
                                    }
                                    return null;
                                  },
                                  keyboardType: TextInputType.number,
                                  controller: _age,
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
                                    hintText: 'Enter Age',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        fontSize: 11.sp,
                                        fontFamily: "task"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5.h,),
                         // Phone
                          Container(
                            width: 85.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Phone Number",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "task",
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h,),
                                TextFormField(
                                  validator: (value) {
                                    if (value!.isEmpty) {
                                      return "Please Enter Phone Number";
                                    }
                                    else if(value.length != 10){
                                      return "Please Enter valid Phone number";
                                    }
                                    return null;
                                  },
                                  onChanged: (value) {
                                    setState(() {
                                      _phone.text = value;
                                    });
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
                                    hintText: 'Enter Your Phone Number',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        fontSize: 11.sp,
                                        fontFamily: "task"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          // SizedBox(height: 2.5.h,),
                          // Container(
                          //   width: 85.w,
                          //   child: Column(
                          //     crossAxisAlignment: CrossAxisAlignment.start,
                          //     children: [
                          //       Text(
                          //         "Physician Name",
                          //         style: TextStyle(
                          //             color: Colors.black87,
                          //             fontFamily: "task",
                          //             fontSize: 11.sp,
                          //             fontWeight: FontWeight.bold),
                          //       ),
                          //       SizedBox(height: 0.5.h,),
                          //       TextFormField(
                          //         validator: (value) {
                          //           if (value!.isEmpty) {
                          //             return "Please Enter Name";
                          //           }
                          //           return null;
                          //         },
                          //         keyboardType: TextInputType.text,
                          //         controller: _doctorfname,
                          //         style: TextStyle(height: 1),
                          //         decoration: InputDecoration(
                          //           enabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           disabledBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           focusedBorder: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           border: OutlineInputBorder(
                          //               borderRadius:
                          //               BorderRadius.circular(10),
                          //               borderSide:
                          //               BorderSide(color: Colors.grey)),
                          //           hintText: 'Enter Physician First Name',
                          //           hintStyle: TextStyle(
                          //               color: Colors.black.withOpacity(0.4),
                          //               fontSize: 11.sp,
                          //               fontFamily: "task"),
                          //         ),
                          //       ),
                          //     ],
                          //   ),
                          // ),
                          SizedBox(height: 2.5.h,),
                          Container(
                            width: 85.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Prescribe Medicine(optional)",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "task",
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h,),
                                TextFormField(
                                  maxLines: 3,
                                  keyboardType: TextInputType.text,
                                  controller: _medicine,
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
                                    hintText: 'Enter Medicine Name',
                                    hintStyle: TextStyle(
                                        color: Colors.black.withOpacity(0.4),
                                        fontSize: 11.sp,
                                        fontFamily: "task"),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 2.5.h,),
                          Container(
                            width: 85.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Upload Photo Of Your Prescription",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "task",
                                      fontSize: 11.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 2.h,),
                                InkWell(
                                  onTap: () {
                                    selectfile();

                                  },
                                  child: Container(
                                    width: 85.w,
                                    height: 6.h,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        border: Border.all(
                                            style: BorderStyle.solid,
                                            color: AppColors.primary
                                        )
                                    ),
                                    child: Text("Upload Prescription",style: TextStyle(
                                        color: AppColors.primary,
                                        fontFamily: "task",
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold
                                    ),),
                                  ),
                                ),
                                SizedBox(height: 1.h,),
                                _pickedFile==null?SizedBox():Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Stack(
                                      children: [
                                        Container(
                                          width: 10.h,
                                          height: 10.h,
                                          child: _pickedFile==null?Container():Image.file(_pickedFile!,fit: BoxFit.cover,),
                                        ),
                                        Positioned(
                                          right: 0,
                                          child: InkWell(
                                            onTap: () {
                                              setState(() {
                                                removeImage();
                                              });
                                            },
                                              child: Container(
                                                height: 20,
                                                width: 20,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(3),
                                                  color: Colors.blue.shade200,
                                                ),
                                                child: Icon(
                                                    CupertinoIcons.delete,size: 12.sp,color: Colors.red,
                                                ),
                                              )
                                          ),
                                        )

                                      ],
                                    ),

                                  ],
                                )
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 1.h,
                          ),
                          GestureDetector(
                            onTap: () async{
                              if (_formKey.currentState!.validate()) {

                               if(_pickedFile == '' || _pickedFile== null){
                                 buildErrorDialog(
                                     context, '', "Please Upload Prescription");
                               }
                               else{
                                 await preformap();
                               }
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
                                      "Submit Prescription",
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
                  ]
              ),
            ),
          ),
        )
    );
  }
  selectfile() {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      alignment: Alignment.center,
      backgroundColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            _pickedFile = File(photo!.path);
                          });
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 15.sp,
                          color: Color(0xff0061b0),
                        )),
                    Text(
                      "Camera",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _pickedFile = File(photo!.path);
                          setState(() {
                            _pickedFile = File(photo!.path);
                          });
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.image,
                          size: 15.sp,
                          color: Color(0xff0061b0),
                        )),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
                // Column(
                //   children: [
                //     IconButton(
                //         onPressed: () async {
                //           // Pick a PDF file using FilePicker
                //           FilePickerResult? result = await FilePicker.platform
                //               .pickFiles(type: FileType.custom, allowedExtensions: ['pdf']);
                //           if (result != null) {
                //             setState(() {
                //               _pickedFile = File(result.files.single.path!);
                //             });
                //           }
                //           Navigator.of(context).pop();
                //         },
                //         icon: Icon(
                //           Icons.picture_as_pdf,
                //           size: 15.sp,
                //           color: Color(0xff0061b0),
                //         )),
                //     Text(
                //       "PDF",
                //       style: TextStyle(
                //           color: Colors.black,
                //           fontSize: 13.sp,
                //           fontFamily: "task",
                //           fontWeight: FontWeight.bold),
                //     ),
                //   ],
                // ),
              ],
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }

  preformap() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please Wait ...');
      final Map<String, String> data = {};
      data['UserId'] = usermodal?.userId == "" || usermodal?.userId == null
          ?deviceName.toString():usermodal?.userId ?? "";
      // data['Patientfname'] = _firstname.text.toString();
      // data['Patientemail'] = _email.text.toString();
      // data['Patientaddress'] = _Address.text.toString();
      //data['Zipcode'] = widget.ZipCode;
       data['phone'] = usermodal?.userId == "" || usermodal?.userId == null? _phone.text.toString()
           :profilemodal?.profileDetails?.userPhone??'';
      // data['Gender'] = selected ;
      data['Patientage'] = _age.text.toString();
      // data['Physiciansfname'] = _doctorfname.text.toString();
      data['Prescribedmedicine'] = _medicine.text.toString();
      data['image'] = _pickedFile == null ?'':_pickedFile?.path ?? '';
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().prescriptionformap(data).then((response) async {
            prescriptionformModel = PrescriptionformModel.fromJson(json.decode(response.body));
            print(prescriptionformModel?.status);
            if (response.statusCode == 200 && prescriptionformModel?.status == "success") {
              EasyLoading.showSuccess('Submit Successfully');
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(sel: 1),
              ));
              // setState(() {
              //   isLoading = true;
              // });

              // setState(() {
              //   isLoading = false;
              // });
            } else {
              EasyLoading.showError('Submit Failed');
              // setState(() {
              //   isLoading = false;
              // });
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
  Future<void> getDeviceInfoandStore() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceName =
            androidInfo.model; // Device name
        deviceOS = 'Android ${androidInfo.version.release}';
      });

    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceName = iosInfo.name; // Device name
        deviceOS = 'iOS ${iosInfo.systemVersion}';
      });
    }
    print('Device Name: $deviceName');
    print('Device OS: $deviceOS');
  }


  viewap() {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().ViewProfile(data).then((response) async {
          profilemodal = ProfileModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && profilemodal?.status == "success") {
            print("my name is back") ;
            print(profilemodal?.status);
            setState(() {
              // Assign values to controllers
              _phone.text = profilemodal?.profileDetails?.userPhone ?? "";
              _firstname.text = profilemodal?.profileDetails?.userFirstName ?? "";
              // Add more fields as needed
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
