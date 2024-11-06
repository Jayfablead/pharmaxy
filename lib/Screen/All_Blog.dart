import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/BlogModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/BlogdetailsPage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class All_blogs extends StatefulWidget {
  const All_blogs({super.key});

  @override
  State<All_blogs> createState() => _All_blogsState();
}

final GlobalKey<ScaffoldState> _scaffoldKeyblog = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _scaffoldKeyblog1 = GlobalKey<ScaffoldState>();

bool isLoading = true;

class _All_blogsState extends State<All_blogs> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogap();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      key: _scaffoldKeyblog1,
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeyblog,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        bottomNavigationBar: bottombar(
          selected: 0,
        ),
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
                                  _scaffoldKeyblog.currentState?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 25.sp,
                                )),
                            Text(
                              "All Blogs",
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
                                      ? Icon(CupertinoIcons.person_add,
                                          size: 21.sp, color: AppColors.primary)
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
                      blogmodel?.data?.length == 0 ||
                              blogmodel?.data?.length == null
                          ? Container(
                              height: 80.h,
                              child: Center(
                                child: Text(
                                  'No Blogs Available ',
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
                                itemCount: blogmodel?.data?.length,
                                // The number of items in the grid
                                itemBuilder: (BuildContext context, int index) {
                                  // Build each item in the grid
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  Blogdetailspage(
                                                      iteamid:
                                                          blogmodel
                                                                  ?.data?[index]
                                                                  .id ??
                                                              '',
                                                      id: blogmodel
                                                              ?.data?[index]
                                                              .id ??
                                                          '')));
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
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  child: CachedNetworkImage(
                                                    imageUrl: blogmodel
                                                            ?.data?[index]
                                                            .image ??
                                                        '',
                                                    fit: BoxFit.cover,
                                                    height: 25.w,
                                                    width: 25.w,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(25),
                                                        image: DecorationImage(
                                                          image: imageProvider,
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    placeholder: (context,
                                                            url) =>
                                                        Center(
                                                            child:
                                                                CircularProgressIndicator()),
                                                    errorWidget:
                                                        (context, url, error) =>
                                                            Icon(Icons.error),
                                                  ),
                                                ),
                                              ),
                                              Column(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.start,
                                                crossAxisAlignment:
                                                    CrossAxisAlignment.start,
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
                                                            blogmodel?.data?[index].title ==
                                                                        '' ||
                                                                    blogmodel
                                                                            ?.data?[
                                                                                index]
                                                                            .title ==
                                                                        null
                                                                ? 'N/A'
                                                                : blogmodel
                                                                        ?.data?[
                                                                            index]
                                                                        .title ??
                                                                    '',
                                                            style: TextStyle(
                                                                color: Colors
                                                                    .black,
                                                                fontSize: 11.sp,
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
                                                              child: Container(
                                                                width: 47.w,
                                                                child: Text(
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  blogmodel?.data?[index].description ==
                                                                              '' ||
                                                                          blogmodel?.data?[index].description ==
                                                                              null
                                                                      ? 'N/A'
                                                                      : blogmodel
                                                                              ?.data?[index]
                                                                              .description ??
                                                                          '',
                                                                  style: TextStyle(
                                                                      color: Colors
                                                                          .black,
                                                                      fontSize:
                                                                          11.sp,
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .normal,
                                                                      fontFamily:
                                                                          "task"),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                      SizedBox(height: 1.h),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(context).push(MaterialPageRoute(
                                                                  builder: (context) => Blogdetailspage(
                                                                      iteamid:
                                                                          blogmodel?.data?[index].id ??
                                                                              '',
                                                                      id: blogmodel
                                                                              ?.data?[index]
                                                                              .id ??
                                                                          '')));
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
                                                              height: 4.5.h,
                                                              width: 43.w,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Color(
                                                                      0xff0061b0)),
                                                              child: Text(
                                                                "View Detail",
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

  blogap() async {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().blogapi(data).then((response) async {
          blogmodel = BlogModel.fromJson(json.decode(response.body));
          print(blogmodel?.status);
          if (response.statusCode == 200 && blogmodel?.status == "success") {
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
