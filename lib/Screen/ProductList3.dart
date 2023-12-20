import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
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

class ProductList3 extends StatefulWidget {
  String? selid;

  ProductList3({super.key, this.selid});

  @override
  State<ProductList3> createState() => _ProductList3State();
}

bool name = false;

TextEditingController _serch2 = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
bool _isLoading = false;
bool _issearch = false;

bool isLoading = true;

class _ProductList3State extends State<ProductList3> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bestsellerproductap();
    setState(() {
      _serch2.text = '';
      setState(() {
        isLoading = true;
      });
    });
  }

  @override
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
                                          Icons.arrow_back_ios,
                                          size: 22.sp,
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
                              bestsellerproductmodal?.productData?.length ==
                                          0 ||
                                      bestsellerproductmodal
                                              ?.productData?.length ==
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
                        _serch2.text == ''
                            ? bestsellerproductmodal?.productData?.length ==
                                        0 ||
                                    bestsellerproductmodal
                                            ?.productData?.length ==
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
                                                              productid: bestsellerproductmodal
                                                                      ?.productData?[
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
                                                        imageUrl:
                                                            bestsellerproductmodal
                                                                    ?.productData?[
                                                                        index]
                                                                    .imgData ??
                                                                '',
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
                                                                  bestsellerproductmodal
                                                                          ?.productData?[
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
                                                          bestsellerproductmodal
                                                                  ?.productData?[
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
                                                                  (bestsellerproductmodal
                                                                          ?.productData?[
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
                                                                    (bestsellerproductmodal
                                                                            ?.productData?[index]
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
                                                                              bestsellerproductmodal?.productData?[index].productID ?? '',
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
                                                        : bestsellerproductmodal
                                                                    ?.productData?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? removewishlistap(
                                                                (bestsellerproductmodal
                                                                        ?.productData?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                            : addwishlistap(
                                                                (bestsellerproductmodal
                                                                        ?.productData?[
                                                                            index]
                                                                        .productID)
                                                                    .toString());
                                                  },
                                                  child: Icon(
                                                    bestsellerproductmodal
                                                                ?.productData?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 20.sp,
                                                    color: bestsellerproductmodal
                                                                ?.productData?[
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
                                          ? bestsellerproductmodal
                                              ?.productData?.length
                                          : (bestsellerproductmodal?.productData
                                                          ?.length ??
                                                      0) <
                                                  5
                                              ? bestsellerproductmodal
                                                  ?.productData?.length
                                              : 4, // Replace with the number of grid items you want
                                    ),
                                  )
                            : searchbestsaleModal?.productData?.length == 0 ||
                                    searchbestsaleModal?.productData?.length ==
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
                                                              productid: searchbestsaleModal
                                                                      ?.productData?[
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
                                                        imageUrl:
                                                            searchbestsaleModal
                                                                    ?.productData?[
                                                                        index]
                                                                    .imgData ??
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
                                                                  searchbestsaleModal
                                                                          ?.productData?[
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
                                                          searchbestsaleModal
                                                                  ?.productData?[
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
                                                                  (searchbestsaleModal
                                                                          ?.productData?[
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
                                                              width: 1.h,
                                                            ),
                                                            Text(
                                                              '₹' +
                                                                  (searchbestsaleModal
                                                                          ?.productData?[
                                                                              index]
                                                                          .productPrice)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                decoration:
                                                                    TextDecoration
                                                                        .lineThrough,
                                                                fontSize: 12.sp,
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
                                                                              searchbestsaleModal?.productData?[index].productID ?? '',
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
                                                        : searchbestsaleModal
                                                                    ?.productData?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? removewishlistap(
                                                                (searchbestsaleModal
                                                                        ?.productData?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                            : addwishlistap(
                                                                (searchbestsaleModal
                                                                        ?.productData?[
                                                                            index]
                                                                        .productID)
                                                                    .toString());
                                                  },
                                                  child: Icon(
                                                    searchbestsaleModal
                                                                ?.productData?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 20.sp,
                                                    color: searchbestsaleModal
                                                                ?.productData?[
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
                                      childCount: searchbestsaleModal
                                          ?.productData?.length,
                                    ),
                                  ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 1.h,
                          ),
                        ),
                        SliverToBoxAdapter(
                            child: _serch2.text == ''
                                ? Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          setState(() {
                                            _isLoading = !_isLoading;
                                          });
                                        },
                                        child: (bestsellerproductmodal
                                                        ?.productData?.length ??
                                                    0) <
                                                5
                                            ? Container()
                                            : Container(
                                                alignment: Alignment.center,
                                                height: 4.h,
                                                width: 30.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            30),
                                                    color: Color(0xfff7941d)),
                                                child: Text(
                                                  _isLoading
                                                      ? "View Less.."
                                                      : "View More..",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white),
                                                )),
                                      )
                                    ],
                                  )
                                : Container()),
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

  bestsellerproductap() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().bestsellerproductapi(data).then((response) async {
          bestsellerproductmodal =
              BestSellerProductModal.fromJson(json.decode(response.body));
          print(bestsellerproductmodal?.status);
          if (response.statusCode == 200 &&
              bestsellerproductmodal?.status == "success") {
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

  Widget searchBox() {
    return Container(
      width: 90.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _serch2,
        onTap: () {},
        onChanged: (value) {
          setState(() {
            _issearch = true;
          });
          bestsalesserchap(_serch2.text);
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
            buildErrorDialog(context, '', "Your item is added in wishlist");
            bestsellerproductap();
            bestsalesserchap(_serch2.text);
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
            buildErrorDialog(context, '', "Your item is removed from wishlist");
            bestsellerproductap();
            bestsalesserchap(_serch2.text);
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

  bestsalesserchap(String value) async {
    final Map<String, String> data = {};
    data['searchText'] = value.toString();
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().bestsalesserchapi(data).then((response) async {
          searchbestsaleModal =
              SearchBestSaleModal.fromJson(json.decode(response.body));
          print(searchbestsaleModal?.status);
          if (response.statusCode == 200 &&
              searchbestsaleModal?.status == "success") {
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
