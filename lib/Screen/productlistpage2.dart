import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/BrandWiceProductModel.dart';
import 'package:ecommerce/Modal/BrandWiceProductsearchModel.dart';
import 'package:ecommerce/Modal/FilterbyModel.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SaleListSerachModal.dart';
import 'package:ecommerce/Modal/SalesProductListModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductDetailnovartition.dart';
import 'package:ecommerce/Screen/Productdetai2lWebview.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ProductListPage2 extends StatefulWidget {
  String? allcatid;

  ProductListPage2({super.key, this.allcatid});

  @override
  State<ProductListPage2> createState() => _ProductListPageState();
}

bool name = false;
bool type = false;

TextEditingController _serch2 = TextEditingController();

final GlobalKey<ScaffoldState> _scaffoldKeylist2 = GlobalKey<ScaffoldState>();
bool _isLoading = false;

bool isLoading = true;

class _ProductListPageState extends State<ProductListPage2> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brandswiceproductap();
    setState(() {
      _serch2.text = '';
      setState(() {
        type=false;
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
                                          size: 22.sp,
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
                                    border: Border.all(color: Colors.grey),
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
                                              value: "A to Z",
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
                                              value: "Z to A",
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
                                      Text(
                                        "Sort By",
                                        style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff0061b0),
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
                                                  type=true;
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
                                      Text(
                                        "Filter By",
                                        style: TextStyle(
                                          fontFamily: "task",
                                          fontSize: 15.0,
                                          fontWeight: FontWeight.w600,
                                          color: Color(0xff0061b0),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),

                              SizedBox(
                                height: 2.h,
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
                   type? SliverGrid(
                     gridDelegate:
                     SliverGridDelegateWithMaxCrossAxisExtent(
                         maxCrossAxisExtent:
                         200, // Adjust as needed
                         mainAxisSpacing:
                         10.0, // Adjust as needed
                         crossAxisSpacing:
                         10.0, // Adjust as needed
                         childAspectRatio:
                         6.5 / 10 // Adjust as needed
                     ),
                     delegate: SliverChildBuilderDelegate(
                           (BuildContext context, int index) {
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
                                                   (filterbymodel
                                                       ?.searchResults?[
                                                   index]
                                                       .productPrice)
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
                                               width: 1.w,
                                             ),
                                             Text(
                                               '₹' +
                                                   (filterbymodel
                                                       ?.searchResults?[
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
                           ],
                         );
                       },
                       childCount: filterbymodel
                           ?.searchResults?.length,
                     ),
                   ):_serch2.text != ''
                            ?
                        brandWiceProductsearchmodel?.data?.length == 0 ||
                            brandWiceProductsearchmodel?.data?.length ==
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
                                                10.0, // Adjust as needed
                                            crossAxisSpacing:
                                                10.0, // Adjust as needed
                                            childAspectRatio:
                                                6.5 / 10 // Adjust as needed
                                            ),
                                    delegate: SliverChildBuilderDelegate(
                                      (BuildContext context, int index) {
                                        return Stack(
                                          children: [
                                            GestureDetector(
                                              onTap: () {
                                               Navigator.of(context)
                                                        .push(MaterialPageRoute(
                                                            builder: (context) =>
                                                                productdetailnovartion(
                                                                  productid: brandWiceProductsearchmodel
                                                                          ?.data?[
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
                                                        brandWiceProductsearchmodel
                                                            ?.data?[
                                                        index]
                                                            .productImages?.length==0?'': brandWiceProductsearchmodel
                                                            ?.data?[
                                                        index]
                                                            .productImages?[0] ??
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
                                                                  brandWiceProductsearchmodel
                                                                          ?.data?[
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
                                                                  (brandWiceProductsearchmodel
                                                                          ?.data?[
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
                                                              width: 1.w,
                                                            ),
                                                            Text(
                                                              '₹' +
                                                                  (brandWiceProductsearchmodel
                                                                          ?.data?[
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
                                                                            productdetailnovartion(
                                                                              productid: brandWiceProductsearchmodel?.data?[index].productID ?? '',
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
                                                        : brandWiceProductsearchmodel
                                                                    ?.data?[
                                                                        index]
                                                                    .wishlist ==
                                                                1
                                                            ? removewishlistap(
                                                                (brandWiceProductsearchmodel
                                                                        ?.data?[
                                                                            index]
                                                                        .productID)
                                                                    .toString())
                                                            : addwishlistap(
                                                                (brandWiceProductsearchmodel
                                                                        ?.data?[
                                                                            index]
                                                                        .productID)
                                                                    .toString());
                                                  },
                                                  child: Icon(
                                                    brandWiceProductsearchmodel
                                                                ?.data?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? Icons.favorite
                                                        : Icons
                                                            .favorite_outline,
                                                    size: 20.sp,
                                                    color: brandWiceProductsearchmodel
                                                                ?.data?[
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
                                      childCount: brandWiceProductsearchmodel
                                          ?.data?.length,
                                    ),
                                  ):
                        brandWiceProductmodel?.data?.length == 0 ||
                            brandWiceProductmodel?.data?.length ==
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
                              10.0, // Adjust as needed
                              crossAxisSpacing:
                              10.0, // Adjust as needed
                              childAspectRatio:
                              6.5 / 10 // Adjust as needed
                          ),
                          delegate: SliverChildBuilderDelegate(
                                (BuildContext context, int index) {
                              return Stack(
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                          builder: (context) =>
                                              productdetailnovartion(
                                                productid: brandWiceProductmodel
                                                    ?.data?[
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
                                              brandWiceProductmodel
                                                  ?.data?[
                                              index]
                                                  .productImages?.length==0?'': brandWiceProductmodel
                                                  ?.data?[
                                              index]
                                                  .productImages?[0] ??
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
                                                        brandWiceProductmodel
                                                            ?.data?[
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
                                            mainAxisAlignment:
                                            MainAxisAlignment
                                                .center,
                                            children: [
                                              Row(
                                                children: [
                                                  Text(
                                                    '₹' +
                                                        (brandWiceProductmodel
                                                            ?.data?[
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
                                                          (brandWiceProductmodel
                                                              ?.data?[index]
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
                                                          productdetailnovartion(
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
                                              : brandWiceProductmodel
                                              ?.data?[
                                          index]
                                              .wishlist ==
                                              1
                                              ? removewishlistap(
                                              (brandWiceProductmodel
                                                  ?.data?[
                                              index]
                                                  .productID)
                                                  .toString())
                                              : addwishlistap(
                                              (brandWiceProductmodel
                                                  ?.data?[
                                              index]
                                                  .productID)
                                                  .toString());
                                        },
                                        child: Icon(
                                          brandWiceProductmodel
                                              ?.data?[
                                          index]
                                              .wishlist ==
                                              1
                                              ? Icons.favorite
                                              : Icons
                                              .favorite_outline,
                                          size: 20.sp,
                                          color: brandWiceProductmodel
                                              ?.data?[
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
                            childCount:  brandWiceProductmodel
                                ?.data?.length, // Replace with the number of grid items you want
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
                                      child: (salesproductlistmodal?.productData?.length ?? 0) < 5
                                          ? Container()
                                          : Container(
                                              alignment: Alignment.center,
                                              height: 4.h,
                                              width: 30.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(30),
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
                              : Container(),
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
            brandswiceproductap();
            brandwiceproductserach(_serch2.text);
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
              isLoading = false; type=false;
            });
          } else {
            setState(() {
              isLoading = false; type=false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false; type=false;
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
              type=false;
            });
          } else {
            setState(() {
              isLoading = false;
              type=false;
            });
          }
        });
      } else {
        setState(() {
          isLoading = false;
          type=false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }


  filterbysearch(String value) async {
    final Map<String, String> data = {};
    data['User_id'] = (usermodal?.userId).toString();
    data['priceSort'] = value.toString();
    print('AA dada : ${data}');
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().filterserchapi(data).then((response) async {
          filterbymodel =
              FilterbyModel.fromJson(json.decode(response.body));
          print(filterbymodel?.status);
          if (response.statusCode == 200 &&
              filterbymodel?.status == "success") {
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
