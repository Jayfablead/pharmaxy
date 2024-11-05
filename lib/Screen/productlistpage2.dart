import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/BrandWiceProductModel.dart';
import 'package:ecommerce/Modal/BrandWiceProductsearchModel.dart';
import 'package:ecommerce/Modal/FilterbyModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/ShortbyModel.dart';
import 'package:ecommerce/Modal/brandwicePageViewModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductDetailnovartition.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';

class ProductListPage2 extends StatefulWidget {
  String? allcatid;
  String? name;

  ProductListPage2({super.key, this.allcatid, this.name});

  @override
  State<ProductListPage2> createState() => _ProductListPageState();
}

bool name = false;
bool type = false;
String? type1;
String? short;

TextEditingController _serch2 = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKeylist2 = GlobalKey<ScaffoldState>();
bool _isLoading = false;

bool isLoading = true;

class _ProductListPageState extends State<ProductListPage2> {
  final scrollController = ScrollController();
  List posts = [];
  bool isloding = true;
  int page = 1;
  bool isloadingMore = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    scrollController.addListener(_scrollListener);
    brandwicepageapi();
    brandswiceproductap();
    setState(() {
      _serch2.text = '';
      setState(() {
        type = false;
        isLoading = true;
      });
    });
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: bgcolor,
        key: _scaffoldKeylist2,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(
          selected: 0,
        ),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                child: Stack(
                  children: [
                    CustomScrollView(
                      controller: scrollController,
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
                                          size: 22.sp,
                                        )),
                                    Text(
                                      overflow: TextOverflow.ellipsis,
                                      widget.name.toString(),
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
                                              ? Icon(CupertinoIcons.person_add,
                                                  size: 21.sp,
                                                  color: AppColors.primary)
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
                                height: 1.h,
                              ),
                              // sort & Filter
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Container(
                                  width: MediaQuery.of(context).size.width,
                                  alignment: Alignment.center,
                                  height: 50.0,
                                  decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.0),
                                      color: Colors.grey.shade100,
                                      border:
                                          Border.all(color: AppColors.primary)),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 30.0),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          popupMenuTheme: PopupMenuThemeData(
                                            color: AppColors
                                                .primary, // White background for the popup menu
                                          ),
                                        ),
                                        child: PopupMenuButton<String>(
                                          icon: Icon(
                                            CupertinoIcons.sort_down,
                                            size: 20.sp,
                                            color: Color(0xff0061b0),
                                          ),
                                          onSelected: (value) {
                                            // Select action based on the value chosen
                                            if (value == "A to Z") {
                                              print("Sort by A to Z");
                                            }
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: "A to Z",
                                              onTap: () {
                                                setState(() {
                                                  shortbyap("A to Z");
                                                  short = "2";
                                                });
                                              },
                                              child: Text(
                                                "A to Z",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: "Z to A",
                                              onTap: () {
                                                setState(() {
                                                  shortbyap("Z to A");
                                                  short = "1";
                                                });
                                              },
                                              child: Text(
                                                "Z to A",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      PopupMenuButton<String>(
                                        onSelected: (value) {
                                          // Select action based on the value chosen
                                          if (value == "A to Z") {
                                            print("Sort by A to Z");
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: "A to Z",
                                            onTap: () {
                                              setState(() {
                                                shortbyap("A to Z");
                                                short = "2";
                                              });
                                            },
                                            child: Text(
                                              "A to Z",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: "Z to A",
                                            onTap: () {
                                              setState(() {
                                                shortbyap("Z to A");
                                                short = "1";
                                              });
                                            },
                                            child: Text(
                                              "Z to A",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                        color: AppColors.primary,
                                        child: Text(
                                          "Sort By",
                                          style: TextStyle(
                                            fontFamily: "task",
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff0061b0),
                                          ),
                                        ),
                                      ),
                                      SizedBox(width: 20.0),
                                      VerticalDivider(
                                        color: Colors.grey.withOpacity(0.5),
                                        thickness: 2,
                                        width: 20,
                                        indent: 10,
                                        endIndent: 10,
                                      ),
                                      SizedBox(width: 5.0),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          popupMenuTheme: PopupMenuThemeData(
                                              color: AppColors
                                                  .primary // White background for the popup menu
                                              ),
                                        ),
                                        child: PopupMenuButton<String>(
                                          icon: Icon(
                                            Icons.filter_alt_sharp,
                                            size: 20.sp,
                                            color: Color(0xff0061b0),
                                          ),
                                          onSelected: (value) {
                                            if (value == "Price High to Low") {
                                              print(
                                                  "Filter by Price High to Low");
                                            }
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: "Price High to Low",
                                              onTap: () {
                                                setState(() {
                                                  filterbysearch(
                                                      "Price High to Low");
                                                  type1 = "2";
                                                });
                                              },
                                              child: Text(
                                                "Price High to Low",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: "Price Low to High",
                                              onTap: () {
                                                setState(() {
                                                  filterbysearch(
                                                      "Price Low to High");
                                                  type1 = "1";
                                                });
                                              },
                                              child: Text(
                                                "Price Low to High",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      PopupMenuButton<String>(
                                        onSelected: (value) {
                                          if (value == "Price High to Low") {
                                            print(
                                                "Filter by Price High to Low");
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: "Price High to Low",
                                            onTap: () {
                                              setState(() {
                                                filterbysearch(
                                                    "Price High to Low");
                                                type1 = "2";
                                              });
                                            },
                                            child: Text(
                                              "Price High to Low",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: "Price Low to High",
                                            onTap: () {
                                              setState(() {
                                                filterbysearch(
                                                    "Price Low to High");
                                                type1 = "1";
                                              });
                                            },
                                            child: Text(
                                              "Price Low to High",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white),
                                            ),
                                          ),
                                        ],
                                        color: AppColors.primary,
                                        child: Text(
                                          "Filter By",
                                          style: TextStyle(
                                            fontFamily: "task",
                                            fontSize: 15.0,
                                            fontWeight: FontWeight.w600,
                                            color: Color(0xff0061b0),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 1.h,
                              ),
                              brandWiceProductmodel?.data?.length == 0 ||
                                      brandWiceProductmodel?.data?.length ==
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
                        short == "1"
                            ? SliverGrid(
                                gridDelegate:
                                    SliverGridDelegateWithMaxCrossAxisExtent(
                                        maxCrossAxisExtent:
                                            200, // Adjust as needed
                                        mainAxisSpacing:
                                            0.0, // Adjust as needed
                                        crossAxisSpacing:
                                            0.0, // Adjust as needed
                                        childAspectRatio:
                                            6.5 / 7.9 // Adjust as needed
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
                                                        productdetailnovartion(
                                                          productid: shortbymodel
                                                                  ?.searchResults?[
                                                                      index]
                                                                  .productID ??
                                                              '',
                                                        )));
                                          },
                                          child: Card(
                                            color: Colors.white,
                                            child: Container(
                                              decoration: BoxDecoration(
                                                  color: Colors.white,
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10)),
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
                                                      imageUrl: shortbymodel
                                                                  ?.searchResults?[
                                                                      index]
                                                                  .allImages
                                                                  ?.length ==
                                                              0
                                                          ? ''
                                                          : shortbymodel
                                                                  ?.searchResults?[
                                                                      index]
                                                                  .allImages?[0] ??
                                                              '',
                                                      fit: BoxFit.cover,
                                                      height: 9.5.h,
                                                      width: 25.w,
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
                                                                shortbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productName ??
                                                                    '',
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11.sp,
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
                                                  // Padding(
                                                  //   padding:
                                                  //       EdgeInsets.symmetric(
                                                  //     horizontal: 1.5.w,
                                                  //   ),
                                                  //   child: SizedBox(
                                                  //     width: 35.w,
                                                  //     child: Text(
                                                  //       textAlign:
                                                  //           TextAlign.center,
                                                  //       overflow: TextOverflow
                                                  //           .ellipsis,
                                                  //       maxLines: 2,
                                                  //       brandWiceProductsearchmodel
                                                  //               ?.data?[
                                                  //                   index]
                                                  //               .productShortDesc ??
                                                  //           '',
                                                  //       style: TextStyle(
                                                  //         fontSize: 11.sp,
                                                  //         fontFamily: 'task',
                                                  //         fontWeight:
                                                  //             FontWeight
                                                  //                 .normal,
                                                  //         letterSpacing: 1,
                                                  //         color: Colors.black,
                                                  //       ),
                                                  //     ),
                                                  //   ),
                                                  // ),
                                                  Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // Text(
                                                          //   '₹' +
                                                          //       (shortbymodel
                                                          //           ?.searchResults?[
                                                          //       index]
                                                          //           .saleProductPrice)
                                                          //           .toString(),
                                                          //   style: TextStyle(
                                                          //     fontSize: 11.sp,
                                                          //     fontFamily:
                                                          //     'task',
                                                          //     fontWeight:
                                                          //     FontWeight
                                                          //         .bold,
                                                          //     letterSpacing:
                                                          //     1,
                                                          //     color: Colors
                                                          //         .black,
                                                          //   ),
                                                          // ),
                                                          // SizedBox(
                                                          //   width: 1.w,
                                                          // ),
                                                          Text(
                                                            '₹' +
                                                                (shortbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productPrice)
                                                                    .toString(),
                                                            style: TextStyle(
                                                              fontSize: 12.sp,
                                                              fontFamily:
                                                                  'task',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .normal,
                                                              letterSpacing: 1,
                                                              color:
                                                                  Colors.black,
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
                                                              builder: (context) =>
                                                                  productdetailnovartion(
                                                                    productid: shortbymodel
                                                                            ?.searchResults?[index]
                                                                            .productID ??
                                                                        '',
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
                                                      width: 32.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color: Color(
                                                              0xff0061b0)),
                                                      child: Text(
                                                        "View Product",
                                                        style: TextStyle(
                                                            fontSize: 11.sp,
                                                            color:
                                                                Colors.white),
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
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
                                                            builder: (context) =>
                                                                LoginPage2()))
                                                    : shortbymodel
                                                                ?.searchResults?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? removewishlistap(
                                                            (shortbymodel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .productID)
                                                                .toString())
                                                        : addwishlistap(
                                                            (shortbymodel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .productID)
                                                                .toString());
                                              },
                                              child: Icon(
                                                shortbymodel
                                                            ?.searchResults?[
                                                                index]
                                                            .wishlist ==
                                                        1
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                size: 20.sp,
                                                color: shortbymodel
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
                                  childCount:
                                      shortbymodel?.searchResults?.length,
                                ),
                              )
                            : short == "2"
                                ? SliverGrid(
                                    gridDelegate:
                                        SliverGridDelegateWithMaxCrossAxisExtent(
                                            maxCrossAxisExtent:
                                                200, // Adjust as needed
                                            mainAxisSpacing:
                                                0.0, // Adjust as needed
                                            crossAxisSpacing:
                                                0.0, // Adjust as needed
                                            childAspectRatio:
                                                6.5 / 7.9 // Adjust as needed
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
                                                            productdetailnovartion(
                                                              productid: shortbymodel
                                                                      ?.searchResults?[
                                                                          index]
                                                                      .productID ??
                                                                  '',
                                                            )));
                                              },
                                              child: Card(
                                                color: Colors.white,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                      color: Colors.white,
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              10)),
                                                  child: Column(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      SizedBox(
                                                        height: 2.h,
                                                      ),
                                                      Container(
                                                        child:
                                                            CachedNetworkImage(
                                                          imageUrl: shortbymodel
                                                                      ?.searchResults?[
                                                                          index]
                                                                      .allImages
                                                                      ?.length ==
                                                                  0
                                                              ? ''
                                                              : shortbymodel
                                                                      ?.searchResults?[
                                                                          index]
                                                                      .allImages?[0] ??
                                                                  '',
                                                          fit: BoxFit.cover,
                                                          height: 9.5.h,
                                                          width: 25.w,
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
                                                                fit: BoxFit
                                                                    .cover,
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
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal:
                                                                    1.w),
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
                                                                    shortbymodel
                                                                            ?.searchResults?[index]
                                                                            .productName ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontSize: 11
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
                                                      // Padding(
                                                      //   padding:
                                                      //       EdgeInsets.symmetric(
                                                      //     horizontal: 1.5.w,
                                                      //   ),
                                                      //   child: SizedBox(
                                                      //     width: 35.w,
                                                      //     child: Text(
                                                      //       textAlign:
                                                      //           TextAlign.center,
                                                      //       overflow: TextOverflow
                                                      //           .ellipsis,
                                                      //       maxLines: 2,
                                                      //       brandWiceProductsearchmodel
                                                      //               ?.data?[
                                                      //                   index]
                                                      //               .productShortDesc ??
                                                      //           '',
                                                      //       style: TextStyle(
                                                      //         fontSize: 11.sp,
                                                      //         fontFamily: 'task',
                                                      //         fontWeight:
                                                      //             FontWeight
                                                      //                 .normal,
                                                      //         letterSpacing: 1,
                                                      //         color: Colors.black,
                                                      //       ),
                                                      //     ),
                                                      //   ),
                                                      // ),
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              Text(
                                                                '₹' +
                                                                    (shortbymodel
                                                                            ?.searchResults?[index]
                                                                            .productPrice)
                                                                        .toString(),
                                                                style:
                                                                    TextStyle(
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
                                                                          productdetailnovartion(
                                                                            productid:
                                                                                shortbymodel?.searchResults?[index].productID ?? '',
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
                                                          width: 32.w,
                                                          decoration: BoxDecoration(
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10),
                                                              color: Color(
                                                                  0xff0061b0)),
                                                          child: Text(
                                                            "View Product",
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                color: Colors
                                                                    .white),
                                                          ),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
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
                                                                builder: (context) =>
                                                                    LoginPage2()))
                                                        : shortbymodel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? removewishlistap(
                                                                (shortbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                            : addwishlistap((shortbymodel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .productID)
                                                                .toString());
                                                  },
                                                  child: Icon(
                                                    shortbymodel
                                                                ?.searchResults?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 20.sp,
                                                    color: shortbymodel
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
                                      childCount:
                                          shortbymodel?.searchResults?.length,
                                    ),
                                  )
                                : type1 == "1"
                                    ? SliverGrid(
                                        gridDelegate:
                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                maxCrossAxisExtent:
                                                    200, // Adjust as needed
                                                mainAxisSpacing:
                                                    0.0, // Adjust as needed
                                                crossAxisSpacing:
                                                    0.0, // Adjust as needed
                                                childAspectRatio: 6.5 /
                                                    7.5 // Adjust as needed
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
                                                                productdetailnovartion(
                                                                  productid: filterbymodel
                                                                          ?.searchResults?[
                                                                              index]
                                                                          .productID ??
                                                                      '',
                                                                )));
                                                  },
                                                  child: Card(
                                                    color: Colors.white,
                                                    child: Container(
                                                      decoration: BoxDecoration(
                                                          color: Colors.white,
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(
                                                                      10)),
                                                      child: Column(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .center,
                                                        children: [
                                                          SizedBox(
                                                            height: 2.h,
                                                          ),
                                                          Container(
                                                            child:
                                                                CachedNetworkImage(
                                                              imageUrl: filterbymodel
                                                                          ?.searchResults?[
                                                                              index]
                                                                          .allImages
                                                                          ?.length ==
                                                                      0
                                                                  ? ''
                                                                  : filterbymodel
                                                                          ?.searchResults?[
                                                                              index]
                                                                          .allImages?[0] ??
                                                                      '',
                                                              fit: BoxFit.cover,
                                                              height: 9.5.h,
                                                              width: 25.w,
                                                              imageBuilder:
                                                                  (context,
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
                                                                    fit: BoxFit
                                                                        .cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context,
                                                                      url) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                              errorWidget: (context,
                                                                      url,
                                                                      error) =>
                                                                  Icon(Icons
                                                                      .error),
                                                            ),
                                                          ),
                                                          SizedBox(
                                                            height: 1.h,
                                                          ),
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        1.w),
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
                                                                      width:
                                                                          30.w,
                                                                      child:
                                                                          Text(
                                                                        textAlign:
                                                                            TextAlign.center,
                                                                        overflow:
                                                                            TextOverflow.ellipsis,
                                                                        maxLines:
                                                                            1,
                                                                        filterbymodel?.searchResults?[index].productName ??
                                                                            '',
                                                                        style: TextStyle(
                                                                            fontSize: 11
                                                                                .sp,
                                                                            fontFamily:
                                                                                'task',
                                                                            fontWeight: FontWeight
                                                                                .bold,
                                                                            letterSpacing:
                                                                                1,
                                                                            color:
                                                                                Colors.black),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                          ),
                                                          // Padding(
                                                          //   padding:
                                                          //       EdgeInsets.symmetric(
                                                          //     horizontal: 1.5.w,
                                                          //   ),
                                                          //   child: SizedBox(
                                                          //     width: 35.w,
                                                          //     child: Text(
                                                          //       textAlign:
                                                          //           TextAlign.center,
                                                          //       overflow: TextOverflow
                                                          //           .ellipsis,
                                                          //       maxLines: 2,
                                                          //       brandWiceProductsearchmodel
                                                          //               ?.data?[
                                                          //                   index]
                                                          //               .productShortDesc ??
                                                          //           '',
                                                          //       style: TextStyle(
                                                          //         fontSize: 11.sp,
                                                          //         fontFamily: 'task',
                                                          //         fontWeight:
                                                          //             FontWeight
                                                          //                 .normal,
                                                          //         letterSpacing: 1,
                                                          //         color: Colors.black,
                                                          //       ),
                                                          //     ),
                                                          //   ),
                                                          // ),
                                                          Row(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                children: [
                                                                  Text(
                                                                    '₹' +
                                                                        (filterbymodel?.searchResults?[index].productPrice)
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
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
                                                                      builder: (context) =>
                                                                          productdetailnovartion(
                                                                            productid:
                                                                                filterbymodel?.searchResults?[index].productID ?? '',
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
                                                                  Alignment
                                                                      .center,
                                                              height: 4.h,
                                                              width: 32.w,
                                                              decoration: BoxDecoration(
                                                                  borderRadius:
                                                                      BorderRadius
                                                                          .circular(
                                                                              10),
                                                                  color: Color(
                                                                      0xff0061b0)),
                                                              child: Text(
                                                                "View Product",
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        11.sp,
                                                                    color: Colors
                                                                        .white),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Positioned(
                                                    left: 37.w,
                                                    top: 1.h,
                                                    child: GestureDetector(
                                                      onTap: () {
                                                        usermodal?.userId ==
                                                                    "" ||
                                                                usermodal
                                                                        ?.userId ==
                                                                    null
                                                            ? Navigator.of(
                                                                    context)
                                                                .push(MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            LoginPage2()))
                                                            : filterbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .wishlist ==
                                                                    1
                                                                ? removewishlistap((filterbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                                : addwishlistap((filterbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productID)
                                                                    .toString());
                                                      },
                                                      child: Icon(
                                                        filterbymodel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? Icons.favorite
                                                            : Icons
                                                                .favorite_outline,
                                                        size: 20.sp,
                                                        color: filterbymodel
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
                                          childCount: filterbymodel
                                              ?.searchResults?.length,
                                        ),
                                      )
                                    : type1 == "2"
                                        ? SliverGrid(
                                            gridDelegate:
                                                SliverGridDelegateWithMaxCrossAxisExtent(
                                                    maxCrossAxisExtent:
                                                        200, // Adjust as needed
                                                    mainAxisSpacing:
                                                        0.0, // Adjust as needed
                                                    crossAxisSpacing:
                                                        0.0, // Adjust as needed
                                                    childAspectRatio: 6.5 /
                                                        7.9 // Adjust as needed
                                                    ),
                                            delegate:
                                                SliverChildBuilderDelegate(
                                              (BuildContext context,
                                                  int index) {
                                                return Stack(
                                                  children: [
                                                    GestureDetector(
                                                      onTap: () {
                                                        Navigator.of(context).push(
                                                            MaterialPageRoute(
                                                                builder:
                                                                    (context) =>
                                                                        productdetailnovartion(
                                                                          productid:
                                                                              filterbymodel?.searchResults?[index].productID ?? '',
                                                                        )));
                                                      },
                                                      child: Card(
                                                        color: Colors.white,
                                                        child: Container(
                                                          decoration: BoxDecoration(
                                                              color:
                                                                  Colors.white,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          10)),
                                                          child: Column(
                                                            mainAxisAlignment:
                                                                MainAxisAlignment
                                                                    .center,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              SizedBox(
                                                                height: 2.h,
                                                              ),
                                                              Container(
                                                                child:
                                                                    CachedNetworkImage(
                                                                  imageUrl: filterbymodel
                                                                              ?.searchResults?[
                                                                                  index]
                                                                              .allImages
                                                                              ?.length ==
                                                                          0
                                                                      ? ''
                                                                      : filterbymodel
                                                                              ?.searchResults?[index]
                                                                              .allImages?[0] ??
                                                                          '',
                                                                  fit: BoxFit
                                                                      .cover,
                                                                  height: 9.5.h,
                                                                  width: 25.w,
                                                                  imageBuilder:
                                                                      (context,
                                                                              imageProvider) =>
                                                                          Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      // borderRadius: BorderRadius.circular(10),
                                                                      image:
                                                                          DecorationImage(
                                                                        filterQuality:
                                                                            FilterQuality.high,
                                                                        image:
                                                                            imageProvider,
                                                                        fit: BoxFit
                                                                            .cover,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  placeholder: (context,
                                                                          url) =>
                                                                      Center(
                                                                          child:
                                                                              CircularProgressIndicator()),
                                                                  errorWidget: (context,
                                                                          url,
                                                                          error) =>
                                                                      Icon(Icons
                                                                          .error),
                                                                ),
                                                              ),
                                                              SizedBox(
                                                                height: 1.h,
                                                              ),
                                                              Padding(
                                                                padding: EdgeInsets
                                                                    .symmetric(
                                                                        horizontal:
                                                                            1.w),
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
                                                                          width:
                                                                              30.w,
                                                                          child:
                                                                              Text(
                                                                            textAlign:
                                                                                TextAlign.center,
                                                                            overflow:
                                                                                TextOverflow.ellipsis,
                                                                            maxLines:
                                                                                1,
                                                                            filterbymodel?.searchResults?[index].productName ??
                                                                                '',
                                                                            style: TextStyle(
                                                                                fontSize: 11.sp,
                                                                                fontFamily: 'task',
                                                                                fontWeight: FontWeight.bold,
                                                                                letterSpacing: 1,
                                                                                color: Colors.black),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ],
                                                                ),
                                                              ),
                                                              // Padding(
                                                              //   padding:
                                                              //       EdgeInsets.symmetric(
                                                              //     horizontal: 1.5.w,
                                                              //   ),
                                                              //   child: SizedBox(
                                                              //     width: 35.w,
                                                              //     child: Text(
                                                              //       textAlign:
                                                              //           TextAlign.center,
                                                              //       overflow: TextOverflow
                                                              //           .ellipsis,
                                                              //       maxLines: 2,
                                                              //       brandWiceProductsearchmodel
                                                              //               ?.data?[
                                                              //                   index]
                                                              //               .productShortDesc ??
                                                              //           '',
                                                              //       style: TextStyle(
                                                              //         fontSize: 11.sp,
                                                              //         fontFamily: 'task',
                                                              //         fontWeight:
                                                              //             FontWeight
                                                              //                 .normal,
                                                              //         letterSpacing: 1,
                                                              //         color: Colors.black,
                                                              //       ),
                                                              //     ),
                                                              //   ),
                                                              // ),
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  Row(
                                                                    children: [
                                                                      // Text(
                                                                      //   '₹' +
                                                                      //       (filterbymodel
                                                                      //           ?.searchResults?[
                                                                      //       index]
                                                                      //           .saleProductPrice)
                                                                      //           .toString(),
                                                                      //   style: TextStyle(
                                                                      //     fontSize: 11.sp,
                                                                      //     fontFamily:
                                                                      //     'task',
                                                                      //     fontWeight:
                                                                      //     FontWeight
                                                                      //         .bold,
                                                                      //     letterSpacing:
                                                                      //     1,
                                                                      //     color: Colors
                                                                      //         .black,
                                                                      //   ),
                                                                      // ),

                                                                      Text(
                                                                        '₹' +
                                                                            (filterbymodel?.searchResults?[index].productPrice).toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          fontSize:
                                                                              12.sp,
                                                                          fontFamily:
                                                                              'task',
                                                                          fontWeight:
                                                                              FontWeight.normal,
                                                                          letterSpacing:
                                                                              1,
                                                                          color:
                                                                              Colors.black,
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
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(MaterialPageRoute(
                                                                          builder: (context) => productdetailnovartion(
                                                                                productid: filterbymodel?.searchResults?[index].productID ?? '',
                                                                              )));

                                                                  //ADD CART API
                                                                  // addtocartapi((allsubcatwiceproduct
                                                                  //     ?.subcategoriesWiseProduct?[
                                                                  // index]
                                                                  //     .productID ??
                                                                  //     ''));
                                                                },
                                                                child:
                                                                    Container(
                                                                  alignment:
                                                                      Alignment
                                                                          .center,
                                                                  height: 4.h,
                                                                  width: 32.w,
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Color(
                                                                          0xff0061b0)),
                                                                  child: Text(
                                                                    "View Product",
                                                                    style: TextStyle(
                                                                        fontSize: 11
                                                                            .sp,
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                        left: 37.w,
                                                        top: 1.h,
                                                        child: GestureDetector(
                                                          onTap: () {
                                                            usermodal?.userId ==
                                                                        "" ||
                                                                    usermodal
                                                                            ?.userId ==
                                                                        null
                                                                ? Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder: (context) =>
                                                                            LoginPage2()))
                                                                : filterbymodel
                                                                            ?.searchResults?[
                                                                                index]
                                                                            .wishlist ==
                                                                        1
                                                                    ? removewishlistap((filterbymodel
                                                                            ?.searchResults?[
                                                                                index]
                                                                            .productID)
                                                                        .toString())
                                                                    : addwishlistap((filterbymodel
                                                                            ?.searchResults?[index]
                                                                            .productID)
                                                                        .toString());
                                                          },
                                                          child: Icon(
                                                            filterbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .wishlist ==
                                                                    1
                                                                ? Icons.favorite
                                                                : Icons
                                                                    .favorite_outline,
                                                            size: 20.sp,
                                                            color: filterbymodel
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
                                              childCount: filterbymodel
                                                  ?.searchResults?.length,
                                            ),
                                          )
                                        : _serch2.text != ''
                                            ? brandWiceProductsearchmodel
                                                            ?.data?.length ==
                                                        0 ||
                                                    brandWiceProductsearchmodel
                                                            ?.data?.length ==
                                                        null
                                                ? SliverToBoxAdapter(
                                                    child: Container(
                                                      height: 70.h,
                                                      child: Center(
                                                          child: Text(
                                                        'No Medicine Available',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily: 'task',
                                                          fontSize: 15.sp,
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
                                                                0.0, // Adjust as needed
                                                            crossAxisSpacing:
                                                                0.0, // Adjust as needed
                                                            childAspectRatio: 6.5 /
                                                                7.9 // Adjust as needed
                                                            ),
                                                    delegate:
                                                        SliverChildBuilderDelegate(
                                                      (BuildContext context,
                                                          int index) {
                                                        return Stack(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder: (context) => productdetailnovartion(
                                                                              productid: brandWiceProductsearchmodel?.data?[index].productID ?? '',
                                                                            )));
                                                              },
                                                              child: Card(
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10)),
                                                                  child: Column(
                                                                    mainAxisAlignment:
                                                                        MainAxisAlignment
                                                                            .center,
                                                                    crossAxisAlignment:
                                                                        CrossAxisAlignment
                                                                            .center,
                                                                    children: [
                                                                      SizedBox(
                                                                        height:
                                                                            2.h,
                                                                      ),
                                                                      Container(
                                                                        child:
                                                                            CachedNetworkImage(
                                                                          imageUrl: brandWiceProductsearchmodel?.data?[index].productImages?.length == 0
                                                                              ? ''
                                                                              : brandWiceProductsearchmodel?.data?[index].productImages?[0] ?? '',
                                                                          fit: BoxFit
                                                                              .cover,
                                                                          height:
                                                                              9.5.h,
                                                                          width:
                                                                              25.w,
                                                                          imageBuilder: (context, imageProvider) =>
                                                                              Container(
                                                                            decoration:
                                                                                BoxDecoration(
                                                                              // borderRadius: BorderRadius.circular(10),
                                                                              image: DecorationImage(
                                                                                filterQuality: FilterQuality.high,
                                                                                image: imageProvider,
                                                                                fit: BoxFit.cover,
                                                                              ),
                                                                            ),
                                                                          ),
                                                                          placeholder: (context, url) =>
                                                                              Center(child: CircularProgressIndicator()),
                                                                          errorWidget: (context, url, error) =>
                                                                              Icon(Icons.error),
                                                                        ),
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            1.h,
                                                                      ),
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.symmetric(horizontal: 1.w),
                                                                        child:
                                                                            Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          children: [
                                                                            Column(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              crossAxisAlignment: CrossAxisAlignment.center,
                                                                              children: [
                                                                                SizedBox(
                                                                                  width: 30.w,
                                                                                  child: Text(
                                                                                    textAlign: TextAlign.center,
                                                                                    overflow: TextOverflow.ellipsis,
                                                                                    maxLines: 1,
                                                                                    brandWiceProductsearchmodel?.data?[index].productName ?? '',
                                                                                    style: TextStyle(fontSize: 11.sp, fontFamily: 'task', fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.black),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                      // Padding(
                                                                      //   padding:
                                                                      //       EdgeInsets.symmetric(
                                                                      //     horizontal: 1.5.w,
                                                                      //   ),
                                                                      //   child: SizedBox(
                                                                      //     width: 35.w,
                                                                      //     child: Text(
                                                                      //       textAlign:
                                                                      //           TextAlign.center,
                                                                      //       overflow: TextOverflow
                                                                      //           .ellipsis,
                                                                      //       maxLines: 2,
                                                                      //       brandWiceProductsearchmodel
                                                                      //               ?.data?[
                                                                      //                   index]
                                                                      //               .productShortDesc ??
                                                                      //           '',
                                                                      //       style: TextStyle(
                                                                      //         fontSize: 11.sp,
                                                                      //         fontFamily: 'task',
                                                                      //         fontWeight:
                                                                      //             FontWeight
                                                                      //                 .normal,
                                                                      //         letterSpacing: 1,
                                                                      //         color: Colors.black,
                                                                      //       ),
                                                                      //     ),
                                                                      //   ),
                                                                      // ),
                                                                      Row(
                                                                        mainAxisAlignment:
                                                                            MainAxisAlignment.center,
                                                                        children: [
                                                                          Row(
                                                                            children: [
                                                                              // Text(
                                                                              //   '₹' +
                                                                              //       (brandWiceProductsearchmodel
                                                                              //               ?.data?[
                                                                              //                   index]
                                                                              //               .saleProductPrice)
                                                                              //           .toString(),
                                                                              //   style: TextStyle(
                                                                              //     fontSize: 11.sp,
                                                                              //     fontFamily:
                                                                              //         'task',
                                                                              //     fontWeight:
                                                                              //         FontWeight
                                                                              //             .bold,
                                                                              //     letterSpacing:
                                                                              //         1,
                                                                              //     color: Colors
                                                                              //         .black,
                                                                              //   ),
                                                                              // ),
                                                                              // SizedBox(
                                                                              //   width: 1.w,
                                                                              // ),
                                                                              Text(
                                                                                '₹' + (brandWiceProductsearchmodel?.data?[index].productPrice).toString(),
                                                                                style: TextStyle(
                                                                                  fontSize: 12.sp,
                                                                                  fontFamily: 'task',
                                                                                  fontWeight: FontWeight.normal,
                                                                                  letterSpacing: 1,
                                                                                  color: Colors.black,
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ],
                                                                      ),
                                                                      SizedBox(
                                                                        height:
                                                                            1.h,
                                                                      ),
                                                                      GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          Navigator.of(context).push(MaterialPageRoute(
                                                                              builder: (context) => productdetailnovartion(
                                                                                    productid: brandWiceProductsearchmodel?.data?[index].productID ?? '',
                                                                                  )));

                                                                          //ADD CART API
                                                                          // addtocartapi((allsubcatwiceproduct
                                                                          //     ?.subcategoriesWiseProduct?[
                                                                          // index]
                                                                          //     .productID ??
                                                                          //     ''));
                                                                        },
                                                                        child:
                                                                            Container(
                                                                          alignment:
                                                                              Alignment.center,
                                                                          height:
                                                                              4.h,
                                                                          width:
                                                                              32.w,
                                                                          decoration: BoxDecoration(
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              color: Color(0xff0061b0)),
                                                                          child:
                                                                              Text(
                                                                            "View Product",
                                                                            style:
                                                                                TextStyle(fontSize: 11.sp, color: Colors.white),
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ],
                                                                  ),
                                                                ),
                                                              ),
                                                            ),
                                                            Positioned(
                                                                left: 37.w,
                                                                top: 1.h,
                                                                child:
                                                                    GestureDetector(
                                                                  onTap: () {
                                                                    usermodal?.userId ==
                                                                                "" ||
                                                                            usermodal?.userId ==
                                                                                null
                                                                        ? Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                LoginPage2()))
                                                                        : brandWiceProductsearchmodel?.data?[index].wishlist ==
                                                                                1
                                                                            ? removewishlistap((brandWiceProductsearchmodel?.data?[index].productID).toString())
                                                                            : addwishlistap((brandWiceProductsearchmodel?.data?[index].productID).toString());
                                                                  },
                                                                  child: Icon(
                                                                    brandWiceProductsearchmodel?.data?[index].wishlist ==
                                                                            1
                                                                        ? Icons
                                                                            .favorite
                                                                        : Icons
                                                                            .favorite_outline,
                                                                    size: 20.sp,
                                                                    color: brandWiceProductsearchmodel?.data?[index].wishlist ==
                                                                            1
                                                                        ? Colors
                                                                            .red
                                                                        : Colors
                                                                            .black,
                                                                  ),
                                                                )),
                                                          ],
                                                        );
                                                      },
                                                      childCount:
                                                          brandWiceProductsearchmodel
                                                              ?.data?.length,
                                                    ),
                                                  )
                                            : brandWiceProductmodel
                                                            ?.data?.length ==
                                                        0 ||
                                                    brandWiceProductmodel
                                                            ?.data?.length ==
                                                        null
                                                ? SliverToBoxAdapter(
                                                    child: Container(
                                                      height: 70.h,
                                                      child: Center(
                                                          child: Text(
                                                        'No Medicine Available',
                                                        style: TextStyle(
                                                          fontWeight:
                                                              FontWeight.normal,
                                                          fontFamily: 'task',
                                                          fontSize: 15.sp,
                                                        ),
                                                      )),
                                                    ),
                                                  )
                                                : isloding == true
                                                    ? SliverToBoxAdapter(
                                                        child: Center(
                                                            child:
                                                                CircularProgressIndicator()))
                                                    : SliverGrid(
                                                        gridDelegate:
                                                            SliverGridDelegateWithMaxCrossAxisExtent(
                                                                maxCrossAxisExtent:
                                                                    200, // Adjust as needed
                                                                mainAxisSpacing:
                                                                    0.0, // Adjust as needed
                                                                crossAxisSpacing:
                                                                    0.0, // Adjust as needed
                                                                childAspectRatio:
                                                                    6.5 /
                                                                        7.9 // Adjust as needed
                                                                ),
                                                        delegate:
                                                            SliverChildBuilderDelegate(
                                                          (BuildContext context,
                                                              int index) {
                                                            if (index <
                                                                posts.length) {
                                                              final post =
                                                                  posts[index];
                                                              return Stack(
                                                                children: [
                                                                  GestureDetector(
                                                                    onTap: () {
                                                                      Navigator.of(context).push(MaterialPageRoute(
                                                                          builder: (context) => productdetailnovartion(
                                                                                productid: brandWiceProductmodel?.data?[index].productID ?? '',
                                                                              )));
                                                                    },
                                                                    child: Card(
                                                                      color: Colors
                                                                          .white,
                                                                      child:
                                                                          Container(
                                                                        decoration: BoxDecoration(
                                                                            color:
                                                                                Colors.white,
                                                                            borderRadius: BorderRadius.circular(10)),
                                                                        child:
                                                                            Column(
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
                                                                                imageUrl: brandWiceProductmodel?.data?[index].productImages?.length == 0 ? '' : brandWiceProductmodel?.data?[index].productImages?[0] ?? '',
                                                                                fit: BoxFit.cover,
                                                                                height: 9.5.h,
                                                                                width: 25.w,
                                                                                imageBuilder: (context, imageProvider) => Container(
                                                                                  decoration: BoxDecoration(
                                                                                    // borderRadius: BorderRadius.circular(10),
                                                                                    image: DecorationImage(
                                                                                      filterQuality: FilterQuality.high,
                                                                                      image: imageProvider,
                                                                                      fit: BoxFit.cover,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height: 1.h,
                                                                            ),
                                                                            Padding(
                                                                              padding: EdgeInsets.symmetric(horizontal: 1.w),
                                                                              child: Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                children: [
                                                                                  Column(
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    children: [
                                                                                      SizedBox(
                                                                                        width: 30.w,
                                                                                        child: Text(
                                                                                          textAlign: TextAlign.center,
                                                                                          overflow: TextOverflow.ellipsis,
                                                                                          maxLines: 1,
                                                                                          brandWiceProductmodel?.data?[index].productName ?? '',
                                                                                          style: TextStyle(fontSize: 11.sp, fontFamily: 'task', fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.black),
                                                                                        ),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ),
                                                                            // Padding(
                                                                            //   padding:
                                                                            //       EdgeInsets.symmetric(
                                                                            //     horizontal: 1.5.w,
                                                                            //   ),
                                                                            //   child: SizedBox(
                                                                            //     width: 35.w,
                                                                            //     child: Text(
                                                                            //       textAlign:
                                                                            //           TextAlign.center,
                                                                            //       overflow: TextOverflow
                                                                            //           .ellipsis,
                                                                            //       maxLines: 2,
                                                                            //       salesproductlistmodal
                                                                            //               ?.productData?[
                                                                            //                   index]
                                                                            //               .productShortDesc ??
                                                                            //           '',
                                                                            //       style: TextStyle(
                                                                            //         fontSize: 12.sp,
                                                                            //         fontFamily: 'task',
                                                                            //         fontWeight:
                                                                            //             FontWeight
                                                                            //                 .normal,
                                                                            //         letterSpacing: 1,
                                                                            //         color: Colors.black,
                                                                            //       ),
                                                                            //     ),
                                                                            //   ),
                                                                            // ),
                                                                            Row(
                                                                              mainAxisAlignment: MainAxisAlignment.center,
                                                                              children: [
                                                                                Row(
                                                                                  children: [
                                                                                    // Text(
                                                                                    //   '₹' +
                                                                                    //       (brandWiceProductmodel
                                                                                    //           ?.data?[
                                                                                    //       index]
                                                                                    //           .saleProductPrice)
                                                                                    //           .toString(),
                                                                                    //   style: TextStyle(
                                                                                    //     fontSize: 11.sp,
                                                                                    //     fontFamily:
                                                                                    //     'task',
                                                                                    //     fontWeight:
                                                                                    //     FontWeight
                                                                                    //         .bold,
                                                                                    //     letterSpacing:
                                                                                    //     1,
                                                                                    //     color: Colors
                                                                                    //         .black,
                                                                                    //   ),
                                                                                    // ),
                                                                                    // SizedBox(
                                                                                    //   width: 0.5.w,
                                                                                    // ),
                                                                                    Padding(
                                                                                      padding: EdgeInsets.only(top: 0.4.h),
                                                                                      child: Text(
                                                                                        '₹' + (brandWiceProductmodel?.data?[index].productPrice).toString(),
                                                                                        style: TextStyle(
                                                                                          fontSize: 12.sp,
                                                                                          fontFamily: 'task',
                                                                                          fontWeight: FontWeight.normal,
                                                                                          letterSpacing: 1,
                                                                                          color: Colors.black,
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
                                                                                Navigator.of(context).push(MaterialPageRoute(
                                                                                    builder: (context) => productdetailnovartion(
                                                                                          productid: brandWiceProductmodel?.data?[index].productID ?? '',
                                                                                        )));

                                                                                //ADD CART API
                                                                                // addtocartapi((allsubcatwiceproduct
                                                                                //     ?.subcategoriesWiseProduct?[
                                                                                // index]
                                                                                //     .productID ??
                                                                                //     ''));
                                                                              },
                                                                              child: Container(
                                                                                alignment: Alignment.center,
                                                                                height: 4.h,
                                                                                width: 32.w,
                                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff0061b0)),
                                                                                child: Text(
                                                                                  "View Product",
                                                                                  style: TextStyle(fontSize: 11.sp, color: Colors.white),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ),
                                                                  Positioned(
                                                                      left:
                                                                          37.w,
                                                                      top: 1.h,
                                                                      child:
                                                                          GestureDetector(
                                                                        onTap:
                                                                            () {
                                                                          usermodal?.userId == "" || usermodal?.userId == null
                                                                              ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage2()))
                                                                              : brandWiceProductmodel?.data?[index].wishlist == 1
                                                                                  ? removewishlistap((brandWiceProductmodel?.data?[index].productID).toString())
                                                                                  : addwishlistap((brandWiceProductmodel?.data?[index].productID).toString());
                                                                        },
                                                                        child:
                                                                            Icon(
                                                                          brandWiceProductmodel?.data?[index].wishlist == 1
                                                                              ? Icons.favorite
                                                                              : Icons.favorite_outline,
                                                                          size:
                                                                              20.sp,
                                                                          color: brandWiceProductmodel?.data?[index].wishlist == 1
                                                                              ? Colors.red
                                                                              : Colors.black,
                                                                        ),
                                                                      )),
                                                                ],
                                                              );
                                                            } else {
                                                              return Center(
                                                                  child:
                                                                      SizedBox());
                                                            }
                                                          },
                                                          childCount: isloadingMore
                                                              ? posts.length + 1
                                                              : posts
                                                                  .length, // Replace with the number of grid items you want
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
      width: 90.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _serch2,
        onTap: () {},
        onChanged: (value) {
          brandwiceproductserach(_serch2.text);
        },
        style: TextStyle(color: Colors.black, fontFamily: 'task'),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          //contentPadding: EdgeInsets.all(0),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          suffixIcon: _serch2.text.isNotEmpty
              ? IconButton(
                  icon: Icon(
                    Icons.close,
                    color: Colors.black,
                    size: 13.sp,
                  ),
                  onPressed: () {
                    setState(() {
                      _serch2.clear(); // Clear the text in the TextField
                      //_issearch = false; // Reset the search state if needed
                    });
                    brandwiceproductserach(
                        _serch2.text); // Call the API with empty search
                  },
                )
              : null,
          border: InputBorder.none,
          hintText: 'Search Products',
          hintStyle: TextStyle(
              color: Colors.black, fontFamily: 'task', fontSize: 12.sp),
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
            brandswiceproductap();
            brandwiceproductserach(_serch2.text);
            filterbysearch(value);
            shortbyap(value);
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
            brandswiceproductap();
            brandwiceproductserach(_serch2.text);
            filterbysearch(value);
            shortbyap(value);
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

  brandswiceproductap() async {
    final Map<String, String> data = {};
    data['brand_id'] = widget.allcatid.toString();
    data['User_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().brandswiceproductapi(data).then((response) async {
          brandWiceProductmodel =
              BrandWiceProductModel.fromJson(json.decode(response.body));
          print(brandWiceProductmodel?.status);
          if (response.statusCode == 200 &&
              brandWiceProductmodel?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            setState(() {
              isLoading = false;
              type1 = "";
              short = "";
            });
          } else {
            setState(() {
              isLoading = false;
              type1 = "";
              short = "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1 = "";
          short = "";
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  brandwiceproductserach(String value) async {
    final Map<String, String> data = {};
    data['brand_id'] = widget.allcatid.toString();
    data['search_term'] = value.toString();
    data['User_id'] = (usermodal?.userId).toString();
    print('AA dada : ${data}');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().brandswiceproductsearchapi(data).then((response) async {
          brandWiceProductsearchmodel =
              BrandWiceProductsearchModel.fromJson(json.decode(response.body));
          print(brandWiceProductsearchmodel?.status);
          if (response.statusCode == 200 &&
              brandWiceProductsearchmodel?.status == "success") {
            setState(() {
              isLoading = false;
              type1 = "";
              short = "";
            });
          } else {
            setState(() {
              isLoading = false;
              type1 = "";
              short = "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1 = "";
          short = "";
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  filterbysearch(String value) async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['User_id'] = (usermodal?.userId).toString();
    data['priceSort'] = type1.toString();
    print('AA dada : ${data}');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().filterserchapi(data).then((response) async {
          filterbymodel = FilterbyModel.fromJson(json.decode(response.body));
          print(filterbymodel?.status);
          if (response.statusCode == 200 &&
              filterbymodel?.status == "success") {
            EasyLoading.showSuccess('success');
            setState(() {
              isLoading = false;
              short = "";
            });
          } else {
            setState(() {
              isLoading = false;
              short = "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          short = "";
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  shortbyap(String value) async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['User_id'] = (usermodal?.userId).toString();
    data['sortOrder'] = short.toString();
    print('AA dada : ${data}');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().shortsearchapi(data).then((response) async {
          shortbymodel = ShortbyModel.fromJson(json.decode(response.body));
          print(shortbymodel?.status);
          if (response.statusCode == 200 && shortbymodel?.status == "success") {
            EasyLoading.showSuccess('success');
            setState(() {
              isLoading = false;
              type1 = "";
            });
          } else {
            setState(() {
              isLoading = false;
              type1 = "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1 = "";
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  brandwicepageapi() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['page'] = "$page";
    data['brand_id'] = widget.allcatid.toString();
    data['limit'] = "6";
    checkInternet().then((internet) async {
      print("555555555555555");
      if (internet) {
        authprovider().brandwicepage(data).then((response) async {
          brandwicePageviewmodel =
              BrandwicePageViewModel.fromJson(json.decode(response.body));
          print(brandwicePageviewmodel?.status);
          if (response.statusCode == 200 &&
              brandwicePageviewmodel?.status == "success") {
            print("6666666666666");
            final jsonResponse = jsonDecode(response.body);
            final jsonAppointments = jsonResponse['data'];
            List<dynamic> currentNames =
                posts.map((post) => post['ProductID']).toList();

            // Filter out appointments with names that already exist in the posts list
            final uniqueAppointments = jsonAppointments.where((appointment) {
              return !currentNames.contains(appointment['ProductID']);
            }).toList();

            setState(() {
              posts = posts + jsonAppointments;
              isloding = false;
            });

            print('EE Thay Gyu Hooooo ${posts.length} ! ^_^');
            // setState(() {
            //   isLoading = false;
            //   type1= "";
            //   short= "";
            // });
          } else {
            setState(() {
              isLoading = false;
              type1 = "";
              short = "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1 = "";
          short = "";
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  Future<void> _scrollListener() async {
    if (isloadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isloadingMore = true;
      });
      page = page + 1;
      print("$page");
      await brandwicepageapi();
      setState(() {
        isloadingMore = false;
      });
    }
  }
}
