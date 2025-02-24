import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AllCatModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductListPage.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class CategoryPage extends StatefulWidget {
  const CategoryPage({super.key});

  @override
  State<CategoryPage> createState() => _CategoryPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKeycate = GlobalKey<ScaffoldState>();
final GlobalKey<ScaffoldState> _scaffoldKeycate1 = GlobalKey<ScaffoldState>();

class book {
  String? image;
  String? name;
  String? dec;
  String? price;

  book(this.image, this.name, this.price, this.dec);
}

List<book> cat = [
  book(
    'https://www.transparentpng.com/thumb/-iphone-x/dO1Aqf-apple-iphone-caracteru-edsticas-especificaciones.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  book(
    'https://www.transparentpng.com/thumb/computer/6o4Q2H-png-windows-desktop-set-software-game-coding-.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  book(
    'https://pngimg.com/d/book_PNG51058.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  book(
    'https://www.transparentpng.com/thumb/watch/dOleGR-skin-watch-clipart-transparent.png',
    'Samsung Mobile ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  book(
    'https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png',
    'Toys',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  book(
    'https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png',
    'Toys',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
];

bool isLoading = true;

class _CategoryPageState extends State<CategoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allcatap();
    viewap();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      key: _scaffoldKeycate1,
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeycate,
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
                                  _scaffoldKeycate.currentState?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 25.sp,
                                )),
                            Text(
                              "Medicine",
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
                      allcatmodal?.categories?.length == 0 ||
                              allcatmodal?.categories?.length == null
                          ? Container(
                              height: 80.h,
                              child: Center(
                                child: Text(
                                  'No Products Available In This Category',
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
                                itemCount: allcatmodal?.categories?.length,
                                // The number of items in the grid
                                itemBuilder: (BuildContext context, int index) {
                                  // Build each item in the grid
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductListPage(
                                                    catid: allcatmodal
                                                            ?.categories?[index]
                                                            .categoryID ??
                                                        '',
                                                    name: allcatmodal
                                                            ?.categories?[index]
                                                            .categoryName ??
                                                        '',
                                                    subcatid: allcatmodal
                                                            ?.categories?[index]
                                                            .categoryID ??
                                                        "",
                                                    allcatid: allcatmodal
                                                            ?.categories?[index]
                                                            .categoryID ??
                                                        "",
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
                                                  padding: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  child: CachedNetworkImage(
                                                    imageUrl: allcatmodal
                                                            ?.categories?[index]
                                                            .catagoryimage ??
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
                                              SizedBox(
                                                width: 5.w,
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
                                                        MainAxisAlignment.start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsets.only(
                                                                left: 1.w),
                                                        child: SizedBox(
                                                          width: 45.w,
                                                          child: Text(
                                                            allcatmodal?.categories?[index].categoryName ==
                                                                        "" ||
                                                                    allcatmodal
                                                                            ?.categories?[
                                                                                index]
                                                                            .categoryName ==
                                                                        null
                                                                ? "N/A"
                                                                : allcatmodal
                                                                        ?.categories?[
                                                                            index]
                                                                        .categoryName ??
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
                                                      // SizedBox(
                                                      //   width: 50.w,
                                                      //   child: Row(
                                                      //     mainAxisAlignment:
                                                      //         MainAxisAlignment
                                                      //             .spaceBetween,
                                                      //     children: [
                                                      //       Container(
                                                      //         padding: EdgeInsets
                                                      //             .only(
                                                      //                 left:
                                                      //                     1.w),
                                                      //         child:
                                                      //             Container(
                                                      //           width: 47.w,
                                                      //           child: Text(
                                                      //             overflow:
                                                      //                 TextOverflow
                                                      //                     .ellipsis,
                                                      //             maxLines:
                                                      //                 1,
                                                      //             allcatmodal?.categories?[index].categoryDesc == "" ||
                                                      //                 allcatmodal?.categories?[index].categoryDesc ==
                                                      //                         null
                                                      //                 ? "N/A"
                                                      //                 : allcatmodal?.categories?[index].categoryDesc ??
                                                      //                     '',
                                                      //             style: TextStyle(
                                                      //                 color: Colors
                                                      //                     .black,
                                                      //                 fontSize: 11
                                                      //                     .sp,
                                                      //                 fontWeight: FontWeight
                                                      //                     .normal,
                                                      //                 fontFamily:
                                                      //                     "task"),
                                                      //           ),
                                                      //         ),
                                                      //       ),
                                                      //     ],
                                                      //   ),
                                                      // ),
                                                      // SizedBox(height: 1.h),
                                                      Row(
                                                        children: [
                                                          SizedBox(
                                                            width: 3.w,
                                                          ),
                                                          GestureDetector(
                                                            onTap: () {
                                                              Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder: (context) =>
                                                                          ProductListPage(
                                                                            catid:
                                                                                allcatmodal?.categories?[index].categoryID ?? '',
                                                                            name:
                                                                                allcatmodal?.categories?[index].categoryName ?? '',
                                                                            subcatid:
                                                                                allcatmodal?.categories?[index].categoryID,
                                                                            allcatid:
                                                                                allcatmodal?.categories?[index].categoryID,
                                                                            // selid: selected.toString(),
                                                                          )));
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

  allcatap() async {
    final Map<String, String> data = {};
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allcatapi(data).then((response) async {
          allcatmodal = AllCatModal.fromJson(json.decode(response.body));
          print(allcatmodal?.status);
          if (response.statusCode == 200 && allcatmodal?.status == "success") {
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
}
