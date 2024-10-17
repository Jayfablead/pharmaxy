import 'dart:convert';
import 'dart:io';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:device_info_plus/device_info_plus.dart';
import 'package:ecommerce/Modal/AllCouponModal.dart';
import 'package:ecommerce/Modal/Cartmodal.dart';
import 'package:ecommerce/Modal/CheckOutSendModel.dart';
import 'package:ecommerce/Modal/CouponModel.dart';
import 'package:ecommerce/Modal/DisIncrementModal.dart';
import 'package:ecommerce/Modal/IncrementModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveCartModal.dart';
import 'package:ecommerce/Modal/RemoveCouponModel.dart';
import 'package:ecommerce/Modal/Remove_cart_withoutlogin_Model.dart';
import 'package:ecommerce/Modal/ViewCartModal.dart';
import 'package:ecommerce/Modal/View_withoutuser_Model.dart';
import 'package:ecommerce/Modal/increment_without_login_model.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/CheckoutDetail.dart';
import 'package:ecommerce/Screen/ProductDetailnovartition.dart';
import 'package:ecommerce/Screen/ProfilePage.dart';
import 'package:ecommerce/Screen/decrement_without_login.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
import 'package:get/route_manager.dart';
import 'package:provider/provider.dart';
import 'package:sizer/sizer.dart';
import 'package:url_launcher/url_launcher.dart';

import '../Databasehandler.dart';
import '../Modal/AllUserAddModal.dart';
import '../Provider/cartProvider.dart';
import '../Widget/bottombar.dart';
import 'LoginPage2.dart';

class CartPage extends StatefulWidget {
  CartPage({super.key});

  @override
  State<CartPage> createState() => _CartPageState();
}



int age = 1;
int? newprice;
int? taxprice;
String? deviceName;
String? deviceOS;
final GlobalKey<ScaffoldState> _scaffoldKeycart1 = GlobalKey<ScaffoldState>();
DatabaseHelper databaseHelper = DatabaseHelper();

class order {
  String? image;
  String? name;
  String? dec;
  String? price;

  order(this.image, this.name, this.price, this.dec);
}

int pricetag = 0;

bool isLoading = true;
bool cpupon = false;
String? cpn;
String? coponapplend=_searchController.text.toString();
late TextEditingController _searchController;

int total = 0;
List<order> cat = [
  order(
    'https://www.transparentpng.com/thumb/-iphone-x/dO1Aqf-apple-iphone-caracteru-edsticas-especificaciones.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.transparentpng.com/thumb/computer/6o4Q2H-png-windows-desktop-set-software-game-coding-.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
];

class _CartPageState extends State<CartPage> {
  DatabaseHelper databaseHelper = DatabaseHelper();
  List<CartItem> cartItems = [];
  void _makePhoneCall(String phoneNumber) async {
    final Uri launchUri = Uri(
      scheme: 'tel',
      path: phoneNumber,
    );
    await launchUrl(launchUri);
  }
  @override
  void initState() {
    super.initState();
    ViewCartApi();
    getDeviceInfoandStore();
    ViewCartwithoutloginAp();
    allcoupon();
    print("(viewwithoutuserModel?.handlingCharge).toString(),${   (viewwithoutuserModel?.handlingCharge).toString()}");
    setState(() {
      isLoading = true;
      cpupon = false;
    });
    alluseraddapi();
    _searchController = TextEditingController();
  }



  Future<void> _fetchCartItems() async {
    List<CartItem> items = await databaseHelper.getCartItems();
    setState(() {
      cartItems = items;
    });
  }

  // @override
  // void dispose() {
  //   _searchController.dispose(); // Dispose of controller to avoid memory leaks
  //   super.dispose();
  // }

  @override
  Widget build(BuildContext context) {
    // final cart = Provider.of<CartProvider>(context);
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        bottomNavigationBar: bottombar(),
        key: _scaffoldKeycart1,
        extendBody: true,
        drawer: drawer1(),
        backgroundColor: bgcolor,
        body: isLoading
            ? Container()
            : SingleChildScrollView(
              child: Padding(
                  padding: EdgeInsets.symmetric(vertical: 1.h, horizontal: 3.w),
                  child: usermodal?.userId == "" || usermodal?.userId == null
                      ?
                  // Container(
                  //   child: FutureBuilder(
                  //     future: cart.getdata(),
                  //     builder: (context, snapshot) {
                  //       if (snapshot.hasData) {
                  //         return Column(
                  //           children: [
                  //             SizedBox(height: 4.h),
                  //             Container(
                  //               width: MediaQuery.of(context).size.width,
                  //               child: Row(
                  //                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                 children: [
                  //                   IconButton(
                  //                       onPressed: () {
                  //                         _scaffoldKeycart.currentState
                  //                             ?.openDrawer();
                  //                       },
                  //                       icon: Icon(
                  //                         Icons.menu_rounded,
                  //                         size: 22.sp,
                  //                       )),
                  //                   Text(
                  //                     "My Cart",
                  //                     style: TextStyle(
                  //                       fontSize: 13.sp,
                  //                       fontFamily: "task",
                  //                       fontWeight: FontWeight.bold,
                  //                     ),
                  //                   ),
                  //                   GestureDetector(
                  //                       onTap: () {
                  //                         Navigator.of(context).push(
                  //                             MaterialPageRoute(
                  //                                 builder: (context) =>
                  //                                     LoginPage2()));
                  //                       },
                  //                       child: Padding(
                  //                         padding:
                  //                         EdgeInsets.only(bottom: 1.h),
                  //                         child:  Icon(
                  //                             CupertinoIcons.person_add,
                  //                             size: 21.sp,
                  //                             color:  AppColors.primary
                  //
                  //                         ),
                  //                       ))
                  //                 ],
                  //               ),
                  //             ),
                  //             //SizedBox(height: 1.h),
                  //             snapshot.data!.length == 0 ||
                  //                 snapshot.data!.length == null
                  //                 ? Container(
                  //                 height: 70.h,
                  //                 alignment: Alignment.center,
                  //                 child: Text(
                  //                   "No Data Available",
                  //                   style: TextStyle(
                  //                     color: Colors.black,
                  //                     fontWeight: FontWeight.bold,
                  //                     fontFamily: 'task',
                  //                     fontSize: 12.sp,
                  //                   ),
                  //                 ))
                  //                 : Column(
                  //               children: [
                  //                 Container(
                  //                   alignment: Alignment.center,
                  //                   height: 51.h,
                  //                   child: ListView.builder(
                  //                       padding: EdgeInsets.zero,
                  //                       itemCount:
                  //                       snapshot.data!.length,
                  //                       itemBuilder:
                  //                           (BuildContext context,
                  //                           int index) {
                  //                         return Stack(
                  //                           children: [
                  //                             Card(
                  //                                 color: Colors.white,
                  //                                 child: Container(
                  //                                   decoration: BoxDecoration(
                  //                                       borderRadius: BorderRadius.circular(10),
                  //                                       color: Colors.white
                  //                                   ),
                  //                                   child: Column(
                  //                                     mainAxisAlignment:
                  //                                     MainAxisAlignment
                  //                                         .end,
                  //                                     crossAxisAlignment:
                  //                                     CrossAxisAlignment
                  //                                         .center,
                  //                                     children: [
                  //                                       Row(
                  //                                         mainAxisAlignment:
                  //                                         MainAxisAlignment
                  //                                             .start,
                  //                                         crossAxisAlignment:
                  //                                         CrossAxisAlignment
                  //                                             .center,
                  //                                         children: [
                  //                                           SizedBox(
                  //                                             width:
                  //                                             2.w,
                  //                                           ),
                  //                                           Container(
                  //                                             decoration: BoxDecoration(
                  //                                               borderRadius: BorderRadius.all(Radius.circular(
                  //                                                   20)),
                  //                                             ),
                  //                                             child:
                  //                                             Padding(
                  //                                               padding:
                  //                                               EdgeInsets.all(3.0),
                  //                                               child:
                  //                                               CachedNetworkImage(
                  //                                                 imageUrl:
                  //                                                 snapshot.data![index].productImage ?? '',
                  //                                                 fit: BoxFit
                  //                                                     .cover,
                  //                                                 height:
                  //                                                 34.w,
                  //                                                 width:
                  //                                                 32.w,
                  //                                                 imageBuilder: (context, imageProvider) =>
                  //                                                     Container(
                  //                                                       decoration:
                  //                                                       BoxDecoration(
                  //                                                         borderRadius: BorderRadius.circular(25),
                  //                                                         image: DecorationImage(
                  //                                                           image: imageProvider,
                  //                                                           // fit: BoxFit.cover,
                  //                                                         ),
                  //                                                       ),
                  //                                                     ),
                  //                                                 placeholder: (context, url) =>
                  //                                                     Center(child: CircularProgressIndicator()),
                  //                                                 errorWidget: (context, url, error) =>
                  //                                                     Icon(Icons.error),
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                           SizedBox(
                  //                                             width:
                  //                                             3.w,
                  //                                           ),
                  //                                           Padding(
                  //                                             padding: EdgeInsets.symmetric(
                  //                                                 vertical: 0.5
                  //                                                     .h,
                  //                                                 horizontal:
                  //                                                 0.5.w),
                  //                                             child:
                  //                                             Column(
                  //                                               mainAxisAlignment:
                  //                                               MainAxisAlignment.start,
                  //                                               crossAxisAlignment:
                  //                                               CrossAxisAlignment.start,
                  //                                               children: [
                  //                                                 SizedBox(
                  //                                                   height:
                  //                                                   1.5.h,
                  //                                                 ),
                  //                                                 Column(
                  //                                                   crossAxisAlignment:
                  //                                                   CrossAxisAlignment.start,
                  //                                                   mainAxisAlignment:
                  //                                                   MainAxisAlignment.center,
                  //                                                   children: [
                  //                                                     Padding(
                  //                                                       padding: EdgeInsets.only(left: 1.w),
                  //                                                       child: SizedBox(
                  //                                                         width: 45.w,
                  //                                                         child: Text(
                  //                                                           snapshot.data![index].productName ?? '',
                  //                                                           style: TextStyle(color: Colors.black, fontSize: 12.sp, fontWeight: FontWeight.w600, fontFamily: "task"),
                  //                                                         ),
                  //                                                       ),
                  //                                                     ),
                  //                                                     SizedBox(
                  //                                                       width: 50.w,
                  //                                                       child: Row(
                  //                                                         mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                                         children: [
                  //                                                           Container(
                  //                                                             padding: EdgeInsets.only(left: 1.w),
                  //                                                             child: Container(
                  //                                                               width: 47.w,
                  //                                                               child: Text(
                  //                                                                 overflow: TextOverflow.ellipsis,
                  //                                                                 maxLines: 2,
                  //                                                                 snapshot.data![index].productDescription ?? '',
                  //                                                                 style: TextStyle(color: Colors.black87, fontSize: 11.sp, fontWeight: FontWeight.normal, fontFamily: "task"),
                  //                                                               ),
                  //                                                             ),
                  //                                                           ),
                  //                                                         ],
                  //                                                       ),
                  //                                                     ),
                  //                                                     SizedBox(
                  //                                                       height: 1.h,
                  //                                                     ),
                  //                                                     Row(
                  //                                                       mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //                                                       children: [
                  //                                                         Container(
                  //                                                           alignment: Alignment.center,
                  //                                                           width: 27.w,
                  //                                                           height: 6.5.h,
                  //                                                           decoration: BoxDecoration(
                  //                                                             borderRadius: BorderRadius.circular(20),
                  //                                                           ),
                  //                                                           child: Row(
                  //                                                             crossAxisAlignment: CrossAxisAlignment.center,
                  //                                                             mainAxisAlignment: MainAxisAlignment.center,
                  //                                                             children: [
                  //                                                               InkWell(
                  //                                                                 onTap: () {
                  //                                                                   int quntity = snapshot.data![index].productQuantity!;
                  //                                                                   int price = snapshot.data![index].initialPrice!.toInt();
                  //                                                                   quntity--;
                  //                                                                   if (quntity > 0) {
                  //                                                                     int? newprice = price * quntity;
                  //                                                                     databaseHelper
                  //                                                                         .updateQuantityCartItems(
                  //                                                                       CartItem(
                  //                                                                         VariationTblId: snapshot.data![index].VariationTblId.toString(),
                  //                                                                         Color: snapshot.data![index].Color.toString(),
                  //                                                                         Size: snapshot.data![index].Size.toString(),
                  //                                                                         productId: snapshot.data![index].productId.toString(),
                  //                                                                         productDescription: snapshot.data![index].productDescription.toString(),
                  //                                                                         id: snapshot.data![index].id,
                  //                                                                         productName: snapshot.data![index].productName,
                  //                                                                         productPrice: newprice.toDouble(),
                  //                                                                         productQuantity: quntity,
                  //                                                                         productImage: snapshot.data![index].productImage.toString(),
                  //                                                                         initialPrice: snapshot.data![index].initialPrice,
                  //                                                                       ),
                  //                                                                     )
                  //                                                                         .then((value) {
                  //                                                                       pricetag = newprice;
                  //                                                                       print(pricetag);
                  //                                                                       cart.removeTotalPrice(double.parse(snapshot.data![index].initialPrice.toString()));
                  //                                                                     }).onError((error, stackTrace) {
                  //                                                                       print(error.toString());
                  //                                                                     });
                  //                                                                   }
                  //                                                                   print("clik button");
                  //                                                                 },
                  //                                                                 child: Container(
                  //                                                                     height: 7.5.w,
                  //                                                                     width: 7.5.w,
                  //                                                                     decoration: BoxDecoration(
                  //                                                                       borderRadius: BorderRadius.circular(15),
                  //                                                                       color: Color(0xff0061b0),
                  //                                                                     ),
                  //                                                                     child: Icon(
                  //                                                                       Icons.remove,
                  //                                                                       size: 20.sp,
                  //                                                                       color: Colors.white,
                  //                                                                     )),
                  //                                                               ),
                  //                                                               SizedBox(
                  //                                                                 width: 2.5.w,
                  //                                                               ),
                  //                                                               Container(
                  //                                                                 child: Row(
                  //                                                                   children: [
                  //                                                                     Container(
                  //                                                                       child: Text(
                  //                                                                         (snapshot.data![index].productQuantity).toString(),
                  //                                                                         style: TextStyle(
                  //                                                                           fontWeight: FontWeight.bold,
                  //                                                                           fontFamily: "task",
                  //                                                                           fontSize: 16.sp,
                  //                                                                         ),
                  //                                                                       ),
                  //                                                                     )
                  //                                                                   ],
                  //                                                                 ),
                  //                                                               ),
                  //                                                               SizedBox(
                  //                                                                 width: 2.5.w,
                  //                                                               ),
                  //                                                               InkWell(
                  //                                                                 onTap: () {
                  //                                                                   int quntity = snapshot.data![index].productQuantity!;
                  //                                                                   int price = snapshot.data![index].initialPrice!.toInt();
                  //                                                                   quntity++;
                  //                                                                   int? newprice = price * quntity;
                  //                                                                   databaseHelper
                  //                                                                       .updateQuantityCartItems(
                  //                                                                     CartItem(
                  //                                                                       VariationTblId: snapshot.data![index].VariationTblId.toString(),
                  //                                                                       Color: snapshot.data![index].Color.toString(),
                  //                                                                       Size: snapshot.data![index].Size.toString(),
                  //                                                                       productId: snapshot.data![index].productId.toString(),
                  //                                                                       productDescription: snapshot.data![index].productDescription.toString(),
                  //                                                                       id: snapshot.data![index].id,
                  //                                                                       productName: snapshot.data![index].productName,
                  //                                                                       productPrice: newprice.toDouble(),
                  //                                                                       productQuantity: quntity,
                  //                                                                       productImage: snapshot.data![index].productImage.toString(),
                  //                                                                       initialPrice: snapshot.data![index].initialPrice,
                  //                                                                     ),
                  //                                                                   )
                  //                                                                       .then((value) {
                  //                                                                     pricetag = newprice;
                  //                                                                     print(pricetag);
                  //                                                                     cart.addTotalPrice(double.parse(snapshot.data![index].initialPrice.toString()));
                  //                                                                   }).onError((error, stackTrace) {
                  //                                                                     print(error.toString());
                  //                                                                   });
                  //                                                                   print("clik button");
                  //                                                                 },
                  //                                                                 child: Container(
                  //                                                                     height: 7.5.w,
                  //                                                                     width: 7.5.w,
                  //                                                                     decoration: BoxDecoration(
                  //                                                                       borderRadius: BorderRadius.circular(25),
                  //                                                                       color: Color(0xff0061b0),
                  //                                                                     ),
                  //                                                                     child: Icon(
                  //                                                                       Icons.add,
                  //                                                                       size: 20.sp,
                  //                                                                       color: Colors.white,
                  //                                                                     )),
                  //                                                               ),
                  //                                                             ],
                  //                                                           ),
                  //                                                         ),
                  //                                                         SizedBox(
                  //                                                           width: 1.w,
                  //                                                         ),
                  //                                                         Text(
                  //                                                           snapshot.data![index].initialPrice.toString(),
                  //                                                           style: TextStyle(
                  //                                                             fontSize: 15.sp,
                  //                                                             fontFamily: 'task',
                  //                                                             fontWeight: FontWeight.normal,
                  //                                                             letterSpacing: 1,
                  //                                                             color: Colors.black,
                  //                                                           ),
                  //                                                         ),
                  //                                                       ],
                  //                                                     ),
                  //                                                   ],
                  //                                                 ),
                  //                                                 SizedBox(
                  //                                                   height:
                  //                                                   2.h,
                  //                                                 ),
                  //                                               ],
                  //                                             ),
                  //                                           )
                  //                                         ],
                  //                                       ),
                  //                                     ],
                  //                                   ),
                  //                                 )),
                  //                             Positioned(
                  //                               left: 84.w,
                  //                               child: IconButton(
                  //                                 icon: Icon(
                  //                                   Icons
                  //                                       .highlight_remove,
                  //                                   size: 20.sp,
                  //                                   color:
                  //                                   Colors.grey,
                  //                                 ), // Icon to open the menu
                  //                                 onPressed: () {
                  //                                   print(pricetag);
                  //                                   showBottomSheet(
                  //                                     context:
                  //                                     context,
                  //                                     builder:
                  //                                         (context) {
                  //                                       return Stack(
                  //                                         children: [
                  //                                           Container(
                  //                                             decoration: BoxDecoration(
                  //                                                 borderRadius:
                  //                                                 BorderRadius.circular(10),
                  //                                                 color: Colors.white),
                  //                                             height:
                  //                                             23.h,
                  //                                             width: double
                  //                                                 .infinity,
                  //                                             // Customize the bottom sheet content here
                  //                                             child:
                  //                                             Padding(
                  //                                               padding: EdgeInsets.symmetric(
                  //                                                   horizontal: 5.w,
                  //                                                   vertical: 2.h),
                  //                                               child:
                  //                                               Column(
                  //                                                 mainAxisAlignment:
                  //                                                 MainAxisAlignment.start,
                  //                                                 crossAxisAlignment:
                  //                                                 CrossAxisAlignment.start,
                  //                                                 mainAxisSize:
                  //                                                 MainAxisSize.min,
                  //                                                 children: [
                  //                                                   Row(
                  //                                                     children: [
                  //                                                       Text(
                  //                                                         "Remove From Cart?",
                  //                                                         style: TextStyle(fontWeight: FontWeight.bold, fontSize: 13.sp, fontFamily: 'task'),
                  //                                                       ),
                  //                                                     ],
                  //                                                   ),
                  //                                                   Text(
                  //                                                     "Are You Sure to delete this product from Cart?",
                  //                                                     style: TextStyle(fontWeight: FontWeight.normal, fontSize: 12.sp, fontFamily: 'task'),
                  //                                                   ),
                  //                                                   SizedBox(
                  //                                                     height: 2.h,
                  //                                                   ),
                  //                                                   Row(
                  //                                                     mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  //                                                     children: [
                  //                                                       GestureDetector(
                  //                                                         onTap: () {
                  //                                                           Navigator.of(context).pop();
                  //                                                         },
                  //                                                         child: Container(
                  //                                                             alignment: Alignment.center,
                  //                                                             height: 5.h,
                  //                                                             width: 35.w,
                  //                                                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white70, border: Border.all(width: 0.5, color: Colors.grey)),
                  //                                                             child: Text(
                  //                                                               "Cancel",
                  //                                                               style: TextStyle(fontSize: 13.sp, color: Colors.black, fontFamily: "task", fontWeight: FontWeight.bold),
                  //                                                             )),
                  //                                                       ),
                  //                                                       GestureDetector(
                  //                                                         onTap: () {
                  //                                                           setState(() {
                  //                                                             cart.removeTotalPrice(pricetag == 0 ? snapshot.data![index].initialPrice!.toDouble() : pricetag.toDouble());
                  //                                                           });
                  //                                                           databaseHelper.delete(
                  //                                                             int.parse(snapshot.data![index].id.toString()),
                  //                                                           );
                  //                                                           Navigator.pop(context);
                  //                                                         },
                  //                                                         child: Container(
                  //                                                             alignment: Alignment.center,
                  //                                                             height: 5.h,
                  //                                                             width: 35.w,
                  //                                                             decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: AppColors.primary),
                  //                                                             child: Text(
                  //                                                               "Remove",
                  //                                                               style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                  //                                                             )),
                  //                                                       ),
                  //                                                     ],
                  //                                                   ),
                  //                                                   // Add more options as needed
                  //                                                 ],
                  //                                               ),
                  //                                             ),
                  //                                           ),
                  //                                           Positioned(
                  //                                             right:
                  //                                             1.w,
                  //                                             child: IconButton(
                  //                                                 icon: Icon(
                  //                                                   Icons.highlight_remove,
                  //                                                   size: 25.sp,
                  //                                                   color: Colors.grey,
                  //                                                 ),
                  //                                                 // Icon to open the menu
                  //                                                 onPressed: () {
                  //                                                   Navigator.of(context).pop();
                  //                                                 } // We set onPressed to null to disable the button
                  //                                             ),
                  //                                           ),
                  //                                         ],
                  //                                       );
                  //                                     },
                  //                                   );
                  //                                 }, // We set onPressed to null to disable the button
                  //                               ),
                  //                             ),
                  //                           ],
                  //                         );
                  //                       }),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 1.h,
                  //                 ),
                  //                 Container(
                  //                   width: 93.w,
                  //                   height: 8.h,
                  //                   decoration: BoxDecoration(
                  //                     borderRadius:
                  //                     BorderRadius.circular(10),
                  //                     color: Color(0xffffffff),
                  //                   ),
                  //                   child: Row(
                  //                     mainAxisSize: MainAxisSize.max,
                  //                     mainAxisAlignment:
                  //                     MainAxisAlignment
                  //                         .spaceBetween,
                  //                     children: [
                  //                       Padding(
                  //                         padding: EdgeInsets.only(
                  //                           left: 3.w,
                  //                         ),
                  //                         child: Text(
                  //                           'Sub Total Amount',
                  //                           style: TextStyle(
                  //                             fontFamily: 'task',
                  //                             color: Colors
                  //                                 .grey.shade800,
                  //                             fontSize: 12.25.sp,
                  //                             fontWeight:
                  //                             FontWeight.bold,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                       Padding(
                  //                         padding: EdgeInsets.only(
                  //                           right: 3.w,
                  //                         ),
                  //                         child: Text(
                  //                           '₹ ${cart.getTOtalPrice().toString()}',
                  //                           // '₹ ' +
                  //                           //     '${snapshot.data![0].productQuantity == 1 ? snapshot.data![0].productPrice.toString() : newprice.toString()}',
                  //                           style: TextStyle(
                  //                             fontFamily: 'task',
                  //                             fontSize: 12.sp,
                  //                             fontWeight:
                  //                             FontWeight.bold,
                  //                           ),
                  //                         ),
                  //                       ),
                  //                     ],
                  //                   ),
                  //                 ),
                  //                 SizedBox(
                  //                   height: 3.h,
                  //                 ),
                  //                 GestureDetector(
                  //                   onTap: () {
                  //                     Navigator.of(context).push(
                  //                         MaterialPageRoute(
                  //                             builder: (context) =>
                  //                                 LoginPage2()));
                  //                   },
                  //                   child: Container(
                  //                       margin: EdgeInsets.only(
                  //                           right: 7.w, left: 7.w),
                  //                       alignment: Alignment.center,
                  //                       height: 6.h,
                  //                       decoration: BoxDecoration(
                  //                           borderRadius:
                  //                           BorderRadius.circular(
                  //                               10),
                  //                           color:AppColors.primary),
                  //                       child: Text(
                  //                         "Login to Checkout",
                  //                         style: TextStyle(
                  //                             fontSize: 12.sp,
                  //                             color: Colors.white,
                  //                             fontWeight:
                  //                             FontWeight.bold,
                  //                             fontFamily: "task"),
                  //                       )),
                  //                 ),
                  //               ],
                  //             ),
                  //           ],
                  //         );
                  //       }
                  //       return Text('helloo');
                  //     },
                  //   ),
                  // )

                  //  logout
                  Column(
                    children: [
                      SizedBox(
                        height: 2.h,
                      ),
                      SizedBox(
                        height: 2.h,
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(
                                onPressed: () {
                                  _scaffoldKeycart1.currentState
                                      ?.openDrawer();
                                },
                                icon: Icon(
                                  Icons.menu_rounded,
                                  size: 25.sp,
                                )),
                            Text(
                              "My Cart",
                              style: TextStyle(
                                fontSize: 16.sp,
                                fontFamily: "task",
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Row(
                              children: [
                                Padding(
                                  padding:  EdgeInsets.only(right: 2.w),
                                  child: GestureDetector(
                                    onTap: (){
                                     Navigator.of(context).push(
                                          MaterialPageRoute(
                                              builder: (context) =>
                                                  LoginPage2()));
                                    },
                                    child: Icon(
                                        CupertinoIcons.person_add,
                                        size: 21.sp,
                                        color:  AppColors.primary
                                    ),
                                  ),
                                )
                              ],
                            ),
                          ],
                        ),
                      ),
                      viewwithoutuserModel?.cartDetails?.length == 0 ||
                          viewwithoutuserModel?.cartDetails?.length == null
                          ? Container(
                          height: 75.h,
                          alignment: Alignment.center,
                          child: Text(
                            "No Data Available",
                            style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.bold,
                              fontFamily: 'task',
                              fontSize: 13.sp,
                            ),
                          ))
                          : Container(
                        child: Column(
                          children: [
                            Container(
                              height: Platform.isAndroid ?36.5.h:36.h,
                              child: ListView.builder(
                                padding: EdgeInsets.zero,
                                itemCount: viewwithoutuserModel
                                    ?.cartDetails?.length,
                                // The number of items in the grid
                                itemBuilder: (BuildContext context,
                                    int index) {
                                  // Build each item in the grid
                                  return Stack(
                                    children: [
                                      InkWell(
                                        onTap: (){
                                          Navigator.of(context)
                                              .push(MaterialPageRoute(
                                              builder: (context) =>
                                                  productdetailnovartion(
                                                    productid: viewwithoutuserModel
                                                        ?.cartDetails?[
                                                    index]
                                                        .productID ??
                                                        '',
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
                                                MainAxisAlignment.end,
                                                crossAxisAlignment:
                                                CrossAxisAlignment
                                                    .center,
                                                children: [
                                                  Row(
                                                    mainAxisAlignment:
                                                    MainAxisAlignment
                                                        .start,
                                                    crossAxisAlignment:
                                                    CrossAxisAlignment
                                                        .center,
                                                    children: [
                                                      SizedBox(
                                                        width: 2.w,
                                                      ),
                                                      Container(
                                                        decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.all(
                                                              Radius.circular(
                                                                  20)),
                                                          // color: Colors
                                                          //     .grey
                                                          //     .shade200
                                                        ),
                                                        child: Padding(
                                                             padding:
                                                          EdgeInsets
                                                              .all(
                                                              3.0),
                                                          child:
                                                          CachedNetworkImage(
                                                            imageUrl: (viewwithoutuserModel
                                                                ?.cartDetails?[
                                                            index]
                                                                .allImages)
                                                                .toString(),
                                                            fit: BoxFit
                                                                .cover,
                                                            height: 34.w,
                                                            width: 32.w,
                                                            imageBuilder:
                                                                (context,
                                                                imageProvider) =>
                                                                Container(
                                                                  decoration:
                                                                  BoxDecoration(
                                                                    borderRadius:
                                                                    BorderRadius.circular(
                                                                        25),
                                                                    image:
                                                                    DecorationImage(
                                                                      image:
                                                                      imageProvider,
                                                                      // fit: BoxFit.cover,
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
                                                      ),
                                                      SizedBox(
                                                        width: 3.w,
                                                      ),
                                                      Padding(
                                                        padding: EdgeInsets
                                                            .symmetric(
                                                            vertical:
                                                            0.5.h,
                                                            horizontal:
                                                            0.5.w),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          children: [
                                                            SizedBox(
                                                              height:
                                                              1.5.h,
                                                            ),
                                                            Column(
                                                              crossAxisAlignment:
                                                              CrossAxisAlignment
                                                                  .start,
                                                              mainAxisAlignment:
                                                              MainAxisAlignment
                                                                  .center,
                                                              children: [
                                                                Padding(
                                                                  padding:
                                                                  EdgeInsets.only(left: 1.w),
                                                                  child:
                                                                  SizedBox(
                                                                    width:
                                                                    45.w,
                                                                    child:
                                                                    Text(
                                                                      (viewwithoutuserModel?.cartDetails?[index].productName) == null
                                                                          ? "N/A"
                                                                          : (viewwithoutuserModel?.cartDetails?[index].productName).toString(),
                                                                      maxLines:
                                                                      2,
                                                                      overflow:
                                                                      TextOverflow.ellipsis,
                                                                      style: TextStyle(
                                                                          color: Colors.black,
                                                                          fontSize: 10.sp,
                                                                          fontWeight: FontWeight.w600,
                                                                          fontFamily: "task"),
                                                                    ),
                                                                  ),
                                                                ),
                                                                SizedBox(
                                                                  height:
                                                                  0.5.h,
                                                                ),
                                                                Row(
                                                                  mainAxisAlignment:
                                                                  MainAxisAlignment.spaceBetween,
                                                                  children: [
                                                                    Container(
                                                                      alignment:
                                                                      Alignment.center,
                                                                      width:
                                                                      26.w,
                                                                      height:
                                                                      6.5.h,
                                                                      decoration:
                                                                      BoxDecoration(
                                                                        borderRadius: BorderRadius.circular(20),
                                                                      ),
                                                                      child:
                                                                      Row(
                                                                        crossAxisAlignment: CrossAxisAlignment.center,
                                                                        mainAxisAlignment: MainAxisAlignment.center,
                                                                        children: [
                                                                          InkWell(
                                                                            onTap: () {
                                                                              int.parse((viewwithoutuserModel?.cartDetails?[index].cartProductQuantity).toString() ?? '') <= 1 ? buildErrorDialog(context, 'Alert', 'Minimum allowed quantity is 1') : decrementwithoutlogin((viewwithoutuserModel?.cartDetails?[index].cartTblId).toString());
                                                                              // setState(() {
                                                                              //   age--;
                                                                              // });
                                                                            },
                                                                            child: Container(
                                                                                height: 7.5.w,
                                                                                width: 7.5.w,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(15),
                                                                                  color: Color(0xff0061b0),
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.remove,
                                                                                  size: 20.sp,
                                                                                  color: Colors.white,
                                                                                )),
                                                                          ),
                                                                          SizedBox(
                                                                            width: 2.5.w,
                                                                          ),
                                                                          Container(
                                                                            child: Row(
                                                                              children: [
                                                                                Container(
                                                                                  child: Text(
                                                                                    (viewwithoutuserModel?.cartDetails?[index].cartProductQuantity).toString() == null ? "1" : (viewwithoutuserModel?.cartDetails?[index].cartProductQuantity).toString(),
                                                                                    style: TextStyle(
                                                                                      fontWeight: FontWeight.bold,
                                                                                      fontFamily: "task",
                                                                                      fontSize: 14.sp,
                                                                                    ),
                                                                                  ),
                                                                                )
                                                                              ],
                                                                            ),
                                                                          ),
                                                                          SizedBox(
                                                                            width: 2.5.w,
                                                                          ),
                                                                          InkWell(
                                                                            onTap: () {
                                                                              int.parse((viewwithoutuserModel?.cartDetails?[index].cartProductQuantity).toString() ?? '') >= 5
                                                                                  ? buildErrorDialog(context, 'Alert', 'Maximum allowed quantity is 5')
                                                                                  : incrementwithoutlogin(
                                                                                (viewwithoutuserModel?.cartDetails?[index].cartTblId).toString(),
                                                                              );
                                                                            },
                                                                            child: Container(
                                                                                height: 7.5.w,
                                                                                width: 7.5.w,
                                                                                decoration: BoxDecoration(
                                                                                  borderRadius: BorderRadius.circular(25),
                                                                                  color: Color(0xff0061b0),
                                                                                ),
                                                                                child: Icon(
                                                                                  Icons.add,
                                                                                  size: 14.sp,
                                                                                  color: Colors.white,
                                                                                )),
                                                                          ),
                                                                        ],
                                                                      ),
                                                                    ),
                                                                    SizedBox(
                                                                      width:
                                                                      1.w,
                                                                    ),
                                                                    Text(
                                                                      (viewwithoutuserModel?.cartDetails?[index].productPriceMain) == null
                                                                          ? "N/A"
                                                                          : '₹' + (viewwithoutuserModel?.cartDetails?[index].productPriceMain).toString(),
                                                                      style:
                                                                      TextStyle(
                                                                        fontSize: 14.sp,
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
                                                              height: 2.h,
                                                            ),
                                                          ],
                                                        ),
                                                      )
                                                    ],
                                                  ),
                                                ],
                                              ),
                                            )),
                                      ),
                                      Positioned(
                                        left: 82.w,
                                        top: 0.h,
                                        child: IconButton(
                                          icon: Icon(
                                            Icons.highlight_remove,
                                            size: 20.sp,
                                            color: Colors.grey,
                                          ), // Icon to open the menu
                                          onPressed: () {
                                            showBottomSheet(
                                              context: context,
                                              builder: (context) {
                                                return Stack(
                                                  children: [
                                                    Container(
                                                      decoration: BoxDecoration(
                                                          borderRadius:
                                                          BorderRadius.circular(
                                                              10),
                                                          color: Colors
                                                              .white),
                                                      height: 23.h,
                                                      width: double
                                                          .infinity,
                                                      // Customize the bottom sheet content here
                                                      child: Padding(
                                                        padding: EdgeInsets.symmetric(
                                                            horizontal:
                                                            5.w,
                                                            vertical:
                                                            2.h),
                                                        child: Column(
                                                          mainAxisAlignment:
                                                          MainAxisAlignment
                                                              .start,
                                                          crossAxisAlignment:
                                                          CrossAxisAlignment
                                                              .start,
                                                          mainAxisSize:
                                                          MainAxisSize
                                                              .min,
                                                          children: [
                                                            Row(
                                                              children: [
                                                                Text(
                                                                  "Remove From Cart?",
                                                                  style: TextStyle(
                                                                      fontWeight: FontWeight.bold,
                                                                      fontSize: 14.sp,
                                                                      fontFamily: 'task'),
                                                                ),
                                                              ],
                                                            ),
                                                            SizedBox(
                                                              height: 1.h,
                                                            ),
                                                            Text(
                                                              "Are You Sure to delete this product from Cart?",
                                                              style: TextStyle(
                                                                  fontWeight:
                                                                  FontWeight.normal,
                                                                  fontSize: 12.sp,
                                                                  fontFamily: 'task'),
                                                            ),
                                                            SizedBox(
                                                              height:
                                                              2.h,
                                                            ),
                                                            Row(
                                                              mainAxisAlignment:
                                                              MainAxisAlignment.spaceEvenly,
                                                              children: [
                                                                GestureDetector(
                                                                  onTap:
                                                                      () {
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Container(
                                                                      alignment: Alignment.center,
                                                                      height: 5.h,
                                                                      width: 35.w,
                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white70, border: Border.all(width: 0.5, color: Colors.grey)),
                                                                      child: Text(
                                                                        "Cancel",
                                                                        style: TextStyle(fontSize: 13.sp, color: Colors.black, fontFamily: "task", fontWeight: FontWeight.bold),
                                                                      )),
                                                                ),
                                                                GestureDetector(
                                                                  onTap:
                                                                      () {
                                                                        removecartwithoutlogin((viewwithoutuserModel?.cartDetails?[index].productID).toString());
                                                                    Navigator.of(context).pop();
                                                                  },
                                                                  child: Container(
                                                                      alignment: Alignment.center,
                                                                      height: 5.h,
                                                                      width: 35.w,
                                                                      decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff0061b0)),
                                                                      child: Text(
                                                                        "Remove",
                                                                        style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                                                                      )),
                                                                ),
                                                              ],
                                                            ),
                                                            // Add more options as needed
                                                          ],
                                                        ),
                                                      ),
                                                    ),
                                                    Positioned(
                                                      right: 1.w,
                                                      child: IconButton(
                                                          icon: Icon(
                                                            Icons
                                                                .highlight_remove,
                                                            size:
                                                            25.sp,
                                                            color: Colors
                                                                .grey,
                                                          ),
                                                          // Icon to open the menu
                                                          onPressed: () {
                                                            Navigator.of(
                                                                context)
                                                                .pop();
                                                          } // We set onPressed to null to disable the button
                                                      ),
                                                    ),
                                                  ],
                                                );
                                              },
                                            );
                                          }, // We set onPressed to null to disable the button
                                        ),
                                      ),
                                    ],
                                  );
                                },
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              child: Column(
                                children: [
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(8.0),
                                      color: Colors.white,
                                      boxShadow: [
                                        BoxShadow(
                                          color: Colors.grey.withOpacity(0.5),
                                          spreadRadius: 1,
                                          blurRadius: 5,
                                          offset: Offset(0, 3), // changes position of shadow
                                        ),
                                      ],
                                    ),
                                    child: ListTile(
                                      leading: Container(
                                          padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.7.h),
                                          decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Color(0xff0061b0),
                                          ),
                                          child: Icon(Icons.percent, color: Colors.white)),
                                      title: Text('Apply coupon',style: TextStyle(
                                          fontFamily: "task",
                                          fontWeight: FontWeight.bold,
                                          fontSize: 12.sp,
                                          color: Colors.black
                                      ),),
                                      trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                                      onTap: () {
                                        showModalBottomSheet(
                                          shape: RoundedRectangleBorder(
                                            borderRadius: BorderRadius.circular(15.0),
                                          ),
                                          context: context,
                                          backgroundColor: Colors.grey.shade100,
                                          builder: (context) {
                                            return Column(
                                              children: [
                                                SizedBox(height: 1.h,),
                                                Center(
                                                  child: Padding(
                                                    padding:  EdgeInsets.only(top: 1.h),
                                                    child: Text("All Coupons Offer",style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "task",
                                                    ),),
                                                  ),
                                                ),
                                                SizedBox(height: 1.h,),
                                                Expanded(
                                                  child:allcouponmodal?.data?.length==""||allcouponmodal?.data?.length==null?Container(
                                                    child: Center(child: Text("No Coupons Avaliable",style: TextStyle(
                                                      fontSize: 13.sp,
                                                      fontWeight: FontWeight.bold,
                                                      fontFamily: "task",
                                                    ),)),
                                                  ):Padding(
                                                    padding: EdgeInsets.all(8),
                                                    child: ListView.builder(
                                                      // padding: EdgeInsets.only(top: 1.h),
                                                      itemCount: allcouponmodal?.data?.length,  // Dynamic list length
                                                      itemBuilder: (context, index) {
                                                        return Container(
                                                          margin: EdgeInsets.only(left:2.w,top: 1.h),
                                                          alignment: Alignment.center,
                                                          height: 15.h,
                                                          width: 70.w,
                                                          decoration: BoxDecoration(
                                                            borderRadius: BorderRadius.circular(10),
                                                            color: Colors.blue.shade100,
                                                          ),
                                                          child: Row(
                                                            children: [
                                                              Image.network(
                                                                'https://static.vecteezy.com/system/resources/thumbnails/024/585/326/small/3d-happy-cartoon-doctor-cartoon-doctor-on-transparent-background-generative-ai-png.png',
                                                                fit: BoxFit.cover,
                                                                width: 80,
                                                                height: 80,
                                                              ),
                                                              //SizedBox(width: 1.w),
                                                              Expanded(
                                                                child: Column(
                                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                                  crossAxisAlignment: CrossAxisAlignment.start,
                                                                  children: [
                                                                    Padding(
                                                                      padding: EdgeInsets.only(left: 3.5.w),
                                                                      child: Text(
                                                                        "FLAT ${allcouponmodal?.data?[index].couponType == "1" ? "" : "₹"} ${allcouponmodal?.data?[index].couponValue ?? ""} ${allcouponmodal?.data?[index].couponType == "1" ? "%" : "Fixed"} OFF",
                                                                        style: TextStyle(
                                                                          fontSize: 10.5.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontFamily: "task",
                                                                          // color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 1.h),
                                                                    Padding(
                                                                      padding: EdgeInsets.only(left: 3.5.w),
                                                                      child: Text(
                                                                        "on your first order",
                                                                        style: TextStyle(
                                                                          fontSize: 11.sp,
                                                                          fontWeight: FontWeight.bold,
                                                                          fontFamily: 'task',
                                                                          // color: Colors.white,
                                                                        ),
                                                                      ),
                                                                    ),
                                                                    SizedBox(height: 1.h),
                                                                    Row(
                                                                      children: [
                                                                        GestureDetector(
                                                                          onTap: () {
                                                                            // Copy coupon code to clipboard
                                                                            String couponCode = allcouponmodal?.data?[index].couponCode ?? "";
                                                                            Clipboard.setData(ClipboardData(text: couponCode));

                                                                            // Set the copied code to the TextField controller
                                                                            setState(() {
                                                                              _searchController.text = couponCode;
                                                                            });

                                                                            // Show snackbar confirmation
                                                                            ScaffoldMessenger.of(context).showSnackBar(
                                                                              SnackBar(
                                                                                content: Text('Coupon code copied: $couponCode'),
                                                                                behavior: SnackBarBehavior.floating,
                                                                              ),
                                                                            );
                                                                            Navigator.of(context).pop();
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
                                                                         SizedBox(width: 1.w,),
                                                                        GestureDetector(
                                                                          onTap: () {
                                                                            // Copy coupon code to clipboard
                                                                            // String couponCode = allcouponmodal?.data?[index].couponCode ?? "";
                                                                            // Clipboard.setData(ClipboardData(text: couponCode));
                                                                            //
                                                                            // // Set the copied code to the TextField controller
                                                                            // setState(() {
                                                                            //   _searchController.text = couponCode;
                                                                            // });
                                                                            setState(() {
                                                                              applycoupon1(allcouponmodal?.data?[index].couponCode ?? "");
                                                                            });


                                                                            Navigator.of(context).pop();
                                                                          },
                                                                          child: Container(
                                                                            padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.6.h),
                                                                            decoration: BoxDecoration(
                                                                              color: AppColors.primary,
                                                                              borderRadius: BorderRadius.circular(10),
                                                                              boxShadow: [
                                                                                BoxShadow(
                                                                                  color: Colors.black12,
                                                                                  blurRadius: 5,
                                                                                  spreadRadius: 2,
                                                                                ),
                                                                              ],
                                                                            ),
                                                                            child: Text("Apply Coupon",
                                                                              //"Code: ${allcouponmodal?.data?[index].couponCode ?? ""}",
                                                                              style: TextStyle(
                                                                                color: Colors.white,
                                                                                fontWeight: FontWeight.bold,
                                                                                fontSize: 9.5.sp,
                                                                                fontFamily: 'task',
                                                                              ),
                                                                            ),
                                                                          ),
                                                                        ),
                                                                      ],
                                                                    ),

                                                                    // GestureDetector(
                                                                    //   onTap: () {
                                                                    //     // Copy coupon code to clipboard
                                                                    //     Clipboard.setData(ClipboardData(text: allcouponmodal?.data?[index].couponCode ?? ""));
                                                                    //     // Show snackbar confirmation
                                                                    //     ScaffoldMessenger.of(context).showSnackBar(
                                                                    //       SnackBar(
                                                                    //           content: Text('Coupon code copied: ${allcouponmodal?.data?[index].couponCode ?? ""}',),
                                                                    //         behavior: SnackBarBehavior.floating,
                                                                    //       ),
                                                                    //     );
                                                                    //   },
                                                                    //   child: Container(
                                                                    //     margin: EdgeInsets.symmetric(horizontal: 2.w),
                                                                    //     padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                                                    //     decoration: BoxDecoration(
                                                                    //       color: Colors.white,
                                                                    //       borderRadius: BorderRadius.circular(10),
                                                                    //       boxShadow: [
                                                                    //         BoxShadow(
                                                                    //           color: Colors.black12,
                                                                    //           blurRadius: 5,
                                                                    //           spreadRadius: 2,
                                                                    //         ),
                                                                    //       ],
                                                                    //     ),
                                                                    //     child: Text(
                                                                    //       "Code: ${allcouponmodal?.data?[index].couponCode ?? ""}",
                                                                    //       style: TextStyle(
                                                                    //         color: Colors.black,
                                                                    //         fontWeight: FontWeight.bold,
                                                                    //         fontSize: 9.5.sp,
                                                                    //         fontFamily: 'task',
                                                                    //       ),
                                                                    //     ),
                                                                    //   ),
                                                                    // ),
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
                                              ],
                                            );
                                          },
                                        );
                                      },
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
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
                            SizedBox(
                              height: 1.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                              // height: 22.h,
                              alignment: Alignment.center,
                              decoration: BoxDecoration(
                                borderRadius:
                                BorderRadius.circular(10),
                                color: Color(0xffffffff),
                              ),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.w,
                                        ),
                                        child: Text(
                                          'Sub Total Amount : ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 11.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 3.w,
                                        ),
                                        child: Text(
                                          cpupon? '₹ ' +
                                              (couponmodel
                                                  ?.totalAmount)
                                                  .toString(): '₹ ' +
                                              (viewwithoutuserModel
                                                  ?.finalTotal)
                                                  .toString(),
                                          style: TextStyle(
                                              fontFamily: 'task',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                    indent: 3.w,
                                    endIndent: 3.w,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.w,
                                        ),
                                        child: Text(
                                          'Handling Charge : ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 11.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 3.w,
                                        ),
                                        child: Text(
                                     '₹ ' +
                                        (viewwithoutuserModel?.handlingCharge).toString(),
                                          style: TextStyle(
                                              fontFamily: 'task',
                                              fontSize: 10.sp,
                                              fontWeight: FontWeight.w600,
                                              color: Colors.black87
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                    indent: 3.w,
                                    endIndent: 3.w,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.w,
                                        ),
                                        child: Text(
                                          'Discount Applied : ',
                                          style: TextStyle(
                                            fontFamily: "task",
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Row(
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(
                                              right: 3.w,
                                            ),
                                            child: Text(
                                              cpupon?  '₹ ' +
                                                  (couponmodel
                                                      ?.discountApplied)
                                                      .toString():'₹ ' +
                                                  ("0")
                                                      .toString(),

                                              style: TextStyle(
                                                  fontFamily: 'task',
                                                  fontSize: 12.sp,
                                                  fontWeight: FontWeight.w600,
                                                  color: Colors.black87
                                              ),
                                            ),
                                          ),
                                          IconButton(
                                              icon: Icon(
                                                Icons.delete,
                                                color: Colors.red,
                                                size: 15.sp,
                                              ),
                                              onPressed:(){
                                                setState(() {
                                                  removecouponap();
                                                });
                                              }
                                          ),
                                        ],
                                      ),
                                    ],
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Divider(
                                    height: 1,
                                    color: Colors.grey.shade200,
                                    indent: 3.w,
                                    endIndent: 3.w,
                                  ),
                                  SizedBox(
                                    height: 1.h,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                    crossAxisAlignment: CrossAxisAlignment.center,
                                    children: [
                                      Padding(
                                        padding: EdgeInsets.only(
                                          left: 3.w,
                                        ),
                                        child: Text(
                                          'Final Total Amount : ',
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            color: Colors.grey.shade800,
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: EdgeInsets.only(
                                          right: 3.w,
                                        ),
                                        child: Text(
                                          cpupon? '₹ ' +
                                              (couponmodel
                                                  ?.finalTotalWithHandlingCharge)
                                                  .toString(): '₹ ' +
                                              (viewwithoutuserModel
                                                  ?.finalTotalWithHandling)
                                                  .toString(),
                                          style: TextStyle(
                                            fontFamily: 'task',
                                            fontSize: 12.sp,
                                            fontWeight: FontWeight.bold,
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
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    _makePhoneCall('9051294444');

                                  },
                                  child:   Container(
                                    padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                    width: 40.w,
                                    alignment: Alignment.center,
                                    decoration: BoxDecoration(
                                        borderRadius:
                                        BorderRadius.circular(10),
                                        color: Color(0xff0061b0)),
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [
                                        Icon(Icons.call,
                                            color:Colors.white, size: 20),
                                        // Button icon
                                        SizedBox(width: 8),
                                        Text(
                                          "Call Us",
                                          style: TextStyle(
                                              color: Colors.white,
                                              fontWeight: FontWeight.bold,
                                              fontSize: 12.sp,
                                              fontFamily: 'task'),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),

                                GestureDetector(
                                  onTap: () {
                                    Navigator.of(context).push(
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                CheckoutDetail(
                                                  addid: alluseraddmodal
                                                      ?.allShippingAddress?[
                                                  0]
                                                      .id,
                                                  firstname: alluseraddmodal
                                                      ?.allShippingAddress?[
                                                  0]
                                                      .firstName,
                                                  lastname: alluseraddmodal
                                                      ?.allShippingAddress?[
                                                  0]
                                                      .lastName,
                                                  address: alluseraddmodal
                                                      ?.allShippingAddress?[
                                                  0]
                                                      .address,

                                                )));
                                    chekoutsenddetail1();
                                    print("Wow${ alluseraddmodal
                                        ?.allShippingAddress?[
                                    0]
                                        .firstName}");
                                  },
                                  child: Container(
                                      padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                      alignment: Alignment.center,
                                      width: 40.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                          BorderRadius.circular(10),
                                          color: Color(0xff0061b0)),
                                      child: Text(
                                        "Checkout",
                                        style: TextStyle(
                                            fontSize: 12.sp,
                                            color: Colors.white,
                                            fontWeight: FontWeight.bold,
                                            fontFamily: "task"),
                                      )),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  )
                  // Login
                : Column(
                          children: [
                            SizedBox(
                              height: 2.h,
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                      onPressed: () {
                                        _scaffoldKeycart1.currentState
                                            ?.openDrawer();
                                      },
                                      icon: Icon(
                                        Icons.menu_rounded,
                                        size: 25.sp,
                                      )),
                                  Text(
                                    "My Cart",
                                    style: TextStyle(
                                      fontSize: 16.sp,
                                      fontFamily: "task",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  Row(
                                    children: [
                                      GestureDetector(
                                        onTap: () {
                                          Navigator.of(context).push(
                                              MaterialPageRoute(
                                                  builder: (context) =>
                                                      ProfilePage()));
                                        },
                                        child: Container(
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
                                                progressIndicatorBuilder: (context,
                                                        url, progress) =>
                                                    CircularProgressIndicator(),
                                                errorWidget: (context, url,
                                                        error) =>
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
                            viewcartmodal?.cartDetails?.length == 0 ||
                                    viewcartmodal?.cartDetails?.length == null
                                ? Container(
                                    height: 70.h,
                                    alignment: Alignment.center,
                                    child: Text(
                                      "No Data Available",
                                      style: TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontFamily: 'task',
                                        fontSize: 13.sp,
                                      ),
                                    ))
                                : Container(
                                    child: Column(
                                      children: [
                                        Container(
                                          height: 32.5.h,
                                          child: ListView.builder(
                                            padding: EdgeInsets.zero,
                                            itemCount: viewcartmodal
                                                ?.cartDetails?.length,
                                            // The number of items in the grid
                                            itemBuilder: (BuildContext context,
                                                int index) {
                                              // Build each item in the grid
                                              return Stack(
                                                children: [
                                                  GestureDetector(
                                                    onTap: (){
                                                      Navigator.of(context)
                                                          .push(MaterialPageRoute(
                                                          builder: (context) =>
                                                              productdetailnovartion(
                                                                productid: viewcartmodal
                                                                    ?.cartDetails?[
                                                                index]
                                                                    .productID ??
                                                                    '',
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
                                                                MainAxisAlignment.end,
                                                            crossAxisAlignment:
                                                                CrossAxisAlignment
                                                                    .center,
                                                            children: [
                                                              Row(
                                                                mainAxisAlignment:
                                                                    MainAxisAlignment
                                                                        .start,
                                                                crossAxisAlignment:
                                                                    CrossAxisAlignment
                                                                        .center,
                                                                children: [
                                                                  SizedBox(
                                                                    width: 2.w,
                                                                  ),
                                                                  Container(
                                                                    decoration: BoxDecoration(
                                                                        borderRadius:
                                                                            BorderRadius.all(
                                                                                Radius.circular(
                                                                                    20)),
                                                                        // color: Colors
                                                                        //     .grey
                                                                        //     .shade200
                                                                    ),
                                                                    child: Padding(
                                                                      padding:
                                                                          EdgeInsets
                                                                              .all(
                                                                                  3.0),
                                                                      child:
                                                                          CachedNetworkImage(
                                                                        imageUrl: (viewcartmodal
                                                                                ?.cartDetails?[
                                                                                    index]
                                                                                .allImages)
                                                                            .toString(),
                                                                        fit: BoxFit
                                                                            .cover,
                                                                        height: 34.w,
                                                                        width: 32.w,
                                                                        imageBuilder:
                                                                            (context,
                                                                                    imageProvider) =>
                                                                                Container(
                                                                          decoration:
                                                                              BoxDecoration(
                                                                            borderRadius:
                                                                                BorderRadius.circular(
                                                                                    25),
                                                                            image:
                                                                                DecorationImage(
                                                                              image:
                                                                                  imageProvider,
                                                                              // fit: BoxFit.cover,
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
                                                                  ),
                                                                  SizedBox(
                                                                    width: 3.w,
                                                                  ),
                                                                  Padding(
                                                                    padding: EdgeInsets
                                                                        .symmetric(
                                                                            vertical:
                                                                                0.5.h,
                                                                            horizontal:
                                                                                0.5.w),
                                                                    child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      children: [
                                                                        SizedBox(
                                                                          height:
                                                                              1.5.h,
                                                                        ),
                                                                        Column(
                                                                          crossAxisAlignment:
                                                                              CrossAxisAlignment
                                                                                  .start,
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment
                                                                                  .center,
                                                                          children: [
                                                                            Padding(
                                                                              padding:
                                                                                  EdgeInsets.only(left: 1.w),
                                                                              child:
                                                                                  SizedBox(
                                                                                width:
                                                                                    45.w,
                                                                                child:
                                                                                    Text(
                                                                                  (viewcartmodal?.cartDetails?[index].productName) == null
                                                                                      ? "N/A"
                                                                                      : (viewcartmodal?.cartDetails?[index].productName).toString(),
                                                                                  maxLines:
                                                                                      2,
                                                                                  overflow:
                                                                                      TextOverflow.ellipsis,
                                                                                  style: TextStyle(
                                                                                      color: Colors.black,
                                                                                      fontSize: 10.sp,
                                                                                      fontWeight: FontWeight.w600,
                                                                                      fontFamily: "task"),
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(
                                                                              height:
                                                                                  0.5.h,
                                                                            ),
                                                                            Row(
                                                                              mainAxisAlignment:
                                                                                  MainAxisAlignment.spaceBetween,
                                                                              children: [
                                                                                Container(
                                                                                  alignment:
                                                                                      Alignment.center,
                                                                                  width:
                                                                                      26.w,
                                                                                  height:
                                                                                      6.5.h,
                                                                                  decoration:
                                                                                      BoxDecoration(
                                                                                    borderRadius: BorderRadius.circular(20),
                                                                                  ),
                                                                                  child:
                                                                                      Row(
                                                                                    crossAxisAlignment: CrossAxisAlignment.center,
                                                                                    mainAxisAlignment: MainAxisAlignment.center,
                                                                                    children: [
                                                                                      InkWell(
                                                                                        onTap: () {
                                                                                          int.parse((viewcartmodal?.cartDetails?[index].cartProductQuantity).toString() ?? '') <= 1 ? buildErrorDialog(context, 'Alert', 'Minimum allowed quantity is 1') : decrement((viewcartmodal?.cartDetails?[index].cartTblId).toString());
                                                                                          // setState(() {
                                                                                          //   age--;
                                                                                          // });
                                                                                        },
                                                                                        child: Container(
                                                                                            height: 7.5.w,
                                                                                            width: 7.5.w,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(15),
                                                                                              color: Color(0xff0061b0),
                                                                                            ),
                                                                                            child: Icon(
                                                                                              Icons.remove,
                                                                                              size: 20.sp,
                                                                                              color: Colors.white,
                                                                                            )),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 2.5.w,
                                                                                      ),
                                                                                      Container(
                                                                                        child: Row(
                                                                                          children: [
                                                                                            Container(
                                                                                              child: Text(
                                                                                                (viewcartmodal?.cartDetails?[index].cartProductQuantity).toString() == null ? "1" : (viewcartmodal?.cartDetails?[index].cartProductQuantity).toString(),
                                                                                                style: TextStyle(
                                                                                                  fontWeight: FontWeight.bold,
                                                                                                  fontFamily: "task",
                                                                                                  fontSize: 14.sp,
                                                                                                ),
                                                                                              ),
                                                                                            )
                                                                                          ],
                                                                                        ),
                                                                                      ),
                                                                                      SizedBox(
                                                                                        width: 2.5.w,
                                                                                      ),
                                                                                      InkWell(
                                                                                        onTap: () {
                                                                                          int.parse((viewcartmodal?.cartDetails?[index].cartProductQuantity).toString() ?? '') >= 5
                                                                                              ? buildErrorDialog(context, 'Alert', 'Maximum allowed quantity is 5')
                                                                                              : increment(
                                                                                                  (viewcartmodal?.cartDetails?[index].cartTblId).toString(),
                                                                                                );
                                                                                        },
                                                                                        child: Container(
                                                                                            height: 7.5.w,
                                                                                            width: 7.5.w,
                                                                                            decoration: BoxDecoration(
                                                                                              borderRadius: BorderRadius.circular(25),
                                                                                              color: Color(0xff0061b0),
                                                                                            ),
                                                                                            child: Icon(
                                                                                              Icons.add,
                                                                                              size: 14.sp,
                                                                                              color: Colors.white,
                                                                                            )),
                                                                                      ),
                                                                                    ],
                                                                                  ),
                                                                                ),
                                                                                SizedBox(
                                                                                  width:
                                                                                      1.w,
                                                                                ),
                                                                                Text(
                                                                                  (viewcartmodal?.cartDetails?[index].productPriceMain) == null
                                                                                      ? "N/A"
                                                                                      : '₹' + (viewcartmodal?.cartDetails?[index].productPriceMain).toString(),
                                                                                  style:
                                                                                      TextStyle(
                                                                                    fontSize: 14.sp,
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
                                                                          height: 2.h,
                                                                        ),
                                                                      ],
                                                                    ),
                                                                  )
                                                                ],
                                                              ),
                                                            ],
                                                          ),
                                                        )),
                                                  ),
                                                  Positioned(
                                                    left: 82.w,
                                                    top: 0.h,
                                                    child: IconButton(
                                                      icon: Icon(
                                                        Icons.highlight_remove,
                                                        size: 20.sp,
                                                        color: Colors.grey,
                                                      ), // Icon to open the menu
                                                      onPressed: () {
                                                        showBottomSheet(
                                                          context: context,
                                                          builder: (context) {
                                                            return Stack(
                                                              children: [
                                                                Container(
                                                                  decoration: BoxDecoration(
                                                                      borderRadius:
                                                                          BorderRadius.circular(
                                                                              10),
                                                                      color: Colors
                                                                          .white),
                                                                  height: 23.h,
                                                                  width: double
                                                                      .infinity,
                                                                  // Customize the bottom sheet content here
                                                                  child: Padding(
                                                                    padding: EdgeInsets.symmetric(
                                                                        horizontal:
                                                                            5.w,
                                                                        vertical:
                                                                            2.h),
                                                                    child: Column(
                                                                      mainAxisAlignment:
                                                                          MainAxisAlignment
                                                                              .start,
                                                                      crossAxisAlignment:
                                                                          CrossAxisAlignment
                                                                              .start,
                                                                      mainAxisSize:
                                                                          MainAxisSize
                                                                              .min,
                                                                      children: [
                                                                        Row(
                                                                          children: [
                                                                            Text(
                                                                              "Remove From Cart?",
                                                                              style: TextStyle(
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontSize: 14.sp,
                                                                                  fontFamily: 'task'),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        SizedBox(
                                                                          height: 1.h,
                                                                        ),
                                                                        Text(
                                                                          "Are You Sure to delete this product from Cart?",
                                                                          style: TextStyle(
                                                                              fontWeight:
                                                                                  FontWeight.normal,
                                                                              fontSize: 12.sp,
                                                                              fontFamily: 'task'),
                                                                        ),
                                                                        SizedBox(
                                                                          height:
                                                                              2.h,
                                                                        ),
                                                                        Row(
                                                                          mainAxisAlignment:
                                                                              MainAxisAlignment.spaceEvenly,
                                                                          children: [
                                                                            GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Container(
                                                                                  alignment: Alignment.center,
                                                                                  height: 5.h,
                                                                                  width: 35.w,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Colors.white70, border: Border.all(width: 0.5, color: Colors.grey)),
                                                                                  child: Text(
                                                                                    "Cancel",
                                                                                    style: TextStyle(fontSize: 13.sp, color: Colors.black, fontFamily: "task", fontWeight: FontWeight.bold),
                                                                                  )),
                                                                            ),
                                                                            GestureDetector(
                                                                              onTap:
                                                                                  () {
                                                                                removecart((viewcartmodal?.cartDetails?[index].productID).toString());
                                                                                Navigator.of(context).pop();
                                                                              },
                                                                              child: Container(
                                                                                  alignment: Alignment.center,
                                                                                  height: 5.h,
                                                                                  width: 35.w,
                                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(10), color: Color(0xff0061b0)),
                                                                                  child: Text(
                                                                                    "Remove",
                                                                                    style: TextStyle(fontSize: 13.sp, color: Colors.white, fontFamily: "task"),
                                                                                  )),
                                                                            ),
                                                                          ],
                                                                        ),
                                                                        // Add more options as needed
                                                                      ],
                                                                    ),
                                                                  ),
                                                                ),
                                                                Positioned(
                                                                  right: 1.w,
                                                                  child: IconButton(
                                                                      icon: Icon(
                                                                        Icons
                                                                            .highlight_remove,
                                                                        size:
                                                                            25.sp,
                                                                        color: Colors
                                                                            .grey,
                                                                      ),
                                                                      // Icon to open the menu
                                                                      onPressed: () {
                                                                        Navigator.of(
                                                                                context)
                                                                            .pop();
                                                                      } // We set onPressed to null to disable the button
                                                                      ),
                                                                ),
                                                              ],
                                                            );
                                                          },
                                                        );
                                                      }, // We set onPressed to null to disable the button
                                                    ),
                                                  ),
                                                ],
                                              );
                                            },
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          child: Column(
                                            children: [
                                          Container(
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(8.0),
                                              color: Colors.white,
                                              boxShadow: [
                                                BoxShadow(
                                                  color: Colors.grey.withOpacity(0.5),
                                                  spreadRadius: 1,
                                                  blurRadius: 5,
                                                  offset: Offset(0, 3), // changes position of shadow
                                                ),
                                              ],
                                            ),
                                            child: ListTile(
                                              leading: Container(
                                                padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 0.7.h),
                                                decoration: BoxDecoration(
                                                  borderRadius: BorderRadius.circular(10),
                                                  color: Color(0xff0061b0),
                                                ),
                                                  child: Icon(Icons.percent, color: Colors.white)),
                                              title: Text('Apply coupon',style: TextStyle(
                                                fontFamily: "task",
                                                fontWeight: FontWeight.bold,
                                                fontSize: 12.sp,
                                                color: Colors.black
                                              ),),
                                              trailing: Icon(Icons.arrow_forward_ios, color: Colors.black),
                                              onTap: () {
                                                showModalBottomSheet(
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius: BorderRadius.circular(15.0),
                                                  ),
                                                  context: context,
                                                  backgroundColor: Colors.grey.shade100,
                                                  builder: (context) {
                                                    return Column(
                                                      children: [
                                                        SizedBox(height: 1.h,),
                                                        Center(
                                                          child: Padding(
                                                            padding:  EdgeInsets.only(top: 1.h),
                                                            child: Text("All Coupons Offer",style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight: FontWeight.bold,
                                                              fontFamily: "task",
                                                            ),),
                                                          ),
                                                        ),
                                                        SizedBox(height: 1.h,),
                                                        Expanded(
                                                          child:allcouponmodal?.data?.length==""||allcouponmodal?.data?.length==null?Container(
                                                            child: Center(child: Text("No Coupons Avaliable",style: TextStyle(
                                                              fontSize: 13.sp,
                                                              fontWeight: FontWeight.bold,
                                                              fontFamily: "task",
                                                            ),)),
                                                          ):Padding(
                                                            padding: EdgeInsets.all(8),
                                                            child: ListView.builder(
                                                              // padding: EdgeInsets.only(top: 1.h),
                                                              itemCount: allcouponmodal?.data?.length,  // Dynamic list length
                                                              itemBuilder: (context, index) {
                                                                return Container(
                                                                  margin: EdgeInsets.only(left:2.w,top: 1.h),
                                                                  alignment: Alignment.center,
                                                                  height: 15.h,
                                                                  width: 68.w,
                                                                  decoration: BoxDecoration(
                                                                    borderRadius: BorderRadius.circular(10),
                                                                    color: Colors.blue.shade100,
                                                                  ),
                                                                  child: Row(
                                                                    children: [
                                                                      Image.network(
                                                                        'https://static.vecteezy.com/system/resources/thumbnails/024/585/326/small/3d-happy-cartoon-doctor-cartoon-doctor-on-transparent-background-generative-ai-png.png',
                                                                        fit: BoxFit.cover,
                                                                        width: 80,
                                                                        height: 80,
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
                                                                                "FLAT ${allcouponmodal?.data?[index].couponType == "1" ? "" : "₹"} ${allcouponmodal?.data?[index].couponValue ?? ""} ${allcouponmodal?.data?[index].couponType == "1" ? "%" : "Fixed"} OFF",
                                                                                style: TextStyle(
                                                                                  fontSize: 10.5.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: "task",
                                                                                  // color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 1.h),
                                                                            Padding(
                                                                              padding: EdgeInsets.only(left: 3.5.w),
                                                                              child: Text(
                                                                                "on your first order",
                                                                                style: TextStyle(
                                                                                  fontSize: 11.sp,
                                                                                  fontWeight: FontWeight.bold,
                                                                                  fontFamily: 'task',
                                                                                  // color: Colors.white,
                                                                                ),
                                                                              ),
                                                                            ),
                                                                            SizedBox(height: 1.h),
                                                                            Row(
                                                                              children: [
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    // Copy coupon code to clipboard
                                                                                    String couponCode = allcouponmodal?.data?[index].couponCode ?? "";
                                                                                    Clipboard.setData(ClipboardData(text: couponCode));

                                                                                    // Set the copied code to the TextField controller
                                                                                    setState(() {
                                                                                      _searchController.text = couponCode;
                                                                                    });

                                                                                    // Show snackbar confirmation
                                                                                    ScaffoldMessenger.of(context).showSnackBar(
                                                                                      SnackBar(
                                                                                        content: Text('Coupon code copied: $couponCode'),
                                                                                        behavior: SnackBarBehavior.floating,
                                                                                      ),
                                                                                    );
                                                                                    Navigator.of(context).pop();
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
                                                                                SizedBox(width: 5.w,),
                                                                                GestureDetector(
                                                                                  onTap: () {
                                                                                    // Copy coupon code to clipboard
                                                                                    // String couponCode = allcouponmodal?.data?[index].couponCode ?? "";
                                                                                    // Clipboard.setData(ClipboardData(text: couponCode));
                                                                                    //
                                                                                    // // Set the copied code to the TextField controller
                                                                                    // setState(() {
                                                                                    //   _searchController.text = couponCode;
                                                                                    // });
                                                                                    setState(() {
                                                                                      applycoupon(allcouponmodal?.data?[index].couponCode ?? "");
                                                                                    });


                                                                                    Navigator.of(context).pop();
                                                                                  },
                                                                                  child: Container(
                                                                                    padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.6.h),
                                                                                    decoration: BoxDecoration(
                                                                                      color: AppColors.primary,
                                                                                      borderRadius: BorderRadius.circular(10),
                                                                                      boxShadow: [
                                                                                        BoxShadow(
                                                                                          color: Colors.black12,
                                                                                          blurRadius: 5,
                                                                                          spreadRadius: 2,
                                                                                        ),
                                                                                      ],
                                                                                    ),
                                                                                    child: Text("Apply Coupon",
                                                                                      //"Code: ${allcouponmodal?.data?[index].couponCode ?? ""}",
                                                                                      style: TextStyle(
                                                                                        color: Colors.white,
                                                                                        fontWeight: FontWeight.bold,
                                                                                        fontSize: 9.5.sp,
                                                                                        fontFamily: 'task',
                                                                                      ),
                                                                                    ),
                                                                                  ),
                                                                                ),
                                                                              ],
                                                                            ),

                                                                            // GestureDetector(
                                                                            //   onTap: () {
                                                                            //     // Copy coupon code to clipboard
                                                                            //     Clipboard.setData(ClipboardData(text: allcouponmodal?.data?[index].couponCode ?? ""));
                                                                            //     // Show snackbar confirmation
                                                                            //     ScaffoldMessenger.of(context).showSnackBar(
                                                                            //       SnackBar(
                                                                            //           content: Text('Coupon code copied: ${allcouponmodal?.data?[index].couponCode ?? ""}',),
                                                                            //         behavior: SnackBarBehavior.floating,
                                                                            //       ),
                                                                            //     );
                                                                            //   },
                                                                            //   child: Container(
                                                                            //     margin: EdgeInsets.symmetric(horizontal: 2.w),
                                                                            //     padding: EdgeInsets.symmetric(horizontal: 4.w, vertical: 1.h),
                                                                            //     decoration: BoxDecoration(
                                                                            //       color: Colors.white,
                                                                            //       borderRadius: BorderRadius.circular(10),
                                                                            //       boxShadow: [
                                                                            //         BoxShadow(
                                                                            //           color: Colors.black12,
                                                                            //           blurRadius: 5,
                                                                            //           spreadRadius: 2,
                                                                            //         ),
                                                                            //       ],
                                                                            //     ),
                                                                            //     child: Text(
                                                                            //       "Code: ${allcouponmodal?.data?[index].couponCode ?? ""}",
                                                                            //       style: TextStyle(
                                                                            //         color: Colors.black,
                                                                            //         fontWeight: FontWeight.bold,
                                                                            //         fontSize: 9.5.sp,
                                                                            //         fontFamily: 'task',
                                                                            //       ),
                                                                            //     ),
                                                                            //   ),
                                                                            // ),
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
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                            ),
                                          ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(
                                          height: 1.h,
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
                                        SizedBox(
                                          height: 1.h,
                                        ),
                                        Container(
                                          width: MediaQuery.of(context).size.width,
                                          padding: EdgeInsets.symmetric(horizontal: 3.w,vertical: 1.h),
                                          // height: 22.h,
                                          alignment: Alignment.center,
                                          decoration: BoxDecoration(
                                            borderRadius:
                                                BorderRadius.circular(10),
                                            color: Color(0xffffffff),
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 3.w,
                                                    ),
                                                    child: Text(
                                                      'Sub Total Amount : ',
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 11.sp,
                                                        color: Colors.grey.shade800,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 3.w,
                                                    ),
                                                    child: Text(
                                                      cpupon? '₹ ' +
                                                          (couponmodel
                                                              ?.totalAmount)
                                                              .toString(): '₹ ' +
                                                          (viewcartmodal
                                                              ?.finalTotal)
                                                              .toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 10.sp,
                                                        fontWeight: FontWeight.w600,
                                                        color: Colors.black87
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.shade200,
                                                 indent: 3.w,
                                                endIndent: 3.w,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 3.w,
                                                    ),
                                                    child: Text(
                                                      'Handling Charge : ',
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 11.sp,
                                                        color: Colors.grey.shade800,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 3.w,
                                                    ),
                                                    child: Text(
                                                      cpupon? '₹ ' +
                                                          (couponmodel
                                                              ?.handlingCharge)
                                                              .toString(): '₹ ' +
                                                          (viewcartmodal
                                                              ?.headingCharge)
                                                              .toString(),

                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 10.sp,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black87
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.shade200,
                                                indent: 3.w,
                                                endIndent: 3.w,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 3.w,
                                                    ),
                                                    child: Text(
                                                      'Referred Code : ',
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 11.sp,
                                                        color: Colors.grey.shade800,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 3.w,
                                                    ),
                                                    child: Text(
                                                      cpupon? '₹ ' +
                                                          (couponmodel
                                                              ?.agentDiscountApplied)
                                                              .toString(): '₹ ' +
                                                          (viewcartmodal
                                                              ?.referralDiscountAmount)
                                                              .toString(),

                                                      style: TextStyle(
                                                          fontFamily: "task",
                                                          fontSize: 10.sp,
                                                          fontWeight: FontWeight.w600,
                                                          color: Colors.black87
                                                      ),
                                                    ),
                                                  ),
                                                ],
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.shade200,
                                                indent: 3.w,
                                                endIndent: 3.w,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 3.w,
                                                    ),
                                                    child: Text(
                                                      'Discount Applied : ',
                                                      style: TextStyle(
                                                        fontFamily: "task",
                                                        fontSize: 12.sp,
                                                        color: Colors.grey.shade800,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                             Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    icon: Icon(
                                      Icons.delete,
                                      color: Colors.red,
                                      size: 15.sp,
                                    ),
                                    onPressed:(){
                                      setState(() {
                                        removecouponap();
                                      });
                                    }
                                  ),
                                  Padding(
                                    padding: EdgeInsets.only(right: 8.0),
                                    child: Text(
                                      cpupon?  '₹ ' +
                                          (couponmodel
                                              ?.discountApplied)
                                              .toString():'₹ ' +
                                          ("0")
                                              .toString(),
                                      style: TextStyle(
                                        fontFamily: 'task',
                                        fontSize: 16.0,
                                        fontWeight: FontWeight.w600,
                                        color: Colors.black87,
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
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Divider(
                                                height: 1,
                                                color: Colors.grey.shade200,
                                                indent: 3.w,
                                                endIndent: 3.w,
                                              ),
                                              SizedBox(
                                                height: 1.h,
                                              ),
                                              Row(
                                                mainAxisAlignment:
                                                MainAxisAlignment.spaceBetween,
                                                crossAxisAlignment: CrossAxisAlignment.center,
                                                children: [
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      left: 3.w,
                                                    ),
                                                    child: Text(
                                                      'Final Total Amount : ',
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 12.sp,
                                                        color: Colors.grey.shade800,
                                                        fontWeight: FontWeight.bold,
                                                      ),
                                                    ),
                                                  ),
                                                  Padding(
                                                    padding: EdgeInsets.only(
                                                      right: 3.w,
                                                    ),
                                                    child: Text(
                                                        cpupon? '₹ ' +
                                                            (couponmodel
                                                                ?.finalTotalWithHandlingCharge)
                                                                .toString(): '₹ ' +
                                                              (viewcartmodal
                                                                      ?.finalTotalWithCharge)
                                                                  .toString(),
                                                      style: TextStyle(
                                                        fontFamily: 'task',
                                                        fontSize: 12.sp,
                                                        fontWeight: FontWeight.bold,
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
                                        Row(
                                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                                          children: [
                                            GestureDetector(
                                              onTap: () {

                                                _makePhoneCall('9051294444');

                                              },
                                              child:   Container(
                                              padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                                width: 40.w,
                                                alignment: Alignment.center,
                                                decoration: BoxDecoration(
                                                    borderRadius:
                                                    BorderRadius.circular(10),
                                                    color: Color(0xff0061b0)),
                                                child: Row(
                                                  mainAxisAlignment: MainAxisAlignment.center,
                                                  children: [
                                                    Icon(Icons.call,
                                                        color:Colors.white, size: 20),
                                                    // Button icon
                                                    SizedBox(width: 8),
                                                    Text(
                                                      "Call Us",
                                                      style: TextStyle(
                                                          color: Colors.white,
                                                          fontWeight: FontWeight.bold,
                                                          fontSize: 12.sp,
                                                          fontFamily: 'task'),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ),

                                            GestureDetector(
                                              onTap: () {
                                                Navigator.of(context).push(
                                                    MaterialPageRoute(
                                                        builder: (context) =>
                                                            CheckoutDetail(
                                                              addid: alluseraddmodal
                                                                  ?.allShippingAddress?[
                                                              0]
                                                                  .id,
                                                              firstname: alluseraddmodal
                                                                  ?.allShippingAddress?[
                                                              0]
                                                                  .firstName,
                                                              lastname: alluseraddmodal
                                                                  ?.allShippingAddress?[
                                                              0]
                                                                  .lastName,
                                                              address: alluseraddmodal
                                                                  ?.allShippingAddress?[
                                                              0]
                                                                  .address,

                                                            )));
                                                   chekoutsenddetail();
                                              },
                                              child: Container(
                                                  padding: EdgeInsets.symmetric(horizontal: 2.w,vertical: 1.h),
                                                  alignment: Alignment.center,

                                                  width: 40.w,
                                                  decoration: BoxDecoration(
                                                      borderRadius:
                                                      BorderRadius.circular(10),
                                                      color: Color(0xff0061b0)),
                                                  child: Text(
                                                    "Checkout",
                                                    style: TextStyle(
                                                        fontSize: 12.sp,
                                                        color: Colors.white,
                                                        fontWeight: FontWeight.bold,
                                                        fontFamily: "task"),
                                                  )),
                                            ),
                                          ],
                                        ),
                                      ],
                                    ),
                                  ),
                          ],
                        ),
                ),
            ),
      ),
    );
  }
  // Widget searchBox() {
  //   return Container(
  //     width: 61.w,
  //     padding: EdgeInsets.symmetric(horizontal: 3.w),
  //     decoration: BoxDecoration(
  //       color: Colors.grey.shade50,
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     child: TextField(
  //       controller: _searchController,
  //       onTap: () {
  //         // Tap event handled here (optional)
  //       },
  //       onChanged: (value) {
  //         // When text changes, handle it here (optional)
  //       },
  //       style: TextStyle(color: Colors.black, fontFamily: 'task'),
  //       decoration: InputDecoration(
  //         contentPadding: EdgeInsets.all(0),
  //         prefixIconConstraints: BoxConstraints(
  //           maxHeight: 20,
  //           minWidth: 25,
  //         ),
  //         border: InputBorder.none,
  //         hintText: 'Enter Coupon Code',
  //         hintStyle: TextStyle(
  //             color: Colors.black, fontFamily: 'task', fontSize: 11.sp),
  //       ),
  //     ),
  //   );
  // }



  ViewCartApi() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewcartapi(data).then((response) async {
          viewcartmodal = ViewCartModal.fromJson(json.decode(response.body));
          print(viewcartmodal?.status);
          if (response.statusCode == 200 &&
              viewcartmodal?.status == "success") {
            // applycoupon();
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


  ViewCartwithoutloginAp() async {
    final Map<String, String> data = {};
    data['device_id'] = deviceName.toString();
    print("Cart ma data nathi aaavta ${data}");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().viewcartwithoutloginapi(data).then((response) async {
          viewwithoutuserModel = View_withoutuser_Model.fromJson(json.decode(response.body));
          print(viewwithoutuserModel?.status);
          if (response.statusCode == 200 &&
              viewwithoutuserModel?.status == "success") {
            // applycoupon();
            print('EE Thay Gyu Hooooo ! ^_^');
            print(viewcartmodal?.finalTotalWithCharge);
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

  removecart(String value) async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['product_id'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().removecartapi(data).then((response) async {
          removecartmodal =
              RemoveCartModal.fromJson(json.decode(response.body));
          print(removecartmodal?.status);
          if (response.statusCode == 200 &&
              removecartmodal?.status == "success") {
            ViewCartApi();

            print('mer');
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


  removecartwithoutlogin(String value) async {
    final Map<String, String> data = {};
    data['device_id'] = deviceName.toString();
    data['product_id'] = value.toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().removecarwithoutlogintapi(data).then((response) async {
          removecartwithoutloginModel =
              Remove_cart_withoutlogin_Model.fromJson(json.decode(response.body));
          print(removecartwithoutloginModel?.status);
          if (response.statusCode == 200 &&
              removecartwithoutloginModel?.status == "success") {
            ViewCartwithoutloginAp();
            print('mer');
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


  increment(String value) async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['cart_tbl_id'] = value.toString();
    print("cart incre $data");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().incrementapi(data).then((response) async {
          incrementmodal = IncrementModal.fromJson(json.decode(response.body));
          print(incrementmodal?.status);
          if (response.statusCode == 200 &&
              incrementmodal?.status == "success") {
            ViewCartApi();
            print('ADD');
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


  incrementwithoutlogin(String value) async {
    final Map<String, String> data = {};
    data['cart_tbl_id'] = value.toString();
    print("cart incre $data");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().incrementwithoutloginapi(data).then((response) async {
          Incrementwithoutloginmodel = increment_without_login_model1.fromJson(json.decode(response.body));
          print(Incrementwithoutloginmodel?.status);
          if (response.statusCode == 200 &&
              Incrementwithoutloginmodel?.status == "success") {
            ViewCartApi();
            ViewCartwithoutloginAp();

            print('ADD');
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


  decrementwithoutlogin(String value) async {
    final Map<String, String> data = {};
    data['cart_tbl_id'] = value.toString();
    print("cart incre $data");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().decrementwithoutloginapi(data).then((response) async {
          Decrementwithoutlogin = decrement_without_login1.fromJson(json.decode(response.body));
          print(Decrementwithoutlogin?.status);
          if (response.statusCode == 200 &&
              Decrementwithoutlogin?.status == "success") {
            ViewCartApi();
            ViewCartwithoutloginAp();

            print('ADD');
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


  decrement(String value) async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['cart_tbl_id'] = value.toString();
    print("cart decre ${data}");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().disincrementapi(data).then((response) async {
          disincrementmodal =
              DisIncrementModal.fromJson(json.decode(response.body));
          print(disincrementmodal?.status);
          if (response.statusCode == 200 &&
              disincrementmodal?.status == "success") {
            ViewCartApi();

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

  alluseraddapi() async {
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().userallshippingapi(data).then((response) async {
          alluseraddmodal =
              AllUserAddModal.fromJson(json.decode(response.body));
          print(alluseraddmodal?.status);
          if (response.statusCode == 200 &&
              alluseraddmodal?.status == "success") {
            print(
                '====- Add : ${alluseraddmodal?.allShippingAddress?[0].address}');
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


  applycoupon(value) async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['userId'] = (usermodal?.userId).toString();
    data['Coupon'] = value.toString();
    print("cart incre $data");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().applycouponapi(data).then((response) async {
          couponmodel = CouponModel.fromJson(json.decode(response.body));
          print(couponmodel?.status);
          if (response.statusCode == 200 &&
              couponmodel?.status == "success") {
            EasyLoading.showSuccess("Coupon Applied");
            setState(() {
              cpupon =true;
              cpn =value.toString();
            });
            ViewCartApi();
            print('ADD');
            setState(() {
              isLoading = false;
            });
          } else {
            EasyLoading.showError(couponmodel?.message ?? '');
            setState(() {
              cpupon =false;
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


  applycoupon1(value) async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['userId'] = deviceName.toString();
    data['Coupon'] = value.toString();
    print("cart incre $data");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().applycouponapi(data).then((response) async {
          couponmodel = CouponModel.fromJson(json.decode(response.body));
          print(couponmodel?.status);
          if (response.statusCode == 200 &&
              couponmodel?.status == "success") {
            EasyLoading.showSuccess("Coupon Applied");
            setState(() {
              cpupon =true;
              cpn =value.toString();
              print("787878${cpn}");
            });
            ViewCartApi();
            ViewCartwithoutloginAp();
            print('ADD');
            setState(() {
              isLoading = false;
            });
          } else {
            EasyLoading.showError(couponmodel?.message ?? "");
            setState(() {
              cpupon =false;
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

  chekoutsenddetail() async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    data['final_total'] = cpupon?(viewcartmodal ?.finalTotal).toString():(viewcartmodal ?.finalTotal).toString();
    data['total_tax'] = cpupon?(couponmodel ?.handlingCharge).toString():(viewcartmodal ?.headingCharge).toString();
    data['final_total_with_tax'] = cpupon?(couponmodel ?.handlingCharge).toString():(viewcartmodal ?.finalTotalWithCharge).toString();
    data['coupon'] = cpn==null||cpn==""?"":cpn.toString();
    data['discount'] = cpupon?(couponmodel?.discountApplied).toString():"";
    data['referral'] =cpupon?(couponmodel ?.agentDiscountApplied).toString():(viewcartmodal ?.referralDiscountAmount).toString();
    print("sdfdsfsdsfdsf${data}");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().chekoutdetailsendapi(data).then((response) async {
          EasyLoading.showSuccess("success");
          checkOutsendModel = CheckOutSendModel.fromJson(json.decode(response.body));
          print(checkOutsendModel?.status);
          if (response.statusCode == 200 &&
              checkOutsendModel?.status == "success") {
            // applycoupon();
            print('EE Thay Gyu Hooooo ! ^_^');
            _searchController.clear();
            setState(() {
              isLoading = false;
              _searchController.clear();
              cpn=null;
            });
          } else {
            setState(() {
              EasyLoading.showError("No Data Found");
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


  chekoutsenddetail1() async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['user_id'] = deviceName.toString();
    data['final_total'] = cpupon?(viewwithoutuserModel ?.finalTotal).toString():(viewwithoutuserModel ?.finalTotal).toString();
    data['total_tax'] = cpupon?(couponmodel ?.handlingCharge).toString():(viewwithoutuserModel ?.handlingCharge).toString();
    data['final_total_with_tax'] = cpupon?(couponmodel ?.finalTotalWithHandlingCharge).toString():(viewwithoutuserModel ?.finalTotalWithTax).toString();
    data['coupon'] = cpn==null||cpn==""?"":cpn.toString();
    data['discount'] = cpupon?(couponmodel?.discountApplied).toString():"";
    data['referral'] =cpupon?(couponmodel ?.agentDiscountApplied).toString():(viewcartmodal ?.referralDiscountAmount).toString();

    checkInternet().then((internet) async {
      if (internet) {
        authprovider().chekoutdetailsendapi(data).then((response) async {
          checkOutsendModel = CheckOutSendModel.fromJson(json.decode(response.body));
          print(checkOutsendModel?.status);
          if (response.statusCode == 200 &&
              checkOutsendModel?.status == "success") {
            EasyLoading.showSuccess("success");
            print("data on${data}");
            // applycoupon();
            print('EE Thay Gyu Hooooo ! ^_^');
            _searchController.clear();
            setState(() {
              isLoading = false;
              _searchController.clear();
              cpn=null;
            });

          } else {
            setState(() {
              EasyLoading.showError("No Data Found");
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
        deviceName =
            androidInfo.model; // Device name
        deviceOS = 'Android ${androidInfo.version.release}';
      });
      ViewCartwithoutloginAp();
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
             // wait = false;
              isLoading = false;
            });
          } else {
            setState(() {
             // wait = false;
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          //wait = false;
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }




  removecouponap() async {
    EasyLoading.show(status: 'Please Wait ...');
    final Map<String, String> data = {};
    data['userId'] =  usermodal?.userId == "" || usermodal?.userId == null
        ?deviceName.toString():(usermodal?.userId).toString();
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().removecoponapi(data).then((response) async {
          removecouponModel =
              RemoveCouponModel.fromJson(json.decode(response.body));
          print(removecouponModel?.status);
          if (response.statusCode == 200 &&
              removecouponModel?.status == "success") {
            EasyLoading.showSuccess("Remove Coupon");
            print('EE Thay Gyu Hooooo ! ^_^');

            setState(() {
              // wait = false;
              isLoading = false;
              cpupon= false;
            });
          } else {
            setState(() {
              EasyLoading.showError("fail");
              // wait = false;
              isLoading = false;
            });
          }
        });
      } else {
        setState(() {
          //wait = false;
          isLoading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }





}
