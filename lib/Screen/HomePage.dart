import 'dart:convert';
import 'dart:io';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/AllCatModal.dart';
import 'package:ecommerce/Modal/AllCouponModal.dart';
import 'package:ecommerce/Modal/AllProductSerchModel.dart';
import 'package:ecommerce/Modal/BannerModel.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/BlogModel.dart';
import 'package:ecommerce/Modal/BrandModel.dart';
import 'package:ecommerce/Modal/CartcountModel.dart';
import 'package:ecommerce/Modal/CatWiceProductModal.dart';
import 'package:ecommerce/Modal/LogoutCardCount.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SalesProductModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/All_Blog.dart';
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
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/Refill_Alert.dart';
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
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatefulWidget {
  int? sel;

  HomePage({super.key, required this.sel});

  @override
  State<HomePage> createState() => _HomePageState();
}

Future<void> _launchUrl(String url) async {
  if (!await launchUrl(Uri.parse(url), mode: LaunchMode.externalApplication)) {
    throw Exception('Could not launch $url');
  }
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

List<book> mobile = [];

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
    "imageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQjRLhFZkqWgKOsfMxVDLGFtD2dYkwmXcAuww&s",
    "title": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcT7Dz8pJPPA7SOLo6CdZ6cYurBSCfv7Zfec0_olKfcJAFXJa6FcGUo23ozEN6LnMpmIE5Y&usqp=CAU",
    "title": "treatment and prevention from conditions also be used ",
  },
  {
    "imageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRo0otowdFgoXyYHmoWllJh4lik5fcWTORhjT420QQ5DP0LqlcwalO-79_PYqXzL30X-dU&usqp=CAU",
    "title": "tropical pulmonary eosinophilia and loiasis.",
  },
  {
    "imageUrl":
        "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQ5lpByDf_7fRd4ZkgtfyIwM7sgknVKfpI9Ag&s",
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
    "imageUrl":
        "https://premmedical.in/wp-content/uploads/2022/12/Himalaya-Immusante-Tablet-20s.png",
    "title": "Codine Syp",
    "price": "Besides these, it can also be used to treat",
    "saleprice": "Besides these, it can also be used to treat",
  },
  {
    "imageUrl":
        "https://premmedical.in/wp-content/uploads/2022/12/Himalaya-Immusante-Tablet-20s.png",
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

void _makePhoneCall(String phoneNumber) async {
  final Uri launchUri = Uri(
    scheme: 'tel',
    path: phoneNumber,
  );
  await launchUrl(launchUri);
}

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
    bannerap();
    getDeviceInfoandStore();
    setState(() {
      isLoading = true;
    });
  }

  String? deviceName;
  String? deviceOS;

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        extendBody: true,
        backgroundColor: bgcolor,
        key: _scaffoldKeyhome,
        drawer: drawer1(),
        bottomNavigationBar: SizedBox(
          height: 9.h,

            child: bottombar(selected: sel)),
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
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // Menu Icon
                                  IconButton(
                                    onPressed: () {
                                      _scaffoldKeyhome.currentState
                                          ?.openDrawer();
                                    },
                                    icon: Icon(
                                      Icons.menu,
                                      size: 25.sp,
                                    ),
                                  ),

                                  // Image between Menu and Cart
                                  Image.asset(
                                    'assets/mylogo.png',
                                    // Replace with your image path
                                    height: 10.w, // Adjust as needed
                                    width: 30.w,
                                    color:
                                        AppColors.primary, // Adjust as needed
                                  ),

                                  // Cart Icon and Profile
                                  Row(
                                    children: [
                                      // Cart Icon
                                      IconButton(
                                        onPressed: () {
                                          Navigator.of(context).push(
                                            MaterialPageRoute(
                                              builder: (context) => CartPage(),
                                            ),
                                          );
                                        },
                                        icon: Icon(
                                          Icons.shopping_cart,
                                          color: AppColors.primary,
                                          size: 20.sp,
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
                                                        CupertinoIcons
                                                            .person_add,
                                                        size: 20.sp,
                                                        color:
                                                            AppColors.primary),
                                                  ],
                                                )
                                              : Container(
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 1.w),
                                                  height: 10.2.w,
                                                  width: 10.2.w,
                                                  padding: EdgeInsets.all(1.w),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            90),
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
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Icon(
                                                        Icons
                                                            .error_outline_rounded,
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
                                  ? Positioned(
                                  bottom: 2.8.h,
                                  // Adjust the value based on your layout
                                  right: 9.9.w,
                                      // Adjust the value based on your layout
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
                                                    child: logoutCardCount
                                                                ?.cartCount ==
                                                            0
                                                        ? Container()
                                                        : Container(
                                                            width: 5.w,
                                                            height: 5.w,
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 18,
                                                              minHeight: 18,
                                                            ),
                                                            child: Text(
                                                              logoutCardCount?.cartCount ==
                                                                          0 ||
                                                                      logoutCardCount
                                                                              ?.cartCount ==
                                                                          null
                                                                  ? "0"
                                                                  : (logoutCardCount
                                                                          ?.cartCount)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                  ),
                                                ],
                                              ))))
                                  : Positioned(
                                      bottom: 2.8.h,
                                      // Adjust the value based on your layout
                                      right: 15.5.w,
                                      // Adjust the value based on your layout
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
                                                    child: cartcountmodel
                                                                ?.cartCount ==
                                                            0
                                                        ? Container()
                                                        : Container(
                                                            width: 5.w,
                                                            height: 5.w,
                                                            alignment: Alignment
                                                                .center,
                                                            padding:
                                                                EdgeInsets.all(
                                                                    2),
                                                            decoration:
                                                                BoxDecoration(
                                                              color: Colors.red,
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          100),
                                                            ),
                                                            constraints:
                                                                BoxConstraints(
                                                              minWidth: 18,
                                                              minHeight: 18,
                                                            ),
                                                            child: Text(
                                                              cartcountmodel?.cartCount ==
                                                                          0 ||
                                                                      cartcountmodel
                                                                              ?.cartCount ==
                                                                          null
                                                                  ? "0"
                                                                  : (cartcountmodel
                                                                          ?.cartCount)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                color: Colors
                                                                    .white,
                                                                fontSize: 12,
                                                              ),
                                                              textAlign:
                                                                  TextAlign
                                                                      .center,
                                                            ),
                                                          ),
                                                  ),
                                                ],
                                              ))))
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
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 2.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : bannermodel?.data?.length == 0 ||
                                  bannermodel?.data?.length == null
                              ? SliverToBoxAdapter(
                                  child: Container(),
                                )
                              : SliverToBoxAdapter(
                                  child: SizedBox(
                                    height: 20.h,
                                    child: bannermodel?.data?.length == 0
                                        ? Center(
                                            child: Text(
                                              "No Banner Available",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'task',
                                                fontWeight: FontWeight.bold,
                                              ),
                                            ),
                                          )
                                        : CarouselSlider.builder(
                                            options: CarouselOptions(
                                              height: 40.h,
                                              // Carousel height
                                              autoPlay: true,
                                              // Enable auto-scrolling
                                              autoPlayInterval:
                                                  Duration(seconds: 2),
                                              // Scroll every 1 second
                                              enlargeCenterPage: true,
                                              // Optional: enlarge the center item
                                              viewportFraction: 1,
                                              // Fraction of screen width to show
                                              aspectRatio: 16 / 20,

                                              // Aspect ratio of the slider
                                            ),
                                            //padding: EdgeInsets.zero,
                                            // scrollDirection: Axis.horizontal,
                                            itemCount:
                                                bannermodel?.data?.length,
                                            // Change to use dynamic list length
                                            itemBuilder:
                                                (context, index, realIdx) {
                                              return InkWell(
                                                onTap: () {
                                                  // bannermodel?.data?.type == 'url'?
                                                  _launchUrl(bannermodel
                                                              ?.data?[index]
                                                              .bannerUrl ??
                                                          '')
                                                      // : bannermodel?.data?.type == 'brand'? navigate kr brands ma : navigate kr product ma
                                                      ;
                                                },
                                                child: Container(
                                                  width: 90.w,
                                                  // Set the same width for the container
                                                  height: 25.h,
                                                  // Set the same height for the container
                                                  decoration: BoxDecoration(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white,
                                                  ),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      fit: BoxFit.fill,
                                                      // This will ensure the image covers the container
                                                      imageUrl: bannermodel
                                                              ?.data?[index]
                                                              .bannerImg ??
                                                          '',
                                                      width: 60.w,
                                                      // Same width as the container
                                                      height: 15.h,
                                                      // Same height as the container
                                                      progressIndicatorBuilder:
                                                          (context, url,
                                                                  progress) =>
                                                              Center(
                                                                  child:
                                                                      CircularProgressIndicator()),
                                                      errorWidget: (context,
                                                              url, error) =>
                                                          Image.asset(
                                                              'assets/my.png',
                                                              color: AppColors
                                                                  .primary),
                                                    ),
                                                  ),
                                                ),
                                              );
                                            },
                                          ),
                                  ),
                                ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 1.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: Padding(
                                  padding: EdgeInsets.all(3.0),
                                  // Adjust padding for the entire row
                                  child: Container(
                                    // color: CupertinoColors.white,
                                    height: 124,
                                    child: ListView(
                                      scrollDirection: Axis.horizontal,
                                      children: [
                                        // upload prescription
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Prescriptionform()));
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 110,
                                                          child: Text(
                                                            'Upload Prescription',
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                // Adjust the font size
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'task'),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10)),
                                                        color:
                                                            Colors.red.shade50),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        'Fast Delivery',
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
                                        // refill alert
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Refill_Alert()));
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
                                                  color: Colors.white),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
                                                    child: Row(
                                                      children: [
                                                        SizedBox(
                                                          width: 110,
                                                          child: Text(
                                                            'Refill Alert',
                                                            style: TextStyle(
                                                                fontSize: 11.sp,
                                                                // Adjust the font size
                                                                fontWeight:
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "task"),
                                                          ),
                                                        ),
                                                        Image.network(
                                                          'https://cdn-icons-png.flaticon.com/512/3789/3789150.png',
                                                          width: 70,
                                                          height: 70,
                                                        ),
                                                      ],
                                                    ),
                                                  ),
                                                  Container(
                                                    height: 30,
                                                    width: 200,
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10)),
                                                        color:
                                                            Colors.red.shade50),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        'Fast Delivery',
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
                                        // request medicine
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Request_Medicine()));
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
                                                  color: Colors.white),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    "task"),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10)),
                                                        color:
                                                            Colors.red.shade50),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        'Fast Delivery',
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
                                        // order medicine
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        ProductList4()));
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
                                                  color: Colors.white),
                                              child: Column(
                                                mainAxisSize: MainAxisSize.min,
                                                children: [
                                                  Padding(
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'task'),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10)),
                                                        color:
                                                            Colors.red.shade50),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        'Fast Delivery',
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
                                        // request doctor
                                        InkWell(
                                          onTap: () {
                                            Navigator.of(context).push(
                                                MaterialPageRoute(
                                                    builder: (context) =>
                                                        Requestdoctorform()));
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
                                                    padding:
                                                        const EdgeInsets.all(
                                                            8.0),
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
                                                                    FontWeight
                                                                        .bold,
                                                                fontFamily:
                                                                    'task'),
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
                                                    alignment:
                                                        Alignment.centerLeft,
                                                    decoration: BoxDecoration(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                                bottomLeft: Radius
                                                                    .circular(
                                                                        10),
                                                                bottomRight:
                                                                    Radius
                                                                        .circular(
                                                                            10)),
                                                        color:
                                                            Colors.red.shade50),
                                                    child: Padding(
                                                      padding:
                                                          const EdgeInsets.only(
                                                              left: 15),
                                                      child: Text(
                                                        'Fast Delivery',
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
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 0.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 2.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
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
                                      style: TextStyle(
                                          color: Colors.grey,
                                          fontFamily: 'task',
                                          fontSize: 9.5.sp), // Text style
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
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 2.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  Container(
                                    height: 40,
                                    width: 43.w, // Height of the button
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Button background color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded corners
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.call,
                                            color: AppColors.primary, size: 20),
                                        SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {
                                            _makePhoneCall(
                                                '9051294444'); // Replace with the actual phone number
                                          },
                                          child: Text(
                                            "Call Us",
                                            style: TextStyle(
                                              color: AppColors.primary,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                              fontFamily: 'task',
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                  Container(
                                    height: 40,
                                    width: 43.w, // Height of the button
                                    decoration: BoxDecoration(
                                      color: Colors
                                          .white, // Button background color
                                      borderRadius: BorderRadius.circular(
                                          10), // Rounded corners
                                    ),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        Image.network(
                                          "https://cdn-icons-png.flaticon.com/512/2111/2111774.png",
                                          width: 20,
                                          height: 20,
                                          color: Colors.green,
                                        ),
                                        // Icon(Icons.facebook_sharp,color:AppColors.primary, size: 24), // Button icon
                                        SizedBox(width: 8),
                                        GestureDetector(
                                          onTap: () {},
                                          child: GestureDetector(
                                            onTap: () async {
                                              final String phoneNumber =
                                                  "919051294444"; // Replace with your actual number in the correct format
                                              final String whatsappUrl =
                                                  "https://wa.me/$phoneNumber"; // Construct the WhatsApp URL

                                              if (await canLaunch(
                                                  whatsappUrl)) {
                                                await launch(whatsappUrl);
                                              } else {
                                                throw 'Could not launch $whatsappUrl';
                                              }
                                            },
                                            child: Text(
                                              "Whatsapp",
                                              style: TextStyle(
                                                  color: Colors.green,
                                                  fontWeight: FontWeight.bold,
                                                  fontSize: 12.sp,
                                                  fontFamily: 'task'),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 3.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
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
                                      Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  CategoryPage()));
                                    },
                                    child: Container(
                                      child: allcatmodal?.categories?.length ==
                                              0
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
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 2.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: Container(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white,
                                ),
                                height: 19.h,
                                child: allcatmodal?.categories?.length == 0
                                    ? Center(
                                        child: Text(
                                          "No Category Available",
                                          style: TextStyle(
                                            fontSize: 16.sp,
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
                                          crossAxisCount: 4,
                                          // 4 items per row
                                          mainAxisSpacing:
                                              1.0, // spacing between rows
                                          crossAxisSpacing:
                                              1.0, // spacing between items in a row
                                          childAspectRatio: 0.5 /
                                              1, // adjust based on desired item aspect ratio
                                        ),
                                        itemBuilder: (context, index) {
                                          return Column(
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            mainAxisAlignment:
                                                MainAxisAlignment.start,
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
                                                            ProductListPage(
                                                          catid: selected,
                                                          // subcatid: selected,
                                                          allcatid: allcatmodal?.categories?[index].categoryID,
                                                          name: allcatmodal?.categories?[index].categoryName,
                                                        ),
                                                      ),
                                                    );
                                                  });

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
                                                        BorderRadius.circular(
                                                            10),
                                                  ),
                                                  margin: EdgeInsets.symmetric(
                                                      horizontal: 2.w),
                                                  child: ClipRRect(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    child: CachedNetworkImage(
                                                      height: 16.w,
                                                      width: 16.w,
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
                                              name
                                                  ? SliverToBoxAdapter(
                                                      child: Container(),
                                                    )
                                                  : SizedBox(
                                                      height: 1.h,
                                                    ),
                                              SizedBox(
                                                width: 20.w,
                                                child: Text(
                                                  textAlign: TextAlign.center,
                                                  allcatmodal
                                                                  ?.categories?[
                                                                      index]
                                                                  .categoryName ==
                                                              '' ||
                                                          allcatmodal
                                                                  ?.categories?[
                                                                      index]
                                                                  .categoryName ==
                                                              null
                                                      ? 'N/A'
                                                      : allcatmodal
                                                              ?.categories?[
                                                                  index]
                                                              .categoryName ??
                                                          '',
                                                  style: TextStyle(
                                                    fontSize: 9.sp,
                                                    fontWeight: FontWeight.bold,
                                                    fontFamily: "task",
                                                    color: Colors.black,
                                                  ),
                                                ),
                                              ),
                                            ],
                                          );
                                        },
                                        itemCount:
                                            ((allcatmodal?.categories?.length ??
                                                        0) <=
                                                    4
                                                ? (allcatmodal
                                                        ?.categories?.length ??
                                                    0)
                                                : 4),
                                        // itemCount: allcatmodal?.categories?.length,
                                      ),
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 1.h,
                              ),
                            ),
                      // name
                      //     ? SliverToBoxAdapter(
                      //         child: Container(),
                      //       )
                      //     : SliverToBoxAdapter(
                      //         child: brandmodel?.data?.length == 0 ||
                      //                 brandmodel?.data?.length == '' ||
                      //                 brandmodel?.data?.length == null
                      //             ? Container()
                      //             : Row(
                      //                 mainAxisAlignment:
                      //                     MainAxisAlignment.spaceBetween,
                      //                 children: [
                      //                   SizedBox(
                      //                     child: Text(
                      //                       "Featured Brands",
                      //                       style: TextStyle(
                      //                           fontSize: 11.sp,
                      //                           fontWeight: FontWeight.bold,
                      //                           fontFamily: "task"),
                      //                     ),
                      //                   ),
                      //                   GestureDetector(
                      //                     onTap: () {
                      //                       Navigator.of(context).push(
                      //                           MaterialPageRoute(
                      //                               builder: (context) =>
                      //                                   All_Brands()));
                      //                     },
                      //                     child: Container(
                      //                       child: brandmodel?.data?.length == 0
                      //                           ? Text("")
                      //                           : Text(
                      //                               "View All",
                      //                               style: TextStyle(
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                   fontSize: 10.sp,
                      //                                   color:
                      //                                       AppColors.primary,
                      //                                   fontFamily: "task"),
                      //                             ),
                      //                     ),
                      //                   ),
                      //                 ],
                      //               ),
                      //       ),
                      // name
                      //     ? SliverToBoxAdapter(
                      //         child: Container(),
                      //       )
                      //     : SliverToBoxAdapter(
                      //         child: SizedBox(
                      //           height: 1.h,
                      //         ),
                      //       ),
                      // name
                      //     ? SliverToBoxAdapter(
                      //         child: Container(),
                      //       )
                      //     : SliverToBoxAdapter(
                      //         child: Container(
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(10),
                      //             color: Colors.white,
                      //           ),
                      //           height: 15.h,
                      //           child: brandmodel?.data?.length == 0
                      //               ? Center(
                      //                   child: Text(
                      //                     "No Brands Available",
                      //                     style: TextStyle(
                      //                       fontSize: 13.sp,
                      //                       fontFamily: 'task',
                      //                       fontWeight: FontWeight.bold,
                      //                     ),
                      //                   ),
                      //                 )
                      //               : ListView.builder(
                      //                   scrollDirection: Axis.horizontal,
                      //                   padding: EdgeInsets.zero,
                      //                   itemBuilder: (context, index) {
                      //                     return Container(
                      //                       margin: EdgeInsets.symmetric(
                      //                           horizontal: 2.w),
                      //                       child: Center(
                      //                         child: Column(
                      //                           crossAxisAlignment:
                      //                               CrossAxisAlignment.center,
                      //                           mainAxisAlignment:
                      //                               MainAxisAlignment.center,
                      //                           children: [
                      //                             InkWell(
                      //                               onTap: () {
                      //                                 setState(() {
                      //                                   sel = index;
                      //                                   selected = brandmodel
                      //                                       ?.data?[index]
                      //                                       .brandID
                      //                                       .toString();
                      //                                   Navigator.of(context).push(
                      //                                       MaterialPageRoute(
                      //                                           builder:
                      //                                               (context) =>
                      //                                                   ProductListPage2(
                      //                                                     allcatid:
                      //                                                         brandmodel?.data?[index]?.brandID ?? "",
                      //                                                     name: brandmodel?.data?[index]?.brandName ??
                      //                                                         "",
                      //                                                   )));
                      //                                 });
                      //                                 catwiceproductap();
                      //                               },
                      //                               child: Container(
                      //                                 height: 19.w,
                      //                                 width: 19.w,
                      //                                 alignment:
                      //                                     Alignment.center,
                      //                                 decoration: BoxDecoration(
                      //                                   color: Colors
                      //                                       .grey.shade100,
                      //                                   border: Border.all(
                      //                                     width: 1,
                      //                                     color: Colors.grey,
                      //                                   ),
                      //                                   borderRadius:
                      //                                       BorderRadius.circular(
                      //                                           10), // More rounded corners
                      //                                 ),
                      //                                 child: ClipRRect(
                      //                                   borderRadius:
                      //                                       BorderRadius
                      //                                           .circular(10),
                      //                                   // Same rounded corners for the image
                      //                                   child:
                      //                                       CachedNetworkImage(
                      //                                     height: 19.w,
                      //                                     width: 19.w,
                      //                                     imageUrl: brandmodel
                      //                                             ?.data?[index]
                      //                                             .image ??
                      //                                         '',
                      //                                     fit: BoxFit.cover,
                      //                                     progressIndicatorBuilder:
                      //                                         (context, url,
                      //                                                 progress) =>
                      //                                             Center(
                      //                                                 child:
                      //                                                     CircularProgressIndicator()),
                      //                                     errorWidget: (context,
                      //                                             url, error) =>
                      //                                         Icon(Icons
                      //                                             .error_outline_outlined),
                      //                                   ),
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                             SizedBox(
                      //                               height: 1.h,
                      //                             ),
                      //                             SizedBox(
                      //                               width: 16.w,
                      //                               child: Text(
                      //                                 textAlign:
                      //                                     TextAlign.center,
                      //                                 overflow:
                      //                                     TextOverflow.ellipsis,
                      //                                 maxLines: 1,
                      //                                 brandmodel?.data?[index]
                      //                                                 .brandName ==
                      //                                             '' ||
                      //                                         brandmodel
                      //                                                 ?.data?[
                      //                                                     index]
                      //                                                 .brandName ==
                      //                                             null
                      //                                     ? 'N/A'
                      //                                     : brandmodel
                      //                                             ?.data?[index]
                      //                                             .brandName ??
                      //                                         '',
                      //                                 style: TextStyle(
                      //                                   fontSize: 10.sp,
                      //                                   fontWeight:
                      //                                       FontWeight.bold,
                      //                                   fontFamily: "task",
                      //                                   color: Colors.black,
                      //                                 ),
                      //                               ),
                      //                             ),
                      //                           ],
                      //                         ),
                      //                       ),
                      //                     );
                      //                   },
                      //                   itemCount: brandmodel?.data?.length,
                      //                 ),
                      //         ),
                      //       ),
                      name
                          ? SliverToBoxAdapter(
                              child: SizedBox(
                                height: 1.h,
                              ),
                            )
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: 2.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : bestsellerproductmodal?.productData?.length == 0 ||
                                  bestsellerproductmodal?.productData?.length ==
                                      null
                              ? SliverToBoxAdapter(child: Container())
                              : SliverToBoxAdapter(
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
                                                        selid:
                                                            selected.toString(),
                                                      )));
                                        },
                                        child: Container(
                                          child: Text(
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
                          : allProductserachModel?.searchResults?.length == 0 ||
                                  allProductserachModel
                                          ?.searchResults?.length ==
                                      null
                              ? SliverToBoxAdapter(
                                  child: Container(
                                    alignment: Alignment.center,
                                    height: 50.h,
                                    child: Center(
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        crossAxisAlignment: CrossAxisAlignment.center,
                                        children: [
                                          Text(
                                            "No Medicine Available",
                                            style: TextStyle(
                                                fontSize: 14.sp,
                                                fontFamily: 'task',
                                                fontWeight: FontWeight.bold),
                                          ),
                                          SizedBox(height: 5.h,),
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
                                        ],
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
                                                          productid: allProductserachModel
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
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white),
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
                                                      imageUrl: allProductserachModel
                                                              ?.searchResults?[
                                                                  index]
                                                              .allImages?[0] ??
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
                                                                allProductserachModel?.searchResults?[index].productName ==
                                                                            "" ||
                                                                        allProductserachModel?.searchResults?[index].productName ==
                                                                            null
                                                                    ? "N/A"
                                                                    : allProductserachModel
                                                                            ?.searchResults?[index]
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
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Row(
                                                        children: [
                                                          // Text(
                                                          //   '₹' +
                                                          //       (allProductserachModel
                                                          //               ?.searchResults?[
                                                          //                   index]
                                                          //               .saleProductPrice)
                                                          //           .toString(),
                                                          //   style: TextStyle(
                                                          //     fontSize: 11.sp,
                                                          //     fontFamily: 'task',
                                                          //     fontWeight:
                                                          //         FontWeight.bold,
                                                          //     letterSpacing: 1,
                                                          //     color: Colors.black,
                                                          //   ),
                                                          // ),
                                                          // SizedBox(
                                                          //   width: 0.5.h,
                                                          // ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsets.only(
                                                                    top: 0.5.h),
                                                            child: Text(
                                                              '₹' +
                                                                  (allProductserachModel
                                                                          ?.searchResults?[
                                                                              index]
                                                                          .productPrice)
                                                                      .toString(),
                                                              style: TextStyle(
                                                                // decoration:
                                                                //     TextDecoration
                                                                //         .lineThrough,
                                                                fontSize: 11.sp,
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
                                                              builder: (context) =>
                                                                  productdetailnovartion(
                                                                    productid: allProductserachModel
                                                                            ?.searchResults?[index]
                                                                            .productID ??
                                                                        '',
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
                                                                  .circular(10),
                                                          color: AppColors
                                                              .primary),
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
                                                    : allProductserachModel
                                                                ?.searchResults?[
                                                                    index]
                                                                .wishlist ==
                                                            1
                                                        ? removewishlistap(
                                                            (allProductserachModel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .productID)
                                                                .toString())
                                                        : addwishlistap(
                                                            (allProductserachModel
                                                                    ?.searchResults?[
                                                                        index]
                                                                    .productID)
                                                                .toString());
                                              },
                                              child: Icon(
                                                allProductserachModel
                                                            ?.searchResults?[
                                                                index]
                                                            .wishlist ==
                                                        1
                                                    ? Icons.favorite
                                                    : Icons.favorite_outline,
                                                size: 20.sp,
                                                color: allProductserachModel
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
                                      childCount: allProductserachModel
                                          ?.searchResults?.length
                                      // Replace

                                      ),
                                ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : SliverToBoxAdapter(
                              child: SizedBox(
                                height: bestsellerproductmodal
                                                ?.productData?.length ==
                                            0 ||
                                        bestsellerproductmodal
                                                ?.productData?.length ==
                                            null
                                    ? 0.h
                                    : 2.h,
                              ),
                            ),
                      name
                          ? SliverToBoxAdapter(child: Container())
                          : bestsellerproductmodal?.productData?.length == 0 ||
                                  bestsellerproductmodal?.productData?.length ==
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
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            10),
                                                    color: Colors.white),
                                                child: Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.center,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.center,
                                                  children: [
                                                    Container(
                                                      child: CachedNetworkImage(
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
                                                                "",
                                                        // items1[index]['imageUrl']!,
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
                                                                maxLines: 1,
                                                                bestsellerproductmodal?.productData?[index].productName ==
                                                                            "" ||
                                                                        bestsellerproductmodal?.productData?[index].productName ==
                                                                            null
                                                                    ? "N/A"
                                                                    : bestsellerproductmodal
                                                                            ?.productData?[index]
                                                                            .productName ??
                                                                        '',

                                                                // items1[index]['title']!,
                                                                style: TextStyle(
                                                                    fontSize:
                                                                        10.sp,
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
                                                            // Text(
                                                            //   bestsellerproductmodal?.productData?[index].saleProductPrice ==
                                                            //               "" ||
                                                            //           bestsellerproductmodal?.productData?[index].saleProductPrice ==
                                                            //               null
                                                            //       ? "N/A"
                                                            //       : '₹' +
                                                            //           (bestsellerproductmodal?.productData?[index].saleProductPrice).toString(),
                                                            //   // "\$500",
                                                            //   style:
                                                            //       TextStyle(
                                                            //     fontSize:
                                                            //         11.sp,
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
                                                            //   width:
                                                            //       0.5.w,
                                                            // ),
                                                            Padding(
                                                              padding: EdgeInsets
                                                                  .only(
                                                                      top: 0.4
                                                                          .h),
                                                              child: Text(
                                                                bestsellerproductmodal?.productData?[index].productPrice ==
                                                                            "" ||
                                                                        bestsellerproductmodal?.productData?[index].productPrice ==
                                                                            null
                                                                    ? "N/A"
                                                                    : '₹' +
                                                                        (bestsellerproductmodal?.productData?[index].productPrice)
                                                                            .toString(),
                                                                // "\$580",
                                                                style:
                                                                    TextStyle(
                                                                  // decoration:
                                                                  //     TextDecoration.lineThrough,
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
                                                            Alignment.center,
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
                                                child: Icon(bestsellerproductmodal?.productData?[index].wishlist == 1?
                                                  Icons.favorite:Icons.favorite_outline,
                                                  size: 20.sp,
                                                  color: bestsellerproductmodal?.productData?[index].wishlist == 1?
                                                      Colors.red: Colors.black,
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
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Text(
                                    'Blogs',
                                    style: TextStyle(
                                        fontSize: 12.sp,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task'),
                                  ),
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context)
                                          .push(MaterialPageRoute(
                                        builder: (context) => All_blogs(),
                                      ));
                                    },
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
                      name
                          ? SliverToBoxAdapter(
                              child: Container(),
                            )
                          : SliverToBoxAdapter(
                              child: blogmodel?.data?.length == null ||
                                      blogmodel?.data?.length == ""
                                  ? Container(
                                      child: Center(
                                          child: Text(
                                        "No Blog Avaliable",
                                        style: TextStyle(
                                          fontSize: 13.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: "task",
                                        ),
                                      )),
                                    )
                                  : Container(
                                      height: 19.h,
                                      child: ListView.builder(
                                        padding: EdgeInsets.zero,
                                        scrollDirection: Axis.horizontal,
                                        itemCount: blogmodel?.data?.length,
                                        // Change to use dynamic list length
                                        itemBuilder: (context, index) {
                                          return GestureDetector(
                                            onTap: () {
                                              Navigator.of(context)
                                                  .push(MaterialPageRoute(
                                                builder: (context) =>
                                                    Blogdetailspage(
                                                        iteamid: blogmodel
                                                                ?.data?[index]
                                                                .id ??
                                                            '',
                                                        id: blogmodel
                                                                ?.data?[index]
                                                                .id ??
                                                            ''),
                                              ));
                                            },
                                            child: Card(
                                              color: Colors.blue.shade50,
                                              elevation: 0,
                                              child: Container(
                                                decoration: BoxDecoration(
                                                  borderRadius:
                                                      BorderRadius.circular(10),
                                                  color: Colors.white,
                                                ),
                                                child: Column(
                                                  children: [
                                                    Container(
                                                      width: blogmodel?.data
                                                                  ?.length ==
                                                              1
                                                          ? 90.w
                                                          : 60.w,
                                                      child: ClipRRect(
                                                        borderRadius:
                                                            BorderRadius.only(
                                                          topLeft:
                                                              Radius.circular(
                                                                  10),
                                                          topRight:
                                                              Radius.circular(
                                                                  10),
                                                        ),
                                                        child:
                                                            CachedNetworkImage(
                                                          fit: BoxFit.cover,
                                                          imageUrl: blogmodel
                                                                  ?.data?[index]
                                                                  .image ??
                                                              '',
                                                          height: 10.h,
                                                          progressIndicatorBuilder:
                                                              (context, url,
                                                                      progress) =>
                                                                  Center(
                                                                      child:
                                                                          CircularProgressIndicator()),
                                                          errorWidget: (context,
                                                                  url, error) =>
                                                              Image.asset(
                                                            'assets/my.png',
                                                            color: AppColors
                                                                .primary,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    SizedBox(
                                                      width: blogmodel?.data
                                                                  ?.length ==
                                                              1
                                                          ? 90.w
                                                          : 60.w,
                                                      child: Padding(
                                                        padding:
                                                            EdgeInsets.all(8.0),
                                                        child: Text(
                                                          blogmodel
                                                                          ?.data?[
                                                                              index]
                                                                          .title ==
                                                                      '' ||
                                                                  blogmodel
                                                                          ?.data?[
                                                                              index]
                                                                          .title ==
                                                                      null
                                                              ? 'N/A'
                                                              : blogmodel
                                                                      ?.data?[
                                                                          index]
                                                                      .title ??
                                                                  '',
                                                          style: TextStyle(
                                                            fontFamily: 'task',
                                                            color: Colors.black,
                                                            fontWeight:
                                                                FontWeight.bold,
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
      // Container ni width jethi screen pranu responsive layout same aave
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
              wait = false;
            });
          } else {
            setState(() {
              name = true;
              wait = true;
            });
          }
          allproductserchap(_serch.text);
        },
        style: TextStyle(color: Colors.black, fontFamily: 'task'),
        decoration: InputDecoration(
          contentPadding: EdgeInsets.all(0),
          suffixIcon: _serch.text.isNotEmpty // Conditionally show the close icon
              ? InkWell(
            onTap: () {
              setState(() {
                _serch.text = '';
                allproductserchap(_serch.text); // Call API with empty search
                name = false;  // Reset name and wait state
                wait = false;
              });
            },
            child: Icon(Icons.close, size: 20),
          )
              : null,
          // suffixIcon: InkWell(
          //   onTap: () {
          //     setState(() {
          //       _serch.text = '';
          //       allproductserchap(_serch.text);
          //     });
          //   },
          //     child: Icon(Icons.close,size: 20,)
          // ),
          prefixIcon: Icon(
            Icons.search,
            color: Colors.black,
            size: 20,
          ),
          prefixIconConstraints: BoxConstraints(
            maxHeight: 20,
            minWidth: 40,
          ),
          border: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade300,
            ), // Outline border ni width same rakhavi
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: Colors.grey.shade400,
            ), // Enabled state ni border width same
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(10),
            borderSide: BorderSide(
              color: AppColors.primary,
            ), // Focused state ni border width same rakhvi
          ),
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
          allcouponmodal = AllCouponModal.fromJson(json.decode(response.body));
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
          blogmodel = BlogModel.fromJson(json.decode(response.body));
          print(blogmodel?.status);
          if (response.statusCode == 200 && blogmodel?.status == "success") {
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
          brandmodel = BrandModel.fromJson(json.decode(response.body));
          print(brandmodel?.status);
          if (response.statusCode == 200 && brandmodel?.status == "success") {
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
          cartcountmodel = CartcountModel.fromJson(json.decode(response.body));
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

  logoutcarttotal() async {
    final Map<String, String> data = {};
    data['user_id'] = deviceName.toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().logoutcarttotalcountapi(data).then((response) async {
          logoutCardCount =
              LogoutCardCount.fromJson(json.decode(response.body));
          print(logoutCardCount?.status);
          if (response.statusCode == 200 &&
              logoutCardCount?.status == "success") {
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

  bannerap() async {
    final Map<String, String> data = {};
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().bannnerapi(data).then((response) async {
          bannermodel = BannerModel.fromJson(json.decode(response.body));
          print(bannermodel?.status);
          if (response.statusCode == 200 && bannermodel?.status == "success") {
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

  Future<void> getDeviceInfoandStore() async {
    DeviceInfoPlugin deviceInfo = DeviceInfoPlugin();
    if (Platform.isAndroid) {
      AndroidDeviceInfo androidInfo = await deviceInfo.androidInfo;
      setState(() {
        deviceName = androidInfo.model; // Device name
        deviceOS = 'Android ${androidInfo.version.release}';
      });
      logoutcarttotal();
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
