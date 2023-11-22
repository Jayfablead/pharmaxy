import 'dart:convert';

import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce/Modal/CityModal.dart';
import 'package:ecommerce/Modal/CountryModal.dart';
import 'package:ecommerce/Modal/ShippingAddModal.dart';
import 'package:ecommerce/Modal/StateModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/AllAddpage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class Adressform extends StatefulWidget {
  String? addid;

  Adressform({super.key, this.addid});

  @override
  State<Adressform> createState() => _AdressformState();
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
bool back = false;
String? countryValue;

String? stateValue;

String? cityValue;

String? address;

test? selected;
test1? selected1;

test2? selected2;

class _AdressformState extends State<Adressform> {
  TextEditingController _firstname = TextEditingController();
  TextEditingController _lastname = TextEditingController();
  TextEditingController _Address = TextEditingController();
  TextEditingController _ZipCode = TextEditingController();
  TextEditingController _phone = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  List<test> items = [];
  List<test1> items1 = [];
  List<test2> items2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    print(widget.addid);
    setState(() {
      countryValue = null;
      cityValue = null;
      stateValue = null;
    });
    contryap();
  }

  @override
  Widget build(BuildContext context) {
    return Form(
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
                          height: 4.h,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  Navigator.pushReplacement(
                                      context,
                                      MaterialPageRoute(
                                        builder: (context) => AllAddpage(),
                                      ));
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 25.sp,
                                )),
                            Text(
                              "Shipping Address",
                              style: TextStyle(
                                fontSize: 20.sp,
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
                                            fontSize: 15.sp,
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
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
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
                                        fontSize: 15.sp,
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
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your Last Name ',
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
                                        fontSize: 15.sp,
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
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
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
                                        fontSize: 15.sp,
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
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Your Phone Number',
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
                                    "Country",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 0.5.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'Select Country',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 13.sp,
                                              fontFamily: "task"),
                                        ),
                                        // Not necessary for Option 1
                                        value: countryValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            countryValue = newValue.toString();
                                            print(countryValue);
                                            stateap(countryValue ?? '');
                                          });
                                        },
                                        items: countrymodal?.countries
                                            ?.map((location) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              location.countryName ?? '',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'task',
                                                  fontSize: 14.sp),
                                            ),
                                            value: location.countryID,
                                          );
                                        }).toList(),
                                      ),
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
                                    "State",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 0.5.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'Select State',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 13.sp,
                                              fontFamily: "task"),
                                        ),
                                        // Not necessary for Option 1
                                        value: stateValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            stateValue = newValue.toString();
                                            print(stateValue);
                                            cityap(stateValue ?? '');
                                          });
                                        },
                                        items:
                                            statemodal?.states?.map((location) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              location.stateName ?? '',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'task',
                                                  fontSize: 14.sp),
                                            ),
                                            value: location.stateID,
                                          );
                                        }).toList(),
                                      ),
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
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: MediaQuery.of(context).size.width,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                          width: 1, color: Colors.grey),
                                      borderRadius: BorderRadius.circular(50),
                                    ),
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 5.0, vertical: 0.5.h),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton2(
                                        hint: Text(
                                          'Select City',
                                          style: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.4),
                                              fontSize: 13.sp,
                                              fontFamily: "task"),
                                        ),
                                        // Not necessary for Option 1
                                        value: cityValue,
                                        onChanged: (newValue) {
                                          setState(() {
                                            cityValue = newValue.toString();
                                            print(cityValue);
                                          });
                                        },
                                        items:
                                            citymodal?.cities?.map((location) {
                                          return DropdownMenuItem(
                                            child: Text(
                                              location.cityName ?? '',
                                              style: TextStyle(
                                                  color: Colors.black87,
                                                  fontFamily: 'task',
                                                  fontSize: 14.sp),
                                            ),
                                            value: location.cityID,
                                          );
                                        }).toList(),
                                      ),
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
                                        fontSize: 15.sp,
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
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius:
                                              BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Enter Zip Code',
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
                              countryValue == null &&
                                      cityValue == null &&
                                      stateValue == null
                                  ? buildErrorDialog(context, 'Field Error',
                                      'Country, State & City Required')
                                  : cityValue == null && stateValue == null
                                      ? buildErrorDialog(context, 'Field Error',
                                          'State & City Required')
                                      : cityValue == null
                                          ? buildErrorDialog(context,
                                              'Field Error', 'City Required')
                                          : shippingap();
                              print(selected?.title);
                            }
                          },
                          child: Row(
                            children: [
                              Container(
                                  margin:
                                      EdgeInsets.only(right: 7.w, left: 7.w),
                                  alignment: Alignment.center,
                                  height: 6.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xfff7941d)),
                                  child: Text(
                                    "Save Address",
                                    style: TextStyle(
                                        fontSize: 17.sp,
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
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['userId'] = (usermodal?.userId).toString();
      data['first_name'] = _firstname.text.toString();
      data['last_name'] = _lastname.text.toString();
      data['city'] = cityValue ?? "";
      data['state'] = stateValue ?? "";
      data['country'] = countryValue ?? "";
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
              update(context, 'Address', 'Address Save Successfully',
                  callback: () {
                Navigator.pop(context);
                setState(() {
                  back = true;
                });
                back
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
