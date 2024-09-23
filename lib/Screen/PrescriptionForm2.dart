import 'dart:io';

import 'package:ecommerce/Screen/PrescriptionForm.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

class Prescriptionform2 extends StatefulWidget {
  const Prescriptionform2({super.key});

  @override
  State<Prescriptionform2> createState() => _Prescriptionform2State();
}

class _Prescriptionform2State extends State<Prescriptionform2> {
  TextEditingController _age = TextEditingController();
  TextEditingController _doctorfname= TextEditingController();
  TextEditingController _doctorlname = TextEditingController();
  TextEditingController _phoneno = TextEditingController();
  TextEditingController _medicine = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String selected = 'please select';
  ImagePicker _picker = ImagePicker();
  File? _pickedFile = null;
  @override
  Widget build(BuildContext context) {
    return  Form(
        key: _formKey,
        child: commanScreen(
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
                                    builder: (context) => Prescriptionform(),
                                  ));
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 18.sp,
                            )),
                        Text(
                          "Prescription Form",
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
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Text('1',style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold,
                        ),),
                        Container(
                          height: 0.7.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey),
                        ),
                        Container(
                          height: 0.7.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: Colors.grey),
                        ),
                        Container(
                          height: 0.7.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.primary),
                        ),
                        Container(
                          height: 0.7.h,
                          width: 18.w,
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(50),
                              color: AppColors.primary),
                        ),
                        Text('2',style: TextStyle(
                          fontSize: 16.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold,
                        ),),
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
                          Container(
                            width: 85.w,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  "Gender",
                                  style: TextStyle(
                                      color: Colors.black87,
                                      fontFamily: "task",
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold),
                                ),
                                SizedBox(height: 0.5.h,),
                                Container(
                                  height: 8.h,
                                  width: 85.w,
                                  child: DropdownButtonFormField(
                                    borderRadius: BorderRadius.circular(30),
                                    decoration: InputDecoration(
                                      contentPadding: EdgeInsets.symmetric(
                                          vertical: 1.h, horizontal: 3.w),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10),
                                          ),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.all(
                                            Radius.circular(10.0),
                                          ),
                                          borderSide: BorderSide(color: Colors.grey)),
                                      // filled: true,
                                      hintStyle: TextStyle(
                                        // color: Colors.grey[800]
                                      ),
                                    ),
                                    value: selected,
                                    onChanged: (val) {
                                      setState(() {
                                        selected = val!;
                                      });
                                    },
                                    items: [
                                      DropdownMenuItem<String>(
                                        child: Text("Please Select"),
                                        value: "please select",
                                      ),
                                      DropdownMenuItem<String>(
                                        child: Text("Male"),
                                        value: "male",
                                      ),
                                      DropdownMenuItem<String>(
                                        child: Text("Female"),
                                        value: "female",
                                      )
                                    ],
                                    // Initialize this variable with the selected value.
                                  ),
                                ),
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
                                            fontSize: 13.sp,
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
                                Container(
                                  width: 85.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Physician First Name",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "task",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Name";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: _doctorfname,
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
                                          hintText: 'Enter Physician First Name',
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
                                        "Physician Last Name",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "task",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Name";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: _doctorlname,
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
                                          hintText: 'Enter Physician Last Name',
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
                                        "Phycian Phone Number",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "task",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      TextFormField(
                                        keyboardType: TextInputType.phone,
                                        controller: _phoneno,
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
                                SizedBox(height: 2.5.h,),
                                Container(
                                  width: 85.w,
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Prescribe Medicine",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "task",
                                            fontSize: 13.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(height: 0.5.h,),
                                      TextFormField(
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
                                            fontSize: 13.sp,
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
                                      SizedBox(height: 2.h,),
                                      Column(
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Container(
                                            width: 8.h,
                                            height: 8.h,
                                            child: _pickedFile==null?Container():Image.file(_pickedFile!,fit: BoxFit.cover,),
                                          )
                                        ],
                                      )

                                    ],
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
                              if (_formKey.currentState!.validate()) {
                                // countryValue == null &&
                                //     cityValue == null &&
                                //     stateValue == null
                                //     ? buildErrorDialog(context, 'Field Error',
                                //     'Country, State & City Required')
                                //     : cityValue == null && stateValue == null
                                //     ? buildErrorDialog(context, 'Field Error',
                                //     'State & City Required')
                                //     : cityValue == null
                                //     ? buildErrorDialog(context,
                                //     'Field Error', 'City Required')
                                //     : shippingap();
                                // print(selected?.title);
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
                                        borderRadius: BorderRadius.circular(30),
                                        color: Color(0xff0061b0)),
                                    child: Text(
                                      "Submit Form",
                                      style: TextStyle(
                                          fontSize: 14.sp,
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
                          Icons.browse_gallery,
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
}
