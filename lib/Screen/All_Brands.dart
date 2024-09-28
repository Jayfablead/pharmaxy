import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/BrandModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductListPage.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/productlistpage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class All_Brands extends StatefulWidget {
   All_Brands({super.key});



  @override
  State<All_Brands> createState() => _All_BrandsState();
}

final GlobalKey<ScaffoldState> _scaffoldKeybrand = GlobalKey<ScaffoldState>();
bool isLoading = true;

class _All_BrandsState extends State<All_Brands> {

  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    viewap();
    brandap();


  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeybrand,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        bottomNavigationBar: bottombar(),
        body: SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child: isLoading
                ? Container()
                : Column(
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
                            _scaffoldKeybrand.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 25.sp,
                          )),
                      Text(
                        "All Brands",
                        style: TextStyle(
                          fontSize: 14.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      Row(
                        children: [
                          GestureDetector(
                            onTap: () {
                              usermodal?.userId == "" ||
                                  usermodal?.userId == null
                                  ? Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          LoginPage2()))
                                  : Navigator.of(context).push(
                                  MaterialPageRoute(
                                      builder: (context) =>
                                          ProfilePage()));
                            },
                            child: usermodal?.userId == "" ||
                                usermodal?.userId == null
                                ? Icon(
                                CupertinoIcons.person_add,
                                size: 21.sp,
                                color:  AppColors.primary

                            )
                                : Container(
                              margin: EdgeInsets.symmetric(
                                  horizontal: 1.w),
                              height: 12.2.w,
                              width: 12.2.w,
                              padding: EdgeInsets.all(1.w),
                              child: ClipRRect(
                                borderRadius:
                                BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl: profilemodal
                                        ?.profileDetails
                                        ?.profileimage ??
                                        '',
                                    progressIndicatorBuilder: (context,
                                        url, progress) =>
                                        CircularProgressIndicator(),
                                    errorWidget: (context, url,
                                        error) =>
                                        Icon(Icons
                                            .error_outline_rounded)),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
                brandmodel?.data?.length == 0 ||
                    brandmodel?.data?.length == null
                    ? Container(
                    height: 80.h,
                    child: Center(
                      child: Text(
                        'No Brands Available',
                        style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontFamily: 'task',
                            fontSize: 13.sp,
                            color: Colors.black),
                      ),
                    ))
                    : Container(
                  height: 80.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: brandmodel?.data?.length,
                    // The number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      // Build each item in the grid
                      return GestureDetector(
                        onTap: () {
                          Navigator.of(
                              context)
                              .push(MaterialPageRoute(
                              builder: (context) => ProductListPage2(
                                allcatid: brandmodel?.data?[index]?. brandID  ?? "",
                                name: brandmodel?.data?[index]?. brandName  ?? "",
                              )));
                        },
                        child: Card(
                          // color: Colors.white,
                            child: Container(

                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: Colors.white,
                              ),
                              child: Column(
                                mainAxisAlignment:
                                MainAxisAlignment.center,
                                crossAxisAlignment:
                                CrossAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.start,
                                    crossAxisAlignment:
                                    CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 2.w,
                                      ),
                                      Container(
                                        // decoration: BoxDecoration(
                                        //   borderRadius: BorderRadius.all(Radius.circular(20)
                                        //    ),
                                        //   color: Colors.grey.shade200
                                        // ),
                                        child: Padding(
                                          padding:
                                          EdgeInsets.symmetric(horizontal: 1.w),
                                          child: CachedNetworkImage(
                                            imageUrl: brandmodel
                                                ?.data?[
                                            index]
                                                .image ??
                                                '',
                                            fit: BoxFit.cover,
                                            height: 25.w,
                                            width: 25.w,
                                            imageBuilder: (context,
                                                imageProvider) =>
                                                Container(
                                                  decoration:
                                                  BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(25),
                                                    image:
                                                    DecorationImage(
                                                      image:
                                                      imageProvider,
                                                      fit: BoxFit.cover,
                                                    ),
                                                  ),
                                                ),
                                            placeholder: (context,
                                                url) =>
                                                Center(
                                                    child:
                                                    CircularProgressIndicator()),
                                            errorWidget: (context,
                                                url, error) =>
                                                Icon(Icons.error),
                                          ),
                                        ),
                                      ),

                                      Column(
                                        mainAxisAlignment:
                                        MainAxisAlignment.start,
                                        crossAxisAlignment:
                                        CrossAxisAlignment
                                            .start,
                                        children: [
                                          SizedBox(
                                            height: 2.h,
                                          ),
                                          Column(
                                            crossAxisAlignment:
                                            CrossAxisAlignment
                                                .start,
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Padding(
                                                padding:
                                                EdgeInsets.only(
                                                    left: 5.w),
                                                child: SizedBox(
                                                  width: 45.w,
                                                  child: Text(
                                                    brandmodel?.data?[index].brandName ==
                                                        "" ||
                                                        brandmodel?.data?[index].brandName ==
                                                            null
                                                        ? "N/A"
                                                        : brandmodel?.data?[index].brandName ??
                                                        '',
                                                    style: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize:
                                                        11.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                        fontFamily:
                                                        "task"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                height: 0.8.h,
                                              ),
                                              SizedBox(height: 1.h),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(
                                                          context)
                                                          .push(MaterialPageRoute(
                                                          builder: (context) => ProductListPage2(
                                                            allcatid: brandmodel?.data?[index]?. brandID  ?? "",
                                                            name: brandmodel?.data?[index]?. brandName  ?? "",
                                                          )));
                                                    },
                                                    child:
                                                    Container(
                                                      alignment:
                                                      Alignment
                                                          .center,
                                                      height: 4.5.h,
                                                      width: 43.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: Color(0xff0061b0)),
                                                      child: Text(
                                                        "View Products",
                                                        style:
                                                        TextStyle(
                                                          fontSize:
                                                          10.sp,
                                                          color: Colors
                                                              .white,
                                                          fontFamily:
                                                          "task",
                                                        ),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ],
                                          ),
                                          SizedBox(
                                            height: 3.h,
                                          ),
                                        ],
                                      )
                                    ],
                                  ),
                                ],
                              ),
                            )),
                      );
                    },
                  ),
                ),
                SizedBox(
                  height: 2.h,
                ),
              ],
            ),
          ),
        ),
      ),
    );
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


  brandap() async {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().brandapi(data).then((response) async {
          brandmodel =
              BrandModel.fromJson(json.decode(response.body));
          print(brandmodel?.status);
          if (response.statusCode == 200 &&
              brandmodel?.status == "success") {
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
