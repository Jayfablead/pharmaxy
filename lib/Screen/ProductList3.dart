import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/FilterbyModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
import 'package:ecommerce/Modal/ShortbyModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
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

import 'ProductDetailnovartition.dart';

class ProductList3 extends StatefulWidget {
  String? selid;

  ProductList3({super.key, this.selid});

  @override
  State<ProductList3> createState() => _ProductList3State();
}

bool name = false;

TextEditingController _serch2 = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKeylist3 = GlobalKey<ScaffoldState>();
bool _isLoading = false;
bool _issearch = false;

bool isLoading = true;
String? type1;
String? short;

class _ProductList3State extends State<ProductList3> {



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



  double calculatePercentageOffbestsellproduct(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        bestsellerproductmodal?.productData?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        bestsellerproductmodal?.productData?[index].saleProductPrice ?? '0');

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



  double calculatePercentageOffbestsellproductsearch(int index) {
    // Debugging: Print the index and check if the product exists
    print('Index: $index');

    // Access the product price
    double? productPrice = double.tryParse(
        searchbestsaleModal?.productData?[index].productPrice ?? '0');

    // Debugging: Print the product price
    print('Product Price: $productPrice');

    // Access the sale product price
    double? saleProductPrice = double.tryParse(
        searchbestsaleModal?.productData?[index].saleProductPrice ?? '0');

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







  ScrollController _scrollController = ScrollController();
  bool isLoadingMore = false;
  int currentPage = 1;
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
    _scrollController.addListener(() {
      if (_scrollController.position.pixels == _scrollController.position.maxScrollExtent && !isLoadingMore) {
        _loadMoreData(); // Fetch the next page of products
      }
    });

  }
  Future<void> _loadMoreData() async {
    setState(() {
      isLoadingMore = true;
    });

    // Simulate fetching data with a delay (replace with API call)
    await Future.delayed(Duration(seconds: 2));

    setState(() {
      currentPage++;
      isLoadingMore = false;
      // Fetch more products and add to the list (append to shortbymodel.searchResults)
      // For example: shortbymodel.searchResults.addAll(newFetchedProducts);
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
                      controller: _scrollController,
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
                                      "Product List",
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
                                              ?   Icon(
                                              CupertinoIcons.person_add,
                                              size: 21.sp,
                                              color:  AppColors.primary

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
                                      border: Border.all(color: AppColors.primary)
                                  ),
                                  child: Row(
                                    children: [
                                      SizedBox(width: 30.0),
                                      Theme(
                                        data: Theme.of(context).copyWith(
                                          popupMenuTheme: PopupMenuThemeData(
                                            color: AppColors.primary, // White background for the popup menu
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
                                              value: "A to Z",onTap: (){
                                              setState(() {
                                                shortbyap("A to Z");
                                                short="2";
                                              });
                                            },
                                              child: Text(
                                                "A to Z",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: "Z to A",onTap: (){
                                              setState(() {
                                                shortbyap("Z to A");
                                                short="1";
                                              });
                                            },
                                              child: Text(
                                                "Z to A",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color:Colors.white
                                                ),
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
                                            value: "A to Z",onTap: (){
                                            setState(() {
                                              shortbyap("A to Z");
                                              short="2";
                                            });
                                          },
                                            child: Text(
                                              "A to Z",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: "Z to A",onTap: (){
                                            setState(() {
                                              shortbyap("Z to A");
                                              short="1";
                                            });
                                          },
                                            child: Text(
                                              "Z to A",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color:Colors.white
                                              ),
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
                                              color: AppColors.primary // White background for the popup menu
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
                                              print("Filter by Price High to Low");
                                            }
                                          },
                                          itemBuilder: (context) => [
                                            PopupMenuItem(
                                              value: "Price High to Low",onTap: (){
                                              setState(() {
                                                filterbysearch("Price High to Low");
                                                type1="2";
                                              });
                                            },
                                              child: Text(
                                                "Price High to Low",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color:Colors.white
                                                ),
                                              ),
                                            ),
                                            PopupMenuItem(
                                              value: "Price Low to High",
                                              onTap: (){
                                                setState(() {
                                                  filterbysearch("Price Low to High");
                                                  type1="1";
                                                });
                                              },
                                              child: Text(
                                                "Price Low to High",
                                                style: TextStyle(
                                                    fontFamily: "task",
                                                    fontSize: 15.0,
                                                    fontWeight: FontWeight.w600,
                                                    color: Colors.white
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                      SizedBox(width: 10.0),
                                      PopupMenuButton<String>(
                                        onSelected: (value) {
                                          if (value == "Price High to Low") {
                                            print("Filter by Price High to Low");
                                          }
                                        },
                                        itemBuilder: (context) => [
                                          PopupMenuItem(
                                            value: "Price High to Low",onTap: (){
                                            setState(() {
                                              filterbysearch("Price High to Low");
                                              type1="2";
                                            });
                                          },
                                            child: Text(
                                              "Price High to Low",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color:Colors.white
                                              ),
                                            ),
                                          ),
                                          PopupMenuItem(
                                            value: "Price Low to High",
                                            onTap: (){
                                              setState(() {
                                                filterbysearch("Price Low to High");
                                                type1="1";
                                              });
                                            },
                                            child: Text(
                                              "Price Low to High",
                                              style: TextStyle(
                                                  fontFamily: "task",
                                                  fontSize: 15.0,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.white
                                              ),
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
                        short=="1"? SliverGrid(
                          gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
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
                                  // Check if we reached the end of the list and need to load more data
                                  if (index == shortbymodel?.searchResults?.length) {
                                    // Show the loader
                                    return isLoadingMore
                                        ? Center(child: CircularProgressIndicator())
                                        : SizedBox(); // No loader if not loading more
                                  }

                                  return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
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
                                            borderRadius: BorderRadius.circular(10)
                                        ),
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
                                                shortbymodel
                                                    ?.searchResults?[
                                                index]
                                                    .allImages?.length==0?'': shortbymodel
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
                                                              11
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
                                                        '₹' + (shortbymodel?.searchResults?[index].productPrice).toString(),
                                                        style: TextStyle(
                                                          decoration: shortbymodel?.searchResults?[index].saleProductPrice != shortbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
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
                                                alignment:
                                                Alignment.center,
                                                height: 4.h,
                                                width: 32.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    color: Color(0xff0061b0)),
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
                                              builder:
                                                  (context) =>
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
                                  percentageOffValue == null || percentageOffValue == 0
                                      ? Container():Positioned(
                                      right: 29.w,
                                      top: 0.7.h,
                                      child:
                                      Container(
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
                                              '${percentageOffValue.toStringAsFixed(2)}%',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              );
                            },
                            childCount: (shortbymodel?.searchResults?.length ?? 0) + 1, // Adding 1 to show loader at the end
                            // childCount: shortbymodel
                            //     ?.searchResults?.length,
                          ),
                        ):
                        short=="2"? SliverGrid(
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
                                  // Check if we reached the end of the list and need to load more data
                                  if (index == shortbymodel?.searchResults?.length) {
                                    // Show the loader
                                    return isLoadingMore
                                        ? Center(child: CircularProgressIndicator())
                                        : SizedBox(); // No loader if not loading more
                                  }
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
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
                                            borderRadius: BorderRadius.circular(10)
                                        ),
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
                                                shortbymodel
                                                    ?.searchResults?[
                                                index]
                                                    .allImages?.length==0?'': shortbymodel
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
                                                              11
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
                                                            fontSize:11.sp,
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
                                                          '${percentageOffValue.toStringAsFixed(2)}%',
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
                                                alignment:
                                                Alignment.center,
                                                height: 4.h,
                                                width: 32.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    color: Color(0xff0061b0)),
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
                                              builder:
                                                  (context) =>
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
                                  percentageOffValue == null || percentageOffValue == 0
                                      ? Container():Positioned(
                                      right: 27.w,
                                      top: 0.7.h,
                                      child:
                                      Container(
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
                                              'percentageOffValue.toStringAsFixed(2)}% Off',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              );
                            },
                            childCount: (shortbymodel?.searchResults?.length ?? 0) + 1, // Adding 1 to show loader at the end
                            // childCount: shortbymodel
                            //     ?.searchResults?.length,
                          ),
                        ):
                        type1=="1"? SliverGrid(
                          gridDelegate:
                          SliverGridDelegateWithMaxCrossAxisExtent(
                              maxCrossAxisExtent:
                              200, // Adjust as needed
                              mainAxisSpacing:
                              0.0, // Adjust as needed
                              crossAxisSpacing:
                              0.0, // Adjust as needed
                              childAspectRatio:
                              6.5 / 7.5 // Adjust as needed
                          ),
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                                  double
                                  percentageOffValue =
                                  calculatePercentageOfffilter(
                                      index);
                                  // Check if we reached the end of the list and need to load more data
                                  if (index == shortbymodel?.searchResults?.length) {
                                    // Show the loader
                                    return isLoadingMore
                                        ? Center(child: CircularProgressIndicator())
                                        : SizedBox(); // No loader if not loading more
                                  }
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
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
                                            borderRadius: BorderRadius.circular(10)
                                        ),
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
                                                filterbymodel
                                                    ?.searchResults?[
                                                index]
                                                    .allImages?.length==0?'': filterbymodel
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
                                                          filterbymodel
                                                              ?.searchResults?[
                                                          index]
                                                              .productName ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize:
                                                              11
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
                                                        '₹' + (filterbymodel?.searchResults?[index].productPrice).toString(),
                                                        style: TextStyle(
                                                          decoration: filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
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
                                                          '${percentageOffValue.toStringAsFixed(2)}%',
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
                                                Alignment.center,
                                                height: 4.h,
                                                width: 32.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    color: Color(0xff0061b0)),
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
                                              builder:
                                                  (context) =>
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
                                              : addwishlistap(
                                              (filterbymodel
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
                                  percentageOffValue == null || percentageOffValue == 0
                                      ? Container():Positioned(
                                      right: 27.w,
                                      top: 0.7.h,
                                      child:
                                      Container(
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
                                              '${percentageOffValue.toStringAsFixed(2)}%',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),

                                  //${percentageOffValue.toStringAsFixed(2)}% Off
                                ],
                              );
                            },
                            childCount: filterbymodel
                                ?.searchResults?.length,
                          ),
                        ):
                        type1=="2"? SliverGrid(
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
                                  calculatePercentageOfffilter(
                                      index);
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
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
                                            borderRadius: BorderRadius.circular(10)
                                        ),
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
                                                filterbymodel
                                                    ?.searchResults?[
                                                index]
                                                    .allImages?.length==0?'': filterbymodel
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
                                                          filterbymodel
                                                              ?.searchResults?[
                                                          index]
                                                              .productName ??
                                                              '',
                                                          style: TextStyle(
                                                              fontSize:
                                                              11
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
                                                        '₹' + (filterbymodel?.searchResults?[index].productPrice).toString(),
                                                        style: TextStyle(
                                                          decoration: filterbymodel?.searchResults?[index].saleProductPrice != filterbymodel?.searchResults?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
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
                                                          '${percentageOffValue.toStringAsFixed(2)}%',
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
                                                Alignment.center,
                                                height: 4.h,
                                                width: 32.w,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius
                                                        .circular(
                                                        10),
                                                    color: Color(0xff0061b0)),
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
                                              builder:
                                                  (context) =>
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
                                              : addwishlistap(
                                              (filterbymodel
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
                                  percentageOffValue == null || percentageOffValue == 0
                                      ? Container():Positioned(
                                      right: 27.w,
                                      top: 0.7.h,
                                      child:
                                      Container(
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
                                              '${percentageOffValue.toStringAsFixed(2)}%',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                            Text(
                                              'OFF',
                                              style: TextStyle(
                                                  color: Colors.white, // Text color
                                                  fontSize: 7.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task"
                                              ),
                                            ),
                                          ],
                                        ),
                                      )
                                  ),
                                ],
                              );
                            },
                            childCount: filterbymodel
                                ?.searchResults?.length,
                          ),
                        ):
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
                                        'No Medicine Available',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
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
                                            6.5 / 7.9 // Adjust as needed
                                            ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        double
                                        percentageOffValue =
                                        calculatePercentageOffbestsellproduct(
                                            index);
                                        return Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                              Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                productdetailnovartion(
                                                                  productid: bestsellerproductmodal
                                                                          ?.productData?[
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
                                                    borderRadius: BorderRadius.circular(10)
                                                  ),
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
                                                                    bestsellerproductmodal
                                                                            ?.productData?[
                                                                                index]
                                                                            .productName ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11
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
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              if (bestsellerproductmodal?.productData?[index].saleProductPrice != bestsellerproductmodal?.productData?[index].productPrice)
                                                                Padding(
                                                                  padding: EdgeInsets.only(top: 0.4.h),
                                                                  child: Text(
                                                                    '₹' + (bestsellerproductmodal?.productData?[index].saleProductPrice).toString(),
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
                                                                  '₹' + (bestsellerproductmodal?.productData?[index].productPrice).toString(),
                                                                  style: TextStyle(
                                                                    decoration: bestsellerproductmodal?.productData?[index].saleProductPrice != bestsellerproductmodal?.productData?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
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
                                                        onTap: () {
                                                        Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              productdetailnovartion(
                                                                                productid: bestsellerproductmodal?.productData?[index].productID ?? '',
                                                                              )));

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
                                                              color: Color(0xff0061b0)),
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
                                            percentageOffValue == null || percentageOffValue == 0
                                                ? Container():Positioned(
                                                right: 27.w,
                                                top: 0.7.h,
                                                child:
                                                Container(
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
                                                        '${percentageOffValue.toStringAsFixed(2)}%',
                                                        style: TextStyle(
                                                            color: Colors.white, // Text color
                                                            fontSize: 7.sp,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily: "task"
                                                        ),
                                                      ),
                                                      Text(
                                                        'OFF',
                                                        style: TextStyle(
                                                            color: Colors.white, // Text color
                                                            fontSize: 7.sp,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily: "task"
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
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
                                        'No Medicine Available',
                                        style: TextStyle(
                                          fontWeight: FontWeight.normal,
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
                                            6.5 / 8.5 // Adjust as needed
                                            ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        double
                                        percentageOffValue =
                                        calculatePercentageOffbestsellproductsearch(
                                            index);
                                        return Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                             Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                productdetailnovartion(
                                                                  productid: searchbestsaleModal
                                                                          ?.productData?[
                                                                              index]
                                                                          .productID ??
                                                                      '',
                                                                )));

                                              },
                                              child: Card(
                                                color: Colors.white,
                                                child: Container(
                                                  decoration: BoxDecoration(
                                                    borderRadius: BorderRadius.circular(10),
                                                    color: Colors.white
                                                  ),
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
                                                                    searchbestsaleModal
                                                                            ?.productData?[
                                                                                index]
                                                                            .productName ??
                                                                        '',
                                                                    style: TextStyle(
                                                                        fontSize:
                                                                            11
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
                                                      Row(
                                                        mainAxisAlignment:
                                                        MainAxisAlignment.center,
                                                        crossAxisAlignment:
                                                        CrossAxisAlignment.center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              if (searchbestsaleModal?.productData?[index].saleProductPrice != searchbestsaleModal?.productData?[index].productPrice)
                                                                Padding(
                                                                  padding: EdgeInsets.only(top: 0.4.h),
                                                                  child: Text(
                                                                    '₹' + (searchbestsaleModal?.productData?[index].saleProductPrice).toString(),
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
                                                                  '₹' + (searchbestsaleModal?.productData?[index].productPrice).toString(),
                                                                  style: TextStyle(
                                                                    decoration: searchbestsaleModal?.productData?[index].saleProductPrice != searchbestsaleModal?.productData?[index].productPrice ? TextDecoration.lineThrough : TextDecoration.none,
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
                                                        onTap: () {
                                                         Navigator.of(context).push(
                                                                  MaterialPageRoute(
                                                                      builder:
                                                                          (context) =>
                                                                              productdetailnovartion(
                                                                                productid: searchbestsaleModal?.productData?[index].productID ?? '',
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
                                                              color: Color(0xff0061b0)),
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
                                            percentageOffValue == null || percentageOffValue == 0
                                                ? Container():Positioned(
                                                right: 27.w,
                                                top: 0.7.h,
                                                child:
                                                Container(
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
                                                        '${percentageOffValue.toStringAsFixed(2)}%',
                                                        style: TextStyle(
                                                            color: Colors.white, // Text color
                                                            fontSize: 7.sp,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily: "task"
                                                        ),
                                                      ),
                                                      Text(
                                                        'OFF',
                                                        style: TextStyle(
                                                            color: Colors.white, // Text color
                                                            fontSize: 7.sp,
                                                            fontWeight: FontWeight.bold,
                                                            fontFamily: "task"
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                )
                                            ),
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
                                                    color: Color(0xff0061b0)),
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
              type1= "";
              short= "";
            });
          } else {
            setState(() {
              isLoading = false;
              type1= "";
              short= "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1= "";
          short= "";
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
          bestsalesserchap(_serch2.text);
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
                _issearch = false; // Reset the search state if needed
              });
              bestsalesserchap(_serch2.text); // Call the API with empty search
            },
          )
              : null,
          border: InputBorder.none,
          hintText: 'Search Products',
          hintStyle: TextStyle(color: Colors.black, fontFamily: 'task',fontSize: 12.sp),
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
            filterbysearch( value);
            shortbyap( value);
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
            filterbysearch( value);
            shortbyap( value);
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
              type1= "";
              short= "";
            });
          } else {
            setState(() {
              isLoading = false;
              type1= "";
              short= "";
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1= "";
          short= "";
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
          filterbymodel =
              FilterbyModel.fromJson(json.decode(response.body));
          print(filterbymodel?.status);
          if (response.statusCode == 200 &&
              filterbymodel?.status == "success") {
            EasyLoading.showSuccess('success');
            setState(() {
              isLoading = false;
              short= "";

            });
          } else {
            setState(() {
              EasyLoading.showError('No Data Found');
              isLoading = false;
              short= "";

            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          short= "";

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
          shortbymodel =
              ShortbyModel.fromJson(json.decode(response.body));
          print(shortbymodel?.status);
          if (response.statusCode == 200 &&
              shortbymodel?.status == "success") {
            EasyLoading.showSuccess('success');
            setState(() {
              isLoading = false;
              type1= "";
            });
          } else {
            setState(() {
              EasyLoading.showError('No Data Found');
              isLoading = false;
              type1= "";

            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type1= "";

        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
