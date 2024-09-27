import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/UserWishLIstModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductDetailnovartition.dart';
import 'package:ecommerce/Screen/Productdetai2lWebview.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class WishListPage extends StatefulWidget {
  const WishListPage({super.key});

  @override
  State<WishListPage> createState() => _WishListPageState();
}

final GlobalKey<ScaffoldState> _scaffoldKeywishlist =
    GlobalKey<ScaffoldState>();
bool _isLoading = false;

class wish {
  String? image;
  String? price;
  String? name;
  String? bestprice;
  String? detail;

  wish(this.image, this.name, this.price, this.bestprice, this.detail);
}

bool isLoading = true;

class _WishListPageState extends State<WishListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    userwishlistap();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        key: _scaffoldKeywishlist,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: Column(
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
                                  _scaffoldKeywishlist.currentState
                                      ?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 20.sp,
                                )),
                            Text(
                              "WishList",
                              style: TextStyle(
                                fontSize: 13.sp,
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
                                            fontSize: 12.sp,
                                          ),
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
                      Container(
                        height: 85.h,
                        child: userwishlIstmodal?.wishList?.length == null
                            ? Container(
                                child: Center(
                                  child: Text(
                                    "No Products Available",
                                    style: TextStyle(
                                      fontSize: 15.sp,
                                      fontFamily: 'task',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                ),
                              )
                            : ListView.builder(
                                padding: EdgeInsets.only(top: 1.h),
                                itemCount: userwishlIstmodal?.wishList?.length,
                                // The number of items in the grid
                                itemBuilder: (BuildContext context, int index) {
                                  // Build each item in the grid
                                  return Card(

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
                                              InkWell(
                                                onTap: () {
                                              Navigator.of(context)
                                                          .push(MaterialPageRoute(
                                                              builder: (context) =>
                                                                  productdetailnovartion(
                                                                    productid: userwishlIstmodal
                                                                            ?.wishList?[
                                                                                index]
                                                                            .productID ??
                                                                        '',
                                                                  )));

                                                },
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                      ),
                                                  child: Padding(
                                                    padding: EdgeInsets.all(2.0),
                                                    child: CachedNetworkImage(
                                                      imageUrl: userwishlIstmodal
                                                              ?.wishList?[index]
                                                              .allImages ??
                                                          "",
                                                      fit: BoxFit.cover,
                                                      height: 29.w,
                                                      width: 29.w,
                                                      imageBuilder: (context,
                                                              imageProvider) =>
                                                          Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(25),
                                                          image: DecorationImage(
                                                            image: imageProvider,
                                                            // fit: BoxFit.cover,
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
                                                            width: 47.w,
                                                            child: Text(
                                                              userwishlIstmodal
                                                                              ?.wishList?[
                                                                                  index]
                                                                              .productName ==
                                                                          "" ||
                                                                      userwishlIstmodal
                                                                              ?.wishList?[
                                                                                  index]
                                                                              .productName ==
                                                                          null
                                                                  ? "N/A"
                                                                  : userwishlIstmodal
                                                                          ?.wishList?[
                                                                              index]
                                                                          .productName ??
                                                                      "",maxLines: 2,
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
                                                        SizedBox(height: 0.5.h),
                                                        // Padding(
                                                        //   padding: EdgeInsets
                                                        //       .symmetric(
                                                        //     horizontal: 1.w,
                                                        //   ),
                                                        //   child: SizedBox(
                                                        //     width: 40.w,
                                                        //     child: Text(
                                                        //       textAlign:
                                                        //           TextAlign.start,
                                                        //       overflow:
                                                        //           TextOverflow
                                                        //               .ellipsis,
                                                        //       maxLines: 2,
                                                        //       userwishlIstmodal
                                                        //                       ?.wishList?[
                                                        //                           index]
                                                        //                       .productShortDesc ==
                                                        //                   "" ||
                                                        //               userwishlIstmodal
                                                        //                       ?.wishList?[
                                                        //                           index]
                                                        //                       .productShortDesc ==
                                                        //                   null
                                                        //           ? "N/A"
                                                        //           : userwishlIstmodal
                                                        //                   ?.wishList?[
                                                        //                       index]
                                                        //                   .productShortDesc ??
                                                        //               '',
                                                        //       style: TextStyle(
                                                        //         fontSize: 11.sp,
                                                        //         fontFamily:
                                                        //             'task',
                                                        //         fontWeight:
                                                        //             FontWeight
                                                        //                 .normal,
                                                        //         letterSpacing: 1,
                                                        //         color:
                                                        //             Colors.black,
                                                        //       ),
                                                        //     ),
                                                        //   ),
                                                        // ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 1.w),
                                                          child: Row(
                                                            children: [
                                                              Text(
                                                                '₹' +
                                                                    (userwishlIstmodal
                                                                            ?.wishList?[
                                                                                index]
                                                                            .saleProductPrice)
                                                                        .toString(),
                                                                style: TextStyle(
                                                                  fontSize: 11.sp,
                                                                  fontFamily:
                                                                      'task',
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  letterSpacing:
                                                                      1,
                                                                  color: Colors
                                                                      .black,
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 0.5.w,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .only(
                                                                        top: 0.4
                                                                            .h),
                                                                child: Text(
                                                                  '₹' +
                                                                      (userwishlIstmodal
                                                                              ?.wishList?[index]
                                                                              .productPrice)
                                                                          .toString(),
                                                                  style:
                                                                      TextStyle(
                                                                    decoration:
                                                                        TextDecoration
                                                                            .lineThrough,
                                                                    fontSize:
                                                                        11.sp,
                                                                    fontFamily:
                                                                        'task',
                                                                    fontWeight:
                                                                        FontWeight
                                                                            .normal,
                                                                    letterSpacing:
                                                                        1,
                                                                    color: Colors
                                                                        .black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                        SizedBox(height: 1.h),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  left: 1.w),
                                                          child: Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .spaceAround,
                                                            children: [
                                                              Container(
                                                                height: 3.7.h,
                                                                width: 9.w,
                                                                alignment:
                                                                    Alignment
                                                                        .center,
                                                                decoration: BoxDecoration(
                                                                    borderRadius:
                                                                        BorderRadius
                                                                            .circular(
                                                                                5),
                                                                    color: Colors
                                                                        .white70,
                                                                    border: Border.all(
                                                                        width:
                                                                            0.5,
                                                                        color: AppColors.primary
                                                                        // color: Colors
                                                                        //     .grey
                                                                    )
                                                                ),
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    showBottomSheet(
                                                                      context:
                                                                          context,
                                                                      builder:
                                                                          (context) {
                                                                        return Stack(
                                                                          children: [
                                                                            Container(
                                                                              decoration:
                                                                                  BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white),
                                                                              height:
                                                                                  23.h,
                                                                              width:
                                                                                  double.infinity,
                                                                              // Customize the bottom sheet content here
                                                                              child:
                                                                                  Padding(
                                                                                padding: EdgeInsets.symmetric(horizontal: 5.w, vertical: 2.h),
                                                                                child: Column(
                                                                                  mainAxisAlignment: MainAxisAlignment.start,
                                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                                  mainAxisSize: MainAxisSize.min,
                                                                                  children: [
                                                                                    Row(
                                                                                      children: [
                                                                                        Text(
                                                                                          "Remove From Wishlist?",
                                                                                          style: TextStyle(fontWeight: FontWeight.bold, fontSize: 14.sp, fontFamily: 'task'),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    Text(
                                                                                      "Are You Sure to delete this product from wishlist?",
                                                                                      style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp, fontFamily: 'task'),
                                                                                    ),
                                                                                    SizedBox(
                                                                                      height: 2.h,
                                                                                    ),
                                                                                    Row(
                                                                                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                                                                                      children: [
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            Navigator.of(context).pop();
                                                                                          },
                                                                                          child: Container(
                                                                                              alignment: Alignment.center,
                                                                                              height: 5.h,
                                                                                              width: 35.w,
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white70, border: Border.all(width: 0.5, color: Colors.grey)),
                                                                                              child: Text(
                                                                                                "Cancel",
                                                                                                style: TextStyle(fontSize: 13.sp, color: Colors.black, fontFamily: "task", fontWeight: FontWeight.bold),
                                                                                              )),
                                                                                        ),
                                                                                        GestureDetector(
                                                                                          onTap: () {
                                                                                            removewishlistap((userwishlIstmodal?.wishList?[index].productID).toString());
                                                                                            Navigator.of(context).pop();
                                                                                          },
                                                                                          child: Container(
                                                                                              alignment: Alignment.center,
                                                                                              height: 5.h,
                                                                                              width: 35.w,
                                                                                              decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff0061b0)),
                                                                                              child: Text(
                                                                                                "Remove",
                                                                                                style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                                                                                              )),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    // Add more options as needed
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            Positioned(
                                                                              right:
                                                                                  1.w,
                                                                              child: IconButton(
                                                                                  icon: Icon(
                                                                                    Icons.highlight_remove,
                                                                                    size: 25.sp,
                                                                                    color: Colors.grey,
                                                                                  ),
                                                                                  // Icon to open the menu
                                                                                  onPressed: () {
                                                                                    Navigator.of(context).pop();
                                                                                  } // We set onPressed to null to disable the button
                                                                                  ),
                                                                            ),
                                                                          ],
                                                                        );
                                                                      },
                                                                    );
                                                                  },
                                                                  child: Icon(
                                                                    CupertinoIcons
                                                                        .delete,
                                                                    size: 18.sp,color: Colors.red,
                                                                  ),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                width: 2.w,
                                                              ),
                                                              GestureDetector(
                                                                onTap: () {
                                                                 Navigator.of(
                                                                              context)
                                                                          .push(MaterialPageRoute(
                                                                              builder: (context) => productdetailnovartion(
                                                                                    productid: userwishlIstmodal?.wishList?[index].productID ?? '',
                                                                                  )));
                                                                },
                                                                child: Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 4.h,
                                                                  width: 34.w,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Color(0xff0061b0)),
                                                                  child: Text(
                                                                    "View Detail",
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11.sp,
                                                                        color: Colors
                                                                            .white,
                                                                        fontFamily:
                                                                            "task"),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 3.h,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                    ),
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

  userwishlistap() {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userwishlistapi(data).then((response) async {
          userwishlIstmodal =
              UserWishLIstModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              userwishlIstmodal?.status == "success") {
            print(userwishlIstmodal?.status);
            print(response.statusCode);
            setState(() {
              isLoading = false;
            });
          } else {
            print('jguyytud');

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

  removewishlistap(String value) {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['productID'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().removewishlistapi(data).then((response) async {
          removewishlistmodal =
              RemoveWishListModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              removewishlistmodal?.status == "success") {
            userwishlistap();
            print(removewishlistmodal?.status);
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
