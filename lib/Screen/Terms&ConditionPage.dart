import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class TermCondition extends StatefulWidget {
  @override
  State<TermCondition> createState() => _TermConditionState();
}

class _TermConditionState extends State<TermCondition> {
  bool isLoading = false;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
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
                            "Term & Condition",
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
                        height: 2.h,
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 5.w),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "This document (“Terms”) is an "
                              "electronic record in terms of Information Technology Act,"
                              " 2000 and rules thereunder, as"
                              " applicable and the amended"
                              " provisions pertaining to electronic"
                              " records in various statutes"
                              ", as amended from time to time by"
                              " the Information Technology Act, 2000."
                              " This electronic record is generated"
                              " by a computer system and does"
                              " not require any physical or digital signatures.",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "task",
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "1. GENERAL",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "task",
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "The Company reserves the right to"
                              " change or modify these Terms or"
                              " any policy or guideline of the"
                              " Website including the Privacy Policy"
                              ", at any time and in its sole"
                              " discretion. Any changes or"
                              " modifications will be effective"
                              " immediately upon posting the"
                              " revisions on the Website and You"
                              " waive any right You may have to"
                              " receive specific notice of such"
                              " changes or modifications,"
                              " provided however that, We will"
                              " inform You of such "
                              "changes within such timelines as may"
                              " be specified under the applicable laws."
                              " Your continued use of the Website will"
                              " confirm Your acceptance of such changes"
                              " or modifications; therefore, You should"
                              " frequently review these Terms and applicable"
                              " policies to understand the terms and conditions"
                              " that apply to Your use of the app.",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "task",
                              ),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "2. PRODUCTS AND SERVICES",
                              style: TextStyle(
                                  fontSize: 14.sp,
                                  fontFamily: "task",
                                  decoration: TextDecoration.underline),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Text(
                              "The App is a platform that"
                              "facilitates, as an intermediary,"
                              "the online requisition by the User for"
                              "purchase of medicines and wellness / health"
                              "related products and services offered by Company's"
                              " various registered third-party/ies "
                              "(third parties shall for the purpose of this Terms,"
                              " include without limitation, third party retail pharmacies,"
                              " third-party labs et al) . The sale & purchase / transaction"
                              " between the registered third parties and You,"
                              " of Products and Services, facilitated by the"
                              " requisition placed by You on the Website shall"
                              " be governed by these Terms. Company is not and"
                              " cannot be a party to or save as except as may be"
                              " provided in these Terms, control in any manner,"
                              " any transaction between You and the third parties.",
                              style: TextStyle(
                                fontSize: 12.sp,
                                fontFamily: "task",
                              ),
                            )
                          ],
                        ),
                      )
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

                      // Column(
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     children: [
                      //       SizedBox(
                      //         height: 1.h,
                      //       ),
                      //       Row(
                      //         mainAxisAlignment: MainAxisAlignment.center,
                      //         children: [
                      //           // Container(
                      //           //   width: 85.w,
                      //           //   child: Column(
                      //           //     crossAxisAlignment:
                      //           //     CrossAxisAlignment.start,
                      //           //     children: [
                      //           //       Text(
                      //           //         "Patient Name",
                      //           //         style: TextStyle(
                      //           //             color: Colors.black87,
                      //           //             fontFamily: "task",
                      //           //             fontSize: 11.sp,
                      //           //             fontWeight: FontWeight.bold),
                      //           //       ),
                      //           //       SizedBox(height: 0.5.h,),
                      //           //       TextFormField(
                      //           //         validator: (value) {
                      //           //           if (value!.isEmpty) {
                      //           //             return "Please Enter Your Name";
                      //           //           }
                      //           //           return null;
                      //           //         },
                      //           //         keyboardType: TextInputType.text,
                      //           //         style: TextStyle(height: 1),
                      //           //         controller: _firstname,
                      //           //         decoration: InputDecoration(
                      //           //           enabledBorder: OutlineInputBorder(
                      //           //               borderRadius:
                      //           //               BorderRadius.circular(10),
                      //           //               borderSide: BorderSide(
                      //           //                   color: Colors.grey)),
                      //           //           disabledBorder: OutlineInputBorder(
                      //           //               borderRadius:
                      //           //               BorderRadius.circular(10),
                      //           //               borderSide: BorderSide(
                      //           //                   color: Colors.grey)),
                      //           //           focusedBorder: OutlineInputBorder(
                      //           //               borderRadius:
                      //           //               BorderRadius.circular(10),
                      //           //               borderSide: BorderSide(
                      //           //                   color: Colors.grey)),
                      //           //           border: OutlineInputBorder(
                      //           //               borderRadius:
                      //           //               BorderRadius.circular(10),
                      //           //               borderSide: BorderSide(
                      //           //                   color: Colors.grey)),
                      //           //           hintText: 'Enter Your  Name',
                      //           //           hintStyle: TextStyle(
                      //           //               color:
                      //           //               Colors.black.withOpacity(0.4),
                      //           //               fontSize: 11.sp,
                      //           //               fontFamily: "task"),
                      //           //         ),
                      //           //       ),
                      //           //     ],
                      //           //   ),
                      //           // ),
                      //         ],
                      //       ),
                      //       SizedBox(
                      //         height: 2.5.h,
                      //       ),
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Patient Last Name",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 12.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter The Last Name";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         keyboardType: TextInputType.text,
                      //       //         controller: _lastname,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter Your Last Name ',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(
                      //       //   height: 2.5.h,
                      //       // ),
                      //       // email
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Patient Email",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         keyboardType: TextInputType.emailAddress,
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter Your Email";
                      //       //           }
                      //       //           else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
                      //       //
                      //       //           {
                      //       //             return "Please Enter valid email address";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         controller: _email,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter Your Email ',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //
                      //       // SizedBox(
                      //       //   height: 2.5.h,
                      //       // ),
                      //       // Address
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Patient Address",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter Your Address";
                      //       //           }
                      //       //         },
                      //       //         keyboardType: TextInputType.text,
                      //       //         controller: _Address,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter Your Address ',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(
                      //       //   height: 2.5.h,
                      //       // ),
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "State",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 12.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter Statte";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         keyboardType: TextInputType.text,
                      //       //         controller: _state,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter State',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(height: 2.5.h,),
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "City",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter City";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         keyboardType: TextInputType.text,
                      //       //         controller: _city,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter City',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(height: 2.5.h,),
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Zip Code(PostalCode)",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter The Zip Code";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         keyboardType: TextInputType.number,
                      //       //         controller: _ZipCode,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter Zip Code',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(height: 2.5.h,),
                      //       // Phone
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Patient Phone",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter Phone Number";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         keyboardType: TextInputType.phone,
                      //       //         controller: _phone,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter Your Phone Number',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(
                      //       //   height: 2.5.h,
                      //       // ),
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Gender",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       Container(
                      //       //         height: 8.h,
                      //       //         width: 85.w,
                      //       //         child: DropdownButtonFormField(
                      //       //           borderRadius: BorderRadius.circular(30),
                      //       //           decoration: InputDecoration(
                      //       //             contentPadding: EdgeInsets.symmetric(
                      //       //                 vertical: 2.h, horizontal: 4.w),
                      //       //             border: OutlineInputBorder(
                      //       //                 borderRadius: BorderRadius.all(
                      //       //                   Radius.circular(10),
                      //       //                 ),
                      //       //                 borderSide: BorderSide(color: Colors.grey)),
                      //       //             disabledBorder: OutlineInputBorder(
                      //       //                 borderRadius: BorderRadius.all(
                      //       //                   Radius.circular(10.0),
                      //       //                 ),
                      //       //                 borderSide: BorderSide(color: Colors.grey)),
                      //       //             enabledBorder: OutlineInputBorder(
                      //       //                 borderRadius: BorderRadius.all(
                      //       //                   Radius.circular(10.0),
                      //       //                 ),
                      //       //                 borderSide: BorderSide(color: Colors.grey)),
                      //       //             focusedBorder: OutlineInputBorder(
                      //       //                 borderRadius: BorderRadius.all(
                      //       //                   Radius.circular(10.0),
                      //       //                 ),
                      //       //                 borderSide: BorderSide(color: Colors.grey)),
                      //       //             // filled: true,
                      //       //             hintStyle: TextStyle(
                      //       //               // color: Colors.grey[800]
                      //       //             ),
                      //       //           ),
                      //       //           value: selected,
                      //       //           onChanged: (val) {
                      //       //             setState(() {
                      //       //               selected = val!;
                      //       //             });
                      //       //           },
                      //       //           items: [
                      //       //             DropdownMenuItem<String>(
                      //       //               child: Text("Please Select"),
                      //       //               value: "please select",
                      //       //             ),
                      //       //             DropdownMenuItem<String>(
                      //       //               child: Text("Male"),
                      //       //               value: "male",
                      //       //             ),
                      //       //             DropdownMenuItem<String>(
                      //       //               child: Text("Female"),
                      //       //               value: "female",
                      //       //             )
                      //       //           ],
                      //       //           // Initialize this variable with the selected value.
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       // SizedBox(height: 2.5.h,),
                      //       Container(
                      //         width: 85.w,
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Patient Age",
                      //               style: TextStyle(
                      //                   color: Colors.black87,
                      //                   fontFamily: "task",
                      //                   fontSize: 11.sp,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             SizedBox(height: 0.5.h,),
                      //             TextFormField(
                      //               validator: (value) {
                      //                 if (value!.isEmpty) {
                      //                   return "Please Enter Age";
                      //                 }
                      //                 return null;
                      //               },
                      //               keyboardType: TextInputType.number,
                      //               controller: _age,
                      //               style: TextStyle(height: 1),
                      //               decoration: InputDecoration(
                      //                 enabledBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 disabledBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 focusedBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 border: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 hintText: 'Enter Age',
                      //                 hintStyle: TextStyle(
                      //                     color: Colors.black.withOpacity(0.4),
                      //                     fontSize: 11.sp,
                      //                     fontFamily: "task"),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       // SizedBox(height: 2.5.h,),
                      //       // Container(
                      //       //   width: 85.w,
                      //       //   child: Column(
                      //       //     crossAxisAlignment: CrossAxisAlignment.start,
                      //       //     children: [
                      //       //       Text(
                      //       //         "Physician Name",
                      //       //         style: TextStyle(
                      //       //             color: Colors.black87,
                      //       //             fontFamily: "task",
                      //       //             fontSize: 11.sp,
                      //       //             fontWeight: FontWeight.bold),
                      //       //       ),
                      //       //       SizedBox(height: 0.5.h,),
                      //       //       TextFormField(
                      //       //         validator: (value) {
                      //       //           if (value!.isEmpty) {
                      //       //             return "Please Enter Name";
                      //       //           }
                      //       //           return null;
                      //       //         },
                      //       //         keyboardType: TextInputType.text,
                      //       //         controller: _doctorfname,
                      //       //         style: TextStyle(height: 1),
                      //       //         decoration: InputDecoration(
                      //       //           enabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           disabledBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           focusedBorder: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           border: OutlineInputBorder(
                      //       //               borderRadius:
                      //       //               BorderRadius.circular(10),
                      //       //               borderSide:
                      //       //               BorderSide(color: Colors.grey)),
                      //       //           hintText: 'Enter Physician First Name',
                      //       //           hintStyle: TextStyle(
                      //       //               color: Colors.black.withOpacity(0.4),
                      //       //               fontSize: 11.sp,
                      //       //               fontFamily: "task"),
                      //       //         ),
                      //       //       ),
                      //       //     ],
                      //       //   ),
                      //       // ),
                      //       SizedBox(height: 2.5.h,),
                      //       Container(
                      //         width: 85.w,
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Prescribe Medicine(optional)",
                      //               style: TextStyle(
                      //                   color: Colors.black87,
                      //                   fontFamily: "task",
                      //                   fontSize: 11.sp,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             SizedBox(height: 0.5.h,),
                      //             TextFormField(
                      //               maxLines: 3,
                      //               keyboardType: TextInputType.text,
                      //               controller: _medicine,
                      //               style: TextStyle(height: 1),
                      //               decoration: InputDecoration(
                      //                 enabledBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 disabledBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 focusedBorder: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 border: OutlineInputBorder(
                      //                     borderRadius:
                      //                     BorderRadius.circular(10),
                      //                     borderSide:
                      //                     BorderSide(color: Colors.grey)),
                      //                 hintText: 'Enter Medicine Name',
                      //                 hintStyle: TextStyle(
                      //                     color: Colors.black.withOpacity(0.4),
                      //                     fontSize: 11.sp,
                      //                     fontFamily: "task"),
                      //               ),
                      //             ),
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(height: 2.5.h,),
                      //       Container(
                      //         width: 85.w,
                      //         child: Column(
                      //           crossAxisAlignment: CrossAxisAlignment.start,
                      //           children: [
                      //             Text(
                      //               "Upload Photo Of Your Prescription",
                      //               style: TextStyle(
                      //                   color: Colors.black87,
                      //                   fontFamily: "task",
                      //                   fontSize: 11.sp,
                      //                   fontWeight: FontWeight.bold),
                      //             ),
                      //             SizedBox(height: 2.h,),
                      //             InkWell(
                      //               onTap: () {
                      //                 selectfile();
                      //               },
                      //               child: Container(
                      //                 width: 85.w,
                      //                 height: 6.h,
                      //                 alignment: Alignment.center,
                      //                 decoration: BoxDecoration(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                     border: Border.all(
                      //                         style: BorderStyle.solid,
                      //                         color: AppColors.primary
                      //                     )
                      //                 ),
                      //                 child: Text("Upload Prescription",style: TextStyle(
                      //                     color: AppColors.primary,
                      //                     fontFamily: "task",
                      //                     fontSize: 13.sp,
                      //                     fontWeight: FontWeight.bold
                      //                 ),),
                      //               ),
                      //             ),
                      //             SizedBox(height: 1.h,),
                      //             Column(
                      //               crossAxisAlignment: CrossAxisAlignment.start,
                      //               children: [
                      //                 Container(
                      //                   width: 8.h,
                      //                   height: 8.h,
                      //                   child: _pickedFile==null?Container():Image.file(_pickedFile!,fit: BoxFit.cover,),
                      //                 )
                      //               ],
                      //             )
                      //
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 1.h,
                      //       ),
                      //       GestureDetector(
                      //         onTap: () async{
                      //           if (_formKey.currentState!.validate()) {
                      //             await preformap();
                      //             Navigator.of(context).push(
                      //                 MaterialPageRoute(builder: (context) => HomePage(sel: 1,),)
                      //             );
                      //           }
                      //         },
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //                 margin:
                      //                 EdgeInsets.only(right: 7.w, left: 7.w),
                      //                 alignment: Alignment.center,
                      //                 height: 6.h,
                      //                 width: 85.w,
                      //                 decoration: BoxDecoration(
                      //                     borderRadius: BorderRadius.circular(10),
                      //                     color: Color(0xff0061b0)),
                      //                 child: Text(
                      //                   "Submit Prescription",
                      //                   style: TextStyle(
                      //                       fontSize: 13.sp,
                      //                       color: Colors.white,
                      //                       fontWeight: FontWeight.bold,
                      //                       fontFamily: "task"),
                      //                 )),
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         height: 2.h,
                      //       ),
                      //     ]),
                    ]),
        ),
      ),
    );
  }
}
