import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/cateModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/SubCateGoryPage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class newapi extends StatefulWidget {
  const newapi({super.key});

  @override
  State<newapi> createState() => _newapiState();
}

class _newapiState extends State<newapi> {
  final GlobalKey<ScaffoldState> _scaffoldKeycate = GlobalKey<ScaffoldState>();

  bool isLoading = true;
@override
  void initState() {
    // TODO: implement initState
    super.initState();
    newcateapi();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeycate,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        bottomNavigationBar: bottombar(),
        body: isLoading?Container(): SingleChildScrollView(
          child: Padding(
            padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
            child:  Column(
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
                            _scaffoldKeycate.currentState?.openDrawer();
                          },
                          icon: Icon(
                            Icons.menu,
                            size: 25.sp,
                          )),
                      Text(
                        "Categories",
                        style: TextStyle(
                          fontSize: 20.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold,
                        ),
                      ),

                    ],
                  ),
                ),

              catemodel?.categories?.length == null||  catemodel?.categories?.length == ""? Container(
                 height: 80.h,
                 child: Center(
                   child: Text(
                     'No Category Available',
                     style: TextStyle(
                         fontWeight: FontWeight.bold,
                         fontFamily: 'task',
                         fontSize: 15.sp,
                         color: Colors.black),
                   ),
                 )):   Container(
                  height: 82.h,
                  child: ListView.builder(
                    padding: EdgeInsets.only(top: 1.h),
                    itemCount: catemodel?.categories?.length,

                    // maincatmodal?.categories?.length,
                    // The number of items in the grid
                    itemBuilder: (BuildContext context, int index) {
                      // Build each item in the grid
                      return GestureDetector(
                        onTap: () {

                        },
                        child: Card(
                            color: Color(0xffffffff),
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
                                        EdgeInsets.all(3.0),
                                        child: CachedNetworkImage(
                                          imageUrl:
                                           catemodel?.categories?[index].catagoryimage ?? '',

                                          // maincatmodal
                                          //     ?.categories?[
                                          // index]
                                          //     .catagoryimage ??
                                          //     '',
                                          fit: BoxFit.cover,
                                          height: 33.w,
                                          width: 33.w,
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
                                    SizedBox(
                                      width: 3.w,
                                    ),
                                    Padding(
                                      padding: EdgeInsets.symmetric(
                                          vertical: 1.h,
                                          horizontal: 1.w),
                                      child: Column(
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
                                                    left: 1.w),
                                                child: SizedBox(
                                                  width: 45.w,
                                                  child: Text(
                                                    catemodel?.categories?[index].categoryName ?? '',

                                                    style: TextStyle(
                                                        color: Colors
                                                            .black,
                                                        fontSize:
                                                        12.sp,
                                                        fontWeight:
                                                        FontWeight
                                                            .w600,
                                                        fontFamily:
                                                        "task"),
                                                  ),
                                                ),
                                              ),
                                              SizedBox(
                                                width: 50.w,
                                                child: Row(
                                                  mainAxisAlignment:
                                                  MainAxisAlignment
                                                      .spaceBetween,
                                                  children: [
                                                    Container(
                                                      padding: EdgeInsets
                                                          .only(
                                                          left:
                                                          1.w),
                                                      child:
                                                      Container(
                                                        width: 47.w,
                                                        child: Text(
                                                          overflow:
                                                          TextOverflow
                                                              .ellipsis,
                                                          maxLines:
                                                          2,
                                                          catemodel?.categories?[index].categoryDesc ==
                                                              "" ||
                                                              maincatmodal?.categories?[index].categoryDesc ==
                                                                  null
                                                              ? "N/A"
                                                              : catemodel?.categories?[index].categoryDesc ?? '',
                                                          // maincatmodal?.categories?[index].categoryDesc == "" ||
                                                          //     maincatmodal?.categories?[index].categoryDesc ==
                                                          //         null
                                                          //     ? "N/A"
                                                          //     : maincatmodal?.categories?[index].categoryDesc ??
                                                          //     '',
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .black26,
                                                              fontSize: 12
                                                                  .sp,
                                                              fontWeight: FontWeight
                                                                  .w600,
                                                              fontFamily:
                                                              "task"),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                              SizedBox(height: 2.h),
                                              Row(
                                                children: [
                                                  SizedBox(
                                                    width: 3.w,
                                                  ),
                                                  GestureDetector(
                                                    onTap: () {
                                                      // Navigator.of(
                                                      //     context)
                                                      //     .push(MaterialPageRoute(
                                                      //     builder: (context) => SubCateGoryPage(
                                                      //       catid: maincatmodal?.categories?[index].categoryID ?? '',
                                                      //     )));
                                                    },
                                                    child:
                                                    Container(
                                                      alignment:
                                                      Alignment
                                                          .center,
                                                      height: 4.5.h,
                                                      width: 45.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              30),
                                                          color: Color(
                                                              0xfff7941d)),
                                                      child: Text(
                                                        "View Sub Category",
                                                        style:
                                                        TextStyle(
                                                          fontSize:
                                                          14.sp,
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
                                      ),
                                    )
                                  ],
                                ),
                              ],
                            )),
                      );
                    },
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }

  newcateapi() async {
    final Map<String, String> data = {};
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().testcateapi(data).then((response) async {
          catemodel = cateModel.fromJson(json.decode(response.body));
          print(catemodel?.status);
          if (response.statusCode == 200 && catemodel?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            // Navigator.of(context).push(MaterialPageRoute(builder: (context)=>MainPage()));
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
