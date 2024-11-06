import 'dart:convert';
import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:intl/intl.dart';
import 'package:sizer/sizer.dart';

import '../Modal/RequestformModel.dart';

class Requestdoctorform2 extends StatefulWidget {
  String firstname = "";
  String lastname = "";
  String email = "";
  String address = "";
  String phone = "";

  Requestdoctorform2(
      {required this.firstname,
      required this.lastname,
      required this.email,
      required this.address,
      required this.phone});

  @override
  State<Requestdoctorform2> createState() => _Requestdoctorform2State();
}

class _Requestdoctorform2State extends State<Requestdoctorform2> {
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  String? deviceName;
  String? deviceOS;
  TextEditingController _selectdoctor = TextEditingController();
  TextEditingController _ZipCode = TextEditingController();
  TextEditingController _city = TextEditingController();
  TextEditingController _state = TextEditingController();
  TextEditingController _date = TextEditingController();
  String selected = 'please select';

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    getDeviceInfoandStore();
  }

  final GlobalKey<ScaffoldState> _scaffoldKeyreuqest =
      GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Form(
        key: _formKey,
        child: commanScreen(
          key: _scaffoldKeyreuqest,
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
                                    Navigator.pop(context);
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_new_outlined,
                                    size: 18.sp,
                                  )),
                              Text(
                                "Request Appointment",
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
                          Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                '1',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "task",
                                  fontWeight: FontWeight.bold,
                                ),
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
                              Text(
                                '2',
                                style: TextStyle(
                                  fontSize: 16.sp,
                                  fontFamily: "task",
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        "Select Doctor",
                                        style: TextStyle(
                                            color: Colors.black87,
                                            fontFamily: "task",
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold),
                                      ),
                                      SizedBox(
                                        height: 0.5.h,
                                      ),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Enter Doctor Speciality";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: _selectdoctor,
                                        style: TextStyle(height: 1),
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
                                          hintText:
                                              'Enter Doctor Speciality(e.g Cardiologist)',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 11.sp,
                                              fontFamily: "task"),
                                        ),
                                      ),
                                      // SizedBox(height: 2.5.h,),
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
                                      //             fontSize: 12.sp,
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
                                              "Zip Code(Optional)",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: "task",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            TextFormField(
                                              // validator: (value) {
                                              //   if (value!.isEmpty) {
                                              //     return "Please Enter The Zip Code";
                                              //   }
                                              //   return null;
                                              // },
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _ZipCode,
                                              style: TextStyle(height: 1),
                                              decoration: InputDecoration(
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                hintText: 'Enter Zip Code',
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
                                      Container(
                                        width: 85.w,
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Text(
                                              "Select Appointment Date",
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: "task",
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold),
                                            ),
                                            SizedBox(
                                              height: 0.5.h,
                                            ),
                                            TextFormField(
                                              validator: (value) {
                                                if (value!.isEmpty) {
                                                  return "Please Select Date";
                                                }
                                                return null;
                                              },
                                              //keyboardType: TextInputType.number,
                                              controller: _date,
                                              style: TextStyle(height: 1),
                                              decoration: InputDecoration(
                                                suffixIcon: IconButton(
                                                  icon: Icon(
                                                    Icons.date_range_outlined,
                                                    color: AppColors.primary,
                                                    size: 18.sp,
                                                  ),
                                                  onPressed: () async {
                                                    DateTime? datepicker =
                                                        await showDatePicker(
                                                            context: context,
                                                            initialDate:
                                                                DateTime.now(),
                                                            firstDate:
                                                                DateTime.now(),
                                                            lastDate: DateTime(
                                                                2040, 12));
                                                    if (datepicker != null) {
                                                      String formattedDate =
                                                          DateFormat(
                                                                  'dd-MM-yyyy')
                                                              .format(
                                                                  datepicker);
                                                      setState(() {
                                                        _date.text =
                                                            formattedDate
                                                                .toString();
                                                      });
                                                    }
                                                  },
                                                ),
                                                enabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                disabledBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                focusedBorder:
                                                    OutlineInputBorder(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        borderSide: BorderSide(
                                                            color:
                                                                Colors.grey)),
                                                border: OutlineInputBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    borderSide: BorderSide(
                                                        color: Colors.grey)),
                                                hintText: 'Select Date',
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
                                ),
                                SizedBox(
                                  height: 4.h,
                                ),
                                GestureDetector(
                                  onTap: () async {
                                    if (_formKey.currentState!.validate()) {
                                      await Requestformap();
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => HomePage(sel: 1),
                                      ));
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
                                          margin: EdgeInsets.only(
                                              right: 7.w, left: 7.w),
                                          alignment: Alignment.center,
                                          height: 6.h,
                                          width: 86.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Color(0xff0061b0)),
                                          child: Text(
                                            "Appointment Doctor",
                                            style: TextStyle(
                                                fontSize: 12.sp,
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
        ));
  }

  Requestformap() async {
    if (_formKey.currentState!.validate()) {
      EasyLoading.show(status: 'Please Wait ...');
      final Map<String, String> data = {};
      data['UserId'] = usermodal?.userId == "" || usermodal?.userId == null
          ? deviceName.toString()
          : usermodal?.userId ?? "";

      data['fname'] = usermodal?.userId == "" || usermodal?.userId == null
          ? widget.firstname
          : profilemodal?.profileDetails?.userFirstName ?? '';

      data['email'] = usermodal?.userId == "" || usermodal?.userId == null
          ? widget.email
          : profilemodal?.profileDetails?.userEmail ?? '';
      data['address'] = usermodal?.userId == "" || usermodal?.userId == null
          ? widget.address
          : profilemodal?.profileDetails?.userAddress ?? '';
      data['specialist'] = _selectdoctor.text.toString();
      data['zipcode'] = _ZipCode.text.toString();
      data['phone'] = usermodal?.userId == "" || usermodal?.userId == null
          ? widget.phone
          : profilemodal?.profileDetails?.userPhone ?? '';
      data['appointmentdate'] = _date.text.toString();
      print('form $data');
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().requestformap(data).then((response) async {
            requestformModel =
                RequestformModel.fromJson(json.decode(response.body));
            if (response.statusCode == 200 &&
                requestformModel?.status == "success") {
              Navigator.of(context).push(MaterialPageRoute(
                builder: (context) => HomePage(sel: 1),
              ));
              setState(() {
                isLoading = true;
              });
              await EasyLoading.showSuccess('Submit  Successfully');
              setState(() {
                isLoading = false;
              });
            } else {
              await EasyLoading.showError('Submit Failed');
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
