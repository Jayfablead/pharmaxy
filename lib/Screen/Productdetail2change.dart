import 'dart:convert';
import 'package:html/parser.dart' as htmlParser;
import 'package:cached_network_image/cached_network_image.dart';
import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:ecommerce/Databasehandler.dart';
import 'package:ecommerce/Modal/AddCartModal.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/Cartmodal.dart';
import 'package:ecommerce/Modal/ColorMatchModal.dart';
import 'package:ecommerce/Modal/ColorShowModal.dart';
import 'package:ecommerce/Modal/DeleteReviewModal.dart';
import 'package:ecommerce/Modal/ProductDetailModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SelectColorModal.dart';
import 'package:ecommerce/Modal/SizeShowModal.dart';
import 'package:ecommerce/Modal/ViewReviewModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Provider/cartProvider.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:provider/provider.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../Widget/bottombar.dart';
import 'package:http/http.dart' as http;

class productdetail2change extends StatefulWidget {
  String? productid;

  productdetail2change({super.key, this.productid});

  @override
  State<productdetail2change> createState() => _productdetail2changeState();
}

final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
Map<String, String?> selectedValues = {};
String selectedValuesString = selectedValues.values
    .map((value) => value ?? '0')
    .toList()
    .toString();



List<String> options = ['Red', 'White', 'Blue', 'Black'];
String? seleVal;
String selectedValue1 = 'M';
List<String> options1 = ['M', 'L', 'XL', 'XXL'];

String selectedValue2 = 'ASXaxaaX';
List<String> options2 = ['SACASC', 'HJUTDRD', 'ASXaxaaX', 'TTFRSDTD'];


Map<String, String> headers = {
  'Authorization': 'hXuRUGsEGuhGf6KG',
};
int sel = 1;
int color = 0;
final _formKey = GlobalKey<FormState>();
bool isLoading = true;
TextEditingController _comment = TextEditingController();
TextEditingController _rating = TextEditingController();

final controller = PageController(viewportFraction: 0.8, keepPage: true);
List pages = [];
bool h = false;
List sizername = ['XS', 'S', 'M', 'XL', 'L'];
String? mdata;
DatabaseHelper databaseHelper = DatabaseHelper();

int selectedColorIndex = 0;

int selcted = 0;
String? price;
String? price1;

class _productdetail2changeState extends State<productdetail2change> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      color = 0;
      selected = 0;
      isLoading = true;
    });
    productdetailap();
    setState(() {
      isLoading = true;
    });
    colorap();
    setState(() {
      isLoading = true;
    });
    sizeap();
    setState(() {
      isLoading = true;
    });
    if (colorshowmodal?.variationData?.length != 0 &&
        sizeshowmodal?.variationData?.length != 0) {
      setState(() {
        isLoading = true;
      });
      colormatchap();
    } else {
      setState(() {
        isLoading = true;
      });
      selectcolorap();
    }
    viewreviewap();
  }

  @override
  Widget build(BuildContext context) {
    final cartitm = Provider.of<CartProvider>(context);
    addoff() async {
      print("notlog");
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
        initialPrice: sizeshowmodal?.variationData?.length != 0
            ? double.parse(price.toString())
            : colorshowmodal?.variationData?.length == 0 &&
                    sizeshowmodal?.variationData?.length == 0
                ? double.parse(
                    (productdetailmodal?.productData?.saleProductPrice)
                        .toString())
                : double.parse(
                    (selectcolormodal?.variationData?.saleVariationPrice)
                        .toString()),
        productName: productdetailmodal?.productData?.productName ?? "",
        productQuantity: 1,
        productImage: productdetailmodal?.productData?.allimage?[0] ?? "",
        productPrice: sizeshowmodal?.variationData?.length != 0
            ? double.parse(price.toString())
            : colorshowmodal?.variationData?.length == 0 &&
                    sizeshowmodal?.variationData?.length == 0
                ? double.parse(
                    (productdetailmodal?.productData?.saleProductPrice)
                        .toString())
                : double.parse(
                    (selectcolormodal?.variationData?.saleVariationPrice)
                        .toString()),
        productDescription:
            productdetailmodal?.productData?.productShortDesc ?? "",
      );
      int result = await databaseHelper.insertCartItem(item);
      if (result != 0) {
        cartitm.addTotalPrice(sizeshowmodal?.variationData?.length != 0
            ? double.parse(price.toString())
            : colorshowmodal?.variationData?.length == 0 &&
                    sizeshowmodal?.variationData?.length == 0
                ? double.parse(
                    (productdetailmodal?.productData?.saleProductPrice)
                        .toString())
                : double.parse(
                    (selectcolormodal?.variationData?.saleVariationPrice)
                        .toString()));

        buildErrorDialog(context, '', 'Your item is Added in Cart');
      }
    }

    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade100,
        key: _scaffoldKey,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(),
        body: isLoading
            ? Container()
            : CustomScrollView(
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
                                    Navigator.of(context).pop();
                                  },
                                  icon: Icon(
                                    Icons.arrow_back_ios_rounded,
                                    size: 25.sp,
                                  )),
                              Text(
                                "Change page",
                                style: TextStyle(
                                  fontSize: 18.sp,
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
                        Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: <Widget>[
                                SizedBox(
                                  height: 230,
                                  child: PageView.builder(
                                    controller: controller,
                                    itemCount: pages.length,
                                    itemBuilder: (_, index) {
                                      return pages[index % pages.length];
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
                                    dotColor: Colors.grey.shade100,
                                    activeDotColor: Color(0xfff7941d),
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
                            Column(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w,
                                  ),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      SizedBox(
                                        width: 57.w,
                                        child: Text(
                                          productdetailmodal?.productData
                                                          ?.productName ==
                                                      '' ||
                                                  productdetailmodal
                                                          ?.productData
                                                          ?.productName ==
                                                      null
                                              ? 'N/A'
                                              : productdetailmodal?.productData
                                                      ?.productName ??
                                                  '',
                                          style: TextStyle(
                                            fontSize: 14.sp,
                                            color: Colors.black,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "task",
                                          ),
                                        ),
                                      ),
                                      GestureDetector(
                                        onTap: () {
                                          usermodal?.userId == "" ||
                                                  usermodal?.userId == null
                                              ? Navigator.of(context).push(
                                                  MaterialPageRoute(
                                                      builder: (context) =>
                                                          LoginPage2()))
                                              : productdetailmodal?.productData
                                                          ?.wishlist ==
                                                      1
                                                  ? removewishlistap(
                                                      (productdetailmodal
                                                              ?.productData
                                                              ?.productID)
                                                          .toString())
                                                  : addwishlistap(
                                                      (productdetailmodal
                                                              ?.productData
                                                              ?.productID)
                                                          .toString());
                                        },
                                        child: Icon(
                                          productdetailmodal
                                                      ?.productData?.wishlist ==
                                                  1
                                              ? Icons.favorite
                                              : Icons.favorite_outline,
                                          size: 25.sp,
                                          color: productdetailmodal
                                                      ?.productData?.wishlist ==
                                                  1
                                              ? Colors.red
                                              : Colors.black,
                                        ),
                                      )
                                    ],
                                  ),
                                ),
                                SizedBox(
                                  height: 0.7.h,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                    horizontal: 2.5.w,
                                  ),
                                  child: ReadMoreText(
                                    productdetailmodal?.productData
                                                    ?.productShortDesc ==
                                                '' ||
                                            productdetailmodal?.productData
                                                    ?.productShortDesc ==
                                                null
                                        ? 'N/A'
                                        : productdetailmodal?.productData
                                                ?.productShortDesc ??
                                            '',
                                    trimLines: 2,
                                    colorClickableText: Colors.pink,
                                    trimMode: TrimMode.Line,
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.grey,
                                        fontFamily: "task"),
                                    trimCollapsedText: ' Show more',
                                    trimExpandedText: '  Show less',
                                    lessStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task',
                                        color: Color(
                                          0xfff7941d,
                                        ),
                                        fontSize: 12.sp),
                                    moreStyle: TextStyle(
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task',
                                        color: Color(0xfff7941d),
                                        fontSize: 12.sp),
                                  ),
                                ),
                                SizedBox(
                                  height: 2.h,
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  SliverToBoxAdapter(
                    child: SizedBox(
                      height: 30.h,
                      child:FutureBuilder<Map<String, dynamic>>(
                    future: fetchData(),
                    builder: (context, snapshot) {
                      if (snapshot.hasError) {
                        return Text("${snapshot.error}");
                      } else if (snapshot.hasData) {
                        var PDATA = snapshot.data!['product_data'];
                        var pname = PDATA['ProductName'];
                        var kname = snapshot.data!['filter_variation_data'];
                        var kname1 = snapshot.data!['filter_keys'];
                        var l1;
                        var data1;
                        var lgt;

                        // Initialize selected values with a unique default value
                        kname1.forEach((key) {
                          selectedValues[key] ??= null;
                        });

                        return SizedBox(
                          height: 10.h,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              String l1 = kname1[index].toString();
                              mdata = l1;
                              print('mdata :$mdata');
                              lgt = kname1.length;
                              print('ln:$lgt');
                              return Padding(
                                padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 1.h),
                                child: Container(
                                  child: Column(
                                    crossAxisAlignment: CrossAxisAlignment.start,
                                    children: [
                                      Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Text(
                                            '$l1 : ',
                                            style: TextStyle(
                                              color: Colors.black87,
                                              fontFamily: "task",
                                              fontSize: 15.sp,
                                              fontWeight: FontWeight.bold,
                                            ),
                                          ),
                                          Container(
                                            width: 52.w,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(20),
                                              color: Colors.white,
                                            ),
                                            padding: EdgeInsets.symmetric(horizontal: 5.0, vertical: 0.5.h),
                                            child: DropdownButtonHideUnderline(
                                              child: DropdownButton<String>(
                                                hint: Text(
                                                  'Select',
                                                  style: TextStyle(
                                                    color: Colors.black.withOpacity(0.4),
                                                    fontSize: 13,
                                                    fontFamily: "task",
                                                  ),
                                                ),
                                                value: selectedValues[l1],
                                                onChanged: (String? newValue) {
                                                  setState(() {
                                                    selectedValues[l1] = newValue ?? '0';
                                                    for (String key in kname1) {
                                                      String? selectedValue = selectedValues[key];
                                                      if (selectedValue != null) {
                                                        print('Selected value for $key: $selectedValue');
                                                      } else {
                                                        print('No value selected for $key');
                                                      }
                                                    }
                                                  });
                                                },
                                                items: (kname[l1] as List<dynamic>?)
                                                    ?.cast<Map<String, dynamic>>()
                                                    .map<DropdownMenuItem<String>>(
                                                        (Map<String, dynamic> value) {
                                                      return DropdownMenuItem<String>(
                                                        value: value['VariationID']?.toString() ?? '',
                                                        child: Text(value['VariationName'].toString()),
                                                      );
                                                    }).toList() ??
                                                    [],
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                ),
                              );
                            },
                            itemCount: kname1.length,
                          ),
                        );
                      }
                      return Center(child: CircularProgressIndicator()
                      );
                    },
                    ),

                    ),
                  ),
                  SliverToBoxAdapter(
                      child: Column(
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          Container(
                            height: 6.h,
                            width: 45.w,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                color: Colors.white),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Row(
                                  children: [
                                    Text(
                                      colorshowmodal?.variationData?.length !=
                                                  0 &&
                                              sizeshowmodal
                                                      ?.variationData?.length !=
                                                  0
                                          ? colormatchmodal
                                                      ?.priceData?.length ==
                                                  0
                                              ? 'Out of stock'
                                              : '₹${(colormatchmodal?.priceData?[0].saleVariationPrice ?? '')}'
                                          : colorshowmodal?.variationData
                                                          ?.length ==
                                                      0 &&
                                                  sizeshowmodal?.variationData
                                                          ?.length ==
                                                      0
                                              ? productdetailmodal?.productData
                                                              ?.saleProductPrice ==
                                                          '' ||
                                                      productdetailmodal
                                                              ?.productData
                                                              ?.saleProductPrice ==
                                                          null
                                                  ? "N/A"
                                                  : '₹${productdetailmodal?.productData?.saleProductPrice ?? ''}'
                                              : selectcolormodal?.variationData
                                                              ?.saleVariationPrice ==
                                                          '' ||
                                                      selectcolormodal
                                                              ?.variationData
                                                              ?.saleVariationPrice ==
                                                          null
                                                  ? 'N/A'
                                                  : "₹${selectcolormodal?.variationData?.saleVariationPrice ?? ''}",
                                      style: TextStyle(
                                        fontSize: 18.sp,
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
                                      padding: EdgeInsets.only(top: 0.4.h),
                                      child: Text(
                                        colorshowmodal?.variationData?.length !=
                                                    0 &&
                                                sizeshowmodal?.variationData
                                                        ?.length !=
                                                    0
                                            ? colormatchmodal
                                                        ?.priceData?.length ==
                                                    0
                                                ? ''
                                                : '₹${(colormatchmodal?.priceData?[0].variationPrice ?? '')}'
                                            : colorshowmodal?.variationData
                                                            ?.length ==
                                                        0 &&
                                                    sizeshowmodal?.variationData
                                                            ?.length ==
                                                        0
                                                ? productdetailmodal
                                                                ?.productData
                                                                ?.productPrice ==
                                                            '' ||
                                                        productdetailmodal
                                                                ?.productData
                                                                ?.productPrice ==
                                                            null
                                                    ? ''
                                                    : '₹${productdetailmodal?.productData?.productPrice ?? ''}'
                                                : selectcolormodal
                                                                ?.variationData
                                                                ?.variationPrice ==
                                                            '' ||
                                                        selectcolormodal
                                                                ?.variationData
                                                                ?.variationPrice ==
                                                            null
                                                    ? ''
                                                    : "₹${selectcolormodal?.variationData?.variationPrice ?? ''}",
                                        style: TextStyle(
                                          decoration:
                                              TextDecoration.lineThrough,
                                          decorationThickness: 2,
                                          decorationColor: Colors.black,
                                          fontSize: 12.sp,
                                          fontFamily: 'task',
                                          fontWeight: FontWeight.normal,
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
                            width: 8.w,
                          ),
                          colormatchmodal?.priceData?.length == 0 &&
                                  sizeshowmodal?.variationData?.length != 0
                              ? Container()
                              : GestureDetector(
                                  onTap: () {
                                    print(usermodal?.userId);
                                    usermodal?.userId == "" ||
                                            usermodal?.userId == null
                                        ? addoff()
                                        : addcartap();
                                  },
                                  child: Container(
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Container(
                                          alignment: Alignment.center,
                                          height: 6.h,
                                          width: 40.w,
                                          decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(30),
                                              color: Color(0xfff7941d)),
                                          child: Text(
                                            "Add To Cart",
                                            style: TextStyle(
                                                fontSize: 13.sp,
                                                color: Colors.white,
                                                fontFamily: "task"),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                        ],
                      ),
                      SizedBox(height: 1.h),
                      Text(
                        selectedValues.values.toList().toString(),

                        style: TextStyle(fontSize: 18.sp),
                      ),SizedBox(height: 1.h),
                      Text(
                        // mdata.toString(),
                        '',
                        style: TextStyle(fontSize: 18.sp),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 2.5.w),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Reviews :',
                              style: TextStyle(
                                fontSize: 15.sp,
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
                                        msg: "You Have to Login to Give Review",
                                        toastLength: Toast.LENGTH_SHORT,
                                        timeInSecForIosWeb: 1,
                                        backgroundColor: Colors.white,
                                        textColor: Color(0xfff7941d),
                                        fontSize: 11.sp)
                                    : addreviewdialog();
                              },
                              child: Text(
                                'Add Your Review',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'task',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Color(0xfff7941d),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  )),
                  viewReviewmodal?.reviewData?.length == 0 ||
                          viewReviewmodal?.reviewData?.length == null
                      ? SliverToBoxAdapter(
                          child: Center(
                            child: Container(
                              margin: EdgeInsets.only(top: 3.h),
                              child: Text(
                                'No Review Available',
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'task',
                                    fontSize: 18.sp,
                                    color: Colors.black),
                              ),
                            ),
                          ),
                        )
                      :SliverList.builder(
                          itemCount: viewReviewmodal?.reviewData?.length,
                          itemBuilder: (context, index) {
                            return Container(
                              margin: EdgeInsets.symmetric(vertical: 1.h),
                              padding: EdgeInsets.symmetric(vertical: 0.5.h),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(25)),
                              child: Stack(
                                children: [
                                  Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
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
                                                            .withOpacity(0.85),
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
                                                                    Icons.star,
                                                                    color: Colors
                                                                        .amber,
                                                                    size: 14.sp,
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
                                                                            color:
                                                                                Colors.amber,
                                                                            size:
                                                                                14.sp,
                                                                          ),
                                                                          Icon(
                                                                            Icons.star,
                                                                            color:
                                                                                Colors.amber,
                                                                            size:
                                                                                14.sp,
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
                                                                                size: 14.sp,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.amber,
                                                                                size: 14.sp,
                                                                              ),
                                                                              Icon(
                                                                                Icons.star,
                                                                                color: Colors.amber,
                                                                                size: 14.sp,
                                                                              )
                                                                            ],
                                                                          )
                                                                        : viewReviewmodal?.reviewData?[index].rating ==
                                                                                '4'
                                                                            ? Row(
                                                                                children: [
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
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
                                                                                    size: 14.sp,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
                                                                                  ),
                                                                                  Icon(
                                                                                    Icons.star,
                                                                                    color: Colors.amber,
                                                                                    size: 14.sp,
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
                                                            fontFamily: 'task',
                                                            fontWeight:
                                                                FontWeight.bold,
                                                            letterSpacing: 1,
                                                            color: Colors.black
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
                                      SizedBox(height: 0.5.h),
                                      Padding(
                                        padding: EdgeInsets.symmetric(
                                            horizontal: 16.w),
                                        child: Text(
                                          viewReviewmodal?.reviewData?[index]
                                                  .comments ??
                                              '',
                                          style: TextStyle(
                                            fontSize: 12.sp,
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.w600,
                                            letterSpacing: 1,
                                            color:
                                                Colors.black.withOpacity(0.75),
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            );
                          },
                        ),
                ],
              ),
      ),
    );
  }

  Future<Map<String, dynamic>> fetchData() async {
    final Map<String, String> datas = {};
    datas['product_id'] = widget.productid.toString();
    datas['user_id'] = (usermodal?.userId).toString();
    final response = await http.post(
        Uri.parse('https://ecomweb.fableadtechnolabs.com/api/product_details'),
        body: datas,
        headers: headers);
    if (response.statusCode == 200) {
      // If the server returns a 200 OK response, parse the JSON
      return json.decode(response.body);
    } else {
      // If the server did not return a 200 OK response,
      // throw an exception.
      throw Exception('Failed to load data');
    }
  }

  // Future<Map<String, dynamic>> fetchData2() async {
  //   final Map<String, String> datas = {};
  //   datas['product_id'] = widget.productid.toString();
  //   datas['varrtype[]'] = mdata.toString();
  //   datas['varrval[]'] = selectedValues.toString();
  //   final response = await http.post(
  //       Uri.parse('https://ecomweb.fableadtechnolabs.com/show_variation1'),
  //       body: datas,
  //       headers: headers);
  //   if (response.statusCode == 200) {
  //     // If the server returns a 200 OK response, parse the JSON
  //     return json.decode(response.body);
  //   } else {
  //     // If the server did not return a 200 OK response,
  //     // throw an exception.
  //     throw Exception('Failed to load data');
  //   }
  // }




  productdetailap() async {
    final Map<String, String> data = {};
    data['product_id'] = widget.productid.toString();
    data['user_id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().productdetailapi(data).then((response) async {
          productdetailmodal =
              ProductDetailModal.fromJson(json.decode(response.body));
          print(productdetailmodal?.status);
          if (response.statusCode == 200 &&
              productdetailmodal?.status == "success") {
            colorap();
            sizeap();
            colorshowmodal?.variationData?.length != 0 &&
                    sizeshowmodal?.variationData?.length != 0
                ? colormatchap()
                : selectcolorap();
            pages = List.generate(
                (productdetailmodal?.productData?.allimage?.length ?? 0),
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
                                imageUrl: productdetailmodal
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
            productdetailap();

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
            productdetailap();
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

  colorap() async {
    final Map<String, String> data = {};
    data['product_id'] = widget.productid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().colorapi(data).then((response) async {
          colorshowmodal = ColorShowModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              colorshowmodal?.status == "success") {
            print("color");
            print(colorshowmodal?.variationData?.length);
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

  sizeap() async {
    final Map<String, String> data = {};
    data['product_id'] = widget.productid.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().sizeapi(data).then((response) async {
          sizeshowmodal = SizeShowModal.fromJson(json.decode(response.body));
          print(sizeshowmodal?.status);
          if (response.statusCode == 200 &&
              sizeshowmodal?.status == "success") {
            print("size");
            print(colorshowmodal?.variationData?.length);
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

  selectcolorap() async {
    final Map<String, String> data = {};
    data['variation_idd'] =
        colorshowmodal?.variationData?[color].variationIdd ?? '';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().selectcolorapi(data).then((response) async {
          selectcolormodal =
              SelectColorModal.fromJson(json.decode(response.body));
          print(selectcolormodal?.status);
          if (response.statusCode == 200 &&
              selectcolormodal?.status == "success") {
            print(selectcolormodal?.variationData?.variationPrice);
            pages = List.generate(
                (selectcolormodal?.variationData?.allimage?.length ?? 0),
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
                                imageUrl: selectcolormodal
                                        ?.variationData?.allimage?[index] ??
                                    '',
                                fit: BoxFit.cover,
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

  colormatchap() async {
    final Map<String, String> data = {};
    data['product_id'] = widget.productid.toString();
    data['color_variation_id'] =
        colorshowmodal?.variationData?[color].variationID ?? "";
    data['size_variation_id'] =
        sizeshowmodal?.variationData?[selcted].variationID ?? '';
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().colormatchapi(data).then((response) async {
          colormatchmodal =
              ColorMatchModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              colormatchmodal?.status == "success") {
            print('aa batli data');
            print(colormatchmodal?.priceData?[0].saleVariationPrice ?? '');
            pages = colormatchmodal?.priceData?.length == 0
                ? List.generate(
                    1,
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
                                    imageUrl:
                                        'https://www.contentviewspro.com/wp-content/uploads/2017/07/default_image.png',
                                    fit: BoxFit.cover,
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/deim.png')),
                              ),
                            ),
                          ),
                        ))
                : List.generate(
                    (colormatchmodal?.priceData?[0].allimage?.length ?? 0),
                    (index) => Container(
                          width: 80.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(16),
                          ),
                          margin: EdgeInsets.symmetric(
                              horizontal: 7.5.w, vertical: 4),
                          child: Container(
                            height: 280,
                            child: Center(
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(10),
                                child: CachedNetworkImage(
                                    imageUrl: colormatchmodal
                                            ?.priceData?[0].allimage?[index] ??
                                        '',
                                    progressIndicatorBuilder:
                                        (context, url, progress) => Center(
                                            child: CircularProgressIndicator()),
                                    errorWidget: (context, url, error) =>
                                        Image.asset('assets/deim.png')),
                              ),
                            ),
                          ),
                        ));

            setState(() {
              price1 =
                  colormatchmodal?.priceData?[0].variationPrice?.toString();
              price =
                  colormatchmodal?.priceData?[0].saleVariationPrice?.toString();
              // isLoading = false;
            });
          } else {
            setState(() {
              price = "";
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
    data['variation_tbl_id'] = colormatchmodal?.priceData?.length == 0 ||
            colorshowmodal?.variationData?.length == 0 &&
                sizeshowmodal?.variationData?.length == 0
        ? '0'
        : colormatchmodal?.priceData?[0].variationMatchId ?? "";
    data['product_color'] = colorshowmodal?.variationData?.length == 0
        ? '0'
        : (colorshowmodal?.variationData?[0].variationID ?? "");
    data['product_size'] = sizeshowmodal?.variationData?.length == 0
        ? "0"
        : sizeshowmodal?.variationData?[selcted].variationID ?? '';
    data['product_quantity'] = '1';
    data['product_price'] = sizeshowmodal?.variationData?.length != 0
        ? price.toString()
        : colorshowmodal?.variationData?.length == 0 &&
                sizeshowmodal?.variationData?.length == 0
            ? (productdetailmodal?.productData?.saleProductPrice).toString()
            : (selectcolormodal?.variationData?.saleVariationPrice).toString();
    print('Add to Cart');
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().addcartapi(data).then((response) async {
          addcartmodal = AddCartModal.fromJson(json.decode(response.body));
          print(addcartmodal?.status);
          if (response.statusCode == 200 && addcartmodal?.status == "success") {
            productdetailap();
            buildErrorDialog(context, '', "Your item is added in Cart");
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

  // addreviewap() async {
  //   if (_formKey.currentState!.validate()) {
  //     final Map<String, String> data = {};
  //     data['userId'] = (usermodal?.userId).toString();
  //     data['product_id'] = widget.productid.toString();
  //     data['rating'] = _rating.text.trim().toString();
  //     data['description'] = _comment.text.trim().toString();
  //     print('Add Review');
  //     print(data);
  //     checkInternet().then((internet) async {
  //       if (internet) {
  //         authprovider().addReviewApi(data).then((response) async {
  //           addreview = addReviewModal.fromJson(json.decode(response.body));
  //           print(addcartmodal?.status);
  //           if (response.statusCode == 200 && addreview?.status == "success") {
  //             viewreviewap();
  //             Fluttertoast.showToast(
  //                 msg: "Review Added Successfully",
  //                 toastLength: Toast.LENGTH_SHORT,
  //                 timeInSecForIosWeb: 1,
  //                 backgroundColor: Colors.white,
  //                 textColor: Color(0xfff7941d),
  //                 fontSize: 11.sp);
  //             print('EE Review Add Thay Gyu Hooooo ! ^_^');
  //             Navigator.pop(context);
  //             setState(() {
  //               _comment.clear();
  //               _rating.clear();
  //               // isLoading = false;
  //             });
  //           } else {
  //             setState(() {
  //               // isLoading = false;
  //             });
  //           }
  //         });
  //       } else {
  //         setState(() {
  //           // isLoading = false;
  //         });
  //         buildErrorDialog(context, 'Error', "Internet Required");
  //       }
  //     });
  //   }
  // }

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
                textColor: Color(0xfff7941d),
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
                                      fontSize: 17.sp,
                                      fontFamily: 'task',
                                      color: Color(0xfff7941d),
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
                                    children: [
                                      Row(
                                        children: [
                                          SizedBox(width: 1.w),
                                          Icon(CupertinoIcons.info),
                                          SizedBox(width: 2.w),
                                          Column(
                                            children: [
                                              SizedBox(height: 0.5.h),
                                              Text(
                                                "Review",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontFamily: "task",
                                                    fontSize: 15.sp,
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
                                              fontSize: 14.sp,
                                              fontFamily: "task"),
                                        ),
                                      ),
                                      SizedBox(height: 2.h),
                                      Row(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.center,
                                        children: [
                                          SizedBox(width: 1.w),
                                          Icon(CupertinoIcons.star),
                                          SizedBox(width: 2.w),
                                          Column(
                                            children: [
                                              SizedBox(height: 0.5.h),
                                              Text(
                                                "Ratings",
                                                style: TextStyle(
                                                    color: Colors.black87,
                                                    fontFamily: "task",
                                                    fontSize: 15.sp,
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
                                                textColor: Color(0xfff7941d),
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
                                              fontSize: 14.sp,
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
                                      // addreviewap();
                                    },
                                    child: Container(
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Container(
                                            alignment: Alignment.center,
                                            height: 6.h,
                                            width: 40.w,
                                            decoration: BoxDecoration(
                                                borderRadius:
                                                    BorderRadius.circular(30),
                                                color: Color(0xfff7941d)),
                                            child: Row(
                                              children: [
                                                IconButton(
                                                    onPressed: () {},
                                                    icon: Icon(
                                                      CupertinoIcons.add,
                                                      color: Colors.white,
                                                    )),
                                                Text(
                                                  "Add Review",
                                                  style: TextStyle(
                                                      fontSize: 13.sp,
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
                                      color: Color(0xfff7941d),
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
                                        color: Color(0xfff7941d),
                                      ),
                                      color: Color(0xfff4f4f4),
                                      borderRadius: BorderRadius.circular(25)),
                                  child: Text(
                                    'No',
                                    style: TextStyle(
                                        fontSize: 13.sp,
                                        fontFamily: 'task',
                                        color: Color(0xfff7941d),
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
}


//   drop dwon

// colorshowmodal?.variationData
//     ?.length ==
// 0 ||
// colorshowmodal?.variationData
//     ?.length ==
// null
// ? Text(
// '',
// style: TextStyle(
// fontWeight:
// FontWeight.normal,
// fontFamily: 'task',
// fontSize: 15.sp,
// color: Colors.black),
// )
//     :  Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 2.5.w),
// child: Container(
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text(
// "Color :",
// style: TextStyle(
// color: Colors.black87,
// fontFamily: "task",
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold),
// ),
// SizedBox(
// width: 3.7.h,
// ),
// Container(
// width: 70.w,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(20),
// color: Colors.white),
// padding:
// EdgeInsets.symmetric(
// horizontal: 5.0,
// vertical: 0.5.h),
// child:
// DropdownButtonHideUnderline(
// child: DropdownButton2(
// hint: Text(
// 'Select ',
// style: TextStyle(
// color: Colors
//     .black
//     .withOpacity(
// 0.4),
// fontSize: 13.sp,
// fontFamily:
// "task"),
// ),
// // Not necessary for Option 1
// value: selectedValue,
// onChanged:
// (String? newValue) {
// setState(() {
// selectedValue =
// newValue!;
// });
// },
// items: options.map<
// DropdownMenuItem<
// String>>((String
// value) {
// return DropdownMenuItem<
// String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
//
// SizedBox(
// height: 2.h,
// ),
//
// sizeshowmodal?.variationData
//     ?.length ==
// 0 ||
// colorshowmodal?.variationData
//     ?.length ==
// null
// ? Container(
// //-------***** Price and add cart button hight-------------********
// // height: 0.h
// )
//     : Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 2.5.w),
// child: Container(
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text(
// "Size :",
// style: TextStyle(
// color: Colors.black87,
// fontFamily: "task",
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold),
// ),
// SizedBox(
// width: 5.1.h,
// ),
// Container(
// width: 70.w,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(20),
// color: Colors.white),
// padding:
// EdgeInsets.symmetric(
// horizontal: 5.0,
// vertical: 0.5.h),
// child:
// DropdownButtonHideUnderline(
// child: DropdownButton2(
// hint: Text(
// 'Select ',
// style: TextStyle(
// color: Colors
//     .black
//     .withOpacity(
// 0.4),
// fontSize: 13.sp,
// fontFamily:
// "task"),
// ),
// // Not necessary for Option 1
// value: selectedValue1,
// onChanged:
// (String? newValue) {
// setState(() {
// selectedValue1 =
// newValue!;
// });
// },
// items: options1.map<
// DropdownMenuItem<
// String>>((String
// value) {
// return DropdownMenuItem<
// String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
//
// SizedBox(
// height: 2.h,
// ),
//
// Padding(
// padding: EdgeInsets.symmetric(
// horizontal: 2.5.w),
// child: Container(
// child: Column(
// crossAxisAlignment:
// CrossAxisAlignment.start,
// children: [
// Row(
// children: [
// Text(
// "Material :",
// style: TextStyle(
// color: Colors.black87,
// fontFamily: "task",
// fontSize: 15.sp,
// fontWeight:
// FontWeight.bold),
// ),
// SizedBox(
// width: 1.h,
// ),
// Container(
// width: 70.w,
// decoration: BoxDecoration(
// borderRadius:
// BorderRadius
//     .circular(20),
// color: Colors.white),
// padding:
// EdgeInsets.symmetric(
// horizontal: 5.0,
// vertical: 0.5.h),
// child:
// DropdownButtonHideUnderline(
// child: DropdownButton2(
// hint: Text(
// 'Select ',
// style: TextStyle(
// color: Colors
//     .black
//     .withOpacity(
// 0.4),
// fontSize: 13.sp,
// fontFamily:
// "task"),
// ),
// // Not necessary for Option 1
// value: selectedValue2,
// onChanged:
// (String? newValue) {
// setState(() {
// selectedValue2 =
// newValue!;
// });
// },
// items: options2.map<
// DropdownMenuItem<
// String>>((String
// value) {
// return DropdownMenuItem<
// String>(
// value: value,
// child: Text(value),
// );
// }).toList(),
// ),
// ),
// ),
// ],
// ),
// ],
// ),
// ),
// ),
// SizedBox(height: 3.h),
