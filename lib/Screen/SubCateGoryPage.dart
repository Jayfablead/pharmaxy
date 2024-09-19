import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/SubCatModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductListPage.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class SubCateGoryPage extends StatefulWidget {
  String? catid;

  SubCateGoryPage({super.key, this.catid});

  @override
  State<SubCateGoryPage> createState() => _SubCateGoryPageState();
}

bool isLoading = true;

final GlobalKey<ScaffoldState> _scaffoldKeysubcat = GlobalKey<ScaffoldState>();

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

class _SubCateGoryPageState extends State<SubCateGoryPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subcatap();
    viewap();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeysubcat,
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
                                Navigator.of(context).pop();
                              },
                              icon: Icon(
                                Icons.arrow_back_ios_new_outlined,
                                size: 20.sp,
                              ),
                            ),
                            Text(
                              "Sub Categories",
                              style: TextStyle(
                                fontSize: 16.sp,
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
                                      ? Text(
                                          "Login",
                                          style: TextStyle(
                                            color: Color(0xff0061b0),
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 17.sp,
                                          ),
                                        )
                                      : Container(
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 2.h),
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
                      subcatmodal?.subCategories?.length == 0 ||
                              subcatmodal?.subCategories?.length == null
                          ? Container(
                              height: 80.h,
                              child: Center(
                                child: Text(
                                  'No Products Available In This Category',
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontFamily: 'task',
                                      fontSize: 15.sp,
                                      color: Colors.black),
                                ),
                              ))
                          : Container(
                              height: 85.h,
                              child: ListView.builder(
                                padding: EdgeInsets.only(top: 1.h),
                                itemCount: subcatmodal?.subCategories?.length,
                                // The number of items in the grid
                                itemBuilder: (BuildContext context, int index) {
                                  // Build each item in the grid
                                  return GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductListPage(
                                                    catid: widget.catid,
                                                    subcatid: subcatmodal
                                                            ?.subCategories?[
                                                                index]
                                                            .subCategoryId ??
                                                        '',
                                                  )));
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
                                                  //     borderRadius: BorderRadius.all(Radius.circular(20)
                                                  //     ),
                                                  //     color: Colors.grey.shade200
                                                  // ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsets.all(3.0),
                                                    child: CachedNetworkImage(
                                                      imageUrl: subcatmodal
                                                              ?.subCategories?[
                                                                  index]
                                                              .subCategoryImg ??
                                                          "",
                                                      fit: BoxFit.cover,
                                                      height: 25.w,
                                                      width: 28.w,
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
                                                  width: 2.w,
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
                                                                .start,
                                                        children: [
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    left: 1.w),
                                                            child: SizedBox(
                                                              width: 45.w,
                                                              child: Text(
                                                                subcatmodal?.subCategories?[index].subCategory ==
                                                                            '' ||
                                                                        subcatmodal?.subCategories?[index].subCategory ==
                                                                            null
                                                                    ? 'N/A'
                                                                    : subcatmodal
                                                                            ?.subCategories?[index]
                                                                            .subCategory ??
                                                                        '',maxLines: 3,
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

                                                          // SizedBox(
                                                          //   width: 50.w,
                                                          //   child: Row(
                                                          //     mainAxisAlignment:
                                                          //     MainAxisAlignment.spaceBetween,
                                                          //     children: [
                                                          //       Container(
                                                          //         padding:
                                                          //         EdgeInsets.only(left: 1.w),
                                                          //         child: Container(
                                                          //           width: 47.w,
                                                          //           child: Text(
                                                          //             overflow:
                                                          //             TextOverflow.ellipsis,
                                                          //             maxLines: 2,
                                                          //             cat[index].dec ?? "",
                                                          //             style: TextStyle(
                                                          //                 color: Colors.black26,
                                                          //                 fontSize: 12.sp,
                                                          //                 fontWeight:
                                                          //                 FontWeight.w600,
                                                          //                 fontFamily: "task"),
                                                          //           ),
                                                          //         ),
                                                          //       ),
                                                          //     ],
                                                          //   ),
                                                          // ),

                                                          SizedBox(height: 1.h),
                                                          Row(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => ProductListPage(
                                                                                catid: widget.catid,
                                                                                subcatid: subcatmodal?.subCategories?[index].subCategoryId ?? '',
                                                                              )));
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 4.h,
                                                                  width: 35.w,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              30),
                                                                      color: Color(0xff0061b0)),
                                                                  child: Text(
                                                                    "View Products",
                                                                    style:
                                                                        TextStyle(
                                                                      fontSize:
                                                                          12.sp,
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

  subcatap() async {
    final Map<String, String> data = {};
    data['categoryID'] = widget.catid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().subcatapi(data).then((response) async {
          subcatmodal = SubCatModal.fromJson(json.decode(response.body));
          print(subcatmodal?.status);
          if (response.statusCode == 200 && subcatmodal?.status == "success") {
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
