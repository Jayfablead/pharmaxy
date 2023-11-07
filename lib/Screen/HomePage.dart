import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/AllCatModal.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/CatWiceProductModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SalesProductModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/CategoryPage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProductDetailPage2.dart';
import 'package:ecommerce/Screen/ProductList3.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/SubCateGoryPage.dart';
import 'package:ecommerce/Screen/productlistpage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  int? sel;

  HomePage({super.key, required this.sel});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isLoading = true;
bool name = false;
bool wait = true;
TextEditingController _serch = TextEditingController();

class book {
  String? image;
  String? price;
  String? name;
  String? bestprice;
  String? detail;

  book(this.image, this.name, this.price, this.bestprice, this.detail);
}

List<book> mobile = [
  book(
      'https://www.transparentpng.com/thumb/mobile/mobile-samsung-phone-background-png-6.png',
      "vivo v27 New ",
      "24,500",
      "24,200",
      "Vivo T2 Pro 5G is teased to feature power and the "),
  book(
      'https://www.transparentpng.com/thumb/mobile/mobile-samsung-phone-background-png-6.png',
      "vivo v27 New ",
      "24,500",
      "24,200",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  book(
      'https://www.transparentpng.com/thumb/mobile/mobile-samsung-phone-background-png-6.png',
      "vivo v27 New",
      "24,500",
      "24,200",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  book(
      'https://www.transparentpng.com/thumb/mobile/mobile-samsung-phone-background-png-6.png',
      "vivo v27 New",
      "24,500",
      "24,200",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
];

List<book> mobile1 = [
  book(
      'https://images.pngnice.com/download/2007/Mobile-Phone-PNG-HD.png',
      "Samsung S21 ",
      "20,500",
      "16,200",
      "Vivo T2 Pro 5G is teased to feature power and the "),
  book(
      'https://images.pngnice.com/download/2007/Mobile-Phone-PNG-HD.png',
      "Samsung S21 ",
      "20,500",
      "16,200",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  book(
      'https://images.pngnice.com/download/2007/Mobile-Phone-PNG-HD.png',
      "Samsung S21",
      "20,500",
      "16,200",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
  book(
      'https://images.pngnice.com/download/2007/Mobile-Phone-PNG-HD.png',
      "Samsung S21",
      "20,500",
      "16,200",
      "Vivo T2 Pro 5G is teased to feature power and the volume buttons on its right edge."),
];

List booka = [
  "Mobile",
  "Computer",
  "books",
  "Watches",
  "Toys",
];

final List<String> imageList = [
  "https://image01-in.oneplus.net/india-oneplus-statics-file/epb/202304/03/LxsGBcytXOcDJ0CD.png?x-amz-process=image/format,webp/quality,Q_80",
  "https://image01-in.oneplus.net/india-oneplus-statics-file/epb/202304/03/LxsGBcytXOcDJ0CD.png?x-amz-process=image/format,webp/quality,Q_80",
  "https://image01-in.oneplus.net/india-oneplus-statics-file/epb/202304/03/LxsGBcytXOcDJ0CD.png?x-amz-process=image/format,webp/quality,Q_80",
  "https://image01-in.oneplus.net/india-oneplus-statics-file/epb/202304/03/LxsGBcytXOcDJ0CD.png?x-amz-process=image/format,webp/quality,Q_80",
];

List cate = [
  "https://www.pngmart.com/files/15/Apple-iPhone-11-PNG-Background-Image.png",
  "https://www.transparentpng.com/thumb/computer/6o4Q2H-png-windows-desktop-set-software-game-coding-.png",
  "https://pngimg.com/d/book_PNG51058.png",
  "https://www.transparentpng.com/thumb/watch/dOleGR-skin-watch-clipart-transparent.png",
  "https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png",
];

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();

int sel = -1;

String? selected;

bool _isLoading = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();

    allcatap();
    viewap();
    salesproductap();
    bestsellerproductap();
    setState(() {
      isLoading = true;
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
        bottomNavigationBar: bottombar(selected: sel),
        body: WillPopScope(
          onWillPop: dialog,
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
                  child: CustomScrollView(
                    slivers: [
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 3.h,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              IconButton(
                                onPressed: () {
                                  _scaffoldKey.currentState?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu,
                                  size: 25.sp,
                                ),
                              ),
                              Row(
                                children: [
                                  Padding(
                                    padding: EdgeInsets.only(right: 2.w),
                                    child: GestureDetector(
                                      onTap: () {
                                        usermodal?.userId == "" ||
                                                usermodal?.userId == null
                                            ? Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      LoginPage2(),
                                                ),
                                              )
                                            : Navigator.of(context).push(
                                                MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage(),
                                                ),
                                              );
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
                                              width: 12.2.w,
                                              padding: EdgeInsets.all(1.w),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: CachedNetworkImage(
                                                  imageUrl: profilemodal
                                                          ?.profileDetails
                                                          ?.profileimage ??
                                                      '',
                                                  fit: BoxFit.cover,
                                                  progressIndicatorBuilder:
                                                      (context, url,
                                                              progress) =>
                                                          Center(
                                                              child:
                                                                  CircularProgressIndicator()),
                                                  errorWidget:
                                                      (context, url, error) =>
                                                          Icon(
                                                    Icons.error_outline_rounded,
                                                  ),
                                                ),
                                              ),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 1.h,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                "Select Category",
                                style: TextStyle(
                                    fontSize: 16.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "task"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => CategoryPage()));
                              },
                              child: Container(
                                child: allcatmodal?.categories?.length == 0
                                    ? Text("")
                                    : Text(
                                        "View All",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 13.5.sp,
                                            color: Color(0xfff7941d),
                                            fontFamily: "task"),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: Container(
                          height: 17.h,
                          child: allcatmodal?.categories?.length == 0
                              ? Center(
                                  child: Text(
                                    "No Category Available",
                                    style: TextStyle(
                                        fontSize: 18.sp,
                                        fontFamily: 'task',
                                        fontWeight: FontWeight.bold),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      child: Center(
                                        child: Column(
                                          crossAxisAlignment:
                                              CrossAxisAlignment.center,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          children: [
                                            InkWell(
                                              onTap: () {
                                                setState(() {
                                                  sel = index;
                                                  selected = allcatmodal
                                                      ?.categories?[index]
                                                      .categoryID
                                                      .toString();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              SubCateGoryPage(
                                                                catid: selected,
                                                              )));
                                                });
                                                catwiceproductap();
                                              },
                                              child: Container(
                                                height: 19.w,
                                                width: 19.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: sel == index
                                                      ? Colors
                                                          .deepOrange.shade50
                                                      : Colors.grey.shade100,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: sel == index
                                                        ? Color(0xfff7941d)
                                                        : Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          100),
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                child: CircleAvatar(
                                                  radius: 9.5.w,
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            150),
                                                    child: CachedNetworkImage(
                                                      height: 17.w,
                                                      width: 17.w,
                                                      imageUrl: allcatmodal
                                                              ?.categories?[
                                                                  index]
                                                              .catagoryimage ??
                                                          '',
                                                      fit: BoxFit.cover,
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  progress) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(Icons
                                                              .error_outline_outlined),
                                                    ),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            SizedBox(
                                              height: 1.h,
                                            ),
                                            SizedBox(
                                              width: 16.w,
                                              child: Text(
                                                textAlign: TextAlign.center,
                                                overflow: TextOverflow.ellipsis,
                                                maxLines: 1,
                                                allcatmodal?.categories?[index]
                                                                .categoryName ==
                                                            '' ||
                                                        allcatmodal
                                                                ?.categories?[
                                                                    index]
                                                                .categoryName ==
                                                            null
                                                    ? 'N/A'
                                                    : allcatmodal
                                                            ?.categories?[index]
                                                            .categoryName ??
                                                        '',
                                                style: TextStyle(
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task",
                                                  color: sel == index
                                                      ? Color(0xfff7941d)
                                                      : Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: allcatmodal?.categories?.length,
                                ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 1.h,
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: bestsellerproductmodal?.productData?.length ==
                                    0 ||
                                bestsellerproductmodal?.productData?.length ==
                                    null
                            ? Container()
                            : Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                crossAxisAlignment: CrossAxisAlignment.center,
                                children: [
                                  searchBox(),
                                ],
                              ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),
                      _serch.text == ''
                          ? SliverToBoxAdapter()
                          : searchbestsaleModal?.productData?.length == 0 ||
                                  searchbestsaleModal?.productData?.length ==
                                      null
                              ? SliverToBoxAdapter(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.h,
                                    child: Center(
                                      child: Text(
                                        "No Products Available",
                                        style: TextStyle(
                                            fontSize: 20.sp,
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold),
                                      ),
                                    ),
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
                                                        ProductDetailPage2(
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
                                                        searchbestsaleModal
                                                                ?.productData?[
                                                                    index]
                                                                .imgData ??
                                                            '',
                                                    height: 11.5.h,
                                                    width: 30.w,
                                                    imageBuilder: (context,
                                                            imageProvider) =>
                                                        Container(
                                                      decoration: BoxDecoration(
                                                        // borderRadius: BorderRadius.circular(10),
                                                        image: DecorationImage(
                                                          filterQuality:
                                                              FilterQuality
                                                                  .high,
                                                          image: imageProvider,
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
                                                SizedBox(
                                                  height: 1.h,
                                                ),
                                                Padding(
                                                  padding: EdgeInsets.symmetric(
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
                                                                              .productName ==
                                                                          "" ||
                                                                      searchbestsaleModal
                                                                              ?.productData?[
                                                                                  index]
                                                                              .productName ==
                                                                          null
                                                                  ? "N/A"
                                                                  : searchbestsaleModal
                                                                          ?.productData?[
                                                                              index]
                                                                          .productName ??
                                                                      '',
                                                              style: TextStyle(
                                                                  fontSize:
                                                                      12.5.sp,
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
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 1.5.w,
                                                  ),
                                                  child: SizedBox(
                                                    width: 35.w,
                                                    child: Text(
                                                      textAlign:
                                                          TextAlign.center,
                                                      overflow:
                                                          TextOverflow.ellipsis,
                                                      maxLines: 2,
                                                      searchbestsaleModal
                                                                      ?.productData?[
                                                                          index]
                                                                      .productShortDesc ==
                                                                  "" ||
                                                              searchbestsaleModal
                                                                      ?.productData?[
                                                                          index]
                                                                      .productShortDesc ==
                                                                  null
                                                          ? "N/A"
                                                          : searchbestsaleModal
                                                                  ?.productData?[
                                                                      index]
                                                                  .productShortDesc ??
                                                              '',
                                                      style: TextStyle(
                                                        fontSize: 12.sp,
                                                        fontFamily: 'task',
                                                        fontWeight:
                                                            FontWeight.normal,
                                                        letterSpacing: 1,
                                                        color: Colors.black,
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
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
                                                            fontFamily: 'task',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                            color: Colors.black,
                                                          ),
                                                        ),
                                                        SizedBox(
                                                          width: 0.5.h,
                                                        ),
                                                        Padding(
                                                          padding:
                                                              EdgeInsets.only(
                                                                  top: 0.5.h),
                                                          child: Text(
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
                                                              letterSpacing: 1,
                                                              color:
                                                                  Colors.black,
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
                                                            builder: (context) =>
                                                                ProductDetailPage2(
                                                                  productid: searchbestsaleModal
                                                                          ?.productData?[
                                                                              index]
                                                                          .productID ??
                                                                      '',
                                                                )));
                                                    //ADD CART API
                                                    // addtocartapi((catwiceproductmodal
                                                    //     ?.categoriesWiseProduct?[
                                                    // index]
                                                    //     .productID)
                                                    //     .toString());
                                                  },
                                                  child: Container(
                                                    alignment: Alignment.center,
                                                    height: 4.h,
                                                    width: 30.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(30),
                                                        color:
                                                            Color(0xfff7941d)),
                                                    child: Text(
                                                      "View Product",
                                                      style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.white),
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
                                                            builder: (context) =>
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
                                                    : Icons.favorite_outline,
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
                                          ?.productData?.length
                                      // Replace

                                      ),
                                ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 1.5.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Sales",
                                    style: TextStyle(
                                        fontSize: 16.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: "task"),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductListPage2(
                                                    allcatid:
                                                        selected.toString(),
                                                  )));
                                    },
                                    child: Container(
                                      child: salesproductmodal
                                                      ?.productData?.length ==
                                                  0 ||
                                              salesproductmodal
                                                      ?.productData?.length ==
                                                  null
                                          ? Text("")
                                          : Text(
                                              "See More",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.5.sp,
                                                  color: Color(0xfff7941d),
                                                  fontFamily: "task"),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : wait
                              ? SliverToBoxAdapter(
                                  child: Container(
                                      alignment: Alignment.center,
                                      height: 2.h,
                                      width: 2.h,
                                      child: CircularProgressIndicator()),
                                )
                              : salesproductmodal?.productData?.length == 0 ||
                                      salesproductmodal?.productData?.length ==
                                          null
                                  ? SliverToBoxAdapter(
                                      child: Padding(
                                      padding: EdgeInsets.only(top: 1.h),
                                      child: Center(
                                        child: Text(
                                          'No Products Available',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'task',
                                              fontSize: 15.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ))
                                  : wait
                                      ? SliverToBoxAdapter(
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
                                        )
                                      : SliverToBoxAdapter(
                                          child: SizedBox(
                                            height: 1.5.h,
                                          ),
                                        ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: CarouselSlider(
                                options: CarouselOptions(
                                  height:
                                      salesproductmodal?.productData?.length ==
                                                  0 ||
                                              salesproductmodal
                                                      ?.productData?.length ==
                                                  null
                                          ? 7
                                          : 200.0, // Make it full screen
                                  enableInfiniteScroll:
                                      true, // Loop back to the beginning
                                  enlargeCenterPage:
                                      true, // Enlarge the center image
                                  autoPlay:
                                      true, // Automatically play the carousel
                                ),
                                items: (salesproductmodal?.productData ?? [])
                                    .map((imagePath) {
                                  return Builder(
                                    builder: (BuildContext context) {
                                      return GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProductDetailPage2(
                                                        productid:
                                                            imagePath.productID,
                                                      )));
                                        },
                                        child: Container(
                                          width:
                                              MediaQuery.of(context).size.width,
                                          margin: EdgeInsets.symmetric(
                                              horizontal: 5.0),
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            border: Border.all(
                                                width: 0.5,
                                                color: Colors.black54),
                                            color: Colors.transparent,
                                          ),
                                          child: ClipRRect(
                                            borderRadius:
                                                BorderRadius.circular(15),
                                            child: CachedNetworkImage(
                                                imageUrl: imagePath.imgData
                                                    .toString(),
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
                                                    Center(
                                                        child:
                                                            CircularProgressIndicator()),
                                                errorWidget: (context, url,
                                                        error) =>
                                                    Icon(Icons
                                                        .error_outline_rounded)),
                                          ),
                                        ),
                                      );
                                    },
                                  );
                                }).toList(),
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 1.5.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    "Best Seller",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "task",
                                    ),
                                  ),
                                  GestureDetector(
                                    onTap: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  ProductList3(
                                                    selid: selected.toString(),
                                                  )));
                                    },
                                    child: Container(
                                      child: bestsellerproductmodal
                                                      ?.productData?.length ==
                                                  0 ||
                                              bestsellerproductmodal
                                                      ?.productData?.length ==
                                                  null
                                          ? Text("")
                                          : Text(
                                              "See More",
                                              style: TextStyle(
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 13.5.sp,
                                                  color: Color(0xfff7941d),
                                                  fontFamily: "task"),
                                            ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 1.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : wait
                              ? SliverToBoxAdapter(
                                  child: Center(
                                      child: CircularProgressIndicator()),
                                )
                              : bestsellerproductmodal?.productData?.length ==
                                          0 ||
                                      bestsellerproductmodal
                                              ?.productData?.length ==
                                          null
                                  ? SliverToBoxAdapter(
                                      child: Container(
                                      height: 20.h,
                                      child: Center(
                                        child: Text(
                                          'No Products Available',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'task',
                                              fontSize: 18.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ))
                                  : wait
                                      ? SliverToBoxAdapter(
                                          child: Center(
                                              child:
                                                  CircularProgressIndicator()),
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
                                                  childAspectRatio: 6.5 /
                                                      11 // Adjust as needed
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
                                                                  ProductDetailPage2(
                                                                    productid: bestsellerproductmodal
                                                                            ?.productData?[index]
                                                                            .productID ??
                                                                        '',
                                                                  )));
                                                    },
                                                    child: Card(
                                                      color: Colors.white,
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
                                                              imageUrl: bestsellerproductmodal
                                                                              ?.productData?[
                                                                                  index]
                                                                              .imgData ==
                                                                          '' ||
                                                                      bestsellerproductmodal
                                                                              ?.productData?[
                                                                                  index]
                                                                              .imgData ==
                                                                          null
                                                                  ? 'N/A'
                                                                  : bestsellerproductmodal
                                                                          ?.productData?[
                                                                              index]
                                                                          .imgData ??
                                                                      '',
                                                              height: 11.5.h,
                                                              width: 30.w,
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
                                                                        bestsellerproductmodal?.productData?[index].productName == "" || bestsellerproductmodal?.productData?[index].productName == null
                                                                            ? "N/A"
                                                                            : bestsellerproductmodal?.productData?[index].productName ??
                                                                                '',
                                                                        style: TextStyle(
                                                                            fontSize: 12.5
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
                                                          Padding(
                                                            padding: EdgeInsets
                                                                .symmetric(
                                                              horizontal: 1.5.w,
                                                            ),
                                                            child: SizedBox(
                                                              width: 35.w,
                                                              child: Text(
                                                                textAlign:
                                                                    TextAlign
                                                                        .center,
                                                                overflow:
                                                                    TextOverflow
                                                                        .ellipsis,
                                                                maxLines: 2,
                                                                bestsellerproductmodal?.productData?[index].productShortDesc ==
                                                                            "" ||
                                                                        bestsellerproductmodal?.productData?[index].productShortDesc ==
                                                                            null
                                                                    ? "N/A"
                                                                    : bestsellerproductmodal
                                                                            ?.productData?[index]
                                                                            .productShortDesc ??
                                                                        '',
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
                                                                    bestsellerproductmodal?.productData?[index].saleProductPrice ==
                                                                                "" ||
                                                                            bestsellerproductmodal?.productData?[index].saleProductPrice ==
                                                                                null
                                                                        ? "N/A"
                                                                        : '₹' +
                                                                            (bestsellerproductmodal?.productData?[index].saleProductPrice).toString(),
                                                                    style:
                                                                        TextStyle(
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
                                                                  SizedBox(
                                                                    width:
                                                                        0.5.w,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets.only(
                                                                        top: 0.4
                                                                            .h),
                                                                    child: Text(
                                                                      bestsellerproductmodal?.productData?[index].productPrice == "" ||
                                                                              bestsellerproductmodal?.productData?[index].productPrice ==
                                                                                  null
                                                                          ? "N/A"
                                                                          : '₹' +
                                                                              (bestsellerproductmodal?.productData?[index].productPrice).toString(),
                                                                      style:
                                                                          TextStyle(
                                                                        decoration:
                                                                            TextDecoration.lineThrough,
                                                                        fontSize:
                                                                            12.sp,
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
                                                                          ProductDetailPage2(
                                                                            productid:
                                                                                bestsellerproductmodal?.productData?[index].productID ?? '',
                                                                          )));
                                                            },
                                                            child: Container(
                                                              alignment:
                                                                  Alignment
                                                                      .center,
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
                                                                    fontSize:
                                                                        12.sp,
                                                                    color: Colors
                                                                        .white),
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
                                                              : bestsellerproductmodal
                                                                          ?.productData?[
                                                                              index]
                                                                          .wishlist ==
                                                                      1
                                                                  ? removewishlistap((bestsellerproductmodal
                                                                          ?.productData?[
                                                                              index]
                                                                          .productID)
                                                                      .toString())
                                                                  : addwishlistap((bestsellerproductmodal
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
                                                : (bestsellerproductmodal
                                                                ?.productData
                                                                ?.length ??
                                                            0) <
                                                        5
                                                    ? bestsellerproductmodal
                                                        ?.productData?.length
                                                    : 4,
                                            // Replace
                                          ),
                                        ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 1.h,
                        ),
                      ),
                      SliverToBoxAdapter(
                          child: _serch.text == ''
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
                                                      BorderRadius.circular(30),
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
                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 88.w,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: BoxDecoration(
        color: Colors.grey.withOpacity(0.12),
        borderRadius: BorderRadius.circular(20),
      ),
      child: TextField(
        controller: _serch,
        onTap: () {},
        onChanged: (value) {
          setState(() {
            name = true;
          });
          if (_serch.text.isEmpty) {
            setState(() {
              name = false;
            });
          } else {
            setState(() {
              name = true;
            });
          }
          bestsalesserchap(_serch.text);
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

  allcatap() async {
    final Map<String, String> data = {};
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().allcatapi(data).then((response) async {
          allcatmodal = AllCatModal.fromJson(json.decode(response.body));
          print(allcatmodal?.status);
          if (response.statusCode == 200 && allcatmodal?.status == "success") {
            selected = allcatmodal?.categories?[0].categoryID.toString();
            catwiceproductap();
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

  Future<bool> dialog() async {
    close();
    return false;
  }

  void close() {
    showDialog(
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            content: Text(
              '! Are You Sure? \n You Want to Quit !',
              style: TextStyle(
                  fontSize: 18.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'task'),
            ),
            actions: [
              CupertinoButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 16.sp,
                      fontFamily: 'task',
                      fontWeight: FontWeight.bold,
                      color: Color(0xffff0000),
                    ),
                  ),
                  onPressed: () {
                    exit(0);
                  }),
              CupertinoButton(
                  child: Text(
                    'No',
                    style: TextStyle(
                      fontSize: 16.sp,
                      color: Colors.blue,
                      fontFamily: 'task',
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  }),
            ],
          );
        });
  }

  catwiceproductap() async {
    final Map<String, String> data = {};
    data['category_id'] = selected.toString();
    data['user_id'] = (usermodal?.userId).toString();
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
              wait = false;
              isLoading = false;
            });
          } else {
            setState(() {
              wait = false;
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          wait = false;
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
            bestsalesserchap(_serch.text);
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
            bestsalesserchap(_serch.text);
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

  salesproductap() async {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().salesproductapi(data).then((response) async {
          salesproductmodal =
              SalesProductModal.fromJson(json.decode(response.body));
          print(salesproductmodal?.status);
          if (response.statusCode == 200 &&
              salesproductmodal?.status == "success") {
            print('EE Thay Gyu Hooooo ! ^_^');
            setState(() {
              wait = false;
              isLoading = false;
            });
          } else {
            setState(() {
              wait = false;
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          wait = false;
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
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
              wait = false;
              isLoading = false;
            });
          } else {
            setState(() {
              wait = false;
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          wait = false;
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
