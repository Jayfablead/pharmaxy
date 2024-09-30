//
// import 'package:ecommerce/Screen/HomePage.dart';
// import 'package:ecommerce/Widget/Const.dart';
// import 'package:ecommerce/Widget/loder.dart';
// import 'package:flutter/material.dart';
// import 'package:sizer/sizer.dart';
//
// class Request_Medicine extends StatefulWidget {
//   const Request_Medicine({super.key});
//
//   @override
//   State<Request_Medicine> createState() => _Request_MedicineState();
// }
//
//
//
//
// class _Request_MedicineState extends State<Request_Medicine> {
//   final _formKey = GlobalKey<FormState>();
//   bool isLoading = false;
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        extendBody: true,
//       body:  Form(
//           key: _formKey,
//           child: commanScreen(
//             isLoading: isLoading,
//             scaffold: Scaffold(
//               backgroundColor: Colors.white,
//               body: SingleChildScrollView(
//                 child: isLoading
//                     ? Container()
//                     : Column(
//                     mainAxisAlignment: MainAxisAlignment.center,
//                     crossAxisAlignment: CrossAxisAlignment.center,
//                     children: [
//                       SizedBox(
//                         height: 5.h,
//                       ),
//                       // app bar
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                         children: [
//                           IconButton(
//                               onPressed: () {
//                                 Navigator.pushReplacement(
//                                     context,
//                                     MaterialPageRoute(
//                                       builder: (context) => HomePage(sel: 1),
//                                     ));
//                               },
//                               icon: Icon(
//                                 Icons.arrow_back_ios_new_outlined,
//                                 size: 18.sp,
//                               )),
//                           Text(
//                             "Prescription Form",
//                             style: TextStyle(
//                               fontSize: 13.sp,
//                               fontFamily: "task",
//                               fontWeight: FontWeight.bold,
//                             ),
//                           ),
//                           IconButton(onPressed: () {}, icon: Icon(null)),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 2.h,
//                       ),
//                       Row(
//                         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                         children: [
//                           Text('1',style: TextStyle(
//                             fontSize: 16.sp,
//                             fontFamily: "task",
//                             fontWeight: FontWeight.bold,
//                           ),),
//                           Container(
//                             height: 0.7.h,
//                             width: 18.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: AppColors.primary),
//                           ),
//                           Container(
//                             height: 0.7.h,
//                             width: 18.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: AppColors.primary),
//                           ),
//                           Container(
//                             height: 0.7.h,
//                             width: 18.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: Colors.grey),
//                           ),
//                           Container(
//                             height: 0.7.h,
//                             width: 18.w,
//                             decoration: BoxDecoration(
//                                 borderRadius: BorderRadius.circular(50),
//                                 color: Colors.grey),
//                           ),
//                           Text('2',style: TextStyle(
//                             fontSize: 16.sp,
//                             fontFamily: "task",
//                             fontWeight: FontWeight.bold,
//                           ),),
//                         ],
//                       ),
//                       SizedBox(
//                         height: 0.h,
//                       ),
//                       Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           crossAxisAlignment: CrossAxisAlignment.center,
//                           children: [
//                             SizedBox(
//                               height: 2.5.h,
//                             ),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.center,
//                               children: [
//                                 Container(
//                                   width: 85.w,
//                                   child: Column(
//                                     crossAxisAlignment:
//                                     CrossAxisAlignment.start,
//                                     children: [
//                                       Text(
//                                         "Name",
//                                         style: TextStyle(
//                                             color: Colors.black87,
//                                             fontFamily: "task",
//                                             fontSize: 12.sp,
//                                             fontWeight: FontWeight.bold),
//                                       ),
//                                       SizedBox(height: 0.5.h,),
//                                       TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Enter The First Name";
//                                           }
//                                           return null;
//                                         },
//                                         keyboardType: TextInputType.text,
//                                         style: TextStyle(height: 1),
//                                         controller: _firstname,
//                                         decoration: InputDecoration(
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(10),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           disabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(10),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(10),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                               BorderRadius.circular(10),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           hintText: 'Enter Your First Name',
//                                           hintStyle: TextStyle(
//                                               color:
//                                               Colors.black.withOpacity(0.4),
//                                               fontSize: 11.sp,
//                                               fontFamily: "task"),
//                                         ),
//                                       ),
//                                     ],
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(
//                               height: 2.5.h,
//                             ),
//
//                             Container(
//                               width: 85.w,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Patient Email",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontFamily: "task",
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(height: 0.5.h,),
//                                   TextFormField(
//                                     keyboardType: TextInputType.emailAddress,
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Please Enter Your Email";
//                                       }
//                                       else if(!RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+").hasMatch(value))
//
//                                       {
//                                         return "Please Enter valid email address";
//                                       }
//                                       return null;
//                                       return null;
//                                     },
//                                     controller: _email,
//                                     style: TextStyle(height: 1),
//                                     decoration: InputDecoration(
//                                       enabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       disabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       hintText: 'Enter Your Email ',
//                                       hintStyle: TextStyle(
//                                           color: Colors.black.withOpacity(0.4),
//                                           fontSize: 11.sp,
//                                           fontFamily: "task"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//
//                             SizedBox(
//                               height: 2.5.h,
//                             ),
//                             Container(
//                               width: 85.w,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Patient Address",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontFamily: "task",
//                                         fontSize: 12.sp,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(height: 0.5.h,),
//                                   TextFormField(
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Please Enter The Address";
//                                       }
//                                     },
//                                     keyboardType: TextInputType.text,
//                                     controller: _Address,
//                                     style: TextStyle(height: 1),
//                                     decoration: InputDecoration(
//                                       enabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       disabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       hintText: 'Enter Your Address ',
//                                       hintStyle: TextStyle(
//                                           color: Colors.black.withOpacity(0.4),
//                                           fontSize: 11.sp,
//                                           fontFamily: "task"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 2.5.h,
//                             ),
//                             Container(
//                               width: 85.w,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Zip Code(PostalCode)",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontFamily: "task",
//                                         fontSize: 11.sp,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(height: 0.5.h,),
//                                   TextFormField(
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Please Enter The Zip Code";
//                                       }
//                                       return null;
//                                     },
//                                     keyboardType: TextInputType.number,
//                                     controller: _ZipCode,
//                                     style: TextStyle(height: 1),
//                                     decoration: InputDecoration(
//                                       enabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       disabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       hintText: 'Enter Zip Code',
//                                       hintStyle: TextStyle(
//                                           color: Colors.black.withOpacity(0.4),
//                                           fontSize: 11.sp,
//                                           fontFamily: "task"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(height: 2.5.h,),
//                             Container(
//                               width: 85.w,
//                               child: Column(
//                                 crossAxisAlignment: CrossAxisAlignment.start,
//                                 children: [
//                                   Text(
//                                     "Patient Phone",
//                                     style: TextStyle(
//                                         color: Colors.black87,
//                                         fontFamily: "task",
//                                         fontSize: 11.sp,
//                                         fontWeight: FontWeight.bold),
//                                   ),
//                                   SizedBox(height: 0.5.h,),
//                                   TextFormField(
//                                     validator: (value) {
//                                       if (value!.isEmpty) {
//                                         return "Please Enter The Phone";
//                                       }
//                                       return null;
//                                     },
//                                     keyboardType: TextInputType.phone,
//                                     controller: _phone,
//                                     style: TextStyle(height: 1),
//                                     decoration: InputDecoration(
//                                       enabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       disabledBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       focusedBorder: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       border: OutlineInputBorder(
//                                           borderRadius:
//                                           BorderRadius.circular(10),
//                                           borderSide:
//                                           BorderSide(color: Colors.grey)),
//                                       hintText: 'Enter Your Phone Number',
//                                       hintStyle: TextStyle(
//                                           color: Colors.black.withOpacity(0.4),
//                                           fontSize: 11.sp,
//                                           fontFamily: "task"),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 2.5.h,
//                             ),
//
//                             SizedBox(
//                               height: 5.h,
//                             ),
//                             GestureDetector(
//                               onTap: () {
//
//                               },
//                               child: Row(
//                                 children: [
//                                   Container(
//                                       margin:
//                                       EdgeInsets.only(right: 7.w, left: 7.w),
//                                       alignment: Alignment.center,
//                                       height: 6.h,
//                                       width: 85.w,
//                                       decoration: BoxDecoration(
//                                           borderRadius: BorderRadius.circular(10),
//                                           color: Color(0xff0061b0)),
//                                       child: Text(
//                                         "Next",
//                                         style: TextStyle(
//                                             fontSize: 13.sp,
//                                             color: Colors.white,
//                                             fontWeight: FontWeight.bold,
//                                             fontFamily: "task"),
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             SizedBox(
//                               height: 2.h,
//                             ),
//                           ]),
//                     ]
//                 ),
//               ),
//             ),
//           )
//       ));
//
//
//   }
// }
