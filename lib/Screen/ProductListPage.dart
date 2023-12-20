import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/AllSubcatWiceProduct.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SubCatSerchModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductDetailPage2.dart';
import 'package:ecommerce/Screen/Productdetai2lWebview.dart';
import 'package:ecommerce/Screen/Productdetail2change.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductListPage extends StatefulWidget {
  String? catid;
  String? subcatid;
  String? allcatid;

  ProductListPage({super.key, this.catid, this.subcatid, this.allcatid});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

bool name = false;
TextEditingController _serch = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool _isLoading = false;

bool isLoading = true;

class book {
  String? image;
  String? price;
  String? name;
  String? bestprice;
  String? detail;

  book(this.image, this.name, this.price, this.bestprice, this.detail);
}

class _ProductListPageState extends State<ProductListPage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    subcatwiceallproductap();
    setState(() {
      _serch.text = '';
      setState(() {
        isLoading = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: bgcolor,
        key: _scaffoldKey,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Stack(
                  children: [
                    CustomScrollView(
                      slivers: [
                        SliverToBoxAdapter(
                          child: Column(
                            children: [
                              SizedBox(
                                height: 3.h,
                              ),
                              Container(
                                width: MediaQuery.of(context).size.width,
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    IconButton(
                                        onPressed: () {
                                          Navigator.pop(context);
                                        },
                                        icon: Icon(
                                          Icons.arrow_back_ios_new_rounded,
                                          size: 25.sp,
                                        )),
                                    Text(
                                      "Product List",
                                      style: TextStyle(
                                        fontSize: 20.sp,
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
                                                    color: Color(0xfff7941d),
                                                    fontFamily: 'task',
                                                    fontWeight: FontWeight.bold,
                                                    fontSize: 17.sp,
                                                  ),
                                                )
                                              : Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  height: 12.2.w,
                                                  width: 12.25.w,
                                                  padding: EdgeInsets.all(1.w),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
                                                    child: CachedNetworkImage(
                                                        fit: BoxFit.cover,
                                                        imageUrl: profilemodal
                                                                ?.profileDetails
                                                                ?.profileimage ??
                                                            '',
                                                        progressIndicatorBuilder:
                                                            (context, url,
                                                                    progress) =>
                                                                CircularProgressIndicator(),
                                                        errorWidget: (context,
                                                                url, error) =>
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
                              allsubcatwiceproduct?.subcategoriesWiseProduct
                                              ?.length ==
                                          0 ||
                                      allsubcatwiceproduct
                                              ?.subcategoriesWiseProduct
                                              ?.length ==
                                          null
                                  ? Container()
                                  : Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        searchBox(),
                                      ],
                                    ),
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 2.h,
                          ),
                        ),
                        _serch.text == ''
                            ? allsubcatwiceproduct?.subcategoriesWiseProduct
                                            ?.length ==
                                        0 ||
                                    allsubcatwiceproduct
                                            ?.subcategoriesWiseProduct
                                            ?.length ==
                                        null
                                ? SliverToBoxAdapter(
                                    child: Container(
                                      height: 70.h,
                                      child: Center(
                                          child: Text(
                                        'No Products Available',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'task',
                                          fontSize: 22.sp,
                                        ),
                                      )),
                                    ),
                                  )
                                : SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent:
                                                200, // Adjust as needed
                                            mainAxisSpacing:
                                                10.0, // Adjust as needed
                                            crossAxisSpacing:
                                                10.0, // Adjust as needed
                                            childAspectRatio:
                                                6.5 / 11 // Adjust as needed
                                            ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            productdetailwebview(
                                                              productid: allsubcatwiceproduct
                                                                      ?.subcategoriesWiseProduct?[
                                                                          index]
                                                                      .productID ??
                                                                  '',
                                                            )));
                                              },
                                              child: Card(
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Container(
                                                      child: CachedNetworkImage(
                                                        imageUrl: allsubcatwiceproduct
                                                                ?.subcategoriesWiseProduct?[
                                                                    index]
                                                                .productImage1 ??
                                                            '',
                                                        fit: BoxFit.cover,
                                                        height: 11.5.h,
                                                        width: 30.w,
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            // borderRadius: BorderRadius.circular(10),
                                                            image:
                                                                DecorationImage(
                                                              filterQuality:
                                                                  FilterQuality
                                                                      .high,
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
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 30.w,
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  allsubcatwiceproduct
                                                                          ?.subcategoriesWiseProduct?[
                                                                              index]
                                                                          .productName ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5
                                                                              .sp,
                                                                      fontFamily:
                                                                          'task',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 1.5.w,
                                                      ),
                                                      child: SizedBox(
                                                        width: 35.w,
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          allsubcatwiceproduct
                                                                  ?.subcategoriesWiseProduct?[
                                                                      index]
                                                                  .productShortDesc ??
                                                              '',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily: 'task',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            letterSpacing: 1,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '₹' +
                                                                  (allsubcatwiceproduct
                                                                          ?.subcategoriesWiseProduct?[
                                                                              index]
                                                                          .saleProductPrice)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                                    (allsubcatwiceproduct
                                                                            ?.subcategoriesWiseProduct?[index]
                                                                            .productPrice)
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontSize:
                                                                      12.sp,
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
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        productdetailwebview(
                                                                          productid:
                                                                              allsubcatwiceproduct?.subcategoriesWiseProduct?[index].productID ?? '',
                                                                        )));
                                                        //ADD CART API
                                                        // addtocartapi((allsubcatwiceproduct
                                                        //     ?.subcategoriesWiseProduct?[
                                                        // index]
                                                        //     .productID ??
                                                        //     ''));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 4.h,
                                                        width: 30.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Color(
                                                                0xfff7941d)),
                                                        child: Text(
                                                          "View Product",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                left: 37.w,
                                                top: 1.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    usermodal?.userId == "" ||
                                                            usermodal?.userId ==
                                                                null
                                                        ? Navigator.of(context)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LoginPage2()))
                                                        : allsubcatwiceproduct
                                                                    ?.subcategoriesWiseProduct?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? removewishlistap(
                                                                (allsubcatwiceproduct
                                                                        ?.subcategoriesWiseProduct?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                            : addwishlistap(
                                                                (allsubcatwiceproduct
                                                                        ?.subcategoriesWiseProduct?[
                                                                            index]
                                                                        .productID)
                                                                    .toString());
                                                  },
                                                  child: Icon(
                                                    allsubcatwiceproduct
                                                                ?.subcategoriesWiseProduct?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 20.sp,
                                                    color: allsubcatwiceproduct
                                                                ?.subcategoriesWiseProduct?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          ],
                                        );
                                      },
                                      childCount: _isLoading
                                          ? allsubcatwiceproduct
                                              ?.subcategoriesWiseProduct?.length
                                          : (allsubcatwiceproduct
                                                          ?.subcategoriesWiseProduct
                                                          ?.length ??
                                                      0) <
                                                  5
                                              ? allsubcatwiceproduct
                                                  ?.subcategoriesWiseProduct
                                                  ?.length
                                              : 4, // Replace with the number of grid items you want
                                    ),
                                  )
                            : subcatserchmodal?.searchResults?.length == 0 ||
                                    subcatserchmodal?.searchResults?.length ==
                                        null
                                ? SliverToBoxAdapter(
                                    child: Container(
                                      height: 70.h,
                                      child: Center(
                                          child: Text(
                                        'No Products Available',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
                                          fontFamily: 'task',
                                          fontSize: 22.sp,
                                        ),
                                      )),
                                    ),
                                  )
                                : SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent:
                                                200, // Adjust as needed
                                            mainAxisSpacing:
                                                10.0, // Adjust as needed
                                            crossAxisSpacing:
                                                10.0, // Adjust as needed
                                            childAspectRatio:
                                                6.5 / 11 // Adjust as needed
                                            ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            productdetailwebview(
                                                              productid: subcatserchmodal
                                                                      ?.searchResults?[
                                                                          index]
                                                                      .productID ??
                                                                  '',
                                                            )));
                                              },
                                              child: Card(
                                                color: Colors.white,
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      height: 2.h,
                                                    ),
                                                    Container(
                                                      child: CachedNetworkImage(
                                                        imageUrl: subcatserchmodal
                                                                ?.searchResults?[
                                                                    index]
                                                                .allImages ??
                                                            '',
                                                        fit: BoxFit.cover,
                                                        height: 11.5.h,
                                                        width: 30.w,
                                                        imageBuilder: (context,
                                                                imageProvider) =>
                                                            Container(
                                                          decoration:
                                                              BoxDecoration(
                                                            // borderRadius: BorderRadius.circular(10),
                                                            image:
                                                                DecorationImage(
                                                              filterQuality:
                                                                  FilterQuality
                                                                      .high,
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
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                              horizontal: 1.w),
                                                      child: Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                width: 30.w,
                                                                child: Text(
                                                                  textAlign:
                                                                      TextAlign
                                                                          .center,
                                                                  overflow:
                                                                      TextOverflow
                                                                          .ellipsis,
                                                                  maxLines: 1,
                                                                  subcatserchmodal
                                                                          ?.searchResults?[
                                                                              index]
                                                                          .productName ??
                                                                      '',
                                                                  style: TextStyle(
                                                                      fontSize:
                                                                          12.5
                                                                              .sp,
                                                                      fontFamily:
                                                                          'task',
                                                                      fontWeight:
                                                                          FontWeight
                                                                              .bold,
                                                                      letterSpacing:
                                                                          1,
                                                                      color: Colors
                                                                          .black),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsets.symmetric(
                                                        horizontal: 1.5.w,
                                                      ),
                                                      child: SizedBox(
                                                        width: 35.w,
                                                        child: Text(
                                                          textAlign:
                                                              TextAlign.center,
                                                          overflow: TextOverflow
                                                              .ellipsis,
                                                          maxLines: 2,
                                                          subcatserchmodal
                                                                  ?.searchResults?[
                                                                      index]
                                                                  .productShortDesc ??
                                                              '',
                                                          style: TextStyle(
                                                            fontSize: 12.sp,
                                                            fontFamily: 'task',
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
                                                            letterSpacing: 1,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Row(
                                                      mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            Text(
                                                              '₹' +
                                                                  (subcatserchmodal
                                                                          ?.searchResults?[
                                                                              index]
                                                                          .saleProductPrice)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                fontSize: 12.sp,
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
                                                                      top: 0.5
                                                                          .h),
                                                              child: Text(
                                                                '₹' +
                                                                    (subcatserchmodal
                                                                            ?.searchResults?[index]
                                                                            .productPrice)
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
                                                                  decoration:
                                                                      TextDecoration
                                                                          .lineThrough,
                                                                  fontSize:
                                                                      12.sp,
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
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                      height: 1.h,
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        productdetailwebview(
                                                                          productid:
                                                                              subcatserchmodal?.searchResults?[index].productID ?? '',
                                                                        )));
                                                        //ADD CART API
                                                        // addtocartapi((allsubcatwiceproduct
                                                        //     ?.subcategoriesWiseProduct?[
                                                        // index]
                                                        //     .productID ??
                                                        //     ''));
                                                      },
                                                      child: Container(
                                                        alignment:
                                                            Alignment.center,
                                                        height: 4.h,
                                                        width: 30.w,
                                                        decoration: BoxDecoration(
                                                            borderRadius:
                                                                BorderRadius
                                                                    .circular(
                                                                        30),
                                                            color: Color(
                                                                0xfff7941d)),
                                                        child: Text(
                                                          "View Product",
                                                          style: TextStyle(
                                                              fontSize: 12.sp,
                                                              color:
                                                                  Colors.white),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),
                                            Positioned(
                                                left: 37.w,
                                                top: 1.h,
                                                child: GestureDetector(
                                                  onTap: () {
                                                    usermodal?.userId == "" ||
                                                            usermodal?.userId ==
                                                                null
                                                        ? Navigator.of(context)
                                                            .push(MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        LoginPage2()))
                                                        : subcatserchmodal
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? removewishlistap(
                                                                (subcatserchmodal
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                            : addwishlistap(
                                                                (subcatserchmodal
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productID)
                                                                    .toString());
                                                  },
                                                  child: Icon(
                                                    subcatserchmodal
                                                                ?.searchResults?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 20.sp,
                                                    color: subcatserchmodal
                                                                ?.searchResults?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Colors.red
                                                        : Colors.black,
                                                  ),
                                                )),
                                          ],
                                        );
                                      },
                                      childCount: subcatserchmodal
                                          ?.searchResults?.length,
                                    ),
                                  ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 1.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              GestureDetector(
                                onTap: () {
                                  setState(() {
                                    _isLoading = !_isLoading;
                                  });
                                },
                                child: (allsubcatwiceproduct
                                                ?.subcategoriesWiseProduct
                                                ?.length ??
                                            0) <
                                        5
                                    ? Container()
                                    : Container(
                                        alignment: Alignment.center,
                                        height: 4.h,
                                        width: 30.w,
                                        decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(30),
                                            color: Color(0xfff7941d)),
                                        child: Text(
                                          _isLoading
                                              ? "View less.."
                                              : "View More..",
                                          style: TextStyle(
                                              fontSize: 12.sp,
                                              color: Colors.white),
                                        )),
                              )
                            ],
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 1.5.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 1.5.h,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 81.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _serch,
        onTap: () {},
        onChanged: (value) {
          subcatserchap(_serch.text);
        },
        style: TextStyle(color: Colors.black, fontFamily: 'task'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          border: InputBorder.none,
          hintText: 'Search Products',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'task'),
        ),
      ),
    );
  }

  subcatwiceallproductap() async {
    final Map<String, String> data = {};
    data['category_id'] = widget.catid.toString();
    data['subcategory_id'] = widget.subcatid.toString();
    data['user_id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().subcatwiceallproductapi(data).then((response) async {
          allsubcatwiceproduct =
              AllSubcatWiceProduct.fromJson(json.decode(response.body));
          print(allsubcatwiceproduct?.status);
          if (response.statusCode == 200 &&
              allsubcatwiceproduct?.status == "success") {
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

  subcatserchap(String value) async {
    final Map<String, String> data = {};
    data['searchText'] = value.toString();
    data['category_id'] = widget.catid.toString();
    data['subcategory_id'] = widget.subcatid.toString();
    data['user_id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().subcatserchapi(data).then((response) async {
          subcatserchmodal =
              SubCatSerchModal.fromJson(json.decode(response.body));
          print(subcatserchmodal?.status);
          if (response.statusCode == 200 &&
              subcatserchmodal?.status == "success") {
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

  addwishlistap(String value) async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['productID'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addtowishlistapi(data).then((response) async {
          addtowishlIstmodal =
              AddToWishLIstModal.fromJson(json.decode(response.body));
          print(addtowishlIstmodal?.status);
          if (response.statusCode == 200 &&
              addtowishlIstmodal?.status == "success") {
            subcatwiceallproductap();
            subcatserchap(_serch.text);
            buildErrorDialog(context, '', "Your item is added in wishlist");
            print('adddd');
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
            subcatwiceallproductap();
            subcatserchap(_serch.text);
            buildErrorDialog(context, '', "Your item is removed from wishlist");
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
