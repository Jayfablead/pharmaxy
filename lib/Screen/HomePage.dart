import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/AllCatModal.dart';
import 'package:ecommerce/Modal/AllCouponModal.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/BlogModel.dart';
import 'package:ecommerce/Modal/BrandModel.dart';
import 'package:ecommerce/Modal/CartcountModel.dart';
import 'package:ecommerce/Modal/CatWiceProductModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SalesProductModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/All_Brands.dart';
import 'package:ecommerce/Screen/BlogdetailsPage.dart';
import 'package:ecommerce/Screen/CartPage.dart';
import 'package:ecommerce/Screen/CategoryPage.dart';
import 'package:ecommerce/Screen/LoginPage2.dart';
import 'package:ecommerce/Screen/PrescriptionForm.dart';
import 'package:ecommerce/Screen/ProductDetailnovartition.dart';
import 'package:ecommerce/Screen/ProductList3.dart';
import 'package:ecommerce/Screen/ProductList4.dart';
import 'package:ecommerce/Screen/ProductListPage.dart';
import 'package:ecommerce/Screen/Productdetai2lWebview.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/RequestDoctorForm.dart';
import 'package:ecommerce/Screen/Request_Medicine.dart';
import 'package:ecommerce/Screen/SubCateGoryPage.dart';
import 'package:ecommerce/Screen/productlistpage2.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:sizer/sizer.dart';

class HomePage extends StatefulWidget {
  int? sel;

  HomePage({super.key, required this.sel});

  @override
  State<HomePage> createState() => _HomePageState();
}

bool isLoading = true;
bool name = false;
bool wait = false;
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

final List<Map<String, String>> items = [
  {
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjRLhFZkqWgKOsfMxVDLGFtD2dYkwmXcAuww&s",
    "title": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Dz8pJPPA7SOLo6CdZ6cYurBSCfv7Zfec0_olKfcJAFXJa6FcGUo23ozEN6LnMpmIE5Y&usqp=CAU",
    "title": "treatment and prevention from conditions also be used ",
  },
  {
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo0otowdFgoXyYHmoWllJh4lik5fcWTORhjT420QQ5DP0LqlcwalO-79_PYqXzL30X-dU&usqp=CAU",
    "title": "tropical pulmonary eosinophilia and loiasis.",
  },
  {
    "imageUrl": "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5lpByDf_7fRd4ZkgtfyIwM7sgknVKfpI9Ag&s",
    "title": "Besides these, it can also be used to treat conditions like",
  },
];


final List<Map<String, String>> items1 = [
  {
    "imageUrl": "https://pngimg.com/d/pills_PNG16510.png",
    "title": "Cipla",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://pngimg.com/d/pills_PNG16510.png",
    "title": "Paracetamol",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://premmedical.in/wp-content/uploads/2022/12/Himalaya-Immusante-Tablet-20s.png",
    "title": "Codine Syp",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl": "https://premmedical.in/wp-content/uploads/2022/12/Himalaya-Immusante-Tablet-20s.png",
    "title": "Antibiotic",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },

];


List cate = [
  "https://www.pngmart.com/files/15/Apple-iPhone-11-PNG-Background-Image.png",
  "https://www.transparentpng.com/thumb/computer/6o4Q2H-png-windows-desktop-set-software-game-coding-.png",
  "https://pngimg.com/d/book_PNG51058.png",
  "https://www.transparentpng.com/thumb/watch/dOleGR-skin-watch-clipart-transparent.png",
  "https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png",
];

final GlobalKey<ScaffoldState> _scaffoldKeyhome = GlobalKey<ScaffoldState>();

int sel = -1;

String? selected;

bool _isLoading = false;

class _HomePageState extends State<HomePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    allcoupon();
    allcatap();
    viewap();
    salesproductap();
    bestsellerproductap();
    blogap();
    brandap();
    carttotal();
    setState(() {
      isLoading = true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: bgcolor,
        key: _scaffoldKeyhome,
        drawer: drawer1(),
        bottomNavigationBar: bottombar(selected: sel),
        body: WillPopScope(
          onWillPop: dialog,
          child: isLoading
              ? Container()
              : Padding(
                  padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 2.h),
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
                          child: Stack(
                            children: [
                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  // Menu Icon
                                  IconButton(
                                    onPressed: () {
                                      _scaffoldKeyhome.currentState?.openDrawer();
                                    },
                                    icon: Icon(
                                      Icons.menu,
                                      size: 25.sp,
                                    ),
                                  ),

                                  // Image between Menu and Cart
                                  Image.asset(
                                    'assets/my.png', // Replace with your image path
                                    height: 10.w, // Adjust as needed
                                    width: 30.w,
                                    color: AppColors.primary,// Adjust as needed
                                  ),

                                  // Cart Icon and Profile
                                  Row(
                                    children: [
                                      // Cart Icon
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) =>
                                                  CartPage(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          color: AppColors.primary,
                                          size: 25.sp,
                                        ),
                                      ),

                                      // User Login/Profile
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
                                              ? Column(
                                                children: [
                                                  Icon(
                                                      CupertinoIcons.person_add,
                                                      size: 21.sp,
                                                      color:  AppColors.primary

                                                  ),

                                                ],
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
                              usermodal?.userId == "" ||
                                  usermodal?.userId == null
                                  ?Container():Positioned(
                                  bottom:3.5.h, // Adjust the value based on your layout
                                  right: 17.5.w, // Adjust the value based on your layout
                                  child: GestureDetector(
                                      onTap: () {
                                        // Handle the tap on the cart icon
                                      },
                                      child: Container(
                                          width: 5.w,
                                          height: 5.w,
                                          child: Stack(
                                            alignment: Alignment.center,
                                            children: [
                                              Positioned(
                                                top: 0,
                                                right: 0,
                                                child:  cartcountmodel
                                                    ?.cartCount ==
                                                    0?
                                                 Container(): Container(
                                                  width: 5.w,
                                                  height: 5.w,
                                                  alignment: Alignment.center,
                                                  padding: EdgeInsets.all(2),
                                                  decoration: BoxDecoration(
                                                    color: Colors.red,
                                                    borderRadius: BorderRadius.circular(100),
                                                  ),
                                                  constraints: BoxConstraints(
                                                    minWidth: 18,
                                                    minHeight: 18,
                                                  ),
                                                  child: Text(
                                                    cartcountmodel
                                                        ?.cartCount ==
                                                        null ||
                                                        cartcountmodel
                                                            ?.cartCount ==
                                                            ""
                                                        ? "0"
                                                        : (cartcountmodel
                                                        ?.cartCount)
                                                        .toString(),


                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontSize: 12,
                                                    ),
                                                    textAlign: TextAlign.center,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          )
                                      )
                                  )
                              )
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
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            searchBox(),
                          ],
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),

                 name?SliverToBoxAdapter(
                   child: Container(
                   ),
                 ):  SliverToBoxAdapter(
                        child: SizedBox(
                          height: 18.h,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount: allcouponmodal?.data?.length,  // Dynamic list length
                            itemBuilder: (context, index) {
                              return Container(
                                margin: EdgeInsets.only(right: 2.w),
                                alignment: Alignment.center,
                                height: 18.h,
                                width: 84.w,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: AppColors.primary,
                                ),
                                child: Row(
                                  children: [
                                    Image.network(
                                      'https://static.vecteezy.com/system/resources/thumbnails/024/585/326/small/3d-happy-cartoon-doctor-cartoon-doctor-on-transparent-background-generative-ai-png.png',
                                      fit: BoxFit.cover,
                                      width: 110,
                                      height: 110,
                                    ),
                                    SizedBox(width: 2.w),
                                    Expanded(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.start,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 3.5.w),
                                            child: Text(
                                              "FLAT ₹ ${allcouponmodal?.data?[index].couponValue ?? ""} ${allcouponmodal?.data?[index].couponType == "1" ? "%" : "Fixed"} OFF",
                                              style: TextStyle(
                                                fontSize: 10.5.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "task",
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 1.5.h),
                                          Padding(
                                            padding: EdgeInsets.only(left: 3.5.w),
                                            child: Text(
                                              "on your first order",
                                              style: TextStyle(
                                                fontSize: 11.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: 'task',
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(height: 1.5.h),
                                          GestureDetector(
                                            onTap: () {
                                              // Copy coupon code to clipboard
                                              Clipboard.setData(ClipboardData(text: allcouponmodal?.data?[index].couponCode ?? ""));
                                              // Show snackbar confirmation
                                              ScaffoldMessenger.of(context).showSnackBar(
                                                SnackBar(content: Text('Coupon code copied: ${allcouponmodal?.data?[index].couponCode ?? ""}')),
                                              );
                                            },
                                            child: Container(
                                              margin: EdgeInsets.symmetric(horizontal: 2.w),
                                              padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                              decoration: BoxDecoration(
                                                color: Colors.white,
                                                borderRadius: BorderRadius.circular(10),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: Colors.black12,
                                                    blurRadius: 5,
                                                    spreadRadius: 2,
                                                  ),
                                                ],
                                              ),
                                              child: Text(
                                                "Code: ${allcouponmodal?.data?[index].couponCode ?? ""}",
                                                style: TextStyle(
                                                  color: Colors.black,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 9.5.sp,
                                                  fontFamily: 'task',
                                                ),
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ],
                                ),
                              );
                            },
                          ),
                        ),
                      ),


                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: Padding(
                            padding: EdgeInsets.all(3.0),
                            // Adjust padding for the entire row
                            child: Container(
                              // color: CupertinoColors.white,
                              height: 124,
                              child: ListView(
                                scrollDirection: Axis.horizontal,
                                children: [
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      // Navigator.of(context).push(MaterialPageRoute(
                                      //     builder: (context) => Request_Medicine()));
                                    },
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                          BorderRadius.circular(10)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      'Request Medicine',
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          // Adjust the font size
                                                          fontWeight:
                                                          FontWeight.bold,
                                                          fontFamily: "task"),
                                                    ),
                                                  ),
                                                  Image.network(
                                                    'https://www.pngplay.com/wp-content/uploads/9/Medicine-Background-PNG.png',
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 200,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                      Radius.circular(10),
                                                      bottomRight:
                                                      Radius.circular(10)),
                                                  color: Colors.red.shade50),
                                              child: Padding(
                                                padding:
                                                const EdgeInsets.only(left: 15),
                                                child: Text(
                                                  'UPTO 24% OFF',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 9.sp,
                                                      fontFamily: 'task'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),

                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => ProductList4()));
                                    },
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      'Order Medicine',
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          // Adjust the font size
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'task'),
                                                    ),
                                                  ),
                                                  Image.network(
                                                    'https://4vector.com/i/free-vector-prescription-medicine-clip-art_119936_prescription-medicine-clip-art/Prescription_Medicine_clip_art_hight.png',
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 200,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10)),
                                                  color: Colors.red.shade50),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 15),
                                                child: Text(
                                                  'UPTO 24% OFF',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 9.sp,
                                                      fontFamily: 'task'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Prescriptionform()));
                                    },
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                            borderRadius:
                                            BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),

                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      'Request Prescription',
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          // Adjust the font size
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'task'),
                                                    ),
                                                  ),
                                                  Image.network(
                                                    'https://static.vecteezy.com/system/resources/previews/021/193/217/non_2x/prescription-icon-medical-assets-3d-rendering-png.png',
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 200,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10)),
                                                  color: Colors.red.shade50),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 15),
                                                child: Text(
                                                  'UPTO 24% OFF',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 9.sp,
                                                      fontFamily: 'task'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  SizedBox(
                                    width: 1.w,
                                  ),
                                  InkWell(
                                    onTap: (){
                                      Navigator.of(context).push(MaterialPageRoute(
                                          builder: (context) => Requestdoctorform()));
                                    },
                                    child: Card(
                                      elevation: 0,
                                      shape: RoundedRectangleBorder(
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      child: Container(
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          color: Colors.white,
                                        ),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.min,
                                          children: [
                                            Padding(
                                              padding: const EdgeInsets.all(8.0),
                                              child: Row(
                                                children: [
                                                  SizedBox(
                                                    width: 110,
                                                    child: Text(
                                                      'Request Doctors',
                                                      style: TextStyle(
                                                          fontSize: 11.sp,
                                                          // Adjust the font size
                                                          fontWeight:
                                                              FontWeight.bold,
                                                          fontFamily: 'task'),
                                                    ),
                                                  ),
                                                  Image.network(
                                                    'https://static.vecteezy.com/system/resources/previews/036/485/041/original/3d-doctor-character-talking-on-phone-call-suitable-for-medical-content-free-png.png',
                                                    width: 70,
                                                    height: 70,
                                                  ),
                                                ],
                                              ),
                                            ),
                                            Container(
                                              height: 30,
                                              width: 200,
                                              alignment: Alignment.centerLeft,
                                              decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.only(
                                                      bottomLeft:
                                                          Radius.circular(10),
                                                      bottomRight:
                                                          Radius.circular(10)),
                                                  color: Colors.red.shade50),
                                              child: Padding(
                                                padding:
                                                    const EdgeInsets.only(left: 15),
                                                child: Text(
                                                  'UPTO 24% OFF',
                                                  style: TextStyle(
                                                      color: Colors.red,
                                                      fontSize: 9.sp,
                                                      fontFamily: 'task'),
                                                ),
                                              ),
                                            )
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            )),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):SliverToBoxAdapter(
                        child: SizedBox(
                          height: 0.h,
                        ),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):  SliverToBoxAdapter(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Divider(
                                color: Colors.grey, // Divider color
                                thickness: 1,
                                indent: 10, // Divider thickness
                              ),
                            ),
                            Padding(
                              padding:
                                   EdgeInsets.symmetric(horizontal: 10),
                              child: Text(
                                "OR YOU CAN ORDER VIA",
                                style:
                                    TextStyle(color: Colors.grey,fontFamily: 'task',fontSize: 9.5.sp), // Text style
                              ),
                            ),
                            Expanded(
                              child: Divider(
                                color: Colors.grey, // Divider color
                                thickness: 1,
                                endIndent: 10, // Divider thickness
                              ),
                            ),
                          ],
                        ),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):   SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: [
                            Container(
                              height: 40,
                              width: 43.w, // Height of the button
                              decoration: BoxDecoration(
                                color: Colors.white, // Button background color
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Icon(Icons.call,
                                      color: AppColors.primary, size: 24),
                                  // Button icon
                                  SizedBox(width: 8),
                                  Text(
                                    "Call Us",
                                    style: TextStyle(
                                        color: AppColors.primary,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                        fontFamily: 'task'),
                                  ),
                                ],
                              ),
                            ),
                            Container(
                              height: 40,
                              width: 43.w, // Height of the button
                              decoration: BoxDecoration(
                                color: Colors.white, // Button background color
                                borderRadius: BorderRadius.circular(
                                    10), // Rounded corners
                              ),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Image.network(
                                    "https://cdn-icons-png.flaticon.com/512/2111/2111774.png",
                                    width: 20,
                                    height: 20,
                                    color: Colors.green,
                                  ),
                                  // Icon(Icons.facebook_sharp,color:AppColors.primary, size: 24), // Button icon
                                  SizedBox(width: 8),
                                  Text(
                                    "Whatsapp",
                                    style: TextStyle(
                                        color: Colors.green,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 12.sp,
                                        fontFamily: 'task'),
                                  ),
                                ],
                              ),
                            ),
                          ],
                        ),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):SliverToBoxAdapter(
                        child: SizedBox(
                          height: 3.h,
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):   SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                "Shop By Category",
                                style: TextStyle(
                                    fontSize: 11.sp,
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
                                            fontSize: 10.sp,
                                            color: AppColors.primary,
                                            fontFamily: "task"),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 38.h,
                          child: allcatmodal?.categories?.length == 0
                              ? Center(
                                  child: Text(
                                    "No Category Available",
                                    style: TextStyle(
                                      fontSize: 18.sp,
                                      fontFamily: 'task',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : GridView.builder(
                                  physics: NeverScrollableScrollPhysics(),
                                  padding: EdgeInsets.zero,
                                  gridDelegate:
                                      SliverGridDelegateWithFixedCrossAxisCount(
                                    crossAxisCount: 4, // 4 items per row
                                    mainAxisSpacing:
                                        1.0, // spacing between rows
                                    crossAxisSpacing:
                                        1.0, // spacing between items in a row
                                    childAspectRatio: 0.6 /
                                        1, // adjust based on desired item aspect ratio
                                  ),
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
                                                      ),
                                                    ),
                                                  );
                                                });
                                                catwiceproductap();
                                              },
                                              child: Container(
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                ),
                                                margin: EdgeInsets.symmetric(
                                                    horizontal: 2.w),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  child: CachedNetworkImage(
                                                    height: 18.w,
                                                    width: 18.w,
                                                    imageUrl: allcatmodal
                                                            ?.categories?[index]
                                                            .catagoryimage ??
                                                        '',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Icon(Icons
                                                            .error_outline_outlined),
                                                  ),
                                                ),
                                              ),
                                            ),
                                            name?SliverToBoxAdapter(
                                              child: Container(
                                              ),
                                            ): SizedBox(
                                              height: 1.h,
                                            ),
                                            SizedBox(
                                              width: 16.w,
                                              child: Text(
                                                textAlign: TextAlign.center,
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
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task",
                                                  color: Colors.black,
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
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):SliverToBoxAdapter(
                        child: SizedBox(
                          height: 3.h,
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            SizedBox(
                              child: Text(
                                "Featured Brands",
                                style: TextStyle(
                                    fontSize: 11.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "task"),
                              ),
                            ),
                            GestureDetector(
                              onTap: () {
                                Navigator.of(context).push(MaterialPageRoute(
                                    builder: (context) => All_Brands()));
                              },
                              child: Container(
                                child: allcatmodal?.categories?.length == 0
                                    ? Text("")
                                    : Text(
                                        "View All",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 10.sp,
                                            color: AppColors.primary,
                                            fontFamily: "task"),
                                      ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: SizedBox(
                          height: 1.h,
                        ),
                      ),
                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: Container(
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white,
                          ),
                          height: 15.h,
                          child: brandmodel?.data?.length == 0
                              ? Center(
                                  child: Text(
                                    "No Brands Available",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: 'task',
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                )
                              : ListView.builder(
                                  scrollDirection: Axis.horizontal,
                                  padding: EdgeInsets.zero,
                                  itemBuilder: (context, index) {
                                    return Container(
                                      margin:
                                          EdgeInsets.symmetric(horizontal: 2.w),
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
                                                  selected = brandmodel
                                                      ?.data?[index]
                                                      .brandID
                                                      .toString();
                                                  Navigator.of(context).push(
                                                      MaterialPageRoute(
                                                          builder: (context) =>
                                                              ProductListPage2(
                                                             allcatid: brandmodel?.data?[index]?. brandID  ?? "",
                                                                name: brandmodel?.data?[index]?. brandName  ?? "",
                                                              )));
                                                });
                                                catwiceproductap();
                                              },
                                              child: Container(
                                                height: 19.w,
                                                width: 19.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                  color: Colors.grey.shade100,
                                                  border: Border.all(
                                                    width: 1,
                                                    color: Colors.grey,
                                                  ),
                                                  borderRadius:
                                                      BorderRadius.circular(
                                                          10), // More rounded corners
                                                ),
                                                child: ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  // Same rounded corners for the image
                                                  child: CachedNetworkImage(
                                                    height: 19.w,
                                                    width: 19.w,
                                                    imageUrl: brandmodel
                                                            ?.data?[index]
                                                            .image ??
                                                        '',
                                                    fit: BoxFit.cover,
                                                    progressIndicatorBuilder:
                                                        (context, url,
                                                                progress) =>
                                                            Center(
                                                                child:
                                                                    CircularProgressIndicator()),
                                                    errorWidget: (context, url,
                                                            error) =>
                                                        Icon(Icons
                                                            .error_outline_outlined),
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
                                                brandmodel?.data?[index]
                                                                .brandName ==
                                                            '' ||
                                                    brandmodel?.data?[index]
                                                        .brandName ==
                                                            null
                                                    ? 'N/A'
                                                    : brandmodel?.data?[index]
                                                    .brandName ??
                                                        '',
                                                style: TextStyle(
                                                  fontSize: 10.sp,
                                                  fontWeight: FontWeight.bold,
                                                  fontFamily: "task",
                                                  color: Colors.black,
                                                ),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    );
                                  },
                                  itemCount: brandmodel?.data?.length,
                                ),
                        ),
                      ),
                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 2.h,
                        ),
                      ),
                      bestsellerproductmodal?.productData?.length ==
                          0 ||
                          bestsellerproductmodal
                              ?.productData?.length ==
                              null
                          ? SliverToBoxAdapter(
                          child:Container())
                          :  SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment:
                          MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              "Top Selling Products",
                              style: TextStyle(
                                fontSize: 12.sp,
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
                                child:   Text(
                                  "View All",
                                  style: TextStyle(
                                      fontWeight: FontWeight.bold,
                                      fontSize: 10.sp,
                                      color: AppColors.primary,
                                      fontFamily: "task"),
                                ),
                              ),
                            ),
                          ],
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
                                            fontSize: 14.sp,
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold
                                            ),
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
                                          0.0, // Adjust as needed
                                          crossAxisSpacing:
                                          0.0, // Adjust as needed
                                          childAspectRatio:
                                          6.5 / 7.5 // Adjust as needed
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
                                                      height: 9.5.h,
                                                      width: 25.w,
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
                                                                        11.5.sp,
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
                                                              fontSize: 11.sp,
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
                                                                fontSize: 11.sp,
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
                                                                  builder:
                                                                      (context) =>
                                                                          productdetailnovartion(
                                                                            productid:
                                                                                searchbestsaleModal?.productData?[index].productID ?? '',
                                                                          )));

                                                    },
                                                    child: Container(
                                                      alignment: Alignment.center,
                                                      height: 4.h,
                                                      width: 32.w,
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(10),
                                                          color:
                                                             AppColors.primary),
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
                                height:  bestsellerproductmodal?.productData?.length ==
                                    0 ||
                                    bestsellerproductmodal
                                        ?.productData?.length ==
                                        null
                                    ? 0.h
                                    :2.h,
                              ),
                            ),
                    wait? SliverToBoxAdapter(child: Container()): bestsellerproductmodal?.productData?.length ==
                                          0 ||
                                      bestsellerproductmodal
                                              ?.productData?.length ==
                                          null
                                  ? SliverToBoxAdapter(
                                      child: Container(
                                      height: 0.h,
                                      child: Center(
                                        child: Text(
                                          '',
                                          style: TextStyle(
                                              fontWeight: FontWeight.bold,
                                              fontFamily: 'task',
                                              fontSize: 13.5.sp,
                                              color: Colors.black),
                                        ),
                                      ),
                                    ))
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
                                                  6.5 / 7.5 // Adjust as needed
                                                  ),
                                          delegate: SliverChildBuilderDelegate(
                                            (BuildContext context, int index) {
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
                                                                                bestsellerproductmodal?.productData?[index].productID ?? '',
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
                                                              MainAxisAlignment
                                                                  .center,
                                                          crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .center,
                                                          children: [
                                                            Container(
                                                              child:
                                                                  CachedNetworkImage(
                                                                imageUrl:
                                                                    bestsellerproductmodal
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
                                                                                .imgData ?? "",
                                                                // items1[index]['imageUrl']!,
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
                                                                        bestsellerproductmodal?.productData?[index].productName == "" || bestsellerproductmodal?.productData?[index].productName == null
                                                                            ? "N/A"
                                                                            : bestsellerproductmodal?.productData?[index].productName ??
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
                                                                      bestsellerproductmodal?.productData?[index].saleProductPrice ==
                                                                                  "" ||
                                                                              bestsellerproductmodal?.productData?[index].saleProductPrice ==
                                                                                  null
                                                                          ? "N/A"
                                                                          : '₹' +
                                                                              (bestsellerproductmodal?.productData?[index].saleProductPrice).toString(),
                                                                      // "\$500",
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
                                                                        bestsellerproductmodal?.productData?[index].productPrice == "" ||
                                                                                bestsellerproductmodal?.productData?[index].productPrice ==
                                                                                    null
                                                                            ? "N/A"
                                                                            : '₹' +
                                                                                (bestsellerproductmodal?.productData?[index].productPrice).toString(),
                                                                       // "\$580",
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
                                                                        builder:
                                                                            (context) =>
                                                                            productdetailnovartion(
                                                                              productid:
                                                                              bestsellerproductmodal?.productData?[index].productID ?? '',
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
                                                          Icons
                                                              .favorite_outline,
                                                          size: 20.sp,
                                                          color: Colors.black,
                                                        ),
                                                      )),
                                                ],
                                              );
                                            },
                                            childCount:


                                            // items1.length,

                                            _isLoading
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
                                              width: 32.w,
                                              decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: AppColors.primary),
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

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ): SliverToBoxAdapter(
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Text(
                              'Blogs',
                              style: TextStyle(
                                  fontSize: 12.sp,
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'task'),
                            ),
                            TextButton(
                              onPressed: () {},
                              child: Text(
                                'View All',
                                style: TextStyle(
                                    color: AppColors.primary,
                                    fontFamily: 'task',
                                    fontSize: 10.sp,
                                    fontWeight: FontWeight.bold),
                              ),
                            ),
                          ],
                        ),
                      ),

                      name?SliverToBoxAdapter(
                        child: Container(
                        ),
                      ):SliverToBoxAdapter(
                        child: SizedBox(
                          height: 19.h,
                          width: 60.w,
                          child: ListView.builder(
                            padding: EdgeInsets.zero,
                            scrollDirection: Axis.horizontal,
                            itemCount:blogmodel?.data?.length,  // Change to use dynamic list length
                            itemBuilder: (context, index) {
                              return GestureDetector(
                                onTap: (){

                                  Navigator.of(context).push(
                                      MaterialPageRoute(builder: (context) => Blogdetailspage(
                                        iteamid: blogmodel?.data?[index].id ?? '',
                                          id:blogmodel?.data?[index].id ?? ''
                                      ),)
                                  );
                                },
                                child: Card(
                                  color: Colors.blue.shade50,
                                  elevation: 0,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10),
                                      color: Colors.white,),
                                    child: Column(
                                      children: [
                                        Container(
                                          width: 60.w,
                                          child: ClipRRect(
                                            borderRadius: BorderRadius.only(
                                              topLeft: Radius.circular(10),
                                              topRight: Radius.circular(10),
                                            ),
                                            child: CachedNetworkImage(
                                              fit: BoxFit.cover,
                                              imageUrl :blogmodel
                                                  ?.data?[index]
                                                  .image ??
                                                  '',
                                              width: 50.w,
                                              height: 10.h,
                                              progressIndicatorBuilder: (context, url, progress) =>
                                                  Center(child: CircularProgressIndicator()),
                                              errorWidget: (context, url, error) => Image.asset('assets/my.png',color: AppColors.primary,),
                                            ),
                                          ),
                                        ),
                                        SizedBox(
                                          width: 60.w,
                                          child: Padding(
                                            padding: EdgeInsets.all(8.0),
                                            child: Text(
                                              blogmodel
                                                  ?.data?[index]
                                                  .title ==
                                                  '' ||
                                                  blogmodel
                                                      ?.data?[index]
                                                      .title ==
                                                      null
                                                  ? 'N/A'
                                                  :blogmodel
                                                  ?.data?[index]
                                                  .title ??
                                                  '',
                                              style: TextStyle(
                                                fontFamily: 'task',
                                                color: Colors.black,
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ),
                      ),

                      SliverToBoxAdapter(
                        child: SizedBox(
                          height: 9.h,
                        ),
                      ),

                    ],
                  ),
                ),
        ),
      ),
    );
  }

  Widget searchBox() {
    return Container(
      width: 92.w,
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
          });
          if (_serch.text.isEmpty) {
            setState(() {
              name = false;
              wait=false;
            });
          } else {
            setState(() {
              name = true;
              wait=true;
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
          hintText: 'Search  For Medicines',
          hintStyle: TextStyle(
              color: Colors.black, fontFamily: 'task', fontSize: 12.sp),
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
                  fontSize: 15.sp,
                  fontWeight: FontWeight.normal,
                  fontFamily: 'task'),
            ),
            actions: [
              CupertinoButton(
                  child: Text(
                    'Yes',
                    style: TextStyle(
                      fontSize: 15.sp,
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
                      fontSize: 15.sp,
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
    print("addwish" + data.toString());
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

  allcoupon() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().coponapi(data).then((response) async {
          allcouponmodal =
              AllCouponModal.fromJson(json.decode(response.body));
          print(allcouponmodal?.status);
          if (response.statusCode == 200 &&
              allcouponmodal?.status == "success") {
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

  blogap() async {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().blogapi(data).then((response) async {
          blogmodel =
              BlogModel.fromJson(json.decode(response.body));
          print(blogmodel?.status);
          if (response.statusCode == 200 &&
              blogmodel?.status == "success") {
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

  brandap() async {
    final Map<String, String> data = {};
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().brandapi(data).then((response) async {
          brandmodel =
              BrandModel.fromJson(json.decode(response.body));
          print(brandmodel?.status);
          if (response.statusCode == 200 &&
              brandmodel?.status == "success") {
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


  carttotal() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().carttotalcountapi(data).then((response) async {
          cartcountmodel =
              CartcountModel.fromJson(json.decode(response.body));
          print(cartcountmodel?.status);
          if (response.statusCode == 200 &&
              cartcountmodel?.status == "success") {
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
