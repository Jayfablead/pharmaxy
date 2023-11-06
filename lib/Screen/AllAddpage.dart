import 'dart:convert';
import 'package:ecommerce/Modal/AllUserAddModal.dart';
import 'package:ecommerce/Modal/RemoveAddressModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/Adressform.dart';
import 'package:ecommerce/Screen/CheckoutDetail.dart';
import 'package:ecommerce/Screen/editshippingadress.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class AllAddpage extends StatefulWidget {
  AllAddpage({super.key});

  @override
  State<AllAddpage> createState() => _AllAddpageState();
}

bool isChecked = false;

bool isLoading = true;

int sell = 0;
String? selid;

class _AllAddpageState extends State<AllAddpage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    alluseraddapi();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: Colors.grey.shade100,
        bottomNavigationBar: bottombar(),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w, vertical: 2.h),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
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
                              Navigator.of(context).pop();
                            },
                            icon: Icon(
                              Icons.arrow_back_ios_new_outlined,
                              size: 25.sp,
                            ),
                          ),
                          Text(
                            "Address",
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
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => Adressform()));
                      },
                      child: Container(
                        height: 6.h,
                        width: 50.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                                height: 8.w,
                                width: 8.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(25),
                                  color: Color(0xfff7941d),
                                ),
                                child: Center(
                                    child: Icon(
                                  Icons.add,
                                  size: 20.sp,
                                  color: Colors.white,
                                ))),
                            SizedBox(
                              width: 1.w,
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => Adressform(),
                                    ));
                              },
                              child: Center(
                                child: Text(
                                  textAlign: TextAlign.center,
                                  "Add New Address",
                                  style: TextStyle(
                                    fontSize: 14.sp,
                                    fontFamily: 'task',
                                    fontWeight: FontWeight.normal,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    alluseraddmodal?.allShippingAddress?.length == 0 ||
                            alluseraddmodal?.allShippingAddress?.length == null
                        ? Container(
                            height: 62.h,
                            child: Center(
                              child: Text(
                                'No Address Available',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'task',
                                    fontSize: 20.sp,
                                    color: Colors.black),
                              ),
                            ),
                          )
                        : Container(
                            height: 62.h,
                            child: ListView.builder(
                              itemCount:
                                  alluseraddmodal?.allShippingAddress?.length,
                              itemBuilder: (context, index) {
                                return Stack(
                                  children: [
                                    Card(
                                      elevation: 00,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(8)),
                                      child: Padding(
                                        padding: EdgeInsets.symmetric(
                                            vertical: 2.h, horizontal: 2.w),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceAround,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sell = index;
                                                  selid = alluseraddmodal
                                                          ?.allShippingAddress?[
                                                              index]
                                                          .id ??
                                                      '';
                                                });
                                                print(selid);
                                              },
                                              child: Icon(
                                                sell == index
                                                    ? Icons.check_box
                                                    : Icons
                                                        .check_box_outline_blank,
                                                color: sell == index
                                                    ? Color(0xfff7941d)
                                                    : Colors.black,
                                                size: 22.sp,
                                              ),
                                            ),
                                            SizedBox(width: 2.w),
                                            Padding(
                                              padding: EdgeInsets.symmetric(
                                                  horizontal: 1.w,
                                                  vertical: 0.5.h),
                                              child: Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Text(
                                                        alluseraddmodal
                                                                ?.allShippingAddress?[
                                                                    index]
                                                                .firstName ??
                                                            "",
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: "task"),
                                                      ),
                                                      SizedBox(
                                                        width: 1.w,
                                                      ),
                                                      Text(
                                                        alluseraddmodal
                                                                ?.allShippingAddress?[
                                                                    index]
                                                                .lastName ??
                                                            "",
                                                        style: TextStyle(
                                                            fontSize: 16.sp,
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            fontFamily: "task"),
                                                      ),
                                                    ],
                                                  ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      SizedBox(
                                                        width: 75.w,
                                                        child: Text(
                                                          alluseraddmodal
                                                                  ?.allShippingAddress?[
                                                                      index]
                                                                  .address ??
                                                              "",
                                                          style: TextStyle(
                                                              fontSize: 15.sp,
                                                              color:
                                                                  Colors.black,
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              fontFamily:
                                                                  "task"),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      left: 85.w,
                                      child: PopupMenuButton(
                                          elevation: 00,
                                          color: Colors.deepOrange.shade50,
                                          icon: Icon(
                                            Icons.more_vert,
                                            color: Color(0xfff7941d),
                                            size: 20.sp,
                                          ),
                                          // add this line
                                          itemBuilder: (_) =>
                                              <PopupMenuItem<String>>[
                                                PopupMenuItem<String>(
                                                    child: Container(
                                                        width: 10.w,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            editshippingadress(
                                                                              addid: alluseraddmodal?.allShippingAddress?[index].id,
                                                                            )));
                                                          },
                                                          child: Text(
                                                            "Edit",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.sp,
                                                              fontFamily:
                                                                  'task',
                                                            ),
                                                          ),
                                                        )),
                                                    value: 'report'),
                                                PopupMenuItem<String>(
                                                    child: Container(
                                                        width: 14.w,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(
                                                                    context)
                                                                .pop();
                                                            removeadressap(
                                                                (alluseraddmodal
                                                                        ?.allShippingAddress?[
                                                                            index]
                                                                        .id)
                                                                    .toString());
                                                          },
                                                          child: Text(
                                                            "Delete",
                                                            style: TextStyle(
                                                              color:
                                                                  Colors.black,
                                                              fontSize: 15.sp,
                                                              fontFamily:
                                                                  'task',
                                                            ),
                                                          ),
                                                        )),
                                                    value: 'report'),
                                              ],
                                          onSelected: (index) async {
                                            switch (index) {
                                              case 'report':
                                                break;
                                            }
                                          }),
                                    )
                                  ],
                                );
                              },
                            ),
                          ),
                    SizedBox(
                      height: 2.h,
                    ),
                    GestureDetector(
                      onTap: () {
                        print(alluseraddmodal?.allShippingAddress?[sell].id);
                        Navigator.of(context).push(MaterialPageRoute(
                            builder: (context) => CheckoutDetail(
                                  address: alluseraddmodal
                                          ?.allShippingAddress?[sell].address ??
                                      "",
                                  firstname: alluseraddmodal
                                          ?.allShippingAddress?[sell]
                                          .firstName ??
                                      "",
                                  lastname: alluseraddmodal
                                          ?.allShippingAddress?[sell]
                                          .lastName ??
                                      "",
                                  addid: alluseraddmodal
                                          ?.allShippingAddress?[sell].id ??
                                      "",
                                  page: "1",
                                )));
                      },
                      child: Row(
                        children: [
                          alluseraddmodal?.allShippingAddress?.length == 0 ||
                                  alluseraddmodal?.allShippingAddress?.length ==
                                      null
                              ? Container()
                              : Container(
                                  margin:
                                      EdgeInsets.only(right: 7.w, left: 7.w),
                                  alignment: Alignment.center,
                                  height: 6.h,
                                  width: 80.w,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Color(0xfff7941d)),
                                  child: Text(
                                    "Confirm",
                                    style: TextStyle(
                                        fontSize: 17.sp,
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "task"),
                                  )),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  alluseraddapi() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userallshippingapi(data).then((response) async {
          alluseraddmodal =
              AllUserAddModal.fromJson(json.decode(response.body));
          print(alluseraddmodal?.status);
          if (response.statusCode == 200 &&
              alluseraddmodal?.status == "success") {
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

  removeadressap(String value) {
    final Map<String, String> data = {};
    data['shipping_address_id'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().removeshippingadressapi(data).then((response) async {
          removeaddressmodal =
              RemoveAddressModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              removeaddressmodal?.status == "success") {
            alluseraddapi();
            print(removeaddressmodal?.status);
            print(response.statusCode);
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
