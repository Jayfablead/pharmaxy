import 'dart:async';
import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/CatWiceProductModal.dart';
import 'package:ecommerce/Modal/CateWisePageViewModel.dart';
import 'package:ecommerce/Modal/FilterbyModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/ShortbyModel.dart';
import 'package:ecommerce/Modal/SubCatSerchModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
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

class ProductListPage extends StatefulWidget {
  String? catid;
  String? subcatid;
  String? allcatid;
  String? selid;
  String? name;

  ProductListPage(
      {super.key,
      this.catid,
      this.subcatid,
      this.allcatid,
      this.selid,
      this.name});

  @override
  State<ProductListPage> createState() => _ProductListPageState();
}

bool name = false;

bool filterandnsort = false;
bool type = false;
bool sort = false;
TextEditingController _serch = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKeylist1 = GlobalKey<ScaffoldState>();
bool _isLoading = false;
bool _issearch = false;
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
  double calculatePercentageOfffilter(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        filterbymodel?.searchResults?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        filterbymodel?.searchResults?[index].saleProductPrice ?? '0');

    // Debugging: Print the sale product price
    print('Sale Product Price: $saleProductPrice');

    // Check if any values are null or zero
    if (productPrice == null || saleProductPrice == null || productPrice == 0) {
      return 0.0; // Avoid division by zero
    }

    // Check if productPrice is greater than saleProductPrice
    if (productPrice <= saleProductPrice) {
      return 0.0; // No discount, so return 0%
    }

    // Calculate the percentage off
    return ((productPrice - saleProductPrice) / productPrice) * 100;
  }

  double calculatePercentageOffshortby(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        shortbymodel?.searchResults?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        shortbymodel?.searchResults?[index].saleProductPrice ?? '0');

    // Debugging: Print the sale product price
    print('Sale Product Price: $saleProductPrice');

    // Check if any values are null or zero
    if (productPrice == null || saleProductPrice == null || productPrice == 0) {
      return 0.0; // Avoid division by zero
    }

    // Check if productPrice is greater than saleProductPrice
    if (productPrice <= saleProductPrice) {
      return 0.0; // No discount, so return 0%
    }

    // Calculate the percentage off
    return ((productPrice - saleProductPrice) / productPrice) * 100;
  }

  double calculatePercentageOffcatesearch(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        catSerchModal?.categoriesWiseProduct?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        catSerchModal?.categoriesWiseProduct?[index].saleProductPrice ?? '0');

    // Debugging: Print the sale product price
    print('Sale Product Price: $saleProductPrice');

    // Check if any values are null or zero
    if (productPrice == null || saleProductPrice == null || productPrice == 0) {
      return 0.0; // Avoid division by zero
    }

    // Check if productPrice is greater than saleProductPrice
    if (productPrice <= saleProductPrice) {
      return 0.0; // No discount, so return 0%
    }

    // Calculate the percentage off
    return ((productPrice - saleProductPrice) / productPrice) * 100;
  }

  double calculatePercentageOffcatewiceproduct(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        catwiceproductmodal?.categoriesWiseProduct?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        catwiceproductmodal?.categoriesWiseProduct?[index].saleProductPrice ??
            '0');

    // Debugging: Print the sale product price
    print('Sale Product Price: $saleProductPrice');

    // Check if any values are null or zero
    if (productPrice == null || saleProductPrice == null || productPrice == 0) {
      return 0.0; // Avoid division by zero
    }

    // Check if productPrice is greater than saleProductPrice
    if (productPrice <= saleProductPrice) {
      return 0.0; // No discount, so return 0%
    }

    // Calculate the percentage off
    return ((productPrice - saleProductPrice) / productPrice) * 100;
  }

  final scrollController = ScrollController();
  List posts = [];
  bool isloding = true;
  int page = 1;
  bool isloadingMore = false;
  bool name = false;
  bool wait = false;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      _serch.text = '';
      type = false;
      sort = false;
      isLoading = true;
      filterandnsort = false;
      _isLoading = true;
    });
    scrollController.addListener(_scrollListener);
    caateeicepageapi();
    catwiceproductap();
    //subcatwiceallproductap();
  }

  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: bgcolor,
        key: _scaffoldKeylist1,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(
          selected: 0,
        ),
        body: WillPopScope(
          onWillPop: () async {
            Navigator.of(context).pushReplacement(MaterialPageRoute(
              builder: (context) => HomePage(sel: 1),
            ));
            return false;
          },
          child: isLoading
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
                                  // width: MediaQuery.of(context).size.width,
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      IconButton(
                                          onPressed: () {
                                            Navigator.of(context)
                                                .pushReplacement(
                                                    MaterialPageRoute(
                                              builder: (context) =>
                                                  HomePage(sel: 1),
                                            ));
                                            //Navigator.pop(context);
                                          },
                                          icon: Icon(
                                            Icons.arrow_back_ios_new_rounded,
                                            size: 16.sp,
                                          )),
                                      SizedBox(
                                        width: 30.w,
                                        child: Text(
                                          maxLines: 1,
                                          widget.name.toString(),
                                          style: TextStyle(
                                            overflow: TextOverflow.ellipsis,
                                            fontSize: 12.sp,
                                            fontFamily: "task",
                                            fontWeight: FontWeight.bold,
                                          ),
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
                                                    color: AppColors.primary)
                                                : Container(
                                                    margin:
                                                        EdgeInsets.symmetric(
                                                            horizontal: 1.w),
                                                    height: 12.2.w,
                                                    width: 12.25.w,
                                                    padding:
                                                        EdgeInsets.all(1.w),
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
                                // filter and Sort
                                Padding(
                                  padding:
                                      EdgeInsets.symmetric(horizontal: 2.w),
                                  child: Container(
                                    width: MediaQuery.of(context).size.width,
                                    alignment: Alignment.center,
                                    height: 50.0,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.0),
                                        color: Colors.grey.shade100,
                                        border: Border.all(
                                            color: AppColors.primary)),
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
                                                    shortbyap("1");
                                                    sort = true;
                                                    type = false;
                                                  });
                                                },
                                                child: Text(
                                                  "A to Z",
                                                  style: TextStyle(
                                                      fontFamily: "task",
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: "Z to A",
                                                onTap: () {
                                                  setState(() {
                                                    shortbyap("2");
                                                    sort = true;
                                                    type = false;
                                                  });
                                                },
                                                child: Text(
                                                  "Z to A",
                                                  style: TextStyle(
                                                      fontFamily: "task",
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(width: 10.0),
                                        PopupMenuButton<String>(
                                          child: Text(
                                            "Sort By",
                                            style: TextStyle(
                                              fontFamily: "task",
                                              fontSize: 15.0,
                                              fontWeight: FontWeight.w600,
                                              color: Color(0xff0061b0),
                                            ),
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
                                                  shortbyap("1");
                                                  sort = true;
                                                  type = false;
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
                                                  shortbyap("2");
                                                  sort = true;
                                                  type = false;
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
                                              if (value ==
                                                  "Price High to Low") {
                                                print(
                                                    "Filter by Price High to Low");
                                              }
                                            },
                                            itemBuilder: (context) => [
                                              PopupMenuItem(
                                                value: "Price High to Low",
                                                onTap: () {
                                                  setState(() {
                                                    filterbysearch("2");
                                                    type = true;
                                                    sort = false;
                                                  });
                                                },
                                                child: Text(
                                                  "Price High to Low",
                                                  style: TextStyle(
                                                      fontFamily: "task",
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
                                                      color: Colors.white),
                                                ),
                                              ),
                                              PopupMenuItem(
                                                value: "Price Low to High",
                                                onTap: () {
                                                  setState(() {
                                                    filterbysearch("1");
                                                    type = true;
                                                    sort = false;
                                                  });
                                                },
                                                child: Text(
                                                  "Price Low to High",
                                                  style: TextStyle(
                                                      fontFamily: "task",
                                                      fontSize: 15.0,
                                                      fontWeight:
                                                          FontWeight.w600,
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
                                                  filterbysearch("2");
                                                  type = true;
                                                  sort = false;
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
                                                  filterbysearch("1");
                                                  type = true;
                                                  sort = false;
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
                                catwiceproductmodal?.categoriesWiseProduct
                                                ?.length ==
                                            0 ||
                                        catwiceproductmodal
                                                ?.categoriesWiseProduct
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
                          filterandnsort
                              ? SliverToBoxAdapter(child: Container())
                              : sort
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
                                                  6.5 / 8.5 // Adjust as needed
                                              ),
                                      delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          double percentageOffValue =
                                              calculatePercentageOffshortby(
                                                  index);
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
                                                            BorderRadius
                                                                .circular(10)),
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
                                                            errorWidget:
                                                                (context, url,
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
                                                                    width: 30.w,
                                                                    child: Text(
                                                                      textAlign:
                                                                          TextAlign
                                                                              .center,
                                                                      overflow:
                                                                          TextOverflow
                                                                              .ellipsis,
                                                                      maxLines:
                                                                          1,
                                                                      shortbymodel
                                                                              ?.searchResults?[index]
                                                                              .productName ??
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
                                                        Row(
                                                          mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                if (shortbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .saleProductPrice !=
                                                                    shortbymodel
                                                                        ?.searchResults?[
                                                                            index]
                                                                        .productPrice)
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 0.4
                                                                            .h),
                                                                    child: Text(
                                                                      '₹' +
                                                                          (shortbymodel?.searchResults?[index].saleProductPrice)
                                                                              .toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        fontSize:
                                                                            11.sp,
                                                                        fontFamily:
                                                                            'task',
                                                                        fontWeight:
                                                                            FontWeight.normal,
                                                                        letterSpacing:
                                                                            1,
                                                                        color: Colors
                                                                            .black,
                                                                      ),
                                                                    ),
                                                                  ),
                                                                SizedBox(
                                                                  width: 1.w,
                                                                ),
                                                                Padding(
                                                                  padding: EdgeInsets
                                                                      .only(
                                                                          top: 0.4
                                                                              .h),
                                                                  child: Text(
                                                                    '₹' +
                                                                        (shortbymodel?.searchResults?[index].productPrice)
                                                                            .toString(),
                                                                    style:
                                                                        TextStyle(
                                                                      decoration: shortbymodel?.searchResults?[index].saleProductPrice != shortbymodel?.searchResults?[index].productPrice
                                                                          ? TextDecoration
                                                                              .lineThrough
                                                                          : TextDecoration
                                                                              .none,
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
                                                                SizedBox(
                                                                  width: 1.w,
                                                                ),
                                                                // percentageOffValue == null || percentageOffValue == 0
                                                                //     ? Container()
                                                                //     : Padding(
                                                                //   padding:  EdgeInsets.only(top: 0.4.h),
                                                                //   child: Container(
                                                                //     padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                //     decoration: BoxDecoration(
                                                                //       borderRadius: BorderRadius.circular(5),
                                                                //       color: Colors.red.shade400,
                                                                //     ),
                                                                //     child: Text(
                                                                //       '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                //       style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                //     ),
                                                                //   ),
                                                                // ),
                                                              ],
                                                            ),
                                                          ],
                                                        ),
                                                        SizedBox(height: 0.5.h),
                                                        GestureDetector(
                                                          onTap: () {
                                                            Navigator.of(context).push(
                                                                MaterialPageRoute(
                                                                    builder:
                                                                        (context) =>
                                                                            productdetailnovartion(
                                                                              productid: shortbymodel?.searchResults?[index].productID ?? '',
                                                                            )));

                                                            //ADD CART API
                                                            // addtocartapi((allsubcatwiceproduct
                                                            //     ?.subcategoriesWiseProduct?[
                                                            // index]
                                                            //     .productID ??
                                                            //     ''));
                                                          },
                                                          child: Container(
                                                            alignment: Alignment
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
                                                      usermodal?.userId == "" ||
                                                              usermodal
                                                                      ?.userId ==
                                                                  null
                                                          ? Navigator.of(
                                                                  context)
                                                              .push(MaterialPageRoute(
                                                                  builder:
                                                                      (context) =>
                                                                          LoginPage2()))
                                                          : shortbymodel
                                                                      ?.searchResults?[
                                                                          index]
                                                                      .wishlist ==
                                                                  1
                                                              ? removewishlistap((shortbymodel
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
                                              percentageOffValue == null ||
                                                      percentageOffValue == 0
                                                  ? Container()
                                                  : Positioned(
                                                      right: 27.w,
                                                      top: 0.7.h,
                                                      child: Container(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                                horizontal: 1.w,
                                                                vertical: 1.h),
                                                        decoration:
                                                            BoxDecoration(
                                                          color: Colors.red,
                                                          borderRadius:
                                                              BorderRadius.only(
                                                            topLeft:
                                                                Radius.circular(
                                                                    0),
                                                            topRight:
                                                                Radius.circular(
                                                                    0),
                                                            bottomLeft:
                                                                Radius.circular(
                                                                    15),
                                                            bottomRight:
                                                                Radius.circular(
                                                                    15),
                                                          ),
                                                        ),
                                                        child: Column(
                                                          mainAxisSize:
                                                              MainAxisSize.min,
                                                          children: [
                                                            Text(
                                                              '${percentageOffValue.toStringAsFixed(2)}%',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white, // Text color
                                                                  fontSize:
                                                                      7.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      "task"),
                                                            ),
                                                            Text(
                                                              'OFF',
                                                              style: TextStyle(
                                                                  color: Colors
                                                                      .white, // Text color
                                                                  fontSize:
                                                                      7.sp,
                                                                  fontWeight:
                                                                      FontWeight
                                                                          .bold,
                                                                  fontFamily:
                                                                      "task"),
                                                            ),
                                                          ],
                                                        ),
                                                      )),
                                            ],
                                          );
                                        },
                                        childCount:
                                            shortbymodel?.searchResults?.length,
                                      ),
                                    )
                                  : type
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
                                                      8.5 // Adjust as needed
                                                  ),
                                          delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                              double percentageOffValue =
                                                  calculatePercentageOfffilter(
                                                      index);
                                              return Stack(
                                                children: [
                                                  GestureDetector(
                                                    onTap: () {
                                                      Navigator.of(context).push(
                                                          MaterialPageRoute(
                                                              builder: (context) =>
                                                                  productdetailnovartion(
                                                                    productid: filterbymodel
                                                                            ?.searchResults?[index]
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
                                                              crossAxisAlignment:
                                                                  CrossAxisAlignment
                                                                      .center,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    if (filterbymodel
                                                                            ?.searchResults?[
                                                                                index]
                                                                            .saleProductPrice !=
                                                                        filterbymodel
                                                                            ?.searchResults?[index]
                                                                            .productPrice)
                                                                      Padding(
                                                                        padding:
                                                                            EdgeInsets.only(top: 0.4.h),
                                                                        child:
                                                                            Text(
                                                                          '₹' +
                                                                              (filterbymodel?.searchResults?[index].saleProductPrice).toString(),
                                                                          style:
                                                                              TextStyle(
                                                                            fontSize:
                                                                                11.sp,
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
                                                                      ),
                                                                    SizedBox(
                                                                      width:
                                                                          1.w,
                                                                    ),
                                                                    Padding(
                                                                      padding: EdgeInsets.only(
                                                                          top: 0.4
                                                                              .h),
                                                                      child:
                                                                          Text(
                                                                        '₹' +
                                                                            (filterbymodel?.searchResults?[index].productPrice).toString(),
                                                                        style:
                                                                            TextStyle(
                                                                          decoration: filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice
                                                                              ? TextDecoration.lineThrough
                                                                              : TextDecoration.none,
                                                                          fontSize:
                                                                              11.sp,
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
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                          1.w,
                                                                    ),
                                                                    // percentageOffValue == null || percentageOffValue == 0
                                                                    //     ? Container()
                                                                    //     : Padding(
                                                                    //   padding:  EdgeInsets.only(top: 0.4.h),
                                                                    //   child: Container(
                                                                    //     padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                    //     decoration: BoxDecoration(
                                                                    //       borderRadius: BorderRadius.circular(5),
                                                                    //       color: Colors.red.shade400,
                                                                    //     ),
                                                                    //     child: Text(
                                                                    //       '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                    //       style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height: 0.5.h),
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
                                                              child: Container(
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
                                                                  usermodal?.userId ==
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
                                                  percentageOffValue == null ||
                                                          percentageOffValue ==
                                                              0
                                                      ? Container()
                                                      : Positioned(
                                                          right: 29.w,
                                                          top: 0.7.h,
                                                          child: Container(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                                    horizontal:
                                                                        1.w,
                                                                    vertical:
                                                                        1.h),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .only(
                                                                topLeft: Radius
                                                                    .circular(
                                                                        0),
                                                                topRight: Radius
                                                                    .circular(
                                                                        0),
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        15),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            15),
                                                              ),
                                                            ),
                                                            child: Column(
                                                              mainAxisSize:
                                                                  MainAxisSize
                                                                      .min,
                                                              children: [
                                                                Text(
                                                                  '${percentageOffValue.toStringAsFixed(2)}%',
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      // Text color
                                                                      fontSize: 7.sp,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: "task"),
                                                                ),
                                                                Text(
                                                                  'OFF',
                                                                  style: TextStyle(
                                                                      color: Colors.white,
                                                                      // Text color
                                                                      fontSize: 7.sp,
                                                                      fontWeight: FontWeight.bold,
                                                                      fontFamily: "task"),
                                                                ),
                                                              ],
                                                            ),
                                                          )),
                                                ],
                                              );
                                            },
                                            childCount: filterbymodel
                                                ?.searchResults?.length,
                                          ),
                                        )
                                      : _serch.text != ''
                                          ? _issearch
                                              ? SliverToBoxAdapter(
                                                  child: Container(
                                                    height: 65.h,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                )
                                              : catSerchModal?.categoriesWiseProduct
                                                              ?.length ==
                                                          0 ||
                                                      catSerchModal
                                                              ?.categoriesWiseProduct
                                                              ?.length ==
                                                          null
                                                  ? SliverToBoxAdapter(
                                                      child: Container(
                                                        height: 60.h,
                                                        child: Center(
                                                            child: Text(
                                                          'No Medicine Available',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                              childAspectRatio:
                                                                  6.5 /
                                                                      8.5 // Adjust as needed
                                                              ),
                                                      delegate:
                                                          SliverChildBuilderDelegate(
                                                        (BuildContext context,
                                                            int index) {
                                                          double
                                                              percentageOffValue =
                                                              calculatePercentageOffcatesearch(
                                                                  index);
                                                          return Stack(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(
                                                                    MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              productdetailnovartion(
                                                                        productid:
                                                                            catSerchModal?.categoriesWiseProduct?[index].productID ??
                                                                                '',
                                                                      ),
                                                                    ),
                                                                  );
                                                                },
                                                                child: Card(
                                                                  color: Colors
                                                                      .white,
                                                                  child:
                                                                      Container(
                                                                    decoration:
                                                                        BoxDecoration(
                                                                      color: Colors
                                                                          .white,
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                    ),
                                                                    child:
                                                                        Column(
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
                                                                            imageUrl:
                                                                                catSerchModal?.categoriesWiseProduct?[index].productImage1 ?? '',
                                                                            fit:
                                                                                BoxFit.cover,
                                                                            height:
                                                                                9.5.h,
                                                                            width:
                                                                                25.w,
                                                                            imageBuilder: (context, imageProvider) =>
                                                                                Container(
                                                                              decoration: BoxDecoration(
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
                                                                                      catSerchModal?.categoriesWiseProduct?[index].productName ?? '',
                                                                                      style: TextStyle(fontSize: 11.sp, fontFamily: 'task', fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.black),
                                                                                    ),
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.center,
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment.center,
                                                                          children: [
                                                                            Row(
                                                                              children: [
                                                                                if (catSerchModal?.categoriesWiseProduct?[index].saleProductPrice != catSerchModal?.categoriesWiseProduct?[index].productPrice)
                                                                                  Padding(
                                                                                    padding: EdgeInsets.only(top: 0.4.h),
                                                                                    child: Text(
                                                                                      '₹' + (catSerchModal?.categoriesWiseProduct?[index].saleProductPrice).toString(),
                                                                                      style: TextStyle(
                                                                                        fontSize: 11.sp,
                                                                                        fontFamily: 'task',
                                                                                        fontWeight: FontWeight.normal,
                                                                                        letterSpacing: 1,
                                                                                        color: Colors.black,
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                SizedBox(
                                                                                  width: 1.w,
                                                                                ),
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(top: 0.4.h),
                                                                                  child: Text(
                                                                                    '₹' + (catSerchModal?.categoriesWiseProduct?[index].productPrice).toString(),
                                                                                    style: TextStyle(
                                                                                      decoration: catSerchModal?.categoriesWiseProduct?[index].saleProductPrice != catSerchModal?.categoriesWiseProduct?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                      fontSize: 11.sp,
                                                                                      fontFamily: 'task',
                                                                                      fontWeight: FontWeight.normal,
                                                                                      letterSpacing: 1,
                                                                                      color: Colors.black,
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width: 1.w,
                                                                                ),
                                                                                // percentageOffValue == null || percentageOffValue == 0
                                                                                //     ? Container()
                                                                                //     : Padding(
                                                                                //   padding:  EdgeInsets.only(top: 0.4.h),
                                                                                //   child: Container(
                                                                                //     padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                                //     decoration: BoxDecoration(
                                                                                //       borderRadius: BorderRadius.circular(5),
                                                                                //       color: Colors.red.shade400,
                                                                                //     ),
                                                                                //     child: Text(
                                                                                //       '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                                //       style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                                //     ),
                                                                                //   ),
                                                                                // ),
                                                                              ],
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                            height:
                                                                                0.5.h),
                                                                        GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            Navigator.of(context).push(
                                                                              MaterialPageRoute(
                                                                                builder: (context) => productdetailnovartion(
                                                                                  productid: catSerchModal?.categoriesWiseProduct?[index].productID ?? '',
                                                                                ),
                                                                              ),
                                                                            );

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
                                                                            decoration:
                                                                                BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff0061b0)),
                                                                            child:
                                                                                Text(
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
                                                                  left: 37.w,
                                                                  top: 1.h,
                                                                  child:
                                                                      GestureDetector(
                                                                    onTap: () {
                                                                      usermodal?.userId == "" ||
                                                                              usermodal?.userId ==
                                                                                  null
                                                                          ? Navigator.of(context)
                                                                              .push(MaterialPageRoute(builder: (context) => LoginPage2()))
                                                                          : catSerchModal?.categoriesWiseProduct?[index].wishlist == 1
                                                                              ? removewishlistap((catSerchModal?.categoriesWiseProduct?[index].productID).toString())
                                                                              : addwishlistap((catSerchModal?.categoriesWiseProduct?[index].productID).toString());
                                                                    },
                                                                    child: Icon(
                                                                      catSerchModal?.categoriesWiseProduct?[index].wishlist == 1
                                                                          ? Icons
                                                                              .favorite
                                                                          : Icons
                                                                              .favorite_outline,
                                                                      size:
                                                                          20.sp,
                                                                      color: catSerchModal?.categoriesWiseProduct?[index].wishlist == 1
                                                                          ? Colors
                                                                              .red
                                                                          : Colors
                                                                              .black,
                                                                    ),
                                                                  )),
                                                              percentageOffValue ==
                                                                          null ||
                                                                      percentageOffValue ==
                                                                          0
                                                                  ? Container()
                                                                  : Positioned(
                                                                      right:
                                                                          27.w,
                                                                      top:
                                                                          0.7.h,
                                                                      child:
                                                                          Container(
                                                                        padding: EdgeInsets.symmetric(
                                                                            horizontal:
                                                                                1.w,
                                                                            vertical: 1.h),
                                                                        decoration:
                                                                            BoxDecoration(
                                                                          color:
                                                                              Colors.red,
                                                                          borderRadius:
                                                                              BorderRadius.only(
                                                                            topLeft:
                                                                                Radius.circular(0),
                                                                            topRight:
                                                                                Radius.circular(0),
                                                                            bottomLeft:
                                                                                Radius.circular(15),
                                                                            bottomRight:
                                                                                Radius.circular(15),
                                                                          ),
                                                                        ),
                                                                        child:
                                                                            Column(
                                                                          mainAxisSize:
                                                                              MainAxisSize.min,
                                                                          children: [
                                                                            Text(
                                                                              '${percentageOffValue.toStringAsFixed(2)}%',
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  // Text color
                                                                                  fontSize: 7.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: "task"),
                                                                            ),
                                                                            Text(
                                                                              'OFF',
                                                                              style: TextStyle(
                                                                                  color: Colors.white,
                                                                                  // Text color
                                                                                  fontSize: 7.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: "task"),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                      )),
                                                            ],
                                                          );
                                                        },
                                                        childCount: catSerchModal
                                                            ?.categoriesWiseProduct
                                                            ?.length,
                                                      ),
                                                    )
                                          : _isLoading
                                              ? SliverToBoxAdapter(
                                                  child: Container(
                                                    height: 65.h,
                                                    child: Center(
                                                      child:
                                                          CircularProgressIndicator(),
                                                    ),
                                                  ),
                                                )
                                              : catwiceproductmodal
                                                              ?.categoriesWiseProduct
                                                              ?.length ==
                                                          0 ||
                                                      catwiceproductmodal
                                                              ?.categoriesWiseProduct
                                                              ?.length ==
                                                          null
                                                  ? SliverToBoxAdapter(
                                                      child: Container(
                                                        height: 70.h,
                                                        child: Center(
                                                            child: Text(
                                                          'No Medicine Available',
                                                          style: TextStyle(
                                                            fontWeight:
                                                                FontWeight
                                                                    .normal,
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
                                                                      200,
                                                                  // Adjust as needed
                                                                  mainAxisSpacing:
                                                                      0.0,
                                                                  // Adjust as needed
                                                                  crossAxisSpacing:
                                                                      0.0,
                                                                  // Adjust as needed
                                                                  childAspectRatio:
                                                                      6.5 /
                                                                          8.5 // Adjust as needed
                                                                  ),
                                                          delegate:
                                                              SliverChildBuilderDelegate(
                                                            (BuildContext
                                                                    context,
                                                                int index) {
                                                              double
                                                                  percentageOffValue =
                                                                  calculatePercentageOffcatewiceproduct(
                                                                      index);
                                                              if (index <
                                                                  posts
                                                                      .length) {
                                                                final post =
                                                                    posts[
                                                                        index];
                                                                return Stack(
                                                                  children: [
                                                                    GestureDetector(
                                                                      onTap:
                                                                          () {
                                                                        Navigator.of(context)
                                                                            .push(
                                                                          MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                productdetailnovartion(
                                                                              productid: catwiceproductmodal?.categoriesWiseProduct?[index].productID ?? '',
                                                                            ),
                                                                          ),
                                                                        );

                                                                        // catwiceproductmodal
                                                                        //     ?.categoriesWiseProduct?[
                                                                        // index]
                                                                        //     .productType ==
                                                                        //     '1'
                                                                        //     ? Navigator.of(context)
                                                                        //     .push(
                                                                        //   MaterialPageRoute(
                                                                        //     builder: (context) =>
                                                                        //         productdetailnovartion(
                                                                        //           productid: catwiceproductmodal
                                                                        //               ?.categoriesWiseProduct?[
                                                                        //           index]
                                                                        //               .productID ??
                                                                        //               '',
                                                                        //         ),
                                                                        //   ),
                                                                        // )
                                                                        //     : Navigator.of(context)
                                                                        //     .push(
                                                                        //   MaterialPageRoute(
                                                                        //     builder: (context) =>
                                                                        //         productdetailnovartion(
                                                                        //           productid: catwiceproductmodal
                                                                        //               ?.categoriesWiseProduct?[
                                                                        //           index]
                                                                        //               .productID ??
                                                                        //               '',
                                                                        //         ),
                                                                        //   ),
                                                                        // );
                                                                      },
                                                                      child:
                                                                          Card(
                                                                        child:
                                                                            Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(10),
                                                                            color:
                                                                                Colors.white,
                                                                          ),
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
                                                                                  imageUrl: catwiceproductmodal?.categoriesWiseProduct?[index].productImage1 ?? '',
                                                                                  fit: BoxFit.cover,
                                                                                  height: 9.5.h,
                                                                                  width: 25.w,
                                                                                  imageBuilder: (context, imageProvider) => Container(
                                                                                    decoration: BoxDecoration(
                                                                                      // borderRadius: BorderRadius.circular(10),
                                                                                      image: DecorationImage(
                                                                                        filterQuality: FilterQuality.high,
                                                                                        image: imageProvider,
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
                                                                                            catwiceproductmodal?.categoriesWiseProduct?[index].productName ?? '',
                                                                                            style: TextStyle(fontSize: 11.sp, fontFamily: 'task', fontWeight: FontWeight.bold, letterSpacing: 1, color: Colors.black),
                                                                                          ),
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                  ],
                                                                                ),
                                                                              ),
                                                                              Row(
                                                                                mainAxisAlignment: MainAxisAlignment.center,
                                                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                                                children: [
                                                                                  Row(
                                                                                    children: [
                                                                                      if (catwiceproductmodal?.categoriesWiseProduct?[index].saleProductPrice != catwiceproductmodal?.categoriesWiseProduct?[index].productPrice)
                                                                                        Padding(
                                                                                          padding: EdgeInsets.only(top: 0.4.h),
                                                                                          child: Text(
                                                                                            '₹' + (catwiceproductmodal?.categoriesWiseProduct?[index].saleProductPrice).toString(),
                                                                                            style: TextStyle(
                                                                                              fontSize: 11.sp,
                                                                                              fontFamily: 'task',
                                                                                              fontWeight: FontWeight.normal,
                                                                                              letterSpacing: 1,
                                                                                              color: Colors.black,
                                                                                            ),
                                                                                          ),
                                                                                        ),
                                                                                      SizedBox(
                                                                                        width: 1.w,
                                                                                      ),
                                                                                      Padding(
                                                                                        padding: EdgeInsets.only(top: 0.4.h),
                                                                                        child: Text(
                                                                                          '₹' + (catwiceproductmodal?.categoriesWiseProduct?[index].productPrice).toString(),
                                                                                          style: TextStyle(
                                                                                            decoration: catwiceproductmodal?.categoriesWiseProduct?[index].saleProductPrice != catwiceproductmodal?.categoriesWiseProduct?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                            fontSize: 11.sp,
                                                                                            fontFamily: 'task',
                                                                                            fontWeight: FontWeight.normal,
                                                                                            letterSpacing: 1,
                                                                                            color: Colors.black,
                                                                                          ),
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 1.w,
                                                                                      ),
                                                                                      // percentageOffValue == null || percentageOffValue == 0
                                                                                      //     ? Container()
                                                                                      //     : Padding(
                                                                                      //   padding:  EdgeInsets.only(top: 0.4.h),
                                                                                      //   child: Container(
                                                                                      //     padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                                      //     decoration: BoxDecoration(
                                                                                      //       borderRadius: BorderRadius.circular(5),
                                                                                      //       color: Colors.red.shade400,
                                                                                      //     ),
                                                                                      //     child: Text(
                                                                                      //       '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                                      //       style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                                      //     ),
                                                                                      //   ),
                                                                                      // ),
                                                                                    ],
                                                                                  ),
                                                                                ],
                                                                              ),
                                                                              SizedBox(height: 0.5.h),
                                                                              GestureDetector(
                                                                                onTap: () {
                                                                                  catwiceproductmodal?.categoriesWiseProduct?[index].productType == '1'
                                                                                      ? Navigator.of(context).push(
                                                                                          MaterialPageRoute(
                                                                                            builder: (context) => productdetailnovartion(
                                                                                              productid: catwiceproductmodal?.categoriesWiseProduct?[index].productID ?? '',
                                                                                            ),
                                                                                          ),
                                                                                        )
                                                                                      : Navigator.of(context).push(
                                                                                          MaterialPageRoute(
                                                                                            builder: (context) => productdetailnovartion(
                                                                                              productid: catwiceproductmodal?.categoriesWiseProduct?[index].productID ?? '',
                                                                                            ),
                                                                                          ),
                                                                                        );
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
                                                                                    style: TextStyle(fontSize: 11.sp, color: Colors.white, fontFamily: 'task'),
                                                                                  ),
                                                                                ),
                                                                              ),
                                                                            ],
                                                                          ),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    Positioned(
                                                                        left: 37
                                                                            .w,
                                                                        top:
                                                                            1.h,
                                                                        child:
                                                                            GestureDetector(
                                                                          onTap:
                                                                              () {
                                                                            usermodal?.userId == "" || usermodal?.userId == null
                                                                                ? Navigator.of(context).push(MaterialPageRoute(builder: (context) => LoginPage2()))
                                                                                : catwiceproductmodal?.categoriesWiseProduct?[index].wishlist == 1
                                                                                    ? removewishlistap((catwiceproductmodal?.categoriesWiseProduct?[index].productID).toString())
                                                                                    : addwishlistap((catwiceproductmodal?.categoriesWiseProduct?[index].productID).toString());
                                                                          },
                                                                          child:
                                                                              Icon(
                                                                            catwiceproductmodal?.categoriesWiseProduct?[index].wishlist == 1
                                                                                ? Icons.favorite
                                                                                : Icons.favorite_outline,
                                                                            size:
                                                                                20.sp,
                                                                            color: catwiceproductmodal?.categoriesWiseProduct?[index].wishlist == 1
                                                                                ? Colors.red
                                                                                : Colors.black,
                                                                          ),
                                                                        )),
                                                                    percentageOffValue ==
                                                                                null ||
                                                                            percentageOffValue ==
                                                                                0
                                                                        ? Container()
                                                                        : Positioned(
                                                                            right:
                                                                                27.w,
                                                                            top: 0.7.h,
                                                                            child: Container(
                                                                              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 1.h),
                                                                              decoration: BoxDecoration(
                                                                                color: Colors.red,
                                                                                borderRadius: BorderRadius.only(
                                                                                  topLeft: Radius.circular(0),
                                                                                  topRight: Radius.circular(0),
                                                                                  bottomLeft: Radius.circular(15),
                                                                                  bottomRight: Radius.circular(15),
                                                                                ),
                                                                              ),
                                                                              child: Column(
                                                                                mainAxisSize: MainAxisSize.min,
                                                                                children: [
                                                                                  Text(
                                                                                    '${percentageOffValue.toStringAsFixed(2)}% ',
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        // Text color
                                                                                        fontSize: 7.sp,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontFamily: "task"),
                                                                                  ),
                                                                                  Text(
                                                                                    'OFF',
                                                                                    style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        // Text color
                                                                                        fontSize: 7.sp,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontFamily: "task"),
                                                                                  ),
                                                                                ],
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
                                                                ? posts.length +
                                                                    1
                                                                : posts
                                                                    .length, // Replace with the number of grid items you want
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
      ),
    );
  }

  Timer? _debounce; // Define a debounce timer

  Widget searchBox() {
    return Container(
      width: 90.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(10),
      ),
      child: TextField(
        controller: _serch,
        onTap: () {},
        onChanged: (value) {
          setState(() {
            name = true;
            _issearch = true;
            sort = false;
            type = false;
          });

          // If search text is empty, reset states
          if (_serch.text.isEmpty) {
            setState(() {
              name = false;
              wait = false;
            });
          } else {
            setState(() {
              name = true;
              wait = true;
            });
          }

          // Cancel the previous debounce timer if it's still active
          if (_debounce?.isActive ?? false) _debounce!.cancel();

          // Start a new debounce timer
          _debounce = Timer(Duration(seconds: 2), () {
            if (_serch.text.isNotEmpty) {
              catserchap(_serch.text); // Call the API if there's text
            }
          });
        },
        style:
            TextStyle(color: Colors.black, fontFamily: 'task', fontSize: 12.sp),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          suffixIcon: _serch.text.isNotEmpty
              ? InkWell(
                  onTap: () {
                    FocusScope.of(context).unfocus(); // Dismiss the keyboard
                    setState(() {
                      _serch.clear();
                      name = false;
                      wait = false;
                      sort = false;
                      type = false;
                    });
                    // Optionally, call the API after clearing
                    Timer(Duration(seconds: 2), () {
                      catserchap(''); // Pass empty search to refresh results
                    });
                  },
                  child: Icon(Icons.close, size: 20),
                )
              : null,
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 25,
            minWidth: 40,
          ),
          border: InputBorder.none,
          hintText: 'Search Products',
          hintStyle: TextStyle(
            color: Colors.black,
            fontFamily: 'task',
            fontSize: 12.0,
          ),
        ),
      ),
    );
  }

  // subcatwiceallproductap() async {
  //   final Map<String, String> data = {};
  //   data['category_id'] = widget.catid.toString();
  //   data['subcategory_id'] = widget.subcatid.toString();
  //   data['user_id'] = (usermodal?.userId).toString();
  //   print(data);
  //   checkInternet().then((internet) async {
  //     if (internet) {
  //       authprovider().subcatwiceallproductapi(data).then((response) async {
  //         allsubcatwiceproduct =
  //             AllSubcatWiceProduct.fromJson(json.decode(response.body));
  //         print(allsubcatwiceproduct?.status);
  //         if (response.statusCode == 200 &&
  //             allsubcatwiceproduct?.status == "success") {
  //           print('EE Thay Gyu Hooooo ! ^_^');
  //           setState(() {
  //             isLoading = false;
  //             type1= "";
  //             short= "";
  //           });
  //         } else {
  //           setState(() {
  //             isLoading = false;
  //             type1= "";
  //             short= "";
  //           });
  //         }
  //       });
  //     } else {
  //       setState(() {
  //         isLoading = false;
  //         type1= "";
  //         short= "";
  //       });
  //       buildErrorDialog(context, 'Error', "Internet Required");
  //     }
  //   });
  // }
  catwiceproductap() async {
    final Map<String, String> data = {};
    data['category_id'] = widget.catid.toString();
    data['user_id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().catwiceproductapi(data).then((response) async {
          catwiceproductmodal =
              CatWiceProductModal.fromJson(json.decode(response.body));
          print(catwiceproductmodal?.status);
          if (response.statusCode == 200 &&
              catwiceproductmodal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            setState(() {
              //wait = false;
              isLoading = false;
              Timer(Duration(seconds: 1), () {
                setState(() {
                  _isLoading = false;
                });
              });
            });
          } else {
            setState(() {
              //wait = false;
              isLoading = false;
              Timer(Duration(seconds: 1), () {
                setState(() {
                  _isLoading = false;
                });
              });
            });
          }
        });
      } else {
        setState(() {
          // wait = false;
          isLoading = false;
          Timer(Duration(seconds: 1), () {
            setState(() {
              _isLoading = false;
            });
          });
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  catserchap(String value) async {
    final Map<String, String> data = {};
    data['search_term'] = value.toString();
    data['category_id'] = widget.catid.toString();
    data['User_id'] = (usermodal?.userId).toString();
    print("aaavi gaya${data}");
    setState(() {
      _issearch = true;
    });
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().catserchapi(data).then((response) async {
          catSerchModal = CatSerchModal.fromJson(json.decode(response.body));
          print(catSerchModal?.status);
          if (response.statusCode == 200 &&
              catSerchModal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            print('EE Thay ${response.body.toString()}');
            FocusScope.of(context).unfocus();
            setState(() {
              isLoading = false;
              _issearch = false;
            });
          } else {
            FocusScope.of(context).unfocus();
            setState(() {
              isLoading = false;
              _issearch = false;
            });
          }
        });
      } else {
        FocusScope.of(context).unfocus();
        setState(() {
          isLoading = false;
          _issearch = false;
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
            catwiceproductap();
            //subcatwiceallproductap();
            catserchap(_serch.text);
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
            catwiceproductap();
            //subcatwiceallproductap();

            catserchap(_serch.text);
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

  filterbysearch(String value) async {
    setState(() {
      filterandnsort = true;
      _serch.text = '';
    });
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['User_id'] = (usermodal?.userId).toString();
    data['priceSort'] = value;
    data['cate_id'] = widget.catid.toString();
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
              filterandnsort = false;
            });
          } else {
            setState(() {
              EasyLoading.showError('No Data Found');
              filterandnsort = false;
            });
          }
        });
      } else {
        setState(() {
          filterandnsort = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  shortbyap(String value) async {
    setState(() {
      FocusScope.of(context).unfocus();
      filterandnsort = true;
      _serch.clear();
    });
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['User_id'] = (usermodal?.userId).toString();
    data['sortOrder'] = value;
    data['cate_id'] = widget.catid.toString();
    print('AA dada : ${data}');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().shortsearchapi(data).then((response) async {
          shortbymodel = ShortbyModel.fromJson(json.decode(response.body));
          print(shortbymodel?.status);
          if (response.statusCode == 200 && shortbymodel?.status == "success") {
            setState(() {
              EasyLoading.showSuccess('success');
              filterandnsort = false;
            });
          } else {
            setState(() {
              filterandnsort = false;

              EasyLoading.showError('No Data Found');
            });
          }
        });
      } else {
        setState(() {
          filterandnsort = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  caateeicepageapi() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['page'] = "$page";
    data['category_id'] = widget.catid.toString();
    data['limit'] = "6";
    checkInternet().then((internet) async {
      print("555555555555555");
      if (internet) {
        authprovider().catewicepage(data).then((response) async {
          catewisePageViewModel =
              CateWisePageViewModel.fromJson(json.decode(response.body));
          print(catewisePageViewModel?.status);
          if (response.statusCode == 200 &&
              catewisePageViewModel?.status == "success") {
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

  Future<void> _scrollListener() async {
    if (isloadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isloadingMore = true;
      });
      page = page + 1;
      print("$page");
      await caateeicepageapi();
      setState(() {
        isloadingMore = false;
      });
    }
  }
}
