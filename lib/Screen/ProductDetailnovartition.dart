import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Databasehandler.dart';
import 'package:ecommerce/Modal/AddCartModal.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/Addtocart_withoutuser_Model.dart';
import 'package:ecommerce/Modal/Cartmodal.dart';
import 'package:ecommerce/Modal/DeleteReviewModal.dart';
import 'package:ecommerce/Modal/ProductDetail2Modal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/ViewReviewModal.dart';
import 'package:ecommerce/Modal/addReviewModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/Productdetai2lWebview.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Provider/cartProvider.dart';
import '../Widget/bottombar.dart';

class productdetailnovartion extends StatefulWidget {
  String? productid;

  productdetailnovartion({
    super.key,
    this.productid,
  });

  @override
  State<productdetailnovartion> createState() => _productdetailnovartionState();
}

final GlobalKey<ScaffoldState> _scaffoldKeynovar = GlobalKey<ScaffoldState>();

int sel = 1;
int color = 0;
final _formKey = GlobalKey<FormState>();
bool isLoading = true;
TextEditingController _comment = TextEditingController();
TextEditingController _rating = TextEditingController();

final controller = PageController(viewportFraction: 0.8, keepPage: true);
List pages = [];
bool h = false;

DatabaseHelper databaseHelper = DatabaseHelper();

int selectedColorIndex = 0;

int selcted = 0;
String? price;
String? price1;
String? deviceName;
String? deviceOS;


final List<Map<String, String>> items1 = [
  {
    "imageUrl": "https://5.imimg.com/data5/MO/AF/MY-10823160/trypsin-capsule-500x500.png",
    "title": "Cipla",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT9ZcLFjbUN5p8163Gz60m-y5I5Z9ad_1wfRg&s",
    "title": "Paracetamol",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRDCBLPbWLCWusF0c8oNM88u5SmUPxc1sRmcA&s",
    "title": "Codine Syp",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://5.imimg.com/data5/MO/AF/MY-10823160/trypsin-capsule-500x500.png",
    "title": "Antibiotic",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },

];

class _productdetailnovartionState extends State<productdetailnovartion> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();


    productdetail2ap();
    getDeviceInfoandStore();
    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = true;
    });

    setState(() {
      isLoading = true;
    });
    if (colorshowmodal?.variationData?.length != 0 &&
        sizeshowmodal?.variationData?.length != 0) {
      setState(() {
        isLoading = true;
      });
    } else {
      setState(() {
        isLoading = true;
      });
    }
    viewreviewap();
  }

  @override
  Widget build(BuildContext context) {
    final cartitm = Provider.of<CartProvider>(context);



    addoff() async {
      print("notlog");
      print("notlog ${price.toString()}");
      print("notlog ${price.toString()}");
      print("6666666 ${ double.parse(
          (productdetail2modal?.productData?.saleProductPrice)
              .toString())}");
      CartItem item = CartItem(
        VariationTblId: colormatchmodal?.priceData?.length == 0 ||
                colorshowmodal?.variationData?.length == 0 &&
                    sizeshowmodal?.variationData?.length == 0
            ? '0'
            : colormatchmodal?.priceData?[0].variationMatchId ?? "",
        productId: widget.productid.toString(),
        Size: sizeshowmodal?.variationData?.length == 0
            ? "0"
            : sizeshowmodal?.variationData?[selcted].variationID ?? '',
        Color: colorshowmodal?.variationData?.length == 0
            ? '0'
            : (colorshowmodal?.variationData?[0].variationID ?? ""),
        initialPrice:  double.parse(
                    (productdetail2modal?.productData?.saleProductPrice)
                        .toString()),

        productName: productdetail2modal?.productData?.productName ?? "",
        productQuantity: 1,
        productImage: productdetail2modal?.productData?.allimage?[0] ?? "",
        productPrice:  double.parse(
                    (productdetail2modal?.productData?.saleProductPrice)
                        .toString()),
        productDescription:
        productdetail2modal?.productData?.productShortDesc ?? "",
      );
      int result = await databaseHelper.insertCartItem(item);
      if (result != 0) {
        cartitm.addTotalPrice(double.parse(
            (productdetail2modal?.productData?.saleProductPrice)
                .toString()));

        buildErrorDialog(context, '', 'Your item is Added in Cart');
      }
    }



    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: Colors.grey.shade100,
        key: _scaffoldKeynovar,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(),
        body: isLoading
            ? Container()
            : Padding(
                padding: EdgeInsets.symmetric(horizontal: 2.w),
                child: CustomScrollView(
                  slivers: [
                    SliverToBoxAdapter(
                      child: Column(
                        children: [
                          SizedBox(
                            height: 5.h,
                          ),
                          Container(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                IconButton(
                                    onPressed: () {
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder:
                                                  (context) =>
                                                  HomePage(
                                                    sel: 1,
                                                  )));
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_rounded,
                                      size: 20.sp,
                                    )),
                                Text(
                                  "Product Description",
                                  style: TextStyle(
                                    fontSize: 12.sp,
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
                                          ?  Icon(
                                          CupertinoIcons.person_add,
                                          size: 21.sp,
                                          color:  AppColors.primary

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
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Image.asset(
                                                            'assets/deim.png')),
                                              ),
                                            ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          Stack(
                            children: [
                              SingleChildScrollView(
                                child: Column(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: <Widget>[
                                        SizedBox(
                                          height: 230,
                                          child: PageView.builder(
                                            controller: controller,
                                            itemCount: pages.length,
                                            itemBuilder: (_, index) {
                                              return pages[
                                                  index % pages.length];
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        SmoothPageIndicator(
                                          controller: controller,
                                          count: pages.length,
                                          effect: WormEffect(
                                            dotColor: Colors.grey.shade200,
                                            activeDotColor: Color(0xff0061b0),
                                            dotHeight: 1.5.h,
                                            dotWidth: 4.w,
                                            type: WormType.thinUnderground,
                                          ),
                                        ),
                                      ],
                                    ),
                                    SizedBox(
                                      height: 2.h,
                                    ),
                                    Container(
                                      alignment: Alignment.center,
                                      height: 30.h,
                                      margin: EdgeInsets.symmetric(horizontal: 1.w),
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(10),
                                        color: Colors.white,
                                      ),

                                      child: Column(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.symmetric(
                                                horizontal: 2.5.w, vertical: 2.h),
                                            child: Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    SizedBox(
                                                      width: 80.w,
                                                      child: Text(
                                                        productdetail2modal
                                                                        ?.productData
                                                                        ?.productName ==
                                                                    '' ||
                                                                productdetail2modal
                                                                        ?.productData
                                                                        ?.productName ==
                                                                    null
                                                            ? 'N/A'
                                                            : productdetail2modal
                                                                    ?.productData
                                                                    ?.productName ??
                                                                '',
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          color: Colors.black,
                                                          fontWeight: FontWeight.bold,
                                                          fontFamily: "task",
                                                        ),
                                                      ),
                                                    ),
                                                    GestureDetector(
                                                      onTap: () {
                                                        usermodal?.userId == "" ||
                                                                usermodal?.userId ==
                                                                    null
                                                            ? Navigator.of(context)
                                                                .push(MaterialPageRoute(
                                                                    builder: (context) =>
                                                                        LoginPage2()))
                                                            : productdetail2modal
                                                                        ?.productData
                                                                        ?.wishlist ==
                                                                    1
                                                                ? removewishlistap(
                                                                    (productdetail2modal
                                                                            ?.productData
                                                                            ?.productID)
                                                                        .toString())
                                                                : addwishlistap(
                                                                    (productdetail2modal
                                                                            ?.productData
                                                                            ?.productID)
                                                                        .toString());
                                                      },
                                                      child: Icon(
                                                        productdetail2modal
                                                                    ?.productData
                                                                    ?.wishlist ==
                                                                1
                                                            ? Icons.favorite
                                                            : Icons.favorite_outline,
                                                        size: 22.sp,
                                                        color: productdetail2modal
                                                                    ?.productData
                                                                    ?.wishlist ==
                                                                1
                                                            ? Colors.red
                                                            : Colors.black,
                                                      ),
                                                    )
                                                  ],
                                                ),
                                                SizedBox(
                                                  height: 0.7.h,
                                                ),
                                                ReadMoreText(
                                                  productdetail2modal?.productData
                                                                  ?.productShortDesc ==
                                                              '' ||
                                                          productdetail2modal
                                                                  ?.productData
                                                                  ?.productShortDesc ==
                                                              null
                                                      ? 'N/A'
                                                      : productdetail2modal
                                                              ?.productData
                                                              ?.productShortDesc ??
                                                          ' ',
                                                  trimLines: 2,
                                                  colorClickableText: Colors.pink,
                                                  trimMode: TrimMode.Line,
                                                  style: TextStyle(
                                                      fontSize: 11.sp,
                                                      fontWeight: FontWeight.normal,
                                                      color: Colors.black,
                                                      fontFamily: "task"),
                                                  trimCollapsedText: ' Show more',
                                                  trimExpandedText: '  Show less',
                                                  lessStyle: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'task',
                                                      color: Color(0xff0061b0),
                                                      fontSize: 10.sp),
                                                  moreStyle: TextStyle(
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: 'task',
                                                      color: Color(0xff0061b0),
                                                      fontSize: 10.sp),
                                                ),

                                                SizedBox(
                                                  height: 3.h,
                                                ),

                                                Text(
                                                 "Price may vary depending on the product batch*",
                                                  style: TextStyle(
                                                    fontSize: 10.sp,
                                                    color: Colors.red,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "task",
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),

                                          SizedBox(
                                            height: 6.h,
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                ),
                              ),

                              Positioned(
                                left: 4.w,
                                bottom: 1.h,
                                child: Row(
                                  children: [
                                    Container(
                                      height: 5.h,
                                      width: 42.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          border: Border.all(width: 0.5,color: AppColors.primary),
                                          color: Colors.white38),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Row(
                                            children: [
                                              Text(
                                                '₹${productdetail2modal?.productData?.saleProductPrice ?? ''}',
                                                style: TextStyle(
                                                  fontSize: 13.sp,
                                                  fontFamily: 'task',
                                                  fontWeight: FontWeight.bold,
                                                  letterSpacing: 1,
                                                  color: Colors.black,
                                                ),
                                              ),
                                              SizedBox(
                                                width: 0.5.w,
                                              ),
                                              //--------*******SALES PRICE********------
                                              Padding(
                                                padding:
                                                    EdgeInsets.only(top: 0.4.h),
                                                child: Text(
                                                  '₹${productdetail2modal?.productData?.productPrice ?? ''}',
                                                  style: TextStyle(
                                                    decoration: TextDecoration
                                                        .lineThrough,
                                                    decorationThickness: 2,
                                                    decorationColor:
                                                        Colors.black,
                                                    fontSize: 11.sp,
                                                    fontFamily: 'task',
                                                    fontWeight:
                                                        FontWeight.normal,
                                                    letterSpacing: 1,
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                        ],
                                      ),
                                    ),
                                    SizedBox(
                                      width: 5.w,
                                    ),
                                    productdetail2modal
                                                ?.productData?.cartlist ==
                                            1
                                        ? GestureDetector(
                                            onTap: () {
                                              _showDialog(context,
                                                  'Your item is already add in cart');
                                            },
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 5.h,
                                                    width: 42.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xffbababa)),
                                                    child: Text(
                                                      "Added To Cart",
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1,
                                                          fontFamily: "task"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          )
                                        : GestureDetector(
                                            onTap: () {
                                              print(usermodal?.userId);
                                              usermodal?.userId == "" ||
                                                      usermodal?.userId == null
                                                  ? addtocartwithoutlogin()
                                                  : addcartap();
                                            },
                                            child: Container(
                                              child: Row(
                                                mainAxisAlignment:
                                                    MainAxisAlignment.center,
                                                children: [
                                                  Container(
                                                    alignment: Alignment.center,
                                                    height: 5.h,
                                                    width: 42.w,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(10),
                                                        color:
                                                            Color(0xff0061b0)),
                                                    child: Text(
                                                      "Add To Cart",
                                                      style: TextStyle(
                                                          fontSize: 11.5.sp,
                                                          color: Colors.white,
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1,
                                                          fontFamily: "task"),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                            ),
                                          ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Container(
                              height: 10.h,
                              alignment: Alignment.center,
                              width: MediaQuery.of(context).size.width,
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10.0),
                                  color: Colors.white),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    child: Icon(
                                      Icons.add,
                                      color: Colors.white,
                                      size: 13.sp,
                                    ),
                                    decoration: BoxDecoration(
                                        color: Color(0xff0061b0),
                                        borderRadius:
                                            BorderRadius.circular(20.0)),
                                    height: 22.0,
                                    width: 22.0,
                                  ),
                                  // SizedBox(width: 20.w,),
                                  Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 1.h,
                                      ),
                                      Text(
                                        "Free Shipping",
                                        style: TextStyle(
                                          fontSize: 11.sp,
                                          fontFamily: "task",
                                          fontWeight: FontWeight.bold
                                        ),
                                      ),

                                      Text(
                                        'You\'ve got free shipping for ',
                                        style: TextStyle(
                                            fontSize: 10.sp,
                                            fontFamily: "task",
                                            color: Color(0xff0061b0)),
                                      ),
                                      Text(
                                        '\₹ 1500',
                                        style: TextStyle(
                                            fontSize: 11.sp,
                                            fontFamily: "task",
                                            color: Color(0xff0061b0)),
                                      ),
                                    ],
                                  ),
                                  //SizedBox(width: 30.w,),
                                  Icon(
                                    Icons.arrow_forward_ios_outlined,
                                    size: 15.sp,
                                    color: Color(0xff0061b0),
                                  )
                                ],
                              ),
                            ),
                          ),
                          SizedBox(height: 2.h),
                          usermodal?.userId == "" || usermodal?.userId == null
                              ?Container(): Padding(
                            padding: EdgeInsets.symmetric(horizontal: 2.w),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Reviews :',
                                  style: TextStyle(
                                    fontSize: 12.sp,
                                    fontFamily: 'task',
                                    fontWeight: FontWeight.bold,
                                    letterSpacing: 1,
                                    color: Colors.black.withOpacity(0.7),
                                  ),
                                ),
                                InkWell(
                                  onTap: () {
                                    usermodal?.userId == '' ||
                                            usermodal?.userId == null
                                        ? Fluttertoast.showToast(
                                            msg:
                                                "You Have to Login to Give Review",
                                            toastLength: Toast.LENGTH_SHORT,
                                            timeInSecForIosWeb: 1,
                                            backgroundColor: Colors.white,
                                            textColor: Color(0xff0061b0),
                                            fontSize: 11.sp)
                                        : addreviewdialog();
                                  },
                                  child: Text(
                                    'Add Your Review',
                                    style: TextStyle(
                                      fontSize: 11.sp,
                                      fontFamily: 'task',
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1,
                                      color: Color(0xff0061b0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 1.h),
                        ],
                      ),
                    ),

                    usermodal?.userId == "" || usermodal?.userId == null
                        ?SliverToBoxAdapter():viewReviewmodal?.reviewData?.length == 0 ||
                            viewReviewmodal?.reviewData?.length == null
                        ? SliverToBoxAdapter(
                            child: Center(
                              child: Container(
                                margin: EdgeInsets.only(top: 5.h),
                                child: Text(
                                  'No Review Available',
                                  style: TextStyle(
                                      fontWeight: FontWeight.normal,
                                      fontFamily: 'task',
                                      fontSize: 12.sp,
                                      color: Colors.black),
                                ),
                              ),
                            ),
                          )
                        : SliverList.builder(
                            itemCount: viewReviewmodal?.reviewData?.length,
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.symmetric(
                                    vertical: 1.h, horizontal: 1.w),
                                padding: EdgeInsets.symmetric(vertical: 0.5.h),
                                decoration: BoxDecoration(
                                    color: Colors.white,
                                    borderRadius: BorderRadius.circular(12)),
                                child: Stack(
                                  children: [
                                    Column(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Row(
                                          children: [
                                            Container(
                                              margin: EdgeInsets.symmetric(
                                                  horizontal: 1.w),
                                              height: 14.w,
                                              width: 14.w,
                                              padding: EdgeInsets.all(1.w),
                                              child: ClipRRect(
                                                borderRadius:
                                                    BorderRadius.circular(90),
                                                child: CachedNetworkImage(
                                                    fit: BoxFit.cover,
                                                    imageUrl: viewReviewmodal
                                                            ?.reviewData?[index]
                                                            .userProfile ??
                                                        '',
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Image.asset(
                                                            'assets/deim.png')),
                                              ),
                                            ),
                                            Column(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.start,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceBetween,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    SizedBox(
                                                      width: 70.w,
                                                      child: Text(
                                                        viewReviewmodal
                                                                ?.reviewData?[
                                                                    index]
                                                                .name ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 12.sp,
                                                          fontFamily: 'task',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 1,
                                                          color: Colors.black
                                                              .withOpacity(
                                                                  0.85),
                                                        ),
                                                      ),
                                                    ),
                                                    usermodal?.userId ==
                                                            viewReviewmodal
                                                                ?.reviewData?[
                                                                    index]
                                                                .userId
                                                        ? InkWell(
                                                            onTap: () {
                                                              removeratingsheet(
                                                                  viewReviewmodal
                                                                          ?.reviewData?[
                                                                              index]
                                                                          .reviewId ??
                                                                      '');
                                                            },
                                                            child: Icon(
                                                              CupertinoIcons
                                                                  .trash,
                                                              color: Colors.red,
                                                              size: 15.sp,
                                                            ),
                                                          )
                                                        : Container()
                                                  ],
                                                ),
                                                SizedBox(height: 0.3.h),
                                                SizedBox(
                                                  width: 73.w,
                                                  child: Row(
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .spaceBetween,
                                                    children: [
                                                      Row(
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        children: [
                                                          Row(
                                                            children: [
                                                              viewReviewmodal
                                                                          ?.reviewData?[
                                                                              index]
                                                                          .rating ==
                                                                      '1'
                                                                  ? Icon(
                                                                      Icons
                                                                          .star,
                                                                      color: Colors
                                                                          .amber,
                                                                      size:
                                                                          11.sp,
                                                                    )
                                                                  : viewReviewmodal
                                                                              ?.reviewData?[
                                                                                  index]
                                                                              .rating ==
                                                                          '2'
                                                                      ? Row(
                                                                          children: [
                                                                            Icon(
                                                                              Icons.star,
                                                                              color: Colors.amber,
                                                                              size: 11.sp,
                                                                            ),
                                                                            Icon(
                                                                              Icons.star,
                                                                              color: Colors.amber,
                                                                              size: 11.sp,
                                                                            )
                                                                          ],
                                                                        )
                                                                      : viewReviewmodal?.reviewData?[index].rating ==
                                                                              '3'
                                                                          ? Row(
                                                                              children: [
                                                                                Icon(
                                                                                  Icons.star,
                                                                                  color: Colors.amber,
                                                                                  size: 11.sp,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.star,
                                                                                  color: Colors.amber,
                                                                                  size: 11.sp,
                                                                                ),
                                                                                Icon(
                                                                                  Icons.star,
                                                                                  color: Colors.amber,
                                                                                  size: 11.sp,
                                                                                )
                                                                              ],
                                                                            )
                                                                          : viewReviewmodal?.reviewData?[index].rating == '4'
                                                                              ? Row(
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 14.sp,
                                                                                    )
                                                                                  ],
                                                                                )
                                                                              : Row(
                                                                                  children: [
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    ),
                                                                                    Icon(
                                                                                      Icons.star,
                                                                                      color: Colors.amber,
                                                                                      size: 11.sp,
                                                                                    )
                                                                                  ],
                                                                                )
                                                            ],
                                                          ),
                                                          SizedBox(
                                                            width: 2.w,
                                                          ),
                                                          Text(
                                                            '( ' +
                                                                (viewReviewmodal
                                                                        ?.reviewData?[
                                                                            index]
                                                                        .rating ??
                                                                    '') +
                                                                ' )',
                                                            style: TextStyle(
                                                              fontFamily:
                                                                  'task',
                                                              fontWeight:
                                                                  FontWeight
                                                                      .bold,
                                                              letterSpacing: 1,
                                                              color: Colors
                                                                  .black
                                                                  .withOpacity(
                                                                      0.7),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                      Text(
                                                        viewReviewmodal
                                                                ?.reviewData?[
                                                                    index]
                                                                .date ??
                                                            '',
                                                        style: TextStyle(
                                                          fontSize: 10.sp,
                                                          fontFamily: 'task',
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          letterSpacing: 0.5,
                                                          color: Colors.black
                                                              .withOpacity(0.7),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),

                                        Padding(
                                          padding: EdgeInsets.symmetric(
                                              horizontal: 16.w),
                                          child: Text(
                                            viewReviewmodal?.reviewData?[index]
                                                    .comments ??
                                                '',
                                            style: TextStyle(
                                              fontSize: 10.sp,
                                              fontFamily: 'task',
                                              fontWeight: FontWeight.w600,
                                              letterSpacing: 1,
                                              color: Colors.black
                                                  .withOpacity(0.75),
                                            ),
                                          ),
                                        ),
                                        SizedBox(height: 2.h),
                                      ],
                                    ),
                                    // Row(
                                    //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                    //   children: [
                                    //     Text("Similar Product",style: TextStyle(
                                    //       fontSize: 15.sp,
                                    //       fontFamily: 'task',
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Colors.black.withOpacity(0.7),
                                    //     ) ,),
                                    //     Text("View All",style: TextStyle(
                                    //       fontSize: 12.sp,
                                    //       fontFamily: 'task',
                                    //       fontWeight: FontWeight.bold,
                                    //       color: Color(0xff0061b0),
                                    //     ) ,)
                                    //   ],
                                    // ),
                                  ],
                                ),
                              );
                            },
                          ),
                    usermodal?.userId == "" || usermodal?.userId == null
                        ?SliverToBoxAdapter(child: SizedBox(height: 0.h,)):SliverToBoxAdapter(child: SizedBox(height: 2.h,)),

                    SliverToBoxAdapter(
                      child: Padding(
                        padding:  EdgeInsets.symmetric(horizontal: 2.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text("Similar Medicine",style: TextStyle(
                              fontSize: 13.sp,
                              fontFamily: 'task',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Colors.black.withOpacity(0.7),
                            ),),
                            Text("View All",
                              style: TextStyle(
                              fontSize: 11.sp,
                              fontFamily: 'task',
                              fontWeight: FontWeight.bold,
                              letterSpacing: 1,
                              color: Color(0xff0061b0),
                            ),)

                          ],
                        ),
                      ),
                    ),

                    SliverToBoxAdapter(child: SizedBox(height: 1.h,)),
                    productdetail2modal?.relatedProducts?.length == 0 ||
                        productdetail2modal?.relatedProducts?.length ==
                            null
                        ? SliverToBoxAdapter(
                      child: Container(
                        height: 30.h,
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
                    ):  SliverToBoxAdapter(
                  child: Container(
                   height: 35.h,
                 child: ListView.builder(
                   itemCount: productdetail2modal?.relatedProducts?.length,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index){
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
                                        productdetail2modal?.relatedProducts?[index].productID ?? '',
                                      )));
                        },
                        child: Card(

                          child: Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white,
                            ),
                            child: Column(
                              mainAxisAlignment:
                              MainAxisAlignment
                                  .center,
                              crossAxisAlignment:
                              CrossAxisAlignment
                                  .center,
                              children: [
                                SizedBox(
                                  height: 3.h,
                                ),
                                Container(
                                  child:
                                  CachedNetworkImage(
                                    imageUrl:
                                    productdetail2modal
                                                    ?.relatedProducts?[
                                                        index]
                                                    .image ==
                                                '' ||
                                        productdetail2modal
                                                    ?.relatedProducts?[
                                                        index]
                                                    .image ==
                                                null
                                        ? 'N/A'
                                        : productdetail2modal
                                                ?.relatedProducts?[
                                                    index]
                                                .image ?? "",
                                    // items1[index]['imageUrl']!,
                                    height: 15.h,
                                    width: 48.w,
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
                                Row(
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
                                            productdetail2modal
                                                ?.relatedProducts?[
                                            index]
                                                .productName == "" || productdetail2modal
                                                ?.relatedProducts?[
                                            index]
                                                .productName == null
                                                ? "N/A"
                                                : productdetail2modal
                                                ?.relatedProducts?[
                                            index]
                                                .productName ??
                                                    '',

                                            // items1[index]['title']!,
                                            style: TextStyle(
                                                fontSize: 10
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
                                // SizedBox(
                                //   width: 35.w,
                                //   child: Text(
                                //     textAlign:
                                //         TextAlign
                                //             .center,
                                //     overflow:
                                //         TextOverflow
                                //             .ellipsis,
                                //     maxLines: 2,
                                //     // bestsellerproductmodal?.productData?[index].productShortDesc ==
                                //     //             "" ||
                                //     //         bestsellerproductmodal?.productData?[index].productShortDesc ==
                                //     //             null
                                //     //     ? "N/A"
                                //     //     : bestsellerproductmodal
                                //     //             ?.productData?[index]
                                //     //             .productShortDesc ??
                                //     //         '',
                                //             "",
                                //     // "This Is The Antibiotic Product And Body",
                                //     style:
                                //         TextStyle(
                                //       fontSize:
                                //           12.sp,
                                //       fontFamily:
                                //           'task',
                                //       fontWeight:
                                //           FontWeight
                                //               .normal,
                                //       letterSpacing:
                                //           1,
                                //       color: Colors
                                //           .black,
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
                                          productdetail2modal?.relatedProducts?[index].saleProductPrice ==
                                                      "" ||
                                              productdetail2modal?.relatedProducts?[index].saleProductPrice ==
                                                      null
                                              ? "N/A"
                                              : '₹' +
                                                  (  productdetail2modal?.relatedProducts?[index].saleProductPrice).toString(),

                                          style:
                                          TextStyle(
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
                                            productdetail2modal
                                                ?.relatedProducts?[
                                            index]
                                                .productPrice == "" ||
                                                productdetail2modal
                                                    ?.relatedProducts?[
                                                index]
                                                    .productPrice ==
                                                        null
                                                ? "N/A"
                                                : '₹' +
                                                    (productdetail2modal
                                                        ?.relatedProducts?[
                                                    index]
                                                        .productPrice).toString(),

                                            style:
                                            TextStyle(
                                              decoration:
                                              TextDecoration.lineThrough,
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
                                                      productid: productdetail2modal?.relatedProducts?[index].productID ?? '',
                                                    )));

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
                                        color: AppColors
                                            .primary),
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
                          left: 41.w,
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
                                  : productdetail2modal
                                  ?.relatedProducts?[
                              index]
                                  .wishlist ==
                                  1
                                  ? removewishlistap((productdetail2modal
                                  ?.relatedProducts?[
                              index]
                                  .productID)
                                  .toString())
                                  : addwishlistap((productdetail2modal
                                  ?.relatedProducts?[
                              index]
                                  .productID)
                                  .toString());
                            },
                            child: Icon(
                              Icons
                                  .favorite_outline,
                              size: 20.sp,
                              color: Colors.black,
                            ),
                          )),
                    ],
                  );
                }),
              ),
            ),
                    SliverToBoxAdapter(
                      child: SizedBox(
                        height: 10.h,
                      ),
                    ),
                  ],
                ),
              ),
      ),
    );
  }

  productdetail2ap() async {
    final Map<String, String> data = {};
    data['product_id'] = widget.productid.toString();
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().productdetail2api(data).then((response) async {
          productdetail2modal =
              ProductDetail2Modal.fromJson(json.decode(response.body));
          print(productdetail2modal?.status);
          if (response.statusCode == 200 &&
              productdetail2modal?.status == "success") {
            pages = List.generate(
                (productdetail2modal?.productData?.allimage?.length ?? 0),
                (index) => Container(
                      width: 90.w,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                      ),
                      margin: EdgeInsets.symmetric(
                          horizontal: 2.w, vertical: 0.5.h),
                      child: Container(
                        height: 25.h,
                        width: 90.w,
                        child: Center(
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: CachedNetworkImage(
                                height: 25.h,
                                width: 90.w,
                                imageUrl: productdetail2modal
                                        ?.productData?.allimage?[index] ??
                                    '',
                                progressIndicatorBuilder: (context, url,
                                        progress) =>
                                    Center(child: CircularProgressIndicator()),
                                errorWidget: (context, url, error) =>
                                    Image.asset('assets/deim.png')),
                          ),
                        ),
                      ),
                    ));
            setState(() {
              print(productdetailmodal?.status);
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
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
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
            productdetail2ap();
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
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
            productdetail2ap();
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }

  addcartap() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['productID'] = widget.productid.toString();
    data['variation_tbl_id'] = "0";
    data['product_color'] = "0";
    data['product_quantity'] = '1';
    data['product_price'] =
        (productdetail2modal?.productData?.saleProductPrice).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addcartapi(data).then((response) async {
          addcartmodal = AddCartModal.fromJson(json.decode(response.body));
          print(addcartmodal?.status);
          if (response.statusCode == 200 && addcartmodal?.status == "success") {
            productdetail2ap();
            buildErrorDialog(context, '', 'Your item is Added in Cart');

            print('EE Thay Gyu Hooooo ! ^_^');
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }



  addtocartwithoutlogin() async {
    final Map<String, String> data = {};
    data['device_id'] = deviceName.toString();
    data['productID'] = widget.productid.toString();
    data['product_quantity'] = '1';
    data['product_price'] =
        (productdetail2modal?.productData?.saleProductPrice).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addcartwithoutloginapi(data).then((response) async {
          addtocartwithoutuserModel = Addtocart_withoutuser_Model.fromJson(json.decode(response.body));
          print(addtocartwithoutuserModel?.status);
          if (response.statusCode == 200 && addtocartwithoutuserModel?.status == "success") {
            productdetail2ap();
            buildErrorDialog(context, '', 'Your item is Added in Cart');
            print('EE Thay Gyu Hooooo ! ^_^');
            setState(() {
              // isLoading = false;
            });
          } else {
            setState(() {
              // isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          // isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }


  addreviewap() async {
    if (_formKey.currentState!.validate()) {
      final Map<String, String> data = {};
      data['userId'] = (usermodal?.userId).toString();
      data['product_id'] = widget.productid.toString();
      data['rating'] = _rating.text.trim().toString();
      data['description'] = _comment.text.trim().toString();
      print('Add Review');
      print(data);
      checkInternet().then((internet) async {
        if (internet) {
          authprovider().addReviewApi(data).then((response) async {
            addreview = addReviewModal.fromJson(json.decode(response.body));
            print(addcartmodal?.status);
            if (response.statusCode == 200 && addreview?.status == "success") {
              viewreviewap();
              Fluttertoast.showToast(
                  msg: "Review Added Successfully",
                  toastLength: Toast.LENGTH_SHORT,
                  timeInSecForIosWeb: 1,
                  backgroundColor: Colors.white,
                  textColor: Color(0xff0061b0),
                  fontSize: 11.sp);
              print('EE Review Add Thay Gyu Hooooo ! ^_^');
              Navigator.pop(context);
              setState(() {
                _comment.clear();
                _rating.clear();
                // isLoading = false;
              });
            } else {
              setState(() {
                // isLoading = false;
              });
            }
          });
        } else {
          setState(() {
            // isLoading = false;
          });
          buildErrorDialog(context, 'Error', "Internet Required");
        }
      });
    }
  }

  viewreviewap() async {
    final Map<String, String> data = {};
    data['product_id'] = widget.productid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewreviewapi(data).then((response) async {
          viewReviewmodal =
              ViewReviewModal.fromJson(json.decode(response.body));
          print(addcartmodal?.status);
          if (response.statusCode == 200 &&
              viewReviewmodal?.status == "success") {
            print('rrrrrrrrrrrrrrrrr');
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

  deletereviewap(String rId) async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['review_id'] = rId.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().deletereviewapi(data).then((response) async {
          deletereviewmodal =
              DeleteReviewModal.fromJson(json.decode(response.body));
          print(addcartmodal?.status);
          if (response.statusCode == 200 &&
              deletereviewmodal?.status == "success") {
            print(viewReviewmodal?.reviewData?[0].reviewId);
            viewreviewap();
            Fluttertoast.showToast(
                msg: "Review Deleted Successfully",
                toastLength: Toast.LENGTH_SHORT,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.white,
                textColor: Color(0xff0061b0),
                fontSize: 11.sp);
            print('EE Review delete Thay Gyu Hooooo ! ^_^');
            Navigator.pop(context);
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

  addreviewdialog() {
    setState(() {
      _comment.clear();
      _rating.clear();
    });
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return Dialog(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(16),
          ),
          backgroundColor: Colors.white,
          elevation: 00,
          child: Stack(
            children: [
              Container(
                  width: 80.w,
                  child: Padding(
                      padding:
                          EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
                      child: SingleChildScrollView(
                        child: Form(
                          key: _formKey,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            // mainAxisSize: MainAxisSize.min,
                            children: [
                              Center(
                                child: Text(
                                  'Add Your Review',
                                  textAlign: TextAlign.center,
                                  style: TextStyle(
                                      fontSize: 12.sp,
                                      fontFamily: 'task',
                                      color: Color(0xff0061b0),
                                      fontWeight: FontWeight.bold,
                                      letterSpacing: 1),
                                ),
                              ),
                              SizedBox(height: 3.h),
                              Padding(
                                padding: EdgeInsets.symmetric(horizontal: 2.w),
                                child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 1.w),
                                          Padding(
                                            padding:  EdgeInsets.only(top: 0.5.h),
                                            child: Icon(CupertinoIcons.info,size: 13.sp,),
                                          ),
                                          SizedBox(width: 2.w),
                                          Column(
                                            children: [
                                              SizedBox(height: 0.5.h),
                                              Text(
                                                "Review",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontFamily: "task",
                                                    fontSize: 11.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 0.5.h),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Add Your Review";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.text,
                                        controller: _comment,
                                        maxLines: 3,
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          hintText: 'Add Your Review',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 12.sp,
                                              fontFamily: "task"),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 1.w),
                                          Padding(
                                            padding:  EdgeInsets.only(top: 0.5.h),
                                            child: Icon(CupertinoIcons.star,size: 13.sp,),
                                          ),
                                          SizedBox(width: 2.w),
                                          Column(
                                            children: [
                                              SizedBox(height: 0.5.h),
                                              Text(
                                                "Ratings",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontFamily: "task",
                                                    fontSize: 12.sp,
                                                    fontWeight:
                                                        FontWeight.bold),
                                              ),
                                            ],
                                          ),
                                        ],
                                      ),
                                      SizedBox(height: 0.5.h),
                                      TextFormField(
                                        validator: (value) {
                                          if (value!.isEmpty) {
                                            return "Please Give Some Rating";
                                          }
                                          return null;
                                        },
                                        keyboardType: TextInputType.number,
                                        controller: _rating,
                                        onChanged: (value) {
                                          if (int.parse(_rating.text) > 5) {
                                            setState(() {
                                              _rating.text = '';
                                            });
                                            Fluttertoast.showToast(
                                                msg:
                                                    "You Can't Give more than 5 Star Review",
                                                toastLength: Toast.LENGTH_SHORT,
                                                timeInSecForIosWeb: 1,
                                                backgroundColor: Colors.white,
                                                textColor: Color(0xff0061b0),
                                                fontSize: 11.sp);
                                            print('big');
                                          } else {
                                            print('small');
                                          }
                                        },
                                        decoration: InputDecoration(
                                          enabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          disabledBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          focusedBorder: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          border: OutlineInputBorder(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              borderSide: BorderSide(
                                                  color: Colors.grey)),
                                          hintText: 'Give Your Ratings',
                                          hintStyle: TextStyle(
                                              color:
                                                  Colors.black.withOpacity(0.5),
                                              fontSize: 12.sp,
                                              fontFamily: "task"),
                                        ),
                                      ),
                                    ]),
                              ),
                              SizedBox(height: 3.h),
                              Row(
                                crossAxisAlignment: CrossAxisAlignment.center,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  GestureDetector(
                                    onTap: () {
                                      addreviewap();
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 5.5.h,
                                            width: 43.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Color(0xff0061b0)),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CupertinoIcons.add,
                                                      color: Colors.white,
                                                      size: 11.sp,
                                                    )),
                                                Text(
                                                  "Add Review",
                                                  style: TextStyle(
                                                      fontSize: 12.sp,
                                                      color: Colors.white,
                                                      fontFamily: "task"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(height: 2.h),
                            ],
                          ),
                        ),
                      ))),
              Positioned(
                  right: 0,
                  child: IconButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      icon: Icon(CupertinoIcons.clear_circled)))
            ],
          ),
        );
      },
    );
  }

  removeratingsheet(String rID) {
    showModalBottomSheet(
      elevation: 00,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(15),
          topLeft: Radius.circular(15),
        ),
      ),
      context: context,
      builder: (context) {
        return Stack(
          children: [
            Container(
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    SizedBox(height: 3.h),
                    Text(
                      'Are You Sure You Want to Remove Your Review ?',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                          fontSize: 15.sp,
                          fontFamily: 'task',
                          color: Colors.black,
                          fontWeight: FontWeight.w600,
                          height: 0.17.h,
                          letterSpacing: 1),
                    ),
                    SizedBox(height: 3.h),
                    Padding(
                      padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Row(
                            crossAxisAlignment: CrossAxisAlignment.center,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              InkWell(
                                onTap: () {
                                  deletereviewap(rID.toString());
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.5.w),
                                  decoration: BoxDecoration(
                                      color: Color(0xff0061b0),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'Yes',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'task',
                                        color: Colors.white,
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                              InkWell(
                                onTap: () {
                                  Navigator.pop(context);
                                },
                                child: Container(
                                  width: 30.w,
                                  alignment: Alignment.center,
                                  padding: EdgeInsets.all(2.w),
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: Color(0xff0061b0),
                                      ),
                                      color: Color(0xfff4f4f4),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'task',
                                        color: Color(0xff0061b0),
                                        fontWeight: FontWeight.bold,
                                        letterSpacing: 1),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          SizedBox(height: 2.h),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
                right: 0,
                child: IconButton(
                    onPressed: () {
                      Navigator.pop(context);
                    },
                    icon: Icon(CupertinoIcons.clear_circled)))
          ],
        );
      },
    );
  }

  void _showDialog(
    BuildContext context,
    String txt,
  ) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: Color(0xff313131),
          elevation: 00,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(5),
          ),
          content: Container(
            width: 150.w,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Row(
                  children: [
                    Text(txt,
                        style: TextStyle(
                            color: Colors.white,
                            fontSize: 12.5.sp,
                            letterSpacing: 0.5)),
                  ],
                ),
                SizedBox(height: 2.h),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    InkWell(
                      onTap: () {
                        Navigator.pop(context);
                      },
                      child: Text('Ok',
                          style: TextStyle(
                              color: Colors.cyan,
                              fontSize: 12.5.sp,
                              letterSpacing: 0.5)),
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }


  Future<void> getDeviceInfoandStore() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();

    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceName =
            androidInfo.model; // Device name
        deviceOS = 'Android ${androidInfo.version.release}';
      });
    } else if (Platform.isIOS) {
      IosDeviceInfo iosInfo = await deviceInfo.iosInfo;
      setState(() {
        deviceName = iosInfo.name; // Device name
        deviceOS = 'iOS ${iosInfo.systemVersion}';
      });
    }
    print('Device Name: $deviceName');
    print('Device OS: $deviceOS');
  }



}
