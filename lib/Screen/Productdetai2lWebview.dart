// import 'dart:async';
// import 'dart:convert';
//
// import 'package:cached_network_image/cached_network_image.dart';
// import 'package:ecommerce/Databasehandler.dart';
// import 'package:ecommerce/Modal/AddCartModal.dart';
// import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
// import 'package:ecommerce/Modal/Cartmodal.dart';
// import 'package:ecommerce/Modal/ColorMatchModal.dart';
// import 'package:ecommerce/Modal/ColorShowModal.dart';
// import 'package:ecommerce/Modal/DeleteReviewModal.dart';
// import 'package:ecommerce/Modal/ProductDetailModal.dart';
// import 'package:ecommerce/Modal/ProfileModal.dart';
// import 'package:ecommerce/Modal/RemoveWishListModal.dart';
// import 'package:ecommerce/Modal/SelectColorModal.dart';
// import 'package:ecommerce/Modal/SizeShowModal.dart';
// import 'package:ecommerce/Modal/ViewReviewModal.dart';
// import 'package:ecommerce/Modal/addReviewModal.dart';
// import 'package:ecommerce/Provider/Authprovider.dart';
// import 'package:ecommerce/Screen/LoginPage2.dart';
// import 'package:ecommerce/Screen/ProfilePage.dart';
// import 'package:ecommerce/Widget/Const.dart';
// import 'package:ecommerce/Widget/Drawer.dart';
// import 'package:ecommerce/Widget/buildErrorDialog.dart';
// import 'package:ecommerce/Widget/loder.dart';
// import 'package:flutter/cupertino.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_inappwebview/flutter_inappwebview.dart';
// import 'package:fluttertoast/fluttertoast.dart';
// import 'package:provider/provider.dart';
// import 'package:readmore/readmore.dart';
// import 'package:sizer/sizer.dart';
// import 'package:smooth_page_indicator/smooth_page_indicator.dart';
//
// import '../Provider/cartProvider.dart';
// import '../Widget/bottombar.dart';
// late Timer timer;
// class productdetailwebview extends StatefulWidget {
//   String? productid;
//
//   productdetailwebview({
//     super.key,
//     this.productid,
//   });
//
//   @override
//   State<productdetailwebview> createState() => _productdetailwebviewState();
// }
//
// final GlobalKey<ScaffoldState> _scaffoldKeyprdweb = GlobalKey<ScaffoldState>();
//
// final Completer<InAppWebViewController> _controller =
//     Completer<InAppWebViewController>();
// int sel = 1;
// int color = 0;
// bool _load = true;
// final _formKey = GlobalKey<FormState>();
// bool isLoading = true;
// TextEditingController _comment = TextEditingController();
// TextEditingController _rating = TextEditingController();
// double _webViewHeight = 0.001;
// final controller = PageController(viewportFraction: 0.8, keepPage: true);
// List pages = [];
// bool h = false;
// List sizername = ['XS', 'S', 'M', 'XL', 'L'];
//
// List<Color> colorList = [
//   Colors.red,
//   Colors.green,
//   Colors.blue,
//   Colors.orange,
//   Colors.purple,
// ];
// double webViewHeight = 0;
// DatabaseHelper databaseHelper = DatabaseHelper();
// late InAppWebViewController _webViewController;
// int selectedColorIndex = 0;
//
// int selcted = 0;
// String? price;
// String? price1;
// String? _url;
//
// class _productdetailwebviewState extends State<productdetailwebview> {
//   @override
//   void initState() {
//     // TODO: implement initState
//     super.initState();
//
//     setState(() {
//       _webViewHeight = 0.001;
//       color = 0;
//       selected = 0;
//       isLoading = true;
//       _load = true;
//       _url =
//           'https://ecomweb.fableadtechnolabs.com/design/${widget.productid.toString()}/${(usermodal?.userId).toString()}';
//       print('Url link : $_url');
//     });
//     productdetailap();
//     setState(() {
//       isLoading = true;
//     });
//     colorap();
//     setState(() {
//       isLoading = true;
//     });
//     sizeap();
//     setState(() {
//       isLoading = true;
//     });
//     if (colorshowmodal?.variationData?.length != 0 &&
//         sizeshowmodal?.variationData?.length != 0) {
//       setState(() {
//         isLoading = true;
//       });
//       colormatchap();
//     } else {
//       setState(() {
//         isLoading = true;
//       });
//       selectcolorap();
//     }
//     viewreviewap();
//     print('init load : ${_load}');
//     print('init : ${_webViewHeight}');
//   }
// @override
//   void dispose() {
//     // TODO: implement dispose
//     super.dispose();
//     timer.cancel();
//     print("Timer stopped.");
//   }
//   @override
//   Widget build(BuildContext context) {
//     final cartitm = Provider.of<CartProvider>(context);
//     addoff() async {
//       print("notlog");
//       CartItem item = CartItem(
//         VariationTblId: colormatchmodal?.priceData?.length == 0 ||
//                 colorshowmodal?.variationData?.length == 0 &&
//                     sizeshowmodal?.variationData?.length == 0
//             ? '0'
//             : colormatchmodal?.priceData?[0].variationMatchId ?? "",
//         productId: widget.productid.toString(),
//         Size: sizeshowmodal?.variationData?.length == 0
//             ? "0"
//             : sizeshowmodal?.variationData?[selcted].variationID ?? '',
//         Color: colorshowmodal?.variationData?.length == 0
//             ? '0'
//             : (colorshowmodal?.variationData?[0].variationID ?? ""),
//         initialPrice: sizeshowmodal?.variationData?.length != 0
//             ? double.parse(price.toString())
//             : colorshowmodal?.variationData?.length == 0 &&
//                     sizeshowmodal?.variationData?.length == 0
//                 ? double.parse(
//                     (productdetailmodal?.productData?.saleProductPrice)
//                         .toString())
//                 : double.parse(
//                     (selectcolormodal?.variationData?.saleVariationPrice)
//                         .toString()),
//         productName: productdetailmodal?.productData?.productName ?? "",
//         productQuantity: 1,
//         productImage: productdetailmodal?.productData?.allimage?[0] ?? "",
//         productPrice: sizeshowmodal?.variationData?.length != 0
//             ? double.parse(price.toString())
//             : colorshowmodal?.variationData?.length == 0 &&
//                     sizeshowmodal?.variationData?.length == 0
//                 ? double.parse(
//                     (productdetailmodal?.productData?.saleProductPrice)
//                         .toString())
//                 : double.parse(
//                     (selectcolormodal?.variationData?.saleVariationPrice)
//                         .toString()),
//         productDescription:
//             productdetailmodal?.productData?.productShortDesc ?? "",
//       );
//       int result = await databaseHelper.insertCartItem(item);
//       if (result != 0) {
//         cartitm.addTotalPrice(sizeshowmodal?.variationData?.length != 0
//             ? double.parse(price.toString())
//             : colorshowmodal?.variationData?.length == 0 &&
//                     sizeshowmodal?.variationData?.length == 0
//                 ? double.parse(
//                     (productdetailmodal?.productData?.saleProductPrice)
//                         .toString())
//                 : double.parse(
//                     (selectcolormodal?.variationData?.saleVariationPrice)
//                         .toString()));
//
//         buildErrorDialog(context, '', 'Your item is Added in Cart');
//       }
//     }
//
//     return commanScreen(
//       isLoading: isLoading,
//       scaffold: Scaffold(
//         backgroundColor: Colors.grey.shade100,
//         key: _scaffoldKeyprdweb,
//         drawer: drawer1(),
//         bottomNavigationBar: bottombar(),
//         body: isLoading
//             ? Container()
//             : Padding(
//                 padding: EdgeInsets.symmetric(horizontal: 2.w),
//                 child: CustomScrollView(
//                   slivers: [
//                     SliverToBoxAdapter(
//                       child: Column(
//                         children: [
//                           SizedBox(
//                             height: 4.h,
//                           ),
//                           Container(
//                             child: Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 IconButton(
//                                     onPressed: () {
//                                       timer.cancel();
//                                       Navigator.of(context).pop();
//                                     },
//                                     icon: Icon(
//                                       Icons.arrow_back_ios_rounded,
//                                       size: 22.sp,
//                                     )),
//                                 Text(
//                                   "Product Detail Page",
//                                   style: TextStyle(
//                                     fontSize: 17.sp,
//                                     fontFamily: "task",
//                                     fontWeight: FontWeight.bold,
//                                   ),
//                                 ),
//                                 Row(
//                                   children: [
//                                     GestureDetector(
//                                       onTap: () {
//                                         usermodal?.userId == "" ||
//                                                 usermodal?.userId == null
//                                             ? Navigator.of(context).push(
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         LoginPage2()))
//                                             : Navigator.of(context).push(
//                                                 MaterialPageRoute(
//                                                     builder: (context) =>
//                                                         ProfilePage()));
//                                       },
//                                       child: usermodal?.userId == "" ||
//                                               usermodal?.userId == null
//                                           ? Text(
//                                               "Login",
//                                               style: TextStyle(
//                                                 color: Color(0xff0061b0),
//                                                 fontFamily: 'task',
//                                                 fontWeight: FontWeight.bold,
//                                                 fontSize: 17.sp,
//                                               ),
//                                             )
//                                           : Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   horizontal: 1.w),
//                                               height: 12.2.w,
//                                               width: 12.2.w,
//                                               padding: EdgeInsets.all(1.w),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(90),
//                                                 child: CachedNetworkImage(
//                                                     fit: BoxFit.cover,
//                                                     imageUrl: profilemodal
//                                                             ?.profileDetails
//                                                             ?.profileimage ??
//                                                         '',
//                                                     progressIndicatorBuilder:
//                                                         (context, url,
//                                                                 progress) =>
//                                                             Center(
//                                                                 child:
//                                                                     CircularProgressIndicator()),
//                                                     errorWidget: (context, url,
//                                                             error) =>
//                                                         Image.asset(
//                                                             'assets/deim.png')),
//                                               ),
//                                             ),
//                                     ),
//                                   ],
//                                 ),
//                               ],
//                             ),
//                           ),
//                           Stack(
//                             children: [
//                               SingleChildScrollView(
//                                 child: Column(
//                                   mainAxisAlignment: MainAxisAlignment.center,
//                                   crossAxisAlignment: CrossAxisAlignment.center,
//                                   children: [
//                                     Column(
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.center,
//                                       children: <Widget>[
//                                         SizedBox(
//                                           height: 230,
//                                           child: PageView.builder(
//                                             controller: controller,
//                                             itemCount: pages.length,
//                                             itemBuilder: (_, index) {
//                                               return pages[
//                                                   index % pages.length];
//                                             },
//                                           ),
//                                         ),
//                                         SizedBox(
//                                           height: 1.h,
//                                         ),
//                                         SmoothPageIndicator(
//                                           controller: controller,
//                                           count: pages.length,
//                                           effect: WormEffect(
//                                             dotColor: Colors.grey.shade200,
//                                             activeDotColor: Color(0xff0061b0),
//                                             dotHeight: 1.5.h,
//                                             dotWidth: 4.w,
//                                             type: WormType.thinUnderground,
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                     SizedBox(
//                                       height: 2.h,
//                                     ),
//                                     Padding(
//                                       padding: EdgeInsets.symmetric(
//                                           horizontal: 2.5.w, vertical: 2.h),
//                                       child: Column(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.start,
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.start,
//                                         children: [
//                                           Row(
//                                             mainAxisAlignment:
//                                                 MainAxisAlignment.spaceBetween,
//                                             crossAxisAlignment:
//                                                 CrossAxisAlignment.center,
//                                             children: [
//                                               SizedBox(
//                                                 width: 57.w,
//                                                 child: Text(
//                                                   productdetailmodal
//                                                                   ?.productData
//                                                                   ?.productName ==
//                                                               '' ||
//                                                           productdetailmodal
//                                                                   ?.productData
//                                                                   ?.productName ==
//                                                               null
//                                                       ? 'N/A'
//                                                       : productdetailmodal
//                                                               ?.productData
//                                                               ?.productName ??
//                                                           '',
//                                                   style: TextStyle(
//                                                     fontSize: 14.sp,
//                                                     color: Colors.black,
//                                                     fontWeight: FontWeight.bold,
//                                                     fontFamily: "task",
//                                                   ),
//                                                 ),
//                                               ),
//                                               GestureDetector(
//                                                 onTap: () {
//                                                   usermodal?.userId == "" ||
//                                                           usermodal?.userId ==
//                                                               null
//                                                       ? Navigator.of(context)
//                                                           .push(MaterialPageRoute(
//                                                               builder: (context) =>
//                                                                   LoginPage2()))
//                                                       : productdetailmodal
//                                                                   ?.productData
//                                                                   ?.wishlist ==
//                                                               1
//                                                           ? removewishlistap(
//                                                               (productdetailmodal
//                                                                       ?.productData
//                                                                       ?.productID)
//                                                                   .toString())
//                                                           : addwishlistap(
//                                                               (productdetailmodal
//                                                                       ?.productData
//                                                                       ?.productID)
//                                                                   .toString());
//                                                 },
//                                                 child: Icon(
//                                                   productdetailmodal
//                                                               ?.productData
//                                                               ?.wishlist ==
//                                                           1
//                                                       ? Icons.favorite
//                                                       : Icons.favorite_outline,
//                                                   size: 25.sp,
//                                                   color: productdetailmodal
//                                                               ?.productData
//                                                               ?.wishlist ==
//                                                           1
//                                                       ? Colors.red
//                                                       : Colors.black,
//                                                 ),
//                                               )
//                                             ],
//                                           ),
//                                           SizedBox(
//                                             height: 0.7.h,
//                                           ),
//                                           ReadMoreText(
//                                             productdetailmodal?.productData
//                                                             ?.productShortDesc ==
//                                                         '' ||
//                                                     productdetailmodal
//                                                             ?.productData
//                                                             ?.productShortDesc ==
//                                                         null
//                                                 ? 'N/A'
//                                                 : productdetailmodal
//                                                         ?.productData
//                                                         ?.productShortDesc ??
//                                                     '',
//                                             trimLines: 2,
//                                             colorClickableText: Colors.pink,
//                                             trimMode: TrimMode.Line,
//                                             style: TextStyle(
//                                                 fontSize: 13.sp,
//                                                 fontWeight: FontWeight.bold,
//                                                 color: Colors.grey,
//                                                 fontFamily: "task"),
//                                             trimCollapsedText: ' Show more',
//                                             trimExpandedText: '  Show less',
//                                             lessStyle: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'task',
//                                                 color: Color(0xff0061b0),
//                                                 fontSize: 12.sp),
//                                             moreStyle: TextStyle(
//                                                 fontWeight: FontWeight.bold,
//                                                 fontFamily: 'task',
//                                                 color: Color(0xff0061b0),
//                                                 fontSize: 12.sp),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ],
//                                 ),
//                               ),
//                             ],
//                           ),
//                         ],
//                       ),
//                     ),
//                     SliverToBoxAdapter(
//                       child: Stack(
//                         children: [
//                           Container(
//                             height: _webViewHeight,
//                             color: Colors.grey.shade100,
//                             child: InAppWebView(
//                               initialOptions: InAppWebViewGroupOptions(
//                                 crossPlatform: InAppWebViewOptions(
//                                   transparentBackground: true,
//                                 ),
//                               ),
//                               initialUrlRequest: URLRequest(
//                                 url: Uri.parse(
//                                     _url.toString()), // replace with your URL
//                               ),
//                               onWebViewCreated:
//                                   (InAppWebViewController controller) {
//                                 _webViewController = controller;
//                                 _updateWebViewHeight();
//                               },
//                               onLoadStart: (InAppWebViewController controller,
//                                   Uri? url) {
//                                 setState(() {
//                                   _load = true;
//                                 });
//                               },
//                               onLoadStop: (InAppWebViewController controller,
//                                   Uri? url) {
//                                 setState(() {
//                                   _load = false;
//                                   print('loading : ${_load}');
//                                 });
//                                 _updateWebViewHeight();
//                                timer = Timer.periodic(Duration(milliseconds: 100),
//                                     (timer) {
//                                   _updateWebViewHeight();
//                                 });
//                               },
//                             ),
//                           ),
//                           if (_load)
//                             Center(
//                               child: CircularProgressIndicator(),
//                             ),
//                         ],
//                       ),
//                     ),
//                     SizedBox(height: 2.h,),
//                     Padding(
//                       padding:  EdgeInsets.symmetric(horizontal: 2.w),
//                       child: Container(
//                         height: 100,
//                         alignment: Alignment.center,
//                         width: MediaQuery.of(context).size.width,
//                         decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(10.0),
//                             color: Colors.blue.shade50
//                         ),
//                         child: Row(
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Container(
//                               child: Icon(Icons.add,color: Colors.white,size: 10.sp,),
//                               decoration: BoxDecoration(
//                                   color: Color(0xff0061b0),
//                                   borderRadius: BorderRadius.circular(10.0)
//                               ),
//                               height: 20.0,
//                               width: 20.0,
//                             ),
//                             // SizedBox(width: 20.w,),
//                             Column(
//                               crossAxisAlignment: CrossAxisAlignment.start,
//                               children: [
//                                 SizedBox(height: 1.h,),
//                                 Text("Get ₹ 10.37 additional pharmato",style: TextStyle(
//                                   fontSize: 12.sp,
//                                   fontFamily: "task",
//                                 ),),
//                                 Text("Credit with PLUS",style: TextStyle(
//                                   fontSize: 12.sp,
//                                   fontFamily: "task",
//                                 ),),
//                                 Text('Enrol now & enjoy FREE delivery',style: TextStyle(
//                                     fontSize: 12.sp,
//                                     fontFamily: "task",
//                                     color: Color(0xff0061b0)
//                                 ),),
//                                 Text('on your order',style: TextStyle(
//                                     fontSize: 12.sp,
//                                     fontFamily: "task",
//                                     color: Color(0xff0061b0)
//                                 ),),
//                               ],
//                             ),
//                             //SizedBox(width: 30.w,),
//                             Icon(Icons.arrow_forward_ios_outlined,size: 15.sp,color: Color(0xff0061b0),)
//                           ],
//                         ),
//                       ),
//                     ),
//                     SizedBox(height: 2.h,),
//                     SliverToBoxAdapter(
//                       child: Padding(
//                         padding: EdgeInsets.symmetric(horizontal: 2.w),
//                         child: Column(
//                           children: [
//                             SizedBox(height: 2.h),
//                             Row(
//                               mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                               children: [
//                                 Text(
//                                   'Reviews :',
//                                   style: TextStyle(
//                                     fontSize: 15.sp,
//                                     fontFamily: 'task',
//                                     fontWeight: FontWeight.bold,
//                                     letterSpacing: 1,
//                                     color: Colors.black.withOpacity(0.7),
//                                   ),
//                                 ),
//                                 InkWell(
//                                   onTap: () {
//                                     usermodal?.userId == '' ||
//                                             usermodal?.userId == null
//                                         ? Fluttertoast.showToast(
//                                             msg:
//                                                 "You Have to Login to Give Review",
//                                             toastLength: Toast.LENGTH_SHORT,
//                                             timeInSecForIosWeb: 1,
//                                             backgroundColor: Colors.white,
//                                             textColor: Color(0xff0061b0),
//                                             fontSize: 11.sp)
//                                         : addreviewdialog();
//                                   },
//                                   child: Text(
//                                     'Add Your Review',
//                                     style: TextStyle(
//                                       fontSize: 15.sp,
//                                       fontFamily: 'task',
//                                       fontWeight: FontWeight.bold,
//                                       letterSpacing: 1,
//                                       color: Color(0xff0061b0),
//                                     ),
//                                   ),
//                                 ),
//                               ],
//                             ),
//                             SizedBox(height: 1.h),
//                           ],
//                         ),
//                       ),
//                     ),
//                     viewReviewmodal?.reviewData?.length == 0 ||
//                             viewReviewmodal?.reviewData?.length == null
//                         ? SliverToBoxAdapter(
//                             child: Center(
//                               child: Container(
//                                 margin: EdgeInsets.only(top: 3.h),
//                                 child: Text(
//                                   'No Review Available',
//                                   style: TextStyle(
//                                       fontWeight: FontWeight.normal,
//                                       fontFamily: 'task',
//                                       fontSize: 18.sp,
//                                       color: Colors.black),
//                                 ),
//                               ),
//                             ),
//                           )
//                         : SliverList.builder(
//                             itemCount: viewReviewmodal?.reviewData?.length,
//                             itemBuilder: (context, index) {
//                               return Container(
//                                 margin: EdgeInsets.symmetric(vertical: 1.h),
//                                 padding: EdgeInsets.symmetric(vertical: 0.5.h),
//                                 decoration: BoxDecoration(
//                                     color: Colors.white,
//                                     borderRadius: BorderRadius.circular(25)),
//                                 child: Stack(
//                                   children: [
//                                     Column(
//                                       mainAxisAlignment:
//                                           MainAxisAlignment.start,
//                                       crossAxisAlignment:
//                                           CrossAxisAlignment.start,
//                                       children: [
//                                         Row(
//                                           children: [
//                                             Container(
//                                               margin: EdgeInsets.symmetric(
//                                                   horizontal: 1.w),
//                                               height: 14.w,
//                                               width: 14.w,
//                                               padding: EdgeInsets.all(1.w),
//                                               child: ClipRRect(
//                                                 borderRadius:
//                                                     BorderRadius.circular(90),
//                                                 child: CachedNetworkImage(
//                                                     fit: BoxFit.cover,
//                                                     imageUrl: viewReviewmodal
//                                                             ?.reviewData?[index]
//                                                             .userProfile ??
//                                                         '',
//                                                     progressIndicatorBuilder:
//                                                         (context, url,
//                                                                 progress) =>
//                                                             Center(
//                                                                 child:
//                                                                     CircularProgressIndicator()),
//                                                     errorWidget: (context, url,
//                                                             error) =>
//                                                         Image.asset(
//                                                             'assets/deim.png')),
//                                               ),
//                                             ),
//                                             Column(
//                                               mainAxisAlignment:
//                                                   MainAxisAlignment.start,
//                                               crossAxisAlignment:
//                                                   CrossAxisAlignment.start,
//                                               children: [
//                                                 Row(
//                                                   mainAxisAlignment:
//                                                       MainAxisAlignment
//                                                           .spaceBetween,
//                                                   crossAxisAlignment:
//                                                       CrossAxisAlignment.start,
//                                                   children: [
//                                                     SizedBox(
//                                                       width: 70.w,
//                                                       child: Text(
//                                                         viewReviewmodal
//                                                                 ?.reviewData?[
//                                                                     index]
//                                                                 .name ??
//                                                             '',
//                                                         style: TextStyle(
//                                                           fontSize: 12.sp,
//                                                           fontFamily: 'task',
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           letterSpacing: 1,
//                                                           color: Colors.black
//                                                               .withOpacity(
//                                                                   0.85),
//                                                         ),
//                                                       ),
//                                                     ),
//                                                     usermodal?.userId ==
//                                                             viewReviewmodal
//                                                                 ?.reviewData?[
//                                                                     index]
//                                                                 .userId
//                                                         ? InkWell(
//                                                             onTap: () {
//                                                               removeratingsheet(
//                                                                   viewReviewmodal
//                                                                           ?.reviewData?[
//                                                                               index]
//                                                                           .reviewId ??
//                                                                       '');
//                                                             },
//                                                             child: Icon(
//                                                               CupertinoIcons
//                                                                   .trash,
//                                                               color: Colors.red,
//                                                               size: 15.sp,
//                                                             ),
//                                                           )
//                                                         : Container()
//                                                   ],
//                                                 ),
//                                                 SizedBox(height: 0.3.h),
//                                                 SizedBox(
//                                                   width: 73.w,
//                                                   child: Row(
//                                                     mainAxisAlignment:
//                                                         MainAxisAlignment
//                                                             .spaceBetween,
//                                                     children: [
//                                                       Row(
//                                                         mainAxisAlignment:
//                                                             MainAxisAlignment
//                                                                 .center,
//                                                         children: [
//                                                           Row(
//                                                             children: [
//                                                               viewReviewmodal
//                                                                           ?.reviewData?[
//                                                                               index]
//                                                                           .rating ==
//                                                                       '1'
//                                                                   ? Icon(
//                                                                       Icons
//                                                                           .star,
//                                                                       color: Colors
//                                                                           .amber,
//                                                                       size:
//                                                                           14.sp,
//                                                                     )
//                                                                   : viewReviewmodal
//                                                                               ?.reviewData?[
//                                                                                   index]
//                                                                               .rating ==
//                                                                           '2'
//                                                                       ? Row(
//                                                                           children: [
//                                                                             Icon(
//                                                                               Icons.star,
//                                                                               color: Colors.amber,
//                                                                               size: 14.sp,
//                                                                             ),
//                                                                             Icon(
//                                                                               Icons.star,
//                                                                               color: Colors.amber,
//                                                                               size: 14.sp,
//                                                                             )
//                                                                           ],
//                                                                         )
//                                                                       : viewReviewmodal?.reviewData?[index].rating ==
//                                                                               '3'
//                                                                           ? Row(
//                                                                               children: [
//                                                                                 Icon(
//                                                                                   Icons.star,
//                                                                                   color: Colors.amber,
//                                                                                   size: 14.sp,
//                                                                                 ),
//                                                                                 Icon(
//                                                                                   Icons.star,
//                                                                                   color: Colors.amber,
//                                                                                   size: 14.sp,
//                                                                                 ),
//                                                                                 Icon(
//                                                                                   Icons.star,
//                                                                                   color: Colors.amber,
//                                                                                   size: 14.sp,
//                                                                                 )
//                                                                               ],
//                                                                             )
//                                                                           : viewReviewmodal?.reviewData?[index].rating == '4'
//                                                                               ? Row(
//                                                                                   children: [
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     )
//                                                                                   ],
//                                                                                 )
//                                                                               : Row(
//                                                                                   children: [
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     ),
//                                                                                     Icon(
//                                                                                       Icons.star,
//                                                                                       color: Colors.amber,
//                                                                                       size: 14.sp,
//                                                                                     )
//                                                                                   ],
//                                                                                 )
//                                                             ],
//                                                           ),
//                                                           SizedBox(
//                                                             width: 2.w,
//                                                           ),
//                                                           Text(
//                                                             '( ' +
//                                                                 (viewReviewmodal
//                                                                         ?.reviewData?[
//                                                                             index]
//                                                                         .rating ??
//                                                                     '') +
//                                                                 ' )',
//                                                             style: TextStyle(
//                                                               fontFamily:
//                                                                   'task',
//                                                               fontWeight:
//                                                                   FontWeight
//                                                                       .bold,
//                                                               letterSpacing: 1,
//                                                               color: Colors
//                                                                   .black
//                                                                   .withOpacity(
//                                                                       0.7),
//                                                             ),
//                                                           ),
//                                                         ],
//                                                       ),
//                                                       Text(
//                                                         viewReviewmodal
//                                                                 ?.reviewData?[
//                                                                     index]
//                                                                 .date ??
//                                                             '',
//                                                         style: TextStyle(
//                                                           fontFamily: 'task',
//                                                           fontWeight:
//                                                               FontWeight.bold,
//                                                           letterSpacing: 0.5,
//                                                           color: Colors.black
//                                                               .withOpacity(0.7),
//                                                         ),
//                                                       ),
//                                                     ],
//                                                   ),
//                                                 ),
//                                               ],
//                                             ),
//                                           ],
//                                         ),
//                                         SizedBox(height: 0.5.h),
//                                         Padding(
//                                           padding: EdgeInsets.symmetric(
//                                               horizontal: 16.w),
//                                           child: Text(
//                                             viewReviewmodal?.reviewData?[index]
//                                                     .comments ??
//                                                 '',
//                                             style: TextStyle(
//                                               fontSize: 12.sp,
//                                               fontFamily: 'task',
//                                               fontWeight: FontWeight.w600,
//                                               letterSpacing: 1,
//                                               color: Colors.black
//                                                   .withOpacity(0.75),
//                                             ),
//                                           ),
//                                         ),
//                                       ],
//                                     ),
//                                   ],
//                                 ),
//                               );
//                             },
//                           ),
//                     SliverToBoxAdapter(
//                       child: SizedBox(
//                         height: 5.h,
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//       ),
//     );
//   }
//
//   productdetailap() async {
//     final Map<String, String> data = {};
//     data['product_id'] = widget.productid.toString();
//     data['user_id'] = (usermodal?.userId).toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().productdetailapi(data).then((response) async {
//           productdetailmodal =
//               ProductDetailModal.fromJson(json.decode(response.body));
//           print(productdetailmodal?.status);
//           if (response.statusCode == 200 &&
//               productdetailmodal?.status == "success") {
//             colorap();
//             sizeap();
//             colorshowmodal?.variationData?.length != 0 &&
//                     sizeshowmodal?.variationData?.length != 0
//                 ? colormatchap()
//                 : selectcolorap();
//             pages = List.generate(
//                 (productdetailmodal?.productData?.allimage?.length ?? 0),
//                 (index) => Container(
//                       width: 90.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 2.w, vertical: 0.5.h),
//                       child: Container(
//                         height: 25.h,
//                         width: 90.w,
//                         child: Center(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: CachedNetworkImage(
//                                 height: 25.h,
//                                 width: 90.w,
//                                 imageUrl: productdetailmodal
//                                         ?.productData?.allimage?[index] ??
//                                     '',
//                                 progressIndicatorBuilder: (context, url,
//                                         progress) =>
//                                     Center(child: CircularProgressIndicator()),
//                                 errorWidget: (context, url, error) =>
//                                     Image.asset('assets/deim.png')),
//                           ),
//                         ),
//                       ),
//                     ));
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   viewap() {
//     final Map<String, String> data = {};
//     data['userId'] = (usermodal?.userId).toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().ViewProfile(data).then((response) async {
//           profilemodal = ProfileModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 && profilemodal?.status == "success") {
//             print(profilemodal?.status);
//             setState(() {
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
//
//   addwishlistap(String value) async {
//     final Map<String, String> data = {};
//     data['userId'] = (usermodal?.userId).toString();
//     data['productID'] = value.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().addtowishlistapi(data).then((response) async {
//           addtowishlIstmodal =
//               AddToWishLIstModal.fromJson(json.decode(response.body));
//           print(addtowishlIstmodal?.status);
//           if (response.statusCode == 200 &&
//               addtowishlIstmodal?.status == "success") {
//             buildErrorDialog(context, '', "Your item is added in wishlist");
//             productdetailap();
//
//             setState(() {
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
//
//   removewishlistap(String value) {
//     final Map<String, String> data = {};
//     data['userId'] = (usermodal?.userId).toString();
//     data['productID'] = value.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().removewishlistapi(data).then((response) async {
//           removewishlistmodal =
//               RemoveWishListModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 &&
//               removewishlistmodal?.status == "success") {
//             buildErrorDialog(context, '', "Your item is removed from wishlist");
//             productdetailap();
//             setState(() {
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
//
//   colorap() async {
//     final Map<String, String> data = {};
//     data['product_id'] = widget.productid.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().colorapi(data).then((response) async {
//           colorshowmodal = ColorShowModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 &&
//               colorshowmodal?.status == "success") {
//             print("color");
//             print(colorshowmodal?.variationData?.length);
//             setState(() {
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
//
//   sizeap() async {
//     final Map<String, String> data = {};
//     data['product_id'] = widget.productid.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().sizeapi(data).then((response) async {
//           sizeshowmodal = SizeShowModal.fromJson(json.decode(response.body));
//           print(sizeshowmodal?.status);
//           if (response.statusCode == 200 &&
//               sizeshowmodal?.status == "success") {
//             print("size");
//             print(colorshowmodal?.variationData?.length);
//             setState(() {
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
//
//   selectcolorap() async {
//     final Map<String, String> data = {};
//     data['variation_idd'] =
//         colorshowmodal?.variationData?[color].variationIdd ?? '';
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().selectcolorapi(data).then((response) async {
//           selectcolormodal =
//               SelectColorModal.fromJson(json.decode(response.body));
//           print(selectcolormodal?.status);
//           if (response.statusCode == 200 &&
//               selectcolormodal?.status == "success") {
//             print(selectcolormodal?.variationData?.variationPrice);
//             pages = List.generate(
//                 (selectcolormodal?.variationData?.allimage?.length ?? 0),
//                 (index) => Container(
//                       width: 90.w,
//                       decoration: BoxDecoration(
//                         borderRadius: BorderRadius.circular(16),
//                       ),
//                       margin: EdgeInsets.symmetric(
//                           horizontal: 2.w, vertical: 0.5.h),
//                       child: Container(
//                         height: 25.h,
//                         width: 90.w,
//                         child: Center(
//                           child: ClipRRect(
//                             borderRadius: BorderRadius.circular(10),
//                             child: CachedNetworkImage(
//                                 height: 25.h,
//                                 width: 90.w,
//                                 imageUrl: selectcolormodal
//                                         ?.variationData?.allimage?[index] ??
//                                     '',
//                                 fit: BoxFit.cover,
//                                 progressIndicatorBuilder: (context, url,
//                                         progress) =>
//                                     Center(child: CircularProgressIndicator()),
//                                 errorWidget: (context, url, error) =>
//                                     Image.asset('assets/deim.png')),
//                           ),
//                         ),
//                       ),
//                     ));
//             setState(() {
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
//
//   colormatchap() async {
//     final Map<String, String> data = {};
//     data['product_id'] = widget.productid.toString();
//     data['color_variation_id'] =
//         colorshowmodal?.variationData?[color].variationID ?? "";
//     data['size_variation_id'] =
//         sizeshowmodal?.variationData?[selcted].variationID ?? '';
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().colormatchapi(data).then((response) async {
//           colormatchmodal =
//               ColorMatchModal.fromJson(json.decode(response.body));
//           if (response.statusCode == 200 &&
//               colormatchmodal?.status == "success") {
//             print('aa batli data');
//             print(colormatchmodal?.priceData?[0].saleVariationPrice ?? '');
//             pages = colormatchmodal?.priceData?.length == 0
//                 ? List.generate(
//                     1,
//                     (index) => Container(
//                           width: 90.w,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 2.w, vertical: 0.5.h),
//                           child: Container(
//                             height: 25.h,
//                             width: 90.w,
//                             child: Center(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: CachedNetworkImage(
//                                     height: 25.h,
//                                     width: 90.w,
//                                     imageUrl:
//                                         'https://www.contentviewspro.com/wp-content/uploads/2017/07/default_image.png',
//                                     fit: BoxFit.cover,
//                                     progressIndicatorBuilder:
//                                         (context, url, progress) => Center(
//                                             child: CircularProgressIndicator()),
//                                     errorWidget: (context, url, error) =>
//                                         Image.asset('assets/deim.png')),
//                               ),
//                             ),
//                           ),
//                         ))
//                 : List.generate(
//                     (colormatchmodal?.priceData?[0].allimage?.length ?? 0),
//                     (index) => Container(
//                           width: 80.w,
//                           decoration: BoxDecoration(
//                             borderRadius: BorderRadius.circular(16),
//                           ),
//                           margin: EdgeInsets.symmetric(
//                               horizontal: 7.5.w, vertical: 4),
//                           child: Container(
//                             height: 280,
//                             child: Center(
//                               child: ClipRRect(
//                                 borderRadius: BorderRadius.circular(10),
//                                 child: CachedNetworkImage(
//                                     imageUrl: colormatchmodal
//                                             ?.priceData?[0].allimage?[index] ??
//                                         '',
//                                     progressIndicatorBuilder:
//                                         (context, url, progress) => Center(
//                                             child: CircularProgressIndicator()),
//                                     errorWidget: (context, url, error) =>
//                                         Image.asset('assets/deim.png')),
//                               ),
//                             ),
//                           ),
//                         ));
//
//             setState(() {
//               price1 =
//                   colormatchmodal?.priceData?[0].variationPrice?.toString();
//               price =
//                   colormatchmodal?.priceData?[0].saleVariationPrice?.toString();
//               // isLoading = false;
//             });
//           } else {
//             setState(() {
//               price = "";
//               // isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           // isLoading = false;
//         });
//
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   addcartap() async {
//     final Map<String, String> data = {};
//     data['userId'] = (usermodal?.userId).toString();
//     data['productID'] = widget.productid.toString();
//     data['variation_tbl_id'] = colormatchmodal?.priceData?.length == 0 ||
//             colorshowmodal?.variationData?.length == 0 &&
//                 sizeshowmodal?.variationData?.length == 0
//         ? '0'
//         : colormatchmodal?.priceData?[0].variationMatchId ?? "";
//     data['product_color'] = colorshowmodal?.variationData?.length == 0
//         ? '0'
//         : (colorshowmodal?.variationData?[0].variationID ?? "");
//     data['product_size'] = sizeshowmodal?.variationData?.length == 0
//         ? "0"
//         : sizeshowmodal?.variationData?[selcted].variationID ?? '';
//     data['product_quantity'] = '1';
//     data['product_price'] = sizeshowmodal?.variationData?.length != 0
//         ? price.toString()
//         : colorshowmodal?.variationData?.length == 0 &&
//                 sizeshowmodal?.variationData?.length == 0
//             ? (productdetailmodal?.productData?.saleProductPrice).toString()
//             : (selectcolormodal?.variationData?.saleVariationPrice).toString();
//     print('Add to Cart');
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().addcartapi(data).then((response) async {
//           addcartmodal = AddCartModal.fromJson(json.decode(response.body));
//           print(addcartmodal?.status);
//           if (response.statusCode == 200 && addcartmodal?.status == "success") {
//             productdetailap();
//             buildErrorDialog(context, '', "Your item is added in Cart");
//             print('EE Thay Gyu Hooooo ! ^_^');
//             setState(() {
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
//
//   addreviewap() async {
//     if (_formKey.currentState!.validate()) {
//       final Map<String, String> data = {};
//       data['userId'] = (usermodal?.userId).toString();
//       data['product_id'] = widget.productid.toString();
//       data['rating'] = _rating.text.trim().toString();
//       data['description'] = _comment.text.trim().toString();
//       print('Add Review');
//       print(data);
//       checkInternet().then((internet) async {
//         if (internet) {
//           authprovider().addReviewApi(data).then((response) async {
//             addreview = addReviewModal.fromJson(json.decode(response.body));
//             print(addcartmodal?.status);
//             if (response.statusCode == 200 && addreview?.status == "success") {
//               viewreviewap();
//               Fluttertoast.showToast(
//                   msg: "Review Added Successfully",
//                   toastLength: Toast.LENGTH_SHORT,
//                   timeInSecForIosWeb: 1,
//                   backgroundColor: Colors.white,
//                   textColor: Color(0xfff7941d),
//                   fontSize: 11.sp);
//               print('EE Review Add Thay Gyu Hooooo ! ^_^');
//               Navigator.pop(context);
//               setState(() {
//                 _comment.clear();
//                 _rating.clear();
//                 // isLoading = false;
//               });
//             } else {
//               setState(() {
//                 // isLoading = false;
//               });
//             }
//           });
//         } else {
//           setState(() {
//             // isLoading = false;
//           });
//           buildErrorDialog(context, 'Error', "Internet Required");
//         }
//       });
//     }
//   }
//
//   viewreviewap() async {
//     final Map<String, String> data = {};
//     data['product_id'] = widget.productid.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().viewreviewapi(data).then((response) async {
//           viewReviewmodal =
//               ViewReviewModal.fromJson(json.decode(response.body));
//           print(addcartmodal?.status);
//           if (response.statusCode == 200 &&
//               viewReviewmodal?.status == "success") {
//             print('rrrrrrrrrrrrrrrrr');
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   deletereviewap(String rId) async {
//     final Map<String, String> data = {};
//     data['userId'] = (usermodal?.userId).toString();
//     data['review_id'] = rId.toString();
//     print(data);
//     checkInternet().then((internet) async {
//       if (internet) {
//         authprovider().deletereviewapi(data).then((response) async {
//           deletereviewmodal =
//               DeleteReviewModal.fromJson(json.decode(response.body));
//           print(addcartmodal?.status);
//           if (response.statusCode == 200 &&
//               deletereviewmodal?.status == "success") {
//             print(viewReviewmodal?.reviewData?[0].reviewId);
//             viewreviewap();
//             Fluttertoast.showToast(
//                 msg: "Review Deleted Successfully",
//                 toastLength: Toast.LENGTH_SHORT,
//                 timeInSecForIosWeb: 1,
//                 backgroundColor: Colors.white,
//                 textColor: Color(0xfff7941d),
//                 fontSize: 11.sp);
//             print('EE Review delete Thay Gyu Hooooo ! ^_^');
//             Navigator.pop(context);
//             setState(() {
//               isLoading = false;
//             });
//           } else {
//             setState(() {
//               isLoading = false;
//             });
//           }
//         });
//       } else {
//         setState(() {
//           isLoading = false;
//         });
//         buildErrorDialog(context, 'Error', "Internet Required");
//       }
//     });
//   }
//
//   addreviewdialog() {
//     setState(() {
//       _comment.clear();
//       _rating.clear();
//     });
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return Dialog(
//           shape: RoundedRectangleBorder(
//             borderRadius: BorderRadius.circular(16),
//           ),
//           backgroundColor: Colors.white,
//           elevation: 00,
//           child: Stack(
//             children: [
//               Container(
//                   width: 80.w,
//                   child: Padding(
//                       padding:
//                           EdgeInsets.symmetric(vertical: 3.h, horizontal: 3.w),
//                       child: SingleChildScrollView(
//                         child: Form(
//                           key: _formKey,
//                           child: Column(
//                             mainAxisAlignment: MainAxisAlignment.start,
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             // mainAxisSize: MainAxisSize.min,
//                             children: [
//                               Center(
//                                 child: Text(
//                                   'Add Your Review',
//                                   textAlign: TextAlign.center,
//                                   style: TextStyle(
//                                       fontSize: 17.sp,
//                                       fontFamily: 'task',
//                                       color: Color(0xfff7941d),
//                                       fontWeight: FontWeight.bold,
//                                       letterSpacing: 1),
//                                 ),
//                               ),
//                               SizedBox(height: 3.h),
//                               Padding(
//                                 padding: EdgeInsets.symmetric(horizontal: 2.w),
//                                 child: Column(
//                                     crossAxisAlignment:
//                                         CrossAxisAlignment.start,
//                                     children: [
//                                       Row(
//                                         children: [
//                                           SizedBox(width: 1.w),
//                                           Icon(CupertinoIcons.info),
//                                           SizedBox(width: 2.w),
//                                           Column(
//                                             children: [
//                                               SizedBox(height: 0.5.h),
//                                               Text(
//                                                 "Review",
//                                                 style: TextStyle(
//                                                     color: Colors.black87,
//                                                     fontFamily: "task",
//                                                     fontSize: 15.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 0.5.h),
//                                       TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Add Your Review";
//                                           }
//                                           return null;
//                                         },
//                                         keyboardType: TextInputType.text,
//                                         controller: _comment,
//                                         maxLines: 3,
//                                         decoration: InputDecoration(
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           disabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           hintText: 'Add Your Review',
//                                           hintStyle: TextStyle(
//                                               color:
//                                                   Colors.black.withOpacity(0.5),
//                                               fontSize: 14.sp,
//                                               fontFamily: "task"),
//                                         ),
//                                       ),
//                                       SizedBox(height: 2.h),
//                                       Row(
//                                         crossAxisAlignment:
//                                             CrossAxisAlignment.center,
//                                         children: [
//                                           SizedBox(width: 1.w),
//                                           Icon(CupertinoIcons.star),
//                                           SizedBox(width: 2.w),
//                                           Column(
//                                             children: [
//                                               SizedBox(height: 0.5.h),
//                                               Text(
//                                                 "Ratings",
//                                                 style: TextStyle(
//                                                     color: Colors.black87,
//                                                     fontFamily: "task",
//                                                     fontSize: 15.sp,
//                                                     fontWeight:
//                                                         FontWeight.bold),
//                                               ),
//                                             ],
//                                           ),
//                                         ],
//                                       ),
//                                       SizedBox(height: 0.5.h),
//                                       TextFormField(
//                                         validator: (value) {
//                                           if (value!.isEmpty) {
//                                             return "Please Give Some Rating";
//                                           }
//                                           return null;
//                                         },
//                                         keyboardType: TextInputType.number,
//                                         controller: _rating,
//                                         onChanged: (value) {
//                                           if (int.parse(_rating.text) > 5) {
//                                             setState(() {
//                                               _rating.text = '';
//                                             });
//                                             Fluttertoast.showToast(
//                                                 msg:
//                                                     "You Can't Give more than 5 Star Review",
//                                                 toastLength: Toast.LENGTH_SHORT,
//                                                 timeInSecForIosWeb: 1,
//                                                 backgroundColor: Colors.white,
//                                                 textColor: Color(0xfff7941d),
//                                                 fontSize: 11.sp);
//                                             print('big');
//                                           } else {
//                                             print('small');
//                                           }
//                                         },
//                                         decoration: InputDecoration(
//                                           enabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           disabledBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           focusedBorder: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           border: OutlineInputBorder(
//                                               borderRadius:
//                                                   BorderRadius.circular(30),
//                                               borderSide: BorderSide(
//                                                   color: Colors.grey)),
//                                           hintText: 'Give Your Ratings',
//                                           hintStyle: TextStyle(
//                                               color:
//                                                   Colors.black.withOpacity(0.5),
//                                               fontSize: 14.sp,
//                                               fontFamily: "task"),
//                                         ),
//                                       ),
//                                     ]),
//                               ),
//                               SizedBox(height: 3.h),
//                               Row(
//                                 crossAxisAlignment: CrossAxisAlignment.center,
//                                 mainAxisAlignment: MainAxisAlignment.center,
//                                 children: [
//                                   GestureDetector(
//                                     onTap: () {
//                                       addreviewap();
//                                     },
//                                     child: Container(
//                                       child: Row(
//                                         mainAxisAlignment:
//                                             MainAxisAlignment.center,
//                                         children: [
//                                           Container(
//                                             alignment: Alignment.center,
//                                             height: 6.h,
//                                             width: 40.w,
//                                             decoration: BoxDecoration(
//                                                 borderRadius:
//                                                     BorderRadius.circular(30),
//                                                 color: Color(0xfff7941d)),
//                                             child: Row(
//                                               children: [
//                                                 IconButton(
//                                                     onPressed: () {},
//                                                     icon: Icon(
//                                                       CupertinoIcons.add,
//                                                       color: Colors.white,
//                                                     )),
//                                                 Text(
//                                                   "Add Review",
//                                                   style: TextStyle(
//                                                       fontSize: 13.sp,
//                                                       color: Colors.white,
//                                                       fontFamily: "task"),
//                                                 ),
//                                               ],
//                                             ),
//                                           ),
//                                         ],
//                                       ),
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               SizedBox(height: 2.h),
//                             ],
//                           ),
//                         ),
//                       ))),
//               Positioned(
//                   right: 0,
//                   child: IconButton(
//                       onPressed: () {
//                         Navigator.pop(context);
//                       },
//                       icon: Icon(CupertinoIcons.clear_circled)))
//             ],
//           ),
//         );
//       },
//     );
//   }
//
//   removeratingsheet(String rID) {
//     showModalBottomSheet(
//       elevation: 00,
//       shape: RoundedRectangleBorder(
//         borderRadius: BorderRadius.only(
//           topRight: Radius.circular(15),
//           topLeft: Radius.circular(15),
//         ),
//       ),
//       context: context,
//       builder: (context) {
//         return Stack(
//           children: [
//             Container(
//               child: Padding(
//                 padding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 3.w),
//                 child: Column(
//                   mainAxisAlignment: MainAxisAlignment.start,
//                   crossAxisAlignment: CrossAxisAlignment.start,
//                   mainAxisSize: MainAxisSize.min,
//                   children: [
//                     SizedBox(height: 3.h),
//                     Text(
//                       'Are You Sure You Want to Remove Your Review ?',
//                       textAlign: TextAlign.center,
//                       style: TextStyle(
//                           fontSize: 15.sp,
//                           fontFamily: 'task',
//                           color: Colors.black,
//                           fontWeight: FontWeight.w600,
//                           height: 0.17.h,
//                           letterSpacing: 1),
//                     ),
//                     SizedBox(height: 3.h),
//                     Padding(
//                       padding: EdgeInsets.symmetric(horizontal: 2.5.w),
//                       child: Column(
//                         mainAxisAlignment: MainAxisAlignment.start,
//                         crossAxisAlignment: CrossAxisAlignment.start,
//                         mainAxisSize: MainAxisSize.min,
//                         children: [
//                           Row(
//                             crossAxisAlignment: CrossAxisAlignment.center,
//                             mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                             children: [
//                               InkWell(
//                                 onTap: () {
//                                   deletereviewap(rID.toString());
//                                 },
//                                 child: Container(
//                                   width: 30.w,
//                                   alignment: Alignment.center,
//                                   padding: EdgeInsets.all(2.5.w),
//                                   decoration: BoxDecoration(
//                                       color: Color(0xfff7941d),
//                                       borderRadius: BorderRadius.circular(25)),
//                                   child: Text(
//                                     'Yes',
//                                     style: TextStyle(
//                                         fontSize: 13.sp,
//                                         fontFamily: 'task',
//                                         color: Colors.white,
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 1),
//                                   ),
//                                 ),
//                               ),
//                               InkWell(
//                                 onTap: () {
//                                   Navigator.pop(context);
//                                 },
//                                 child: Container(
//                                   width: 30.w,
//                                   alignment: Alignment.center,
//                                   padding: EdgeInsets.all(2.w),
//                                   decoration: BoxDecoration(
//                                       border: Border.all(
//                                         color: Color(0xfff7941d),
//                                       ),
//                                       color: Color(0xfff4f4f4),
//                                       borderRadius: BorderRadius.circular(25)),
//                                   child: Text(
//                                     'No',
//                                     style: TextStyle(
//                                         fontSize: 13.sp,
//                                         fontFamily: 'task',
//                                         color: Color(0xfff7941d),
//                                         fontWeight: FontWeight.bold,
//                                         letterSpacing: 1),
//                                   ),
//                                 ),
//                               ),
//                             ],
//                           ),
//                           SizedBox(height: 2.h),
//                         ],
//                       ),
//                     ),
//                   ],
//                 ),
//               ),
//             ),
//             Positioned(
//                 right: 0,
//                 child: IconButton(
//                     onPressed: () {
//                       Navigator.pop(context);
//                     },
//                     icon: Icon(CupertinoIcons.clear_circled)))
//           ],
//         );
//       },
//     );
//   }
//
//   void _updateWebViewHeight() async {
//     // Get the current content height of the InAppWebView
//     dynamic result = await _webViewController.evaluateJavascript(
//       source:
//           'Math.max(document.documentElement.scrollHeight, document.body.scrollHeight);',
//     );
//
//     // Convert the result to a double
//     double contentHeight = result is int ? result.toDouble() : result;
//
//     // Update the state to trigger a rebuild with the new height
//     setState(() {
//       _webViewHeight = contentHeight;
//
//       print('final hgt : ${_webViewHeight}');
//     });
//   }
//
//   void showAlertDialog(BuildContext context) {
//     // set up the button
//     Widget okButton = TextButton(
//       child: Text("OK", style: TextStyle(color: Colors.white)),
//       onPressed: () {
//         Navigator.pop(context); // Close the dialog
//       },
//     );
//
//     // set up the AlertDialog
//     AlertDialog alert = AlertDialog(
//       backgroundColor: Colors.black87,
//       content: Text(
//         "Your item is added in the cart",
//         style: TextStyle(color: Colors.white),
//       ),
//       actions: [
//         okButton,
//       ],
//     );
//
//     // show the dialog
//     showDialog(
//       context: context,
//       builder: (BuildContext context) {
//         return alert;
//       },
//     );
//   }
//
// // Call this function whenever you want to show the dialog
//   void alert() {
//     // You need to provide the context when calling showAlertDialog
//     // For example, you can call it inside a build method like:
//     // showAlertDialog(context);
//   }
// }
