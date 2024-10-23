import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/AllProductModal.dart';
import 'package:ecommerce/Modal/AllProductSerchModel.dart';
import 'package:ecommerce/Modal/FilterbyModel.dart';
import 'package:ecommerce/Modal/PaginationModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/ShortbyModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/Request_Medicine.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import 'ProductDetailnovartition.dart';

class ProductList4 extends StatefulWidget {
  ProductList4({
    super.key,
  });

  @override
  State<ProductList4> createState() => _ProductList4State();
}

bool name = false;
String? type1;
String? short;

TextEditingController _serch2 = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKeylist3 = GlobalKey<ScaffoldState>();
bool _isLoading = false;
bool _issearch = false;

bool isLoading = true;

class _ProductList4State extends State<ProductList4> {
  final scrollController = ScrollController();
  List posts = [];
  bool isloding = true;
  int page = 1;
  bool isloadingMore = false;
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  double calculatePercentageOff(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        allproductmodal?.allProducts?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        allproductmodal?.allProducts?[index].saleProductPrice ?? '0');

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

  double calculatePercentageOffallproductserach(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        allProductserachModel?.searchResults?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        allProductserachModel?.searchResults?[index].saleProductPrice ?? '0');

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




  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allproductap();
    scrollController.addListener(_scrollListener);
    paginationapi();
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
        key: _scaffoldKeylist3,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(),
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
                                          Icons.arrow_back_ios,
                                          size: 20.sp,
                                        )),
                                    Text(
                                      "All Medicines",
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
                                    double
                                    percentageOffValue =
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
                                                    MainAxisAlignment.center,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment.center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          if (shortbymodel?.searchResults?[index].saleProductPrice != shortbymodel?.searchResults?[index].productPrice)
                                                            Padding(
                                                              padding: EdgeInsets.only(top: 0.4.h),
                                                              child: Text(
                                                                '₹' + (shortbymodel?.searchResults?[index].saleProductPrice).toString(),
                                                                style: TextStyle(
                                                                  fontSize: 9.sp,
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
                                                              '₹' + (shortbymodel?.searchResults?[index].productPrice).toString(),
                                                              style: TextStyle(
                                                                decoration: shortbymodel?.searchResults?[index].saleProductPrice != shortbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                fontSize: 9.sp,
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
                                                          percentageOffValue == null || percentageOffValue == 0
                                                              ? Container()
                                                              : Padding(
                                                            padding:  EdgeInsets.only(top: 0.4.h),
                                                            child: Container(
                                                              padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                              decoration: BoxDecoration(
                                                                borderRadius: BorderRadius.circular(5),
                                                                color: Colors.red.shade400,
                                                              ),
                                                              child: Text(
                                                                '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  ),
                                                  SizedBox(
                                                      height:
                                                      0.5.h),
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

                                  childCount: shortbymodel
                                      ?.searchResults?.length,
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
                                                6.5 / 8.5 // Adjust as needed
                                            ),
                                    delegate: SliverChildBuilderDelegate(
                                        (BuildContext context, int index) {
                                          double
                                          percentageOffValue =
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
                                                    Row(
                                                      mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                      crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                      children: [
                                                        Row(
                                                          children: [
                                                            if (shortbymodel?.searchResults?[index].saleProductPrice != shortbymodel?.searchResults?[index].productPrice)
                                                              Padding(
                                                                padding: EdgeInsets.only(top: 0.4.h),
                                                                child: Text(
                                                                  '₹' + (shortbymodel?.searchResults?[index].saleProductPrice).toString(),
                                                                  style: TextStyle(
                                                                    fontSize: 9.sp,
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
                                                                '₹' + (shortbymodel?.searchResults?[index].productPrice).toString(),
                                                                style: TextStyle(
                                                                  decoration: shortbymodel?.searchResults?[index].saleProductPrice != shortbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                  fontSize: 9.sp,
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
                                                            percentageOffValue == null || percentageOffValue == 0
                                                                ? Container()
                                                                : Padding(
                                                              padding:  EdgeInsets.only(top: 0.4.h),
                                                              child: Container(
                                                                padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(5),
                                                                  color: Colors.red.shade400,
                                                                ),
                                                                child: Text(
                                                                  '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                  style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                ),
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ],
                                                    ),
                                                    SizedBox(
                                                        height:
                                                        0.5.h),
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
                                    },  childCount: shortbymodel
                                          ?.searchResults?.length,

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
                                                    8.5 // Adjust as needed
                                                ),
                                        delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
                                              double
                                              percentageOffValue =
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
                                                                      filterbymodel
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
                                                          MainAxisAlignment.center,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment.center,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                if (filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice)
                                                                  Padding(
                                                                    padding: EdgeInsets.only(top: 0.4.h),
                                                                    child: Text(
                                                                      '₹' + (filterbymodel?.searchResults?[index].saleProductPrice).toString(),
                                                                      style: TextStyle(
                                                                        fontSize: 9.sp,
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
                                                                    '₹' + (filterbymodel?.searchResults?[index].productPrice).toString(),
                                                                    style: TextStyle(
                                                                      decoration: filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                      fontSize: 9.sp,
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
                                                                percentageOffValue == null || percentageOffValue == 0
                                                                    ? Container()
                                                                    : Padding(
                                                                  padding:  EdgeInsets.only(top: 0.4.h),
                                                                  child: Container(
                                                                    padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                    decoration: BoxDecoration(
                                                                      borderRadius: BorderRadius.circular(5),
                                                                      color: Colors.red.shade400,
                                                                    ),
                                                                    child: Text(
                                                                      '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                      style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
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
                                                                            productdetailnovartion(
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
                                                          ? Navigator
                                                                  .of(context)
                                                              .push(MaterialPageRoute(
                                                                  builder: (context) =>
                                                                      LoginPage2()))
                                                          : filterbymodel
                                                                      ?.searchResults?[
                                                                          index]
                                                                      .wishlist ==
                                                                  1
                                                              ? removewishlistap(
                                                                  (filterbymodel
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
                                        }, childCount: filterbymodel
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
                                                        8.5 // Adjust as needed
                                                    ),
                                            delegate: SliverChildBuilderDelegate(
                                                (BuildContext context,
                                                    int index) {
                                                  double
                                                  percentageOffValue =
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
                                                              MainAxisAlignment.center,
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment.center,
                                                              children: [
                                                                Row(
                                                                  children: [
                                                                    if (filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice)
                                                                      Padding(
                                                                        padding: EdgeInsets.only(top: 0.4.h),
                                                                        child: Text(
                                                                          '₹' + (filterbymodel?.searchResults?[index].saleProductPrice).toString(),
                                                                          style: TextStyle(
                                                                            fontSize: 9.sp,
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
                                                                        '₹' + (filterbymodel?.searchResults?[index].productPrice).toString(),
                                                                        style: TextStyle(
                                                                          decoration: filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                          fontSize: 9.sp,
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
                                                                    percentageOffValue == null || percentageOffValue == 0
                                                                        ? Container()
                                                                        : Padding(
                                                                      padding:  EdgeInsets.only(top: 0.4.h),
                                                                      child: Container(
                                                                        padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                        decoration: BoxDecoration(
                                                                          borderRadius: BorderRadius.circular(5),
                                                                          color: Colors.red.shade400,
                                                                        ),
                                                                        child: Text(
                                                                          '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                          style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                        ),
                                                                      ),
                                                                    ),
                                                                  ],
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                                height:
                                                                0.5.h),
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
                                                ],
                                              );
                                            },  childCount: filterbymodel
                                                ?.searchResults?.length,

                                                ),
                                          )
                                        : _serch2.text == ''
                                            ? allproductmodal?.allProducts
                                                            ?.length ==
                                                        0 ||
                                                    allproductmodal?.allProducts
                                                            ?.length ==
                                                        null
                                                ? SliverToBoxAdapter(
                                                    child: Container(
                                                      height: 70.h,
                                                      child: Center(
                                                          child: Text(
                                                        'No Products Available',
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
                                                      maxCrossAxisExtent: 200,
                                                      mainAxisSpacing: 0.0,
                                                      crossAxisSpacing: 0.0,
                                                      childAspectRatio:
                                                          6.5 / 8.5,
                                                    ),
                                                    delegate:
                                                        SliverChildBuilderDelegate(
                                                      (BuildContext context,
                                                          int index) {
                                                        double
                                                            percentageOffValue =
                                                            calculatePercentageOff(
                                                                index);
                                                        if (index % 5 == 0 &&
                                                            index != 0) {
                                                          if (isloadingMore &&
                                                              index ==
                                                                  posts
                                                                      .length) {
                                                            return Center(
                                                              child:
                                                                  CircularProgressIndicator(
                                                                color:
                                                                    Colors.blue,
                                                              ),
                                                            );
                                                          }
                                                        }

                                                        if (index <
                                                            posts.length) {
                                                          final post =
                                                              posts[index];
                                                          return Stack(
                                                            children: [
                                                              GestureDetector(
                                                                onTap: () {
                                                                  Navigator.of(
                                                                          context)
                                                                      .push(
                                                                          MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        productdetailnovartion(
                                                                            productid:
                                                                                ("${post['ProductID']}")),
                                                                  ));
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
                                                                                2.h),
                                                                        Container(
                                                                          child:
                                                                              CachedNetworkImage(
                                                                            imageUrl:
                                                                                allproductmodal?.allProducts?[index].allProductImage?[0] ?? '',
                                                                            height:
                                                                                9.5.h,
                                                                            width:
                                                                                25.w,
                                                                            imageBuilder: (context, imageProvider) =>
                                                                                Container(
                                                                              decoration: BoxDecoration(
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
                                                                                1.h),
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
                                                                                      allproductmodal?.allProducts?[index].productName ?? '',
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
                                                                                if (allproductmodal?.allProducts?[index].saleProductPrice != allproductmodal?.allProducts?[index].productPrice)
                                                                                  Padding(
                                                                                    padding: EdgeInsets.only(top: 0.4.h),
                                                                                    child: Text(
                                                                                      '₹' + (allproductmodal?.allProducts?[index].saleProductPrice).toString(),
                                                                                      style: TextStyle(
                                                                                        fontSize: 9.sp,
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
                                                                                    '₹' + (allproductmodal?.allProducts?[index].productPrice).toString(),
                                                                                    style: TextStyle(
                                                                                      decoration: allproductmodal?.allProducts?[index].saleProductPrice != allproductmodal?.allProducts?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                      fontSize: 9.sp,
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
                                                                                percentageOffValue == null || percentageOffValue == 0
                                                                                    ? Container()
                                                                                    : Padding(
                                                                                        padding:  EdgeInsets.only(top: 0.4.h),
                                                                                        child: Container(
                                                                                          padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                                          decoration: BoxDecoration(
                                                                                            borderRadius: BorderRadius.circular(5),
                                                                                            color: Colors.red.shade400,
                                                                                          ),
                                                                                          child: Text(
                                                                                            '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                                            style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                                          ),
                                                                                        ),
                                                                                      ),
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
                                                                            Navigator.of(context).push(MaterialPageRoute(builder: (context) => productdetailnovartion(productid: ("${post['ProductID']}"))));
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
                                                                    usermodal?.userId ==
                                                                                "" ||
                                                                            usermodal?.userId ==
                                                                                null
                                                                        ? Navigator.of(context).push(MaterialPageRoute(
                                                                            builder: (context) =>
                                                                                LoginPage2()))
                                                                        : allproductmodal?.allProducts?[index].wishlist ==
                                                                                1
                                                                            ? removewishlistap((allproductmodal?.allProducts?[index].productID).toString())
                                                                            : addwishlistap((allproductmodal?.allProducts?[index].productID).toString());
                                                                  },
                                                                  child: Icon(
                                                                    allproductmodal?.allProducts?[index].wishlist ==
                                                                            1
                                                                        ? Icons
                                                                            .favorite
                                                                        : Icons
                                                                            .favorite_outline,
                                                                    size: 20.sp,
                                                                    color: allproductmodal?.allProducts?[index].wishlist ==
                                                                            1
                                                                        ? Colors
                                                                            .red
                                                                        : Colors
                                                                            .black,
                                                                  ),
                                                                ),
                                                              ),
                                                            ],
                                                          );
                                                        }
                                                        //     if (index % 5 == 0 && isloadingMore) {
                                                        //       return Center(
                                                        //         child: CircularProgressIndicator(
                                                        //           color: Colors.blue,
                                                        //         ),
                                                        //       );
                                                        //     }
                                                        // return null;
                                                      },
                                                      // Set childCount to posts.length + 1 to account for the loader
                                                      childCount: posts.length +
                                                          (isloadingMore
                                                              ? (posts.length ~/
                                                                  5)
                                                              : 0),
                                                      //posts.length + (isloadingMore ? (posts.length ~/ 6) : 0),
                                                      //posts.length + (isloadingMore ? 1 : 0),
                                                    ),
                                                  )
                                            : allProductserachModel
                                                            ?.searchResults
                                                            ?.length ==
                                                        0 ||
                                                    allProductserachModel
                                                            ?.searchResults
                                                            ?.length ==
                                                        null
                                                ? SliverToBoxAdapter(
                                                    child: Container(
                                                      height: 70.h,
                                                      child: Center(
                                                        child: Column(
                                                          mainAxisAlignment: MainAxisAlignment.center,
                                                          crossAxisAlignment: CrossAxisAlignment.center,
                                                          children: [
                                                            Image.asset('assets/no-results.png',
                                                              width: 120,height: 100,fit: BoxFit.cover,),
                                                            SizedBox(height: 2.h,),
                                                            Text("Oops No Search Available ${_serch2.text.toString()}",style: TextStyle(
                                                                fontSize: 12.sp,
                                                                fontFamily: 'task',
                                                                fontWeight: FontWeight.w500
                                                            ),),
                                                            // Text(
                                                            //   "No Medicine Available",
                                                            //   style: TextStyle(
                                                            //       fontSize: 14.sp,
                                                            //       fontFamily: 'task',
                                                            //       fontWeight: FontWeight.bold),
                                                            // ),
                                                            SizedBox(height: 5.h,),
                                                            Container(
                                                              width: 85.w,
                                                              alignment: Alignment.center,
                                                              padding: EdgeInsets.symmetric(vertical: 2.h),
                                                              decoration: BoxDecoration(
                                                                  borderRadius: BorderRadius.circular(10),
                                                                  border: Border.all(
                                                                      color: AppColors.primary
                                                                  )
                                                              ) ,
                                                              child: Column(
                                                                children: [
                                                                  Text('Get in touch with us',style: TextStyle(
                                                                      fontSize: 13.sp,
                                                                      fontFamily: 'task',
                                                                      fontWeight: FontWeight.w500
                                                                  ),),
                                                                  SizedBox(height: 1.h,),
                                                                  InkWell(
                                                                    onTap: () {
                                                                      Navigator.of(context).pushReplacement(
                                                                          MaterialPageRoute(builder: (context) => Request_Medicine(),)
                                                                      );
                                                                    },
                                                                    child: Container(
                                                                        margin:
                                                                        EdgeInsets.only(right: 7.w, left: 7.w),
                                                                        alignment: Alignment.center,
                                                                        height: 5.h,
                                                                        width: 60.w,
                                                                        decoration: BoxDecoration(
                                                                            borderRadius: BorderRadius.circular(10),
                                                                            color: Color(0xff0061b0)),
                                                                        child: Text(
                                                                          "Request Medicine",
                                                                          style: TextStyle(
                                                                              fontSize: 12.sp,
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontFamily: "task"),
                                                                        )),
                                                                  ),
                                                                  SizedBox(height: 1.h,),
                                                                  Container(
                                                                    height: 40,
                                                                    width: 43.w, // Height of the button
                                                                    decoration: BoxDecoration(
                                                                      color:  AppColors.primary, // Button background color
                                                                      borderRadius: BorderRadius.circular(
                                                                          10), // Rounded corners
                                                                    ),
                                                                    child: Row(
                                                                      mainAxisAlignment:
                                                                      MainAxisAlignment.center,
                                                                      children: [
                                                                        Icon(Icons.call,
                                                                            color: Colors.white, size: 20.sp),
                                                                        SizedBox(width: 8),
                                                                        GestureDetector(
                                                                          onTap: () {
                                                                            _makePhoneCall(
                                                                                '9051294444'); // Replace with the actual phone number
                                                                          },
                                                                          child: Text(
                                                                            "Call Us",
                                                                            style: TextStyle(
                                                                              color: Colors.white,
                                                                              fontWeight: FontWeight.bold,
                                                                              fontSize: 12.sp,
                                                                              fontFamily: 'task',
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ],
                                                              ),
                                                            )

                                                          ],
                                                        ),
                                                      ),
                                                      // child: Center(
                                                      //     child: Column(
                                                      //       children: [
                                                      //         Text(
                                                      //           'No Medicine Available',
                                                      //           style: TextStyle(
                                                      //             fontWeight: FontWeight.normal,
                                                      //             fontFamily: 'task',
                                                      //             fontSize: 15.sp,
                                                      //           ),
                                                      //         ),
                                                      //         SizedBox(height: 5.h,),
                                                      //         InkWell(
                                                      //           onTap: () {
                                                      //             Navigator.of(context).pushReplacement(
                                                      //                 MaterialPageRoute(builder: (context) => Request_Medicine(),)
                                                      //             );
                                                      //           },
                                                      //           child: Container(
                                                      //               margin:
                                                      //               EdgeInsets.only(right: 7.w, left: 7.w),
                                                      //               alignment: Alignment.center,
                                                      //               height: 5.h,
                                                      //               width: 60.w,
                                                      //               decoration: BoxDecoration(
                                                      //                   borderRadius: BorderRadius.circular(10),
                                                      //                   color: Color(0xff0061b0)),
                                                      //               child: Text(
                                                      //                 "Request Medicine",
                                                      //                 style: TextStyle(
                                                      //                     fontSize: 12.sp,
                                                      //                     color: Colors.white,
                                                      //                     fontWeight: FontWeight.bold,
                                                      //                     fontFamily: "task"),
                                                      //               )),
                                                      //         ),
                                                      //       ],
                                                      //     )),
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
                                                                8.5 // Adjust as needed
                                                            ),
                                                    delegate:
                                                        SliverChildBuilderDelegate(
                                                      (BuildContext context,
                                                          int index) {
                                                        double
                                                            percentageOffValue =
                                                            calculatePercentageOffallproductserach(
                                                                index);
                                                        return Stack(
                                                          children: [
                                                            GestureDetector(
                                                              onTap: () {
                                                                Navigator.of(
                                                                        context)
                                                                    .push(MaterialPageRoute(
                                                                        builder: (context) => productdetailnovartion(
                                                                              productid: allProductserachModel?.searchResults?[index].productID ?? '',
                                                                            )));
                                                              },
                                                              child: Card(
                                                                color: Colors
                                                                    .white,
                                                                child:
                                                                    Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Colors
                                                                          .white),
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
                                                                          imageUrl:
                                                                              allProductserachModel?.searchResults?[index].allImages?[0] ?? '',
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
                                                                                    allProductserachModel?.searchResults?[index].productName ?? '',
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
                                                                              if (allProductserachModel?.searchResults?[index].saleProductPrice != allProductserachModel?.searchResults?[index].productPrice)
                                                                                Padding(
                                                                                  padding: EdgeInsets.only(top: 0.4.h),
                                                                                  child: Text(
                                                                                    '₹' + (allProductserachModel?.searchResults?[index].saleProductPrice).toString(),
                                                                                    style: TextStyle(
                                                                                      fontSize: 9.sp,
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
                                                                                  '₹' + (allProductserachModel?.searchResults?[index].productPrice).toString(),
                                                                                  style: TextStyle(
                                                                                    decoration: allProductserachModel?.searchResults?[index].saleProductPrice != allProductserachModel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
                                                                                    fontSize: 9.sp,
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
                                                                              percentageOffValue == null || percentageOffValue == 0
                                                                                  ? Container()
                                                                                  : Padding(
                                                                                padding:  EdgeInsets.only(top: 0.4.h),
                                                                                child: Container(
                                                                                  padding: EdgeInsets.symmetric(horizontal: 1.w, vertical: 0.2.h),
                                                                                  decoration: BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(5),
                                                                                    color: Colors.red.shade400,
                                                                                  ),
                                                                                  child: Text(
                                                                                    '${percentageOffValue.toStringAsFixed(2)}% Off',
                                                                                    style: TextStyle(color: Colors.white, fontFamily: "task", fontSize: 7.sp),
                                                                                  ),
                                                                                ),
                                                                              ),
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
                                                                          Navigator.of(context).push(MaterialPageRoute(
                                                                              builder: (context) => productdetailnovartion(
                                                                                    productid: allProductserachModel?.searchResults?[index].productID ?? '',
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
                                                                        : allProductserachModel?.searchResults?[index].wishlist ==
                                                                                1
                                                                            ? removewishlistap((allProductserachModel?.searchResults?[index].productID).toString())
                                                                            : addwishlistap((allProductserachModel?.searchResults?[index].productID).toString());
                                                                  },
                                                                  child: Icon(
                                                                    allProductserachModel?.searchResults?[index].wishlist ==
                                                                            1
                                                                        ? Icons
                                                                            .favorite
                                                                        : Icons
                                                                            .favorite_outline,
                                                                    size: 20.sp,
                                                                    color: allProductserachModel?.searchResults?[index].wishlist ==
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
                                                      // childCount: 10
                                                      childCount:
                                                          allProductserachModel
                                                              ?.searchResults
                                                              ?.length,
                                                    ),
                                                  ),
                        SliverToBoxAdapter(
                          child: SizedBox(
                            height: 1.h,
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

  allproductap() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allproductapi(data).then((response) async {
          allproductmodal =
              AllProductModal.fromJson(json.decode(response.body));
          print(allproductmodal?.status);
          if (response.statusCode == 200 &&
              allproductmodal?.status == "success") {
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
          setState(() {
            _issearch = true;
          });
          allproductserchap(_serch2.text);
        },
        style: TextStyle(color: Colors.black, fontFamily: 'task'),
        decoration: InputDecoration(
          isDense: true,
          contentPadding: EdgeInsets.symmetric(vertical: 10),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 13.sp,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 25,
          ),
          suffixIcon:
              _serch2.text.isNotEmpty // Conditionally show the close icon
                  ? InkWell(
                      onTap: () {
                        setState(() {
                          _serch2.clear();
                          allproductserchap(
                              _serch2.text); // Call API with empty search
                          // name = false;  // Reset name and wait state
                          // wait = false;
                        });
                      },
                      child: Icon(Icons.close, size: 20),
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
            allproductap();
            allproductserchap(_serch2.text);
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
            allproductap();
            allproductserchap(_serch2.text);
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
              EasyLoading.showError('No Data Found');
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
              EasyLoading.showError('No Data Found');
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

  paginationapi() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['page'] = "$page";
    data['limit'] = "6";
    checkInternet().then((internet) async {
      print("555555555555555");
      if (internet) {
        authprovider().paginationap(data).then((response) async {
          paginationModel =
              PaginationModel.fromJson(json.decode(response.body));
          print(paginationModel?.status);
          if (response.statusCode == 200 &&
              paginationModel?.status == "success") {
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

  allproductserchap(String value) async {
    final Map<String, String> data = {};
    data['searchText'] = value.toString();
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allproductsearchapi(data).then((response) async {
          allProductserachModel =
              AllProductSerachModel.fromJson(json.decode(response.body));
          print(allProductserachModel?.status);
          if (response.statusCode == 200 &&
              allProductserachModel?.status == "success") {
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

  // Future<void> fetchPosts() async {
  //   final url =
  //       "https://techcrunch.com/wp-json/wp/v2/posts?context=embed&per_page=5&page=$page";
  //   print("$url");
  //   final uri = Uri.parse(url);
  //   final response = await http.get(uri);
  //   if (response.statusCode == 200) {
  //     final json = jsonDecode(response.body) as List;
  //     setState(() {
  //       posts = posts + json;
  //       isloding = false;
  //     });
  //   } else {
  //     print("eroor unexpected");
  //   }
  // }

  Future<void> _scrollListener() async {
    if (isloadingMore) return;
    if (scrollController.position.pixels ==
        scrollController.position.maxScrollExtent) {
      setState(() {
        isloadingMore = true;
      });
      page = page + 1;
      print("$page");
      await paginationapi();
      setState(() {
        isloadingMore = false;
      });
    }
  }
}
