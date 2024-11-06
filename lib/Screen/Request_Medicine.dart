import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RequestMedicineModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

class Request_Medicine extends StatefulWidget {
  const Request_Medicine({super.key});

  @override
  State<Request_Medicine> createState() => _Request_MedicineState();
}

class _Request_MedicineState extends State<Request_Medicine> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _phone = TextEditingController();
  TextEditingController _medicine = TextEditingController();
  TextEditingController _quantity = TextEditingController();

  // void _removeMedicine(int index) {
  //   setState(() {
  //     medicines.removeAt(index);
  //   });
  // }
  void _removeMedicineField(int index) {
    setState(() {
      medicines.removeAt(index);
      _medicineControllers[index].dispose();
      _quantityControllers[index].dispose();
      _medicineControllers.removeAt(index);
      _quantityControllers.removeAt(index);
    });
  }

  void _addMedicineField() {
    setState(() {
      medicines.add({});
      _medicineControllers.add(TextEditingController());
      _quantityControllers.add(TextEditingController());
    });
  }

  List<Map<String, String>> medicines = [];
  List<TextEditingController> _medicineControllers = [];
  List<TextEditingController> _quantityControllers = [];
  bool addbutton = true;
  bool Setbutton = true;
  String? deviceName;
  String? deviceOS;

  Widget _buildAddButton() {
    return GestureDetector(
        onTap: () {
          _addMedicineField();
          print("_medicineControllers${_medicineControllers}");
          // if (_medicine.text.isNotEmpty && _quantity.text.isNotEmpty) {
          //   setState(() {
          //     medicines.add({
          //       "name": _medicine.text,
          //       "quantity": _quantity.text,
          //     });
          //     _medicine.clear();
          //     _quantity.clear();
          //   });
          // }
        },
        child: Padding(
          padding: Setbutton
              ? EdgeInsets.only(top: 3.h)
              : EdgeInsets.only(bottom: 0.h),
          child: Container(
            //margin: EdgeInsets.only(top: 2.5.h),
            alignment: Alignment.center,
            height: 7.h,
            width: 16.w,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
              color: Color(0xff0061b0),
            ),
            child: Icon(
              Icons.add,
              color: Colors.white,
            ),
          ),
        ));
  }

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewap();
    getDeviceInfoandStore();
  }

  Widget _buildAddedMedicinesList() {
    return Column(
      children: List.generate(medicines.length, (index) {
        return Padding(
          padding: EdgeInsets.only(left: 3.5.h, top: 2.5.h),
          child: Row(
            children: [
              Container(
                width: 47.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "Medicine name",
                    //   style: TextStyle(
                    //       color: Colors.black87,
                    //       fontFamily: "task",
                    //       fontSize: 11.sp,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 0.5.h,),
                    TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Please Enter Medicine";
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.text,
                      controller: _medicineControllers[index],
                      style: TextStyle(height: 1),
                      decoration: InputDecoration(
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
                        hintText: 'Medicine Name',
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
                width: 2.w,
              ),
              Container(
                width: 19.w,
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    // Text(
                    //   "quantity",
                    //   style: TextStyle(
                    //       color: Colors.black87,
                    //       fontFamily: "task",
                    //       fontSize: 11.sp,
                    //       fontWeight: FontWeight.bold),
                    // ),
                    // SizedBox(height: 0.5.h,),
                    TextFormField(
                      // validator: (value) {
                      //   if (value!.isEmpty) {
                      //     return "Enter Number of Quantity";
                      //   }
                      //   return null;
                      // },
                      keyboardType: TextInputType.number,
                      controller: _quantityControllers[index],
                      style: TextStyle(height: 1),
                      decoration: InputDecoration(
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
                        hintText: 'Quantity',
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
                width: 1.5.w,
              ),
              GestureDetector(
                onTap: () {
                  _removeMedicineField(0);
                },
                child: Padding(
                  padding: addbutton
                      ? EdgeInsets.only(top: 0.h)
                      : EdgeInsets.only(bottom: 3.h),
                  child: Container(
                    // margin: EdgeInsets.only(top: 1.h),
                    alignment: Alignment.center,
                    height: 7.h,
                    width: 16.w,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Color(0xff0061b0),
                    ),
                    child: Icon(
                      Icons.remove_circle_outline,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
        );
      }),
    );
  }

  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  final GlobalKey<ScaffoldState> _scaffoldKeymedicine =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        extendBody: true,
        body: Form(
            key: _formKey,
            child: commanScreen(
              key: _scaffoldKeymedicine,
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
                                height: 3.h,
                              ),
                              // app bar
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        Navigator.pop(context);
                                      },
                                      icon: Icon(
                                        Icons.arrow_back_ios_new_outlined,
                                        size: 18.sp,
                                      )),
                                  Text(
                                    "Request Medicine",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: "task",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                      onPressed: () {}, icon: Icon(null)),
                                ],
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Container(
                                width: 87.w,
                                height: 23.h,
                                decoration: BoxDecoration(
                                  image: DecorationImage(
                                      image: AssetImage(
                                        "assets/requestmedicine.jpg",
                                      ),
                                      fit: BoxFit.cover),
                                  borderRadius: BorderRadius.circular(15.0),
                                ),
                              ),
                              SizedBox(
                                height: 2.h,
                              ),
                              Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    SizedBox(
                                      height: 2.5.h,
                                    ),
                                    Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          width: 85.w,
                                          child: Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                "Name",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontFamily: "task",
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                              SizedBox(
                                                height: 0.5.h,
                                              ),
                                              TextFormField(
                                                validator: (value) {
                                                  if (value!.isEmpty) {
                                                    return "Please Enter Your Name";
                                                  }
                                                  return null;
                                                },
                                                onChanged: (value) {
                                                  setState(() {
                                                    _firstname.text = value;
                                                  });
                                                },
                                                keyboardType:
                                                    TextInputType.text,
                                                style: TextStyle(height: 1),
                                                controller: _firstname,
                                                decoration: InputDecoration(
                                                  enabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey)),
                                                  disabledBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey)),
                                                  focusedBorder:
                                                      OutlineInputBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          borderSide:
                                                              BorderSide(
                                                                  color: Colors
                                                                      .grey)),
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                      borderSide: BorderSide(
                                                          color: Colors.grey)),
                                                  hintText: 'Enter Your  Name',
                                                  hintStyle: TextStyle(
                                                      color: Colors.black
                                                          .withOpacity(0.4),
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
                                    Container(
                                      width: 85.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          Text(
                                            "Mobile Number",
                                            style: TextStyle(
                                                color: Colors.black87,
                                                fontFamily: "task",
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(
                                            height: 0.5.h,
                                          ),
                                          TextFormField(
                                            validator: (value) {
                                              if (value!.isEmpty) {
                                                return "Please Enter The Phone";
                                              } else if (value.length != 10) {
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
                                                  borderSide: BorderSide(
                                                      color: Colors.grey)),
                                              disabledBorder:
                                                  OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10),
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
                                              hintText:
                                                  'Enter Your Phone Number',
                                              hintStyle: TextStyle(
                                                  color: Colors.black
                                                      .withOpacity(0.4),
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
                                    Padding(
                                      padding: EdgeInsets.only(left: 3.5.h),
                                      child: Row(
                                        children: [
                                          Container(
                                            width: 47.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Medicine name",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontFamily: "task",
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.bold),
                                                ),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Please Enter Medicine";
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.text,
                                                  controller: _medicine,
                                                  style: TextStyle(height: 1),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                    hintText: 'Medicine Name',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        fontSize: 11.sp,
                                                        fontFamily: "task"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 2.w,
                                          ),
                                          Container(
                                            width: 19.w,
                                            child: Column(
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Text(
                                                  "Quantity",
                                                  style: TextStyle(
                                                      color: Colors.black87,
                                                      fontSize: 11.sp,
                                                      fontWeight:
                                                          FontWeight.w500),
                                                ),
                                                SizedBox(
                                                  height: 0.5.h,
                                                ),
                                                TextFormField(
                                                  validator: (value) {
                                                    if (value!.isEmpty) {
                                                      return "Enter Number of Quantity";
                                                    }
                                                    return null;
                                                  },
                                                  keyboardType:
                                                      TextInputType.number,
                                                  controller: _quantity,
                                                  style: TextStyle(height: 1),
                                                  decoration: InputDecoration(
                                                    enabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                    disabledBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                    focusedBorder:
                                                        OutlineInputBorder(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        10),
                                                            borderSide:
                                                                BorderSide(
                                                                    color: Colors
                                                                        .grey)),
                                                    border: OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                    hintText: 'Qty',
                                                    hintStyle: TextStyle(
                                                        color: Colors.black
                                                            .withOpacity(0.4),
                                                        fontSize: 11.sp,
                                                        fontFamily: "task"),
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                          SizedBox(
                                            width: 1.5.w,
                                          ),
                                          _buildAddButton(),
                                        ],
                                      ),
                                    ),
                                    _buildAddedMedicinesList(),
                                    SizedBox(
                                      height: 3.h,
                                    ),
                                    // SUBMIT
                                    GestureDetector(
                                      onTap: () async {
                                        setState(() {
                                          Setbutton = false;
                                        });
                                        if (_formKey.currentState!.validate()) {
                                          setState(() {
                                            Setbutton = true;
                                          });
                                          await Requestmediformap();

                                          print(medicines);
                                        }
                                      },
                                      child: Row(
                                        children: [
                                          Container(
                                              margin: EdgeInsets.only(
                                                  right: 7.w, left: 7.w),
                                              alignment: Alignment.center,
                                              height: 6.h,
                                              width: 85.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Color(0xff0061b0)),
                                              child: Text(
                                                "Request Medicine",
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
                            ]),
                ),
              ),
            )));
  }

  // Widget _buildAddedMedicinesList() {
  //   return Column(
  //     children: medicines.map((medicine) {
  //       return Padding(
  //         padding:  EdgeInsets.only(left: 4.h,top: 2.5.h),
  //         child: Row(
  //           children: [
  //             Container(
  //               width: 47.w,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   // Text(
  //                   //   "Medicine name",
  //                   //   style: TextStyle(
  //                   //       color: Colors.black87,
  //                   //       fontFamily: "task",
  //                   //       fontSize: 11.sp,
  //                   //       fontWeight: FontWeight.bold),
  //                   // ),
  //                   // SizedBox(height: 0.5.h,),
  //                   TextFormField(
  //                     validator: (value) {
  //                       if (value!.isEmpty) {
  //                         return "Please Enter Medicine";
  //                       }
  //                       return null;
  //                     },
  //                     keyboardType: TextInputType.text,
  //                     controller: _medicine,
  //                     style: TextStyle(height: 1),
  //                     decoration: InputDecoration(
  //                       enabledBorder: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       disabledBorder: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       focusedBorder: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       border: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       hintText: 'Medicine Name',
  //                       hintStyle: TextStyle(
  //                           color: Colors.black.withOpacity(0.4),
  //                           fontSize: 11.sp,
  //                           fontFamily: "task"),
  //                     ),
  //                   ),
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: 3.w,
  //             ),
  //             Container(
  //               width: 25.w,
  //               child: Column(
  //                 crossAxisAlignment: CrossAxisAlignment.start,
  //                 children: [
  //                   // Text(
  //                   //   "quantity",
  //                   //   style: TextStyle(
  //                   //       color: Colors.black87,
  //                   //       fontFamily: "task",
  //                   //       fontSize: 11.sp,
  //                   //       fontWeight: FontWeight.bold),
  //                   // ),
  //                  // SizedBox(height: 0.5.h,),
  //                   TextFormField(
  //                     validator: (value) {
  //                       if (value!.isEmpty) {
  //                         return "Enter Number of Quantity";
  //                       }
  //                       return null;
  //                     },
  //                     keyboardType: TextInputType.number,
  //                     controller: _quantity,
  //                     style: TextStyle(height: 1),
  //                     decoration: InputDecoration(
  //                       enabledBorder: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       disabledBorder: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       focusedBorder: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       border: OutlineInputBorder(
  //                           borderRadius:
  //                           BorderRadius.circular(10),
  //                           borderSide:
  //                           BorderSide(color: Colors.grey)),
  //                       hintText: 'Quantity',
  //                       hintStyle: TextStyle(
  //                           color: Colors.black.withOpacity(0.4),
  //                           fontSize: 11.sp,
  //                           fontFamily: "task"),
  //                     ),
  //                   ),
  //
  //                 ],
  //               ),
  //             ),
  //             SizedBox(
  //               width: 2.w,
  //             ),
  //             GestureDetector(
  //               onTap: () {
  //                 _removeMedicine(0);
  //               },
  //               child: Container(
  //                 margin: EdgeInsets.only(top: 1.h),
  //                 alignment: Alignment.center,
  //                 height: 4.h,
  //                 width: 8.w,
  //                 decoration: BoxDecoration(
  //                   borderRadius: BorderRadius.circular(5),
  //                   color: Color(0xff0061b0),
  //                 ),
  //                 child: Icon(
  //                   Icons.remove_circle_outline,color: Colors.red,
  //                 ),
  //               ),
  //             ),
  //
  //           ],
  //         ),
  //       );
  //
  //       // return ListTile(
  //       //   title: Text('${medicine['name']} - ${medicine['quantity']}'),
  //       // );
  //     }).toList(),
  //   );
  // }
  Requestmediformap() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please Wait ...');
      Setbutton = true;
      final List<String> allMedicines = [
        _medicine.text.toString(),
        ..._medicineControllers.map((controller) => controller.text.toString())
      ];
      final List<String> allQuantities = [
        _quantity.text.toString(),
        ..._quantityControllers.map((controller) => controller.text.toString())
      ];
      final Map<String, dynamic> data = {
        "user_id": usermodal?.userId == "" || usermodal?.userId == null
            ? deviceName.toString()
            : usermodal?.userId ?? "",
        "name": usermodal?.userId == "" || usermodal?.userId == null
            ? _firstname.text.toString()
            : profilemodal?.profileDetails?.userFirstName,
        "mobile_number": usermodal?.userId == "" || usermodal?.userId == null
            ? _phone.text.toString()
            : profilemodal?.profileDetails?.userPhone,
      };
      // Construct the medicines list as a list of maps
      List<Map<String, dynamic>> medicinesList = [];
      for (int i = 0; i < allMedicines.length; i++) {
        medicinesList.add({
          "medicine_name": allMedicines[i],
          "quantity": allQuantities[i],
        });
      }
      // Store the medicines list directly in the data map
      data['medicines'] = medicinesList; // No need to convert to JSON string

      print('form $data');
      checkInternet().then((internet) async {
        if (internet) {
          Map<String, String> headers = {
            "Content-Type": "application/json", // Set Content-Type to JSON
          };
          try {
            // Convert the entire data map to a JSON string
            String jsonBody = jsonEncode(data);

            // Sending JSON-encoded data in the request
            final response =
                await authprovider().requestmediformap(jsonBody, headers);

            requestMedicineModel =
                RequestMedicineModel.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                requestMedicineModel?.status == "success") {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(sel: 1),
              ));
              setState(() {
                Setbutton = true;
                isLoading = true;
              });
              await EasyLoading.showSuccess('Submit Successfully');
              setState(() {
                isLoading = false;
              });
            } else {
              print("requestModel${requestMedicineModel?.message ?? ""}");
              await EasyLoading.showError('Submit Failed');
              setState(() {
                isLoading = false;
              });
            }
          } catch (e) {
            print('error :$e');
            await EasyLoading.showError('API call failed: $e');
            setState(() {
              isLoading = false;
            });
          }
        } else {
          setState(() {
            isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
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
            print(profilemodal?.status);
            setState(() {
              // Assign values to controllers
              _phone.text = profilemodal?.profileDetails?.userPhone ?? "";
              _firstname.text =
                  profilemodal?.profileDetails?.userFirstName ?? "";
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

  Future<void> getDeviceInfoandStore() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceName = androidInfo.model; // Device name
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
}
