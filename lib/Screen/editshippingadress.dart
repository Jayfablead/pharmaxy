import 'dart:convert';

import 'package:flutter/material.dart';
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
  final _formKey = GlobalKey<FormState>();

  List<test> items = [];
  List<test1> items1 = [];
  List<test2> items2 = [];

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    shippingap();
    userselectaddap();
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
                                  Navigator.of(context).pop();
                                },
                                icon: Icon(
                                  Icons.arrow_back_ios_new_outlined,
                                  size: 25.sp,
                                )),
                            Text(
                              "Edit Address",
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
                                    crossAxisAlignment: CrossAxisAlignment.start,
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
                                          hintText: 'First Name',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.6),
                                              fontSize: 14.sp,
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
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Last Name',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
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
                                    "Address 1",
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
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                          border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Address 1',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
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
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: 'Phone',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
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
                                    "country",
                                    style: TextStyle(
                                        color: Colors.black87,
                                        fontFamily: "task",
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold),
                                  ),
                                  Container(
                                    width: 85.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<test>(
                                        hint: Text(''),
                                        value: selected,
                                        onChanged: (test? newValue) {
                                          setState(() {
                                            selected =
                                                newValue; // Update the selectedItem
                                          });
                                          stateap();
                                        },
                                        items: items.map((test item) {
                                          return DropdownMenuItem<test>(
                                            value: item,
                                            child: Text(
                                              item.title,
                                              style:
                                                  TextStyle(color: Colors.black),
                                            ),
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
                                    width: 85.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<test1>(
                                        hint: Text(''),
                                        value: selected1,
                                        onChanged: (test1? newValue) {
                                          setState(() {
                                            selected1 =
                                                newValue; // Update the selectedItem
                                          });
                                          cityap();
                                        },
                                        items: items1.map((test1 item) {
                                          return DropdownMenuItem<test1>(
                                            value: item,
                                            child: Text(
                                              item.title,
                                              style:
                                                  TextStyle(color: Colors.black),
                                            ),
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
                                    width: 85.w,
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 3.w, vertical: 0.5.h),
                                    decoration: BoxDecoration(
                                        border: Border.all(color: Colors.grey),
                                        color: Colors.white,
                                        borderRadius: BorderRadius.circular(50)),
                                    child: DropdownButtonHideUnderline(
                                      child: DropdownButton<test2>(
                                        hint: Text(''),
                                        value: selected2,
                                        onChanged: (test2? newValue) {
                                          setState(() {
                                            selected2 =
                                                newValue; // Update the selectedItem
                                          });
                                          print(selected2?.title);
                                          print(selected2?.id);
                                          cityap();
                                        },
                                        items: items2.map((test2 item) {
                                          return DropdownMenuItem<test2>(
                                            value: item,
                                            child: Text(
                                                  item.title,
                                                  style:
                                                  TextStyle(color: Colors.black),
                                            ),
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
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      disabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      focusedBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      border: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(30),
                                          borderSide:
                                              BorderSide(color: Colors.grey)),
                                      hintText: '395004',
                                      hintStyle: TextStyle(
                                          color: Colors.black.withOpacity(0.6),
                                          fontSize: 14.sp,
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
                            editshippingap();
                          },
                          child: Row(
                            children: [
                              Container(
                                  margin: EdgeInsets.only(right: 7.w, left: 7.w),
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
       data['city'] = selected2?.title ?? "";
       data['state'] = selected1?.title ?? "";
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

   editshippingap() async {
     if (_formKey.currentState!.validate()) {
       final Map<String, String> data = {};
       data['first_name'] = _firstname.text.toString();
       data['last_name'] = _lastname.text.toString();
       data['city'] = selected2?.title ?? "";
       data['state'] = selected1?.title ?? "";
       data['country'] = selected?.title ?? "";
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
               update(context, '', 'Address Save Successfully', callback: () {
                 Navigator.of(context).pushReplacement(
                     MaterialPageRoute(builder: (context) => AllAddpage()));
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
            setState(() {
              _firstname.text =
                  userselectaddmodal?.selectShippingAddress?.firstName ?? "";
              _lastname.text =
                  userselectaddmodal?.selectShippingAddress?.lastName ?? "";
              _Address.text =
                  userselectaddmodal?.selectShippingAddress?.address ?? "";
              _phone.text =
                  userselectaddmodal?.selectShippingAddress?.number ?? "";
              _ZipCode.text =
                  userselectaddmodal?.selectShippingAddress?.zipcode ?? "";
              selected2?.title =
                  userselectaddmodal?.selectShippingAddress?.city ?? '';
              selected?.title =
                  userselectaddmodal?.selectShippingAddress?.country ?? '';
              selected1?.title =
                  userselectaddmodal?.selectShippingAddress?.state ?? '';
              isLoading = false;
              print('coutntry ${ userselectaddmodal?.selectShippingAddress?.country ?? ''}');
              print(' state ${ userselectaddmodal?.selectShippingAddress?.state ?? ''}');
              print('city ${ userselectaddmodal?.selectShippingAddress?.city ?? ''}');
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
            print(countrymodal?.countries?.length);

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

   stateap() async {
    final Map<String, String> data = {};
    data['countryID'] = selected?.id ?? '';
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

   cityap() async {
    final Map<String, String> data = {};
    data['stateID'] = selected1?.id ?? '';
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
