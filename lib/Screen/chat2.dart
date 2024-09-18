import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/ChatModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_picker/image_picker.dart';
import 'package:sizer/sizer.dart';

import 'ProductDetailPage2.dart';
import 'ProductDetailnovartition.dart';

class Chatscreen extends StatefulWidget {
  String orderId = "";
  Chatscreen({required this.orderId,});



  @override
  State<Chatscreen> createState() => _ChatscreenState();
}
ImagePicker _picker = ImagePicker();
File? _pickedFile = null;
var photo = "";
class _ChatscreenState extends State<Chatscreen> {
  bool isloading=false;
  String adminID = "6";
  TextEditingController _sendmeasssges = TextEditingController();
  Timer? _timer;
  int type = 0;
  bool send = false;
  bool send1 = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    setState(() {
      isloading =true;
    });
    Chatmessageapi();
    _timer = Timer.periodic(const Duration(milliseconds: 600), (timer) {
      Chatmessageapi();

    });
  }
  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }
  bool isLoading=true;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey.shade200,
      appBar: AppBar(
        backgroundColor: Colors.grey.shade100,
        leadingWidth: 30.0,
        centerTitle: true,
        toolbarHeight: 60,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Colors.orange.shade700,
              child: Icon(Icons.person_outline,color: Colors.white,),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("E-Comm Support",style: TextStyle(
                    fontSize: 15.0,
                    fontWeight: FontWeight.bold,
                  ),
                  ),
                  Text("Order ID (${widget.orderId})",style: TextStyle(
                    fontSize: 13.0,
                    // fontWeight: FontWeight.bold,
                  ),)
                ],
              ),
            ),
          ],
        ),
      ),
      body: Column(
        children: [
          Expanded(
            child: Column(
              children: [
                isloading ? Container()
                    : SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 78.5.h,
                        child:
                        chatviewmodal?.data?.livechat?.length == 0 || chatviewmodal?.data?.livechat?.length == null
                            ? Center(
                            child: Text(
                              "No Message Available",
                              style: TextStyle(
                                  fontFamily: "task",
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.sp,
                                  color: Colors.black),
                            ))
                            : Column(
                          children: [
                            Container(
                              width:
                              MediaQuery.of(context).size.width,
                              height: 77.h,
                              child: ListView.builder(
                                shrinkWrap: true,
                                reverse: false,
                                itemCount:  chatviewmodal?.data?.livechat?.length,
                                itemBuilder: (context, index) {
                                  return chatviewmodal
                                      ?.data?.livechat?[index].msgType == "1"
                                      ? Align(
                                    alignment: Alignment.topRight,
                                    child: Column(
                                      crossAxisAlignment: CrossAxisAlignment.end,
                                      children: [
                                        Container(
                                            margin: EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                1.h,
                                                vertical:
                                                3.w),
                                            alignment: Alignment
                                                .centerLeft,
                                            padding: EdgeInsets
                                                .symmetric(
                                                horizontal:
                                                1.h,
                                                vertical:
                                                3.w),
                                            width: 70.w,
                                            decoration:
                                            BoxDecoration(
                                              borderRadius: BorderRadius
                                                  .only(
                                                  topLeft:
                                                  Radius
                                                      .circular(
                                                    15,
                                                  ),
                                                  topRight:
                                                  Radius
                                                      .circular(
                                                    15,
                                                  ),
                                                  bottomLeft:
                                                  Radius.circular(
                                                    15,
                                                  )),
                                              color: Colors.orange.shade700,
                                            ),
                                            child: chatviewmodal
                                                ?.data?.livechat?[
                                            index]
                                                .msgType ==
                                                "1"
                                                ? Text(
                                              chatviewmodal
                                                  ?.data?.livechat?[index]
                                                  .message ??
                                                  "",
                                              style: TextStyle(
                                                  fontSize: 12
                                                      .sp,
                                                  color: Colors
                                                      .black,
                                                  fontWeight: FontWeight
                                                      .bold,
                                                  fontFamily:
                                                  'task'),
                                            )
                                                : InkWell(
                                              onTap:
                                                  () {
                                                showDialog(
                                                  context:
                                                  context,
                                                  builder:
                                                      (context) {
                                                    return Stack(
                                                      children: [
                                                        Container(
                                                          padding: EdgeInsets.all(4.w),
                                                          margin: EdgeInsets.only(top: 1.h),
                                                          child: ClipRRect(
                                                            borderRadius: BorderRadius.circular(20),
                                                            child: CachedNetworkImage(
                                                              imageUrl: chatviewmodal?.data?.livechat?[index].message ?? "",
                                                              height: 77.h,
                                                              imageBuilder: (context, imageProvider) => Container(
                                                                decoration: BoxDecoration(
                                                                  image: DecorationImage(
                                                                    image: imageProvider,
                                                                    fit: BoxFit.cover,
                                                                  ),
                                                                ),
                                                              ),
                                                              placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                              errorWidget: (context, url, error) => Icon(Icons.error),
                                                            ),
                                                          ),
                                                        ),
                                                        Positioned(
                                                          left: 84.5.w,
                                                          top: 3.51.h,
                                                          child: InkWell(
                                                            onTap: () {
                                                              Navigator.pop(context);
                                                            },
                                                            child: Container(
                                                                decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Colors.red, border: Border.all(color: Colors.red)),
                                                                padding: EdgeInsets.all(2.w),
                                                                child: Icon(
                                                                  Icons.close_rounded,
                                                                  color: Colors.white,
                                                                )),
                                                          ),
                                                        )
                                                      ],
                                                    );
                                                  },
                                                );
                                              },
                                              child:
                                              ClipRRect(
                                                borderRadius:
                                                BorderRadius.circular(30),
                                                child: Image
                                                    .network(
                                                  chatviewmodal?.data?.livechat?[index].message ??
                                                      "",
                                                  height:
                                                  30.h,
                                                  width:
                                                  70.w,
                                                ),
                                              ),
                                            )),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(
                                              right: 1.h),
                                          child: Text(
                                            chatviewmodal?.data?.livechat?[index].createdAt ?? "",
                                            style: TextStyle(
                                                fontSize:
                                                10.sp,
                                                fontWeight:
                                                FontWeight
                                                    .normal,
                                                fontFamily: "task",
                                                color: Colors
                                                    .white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  )
                                      : Align(
                                    alignment:
                                    Alignment.topLeft,
                                    child: Column(
                                      crossAxisAlignment:
                                      CrossAxisAlignment
                                          .start,
                                      children: [
                                        Container(
                                          margin: EdgeInsets
                                              .symmetric(
                                              horizontal:
                                              1.h,
                                              vertical:
                                              3.w),
                                          alignment: Alignment
                                              .center,
                                          padding: EdgeInsets
                                              .symmetric(
                                            vertical: 1.5.h,
                                          ),
                                          width: 70.w,
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.only(
                                                  topLeft: Radius.circular(
                                                    15,
                                                  ),
                                                  topRight: Radius.circular(
                                                    15,
                                                  ),
                                                  bottomRight: Radius.circular(
                                                    15,
                                                  )),
                                              color: Colors.orange),
                                          child: SizedBox(
                                              width: 60.w,
                                              child: chatviewmodal
                                                  ?.data?.livechat?[index]
                                                  .msgType ==
                                                  "1"
                                                  ? Text(
                                                chatviewmodal?.data?.livechat?[index].message ??
                                                    "",
                                                style: TextStyle(
                                                    fontSize:
                                                    11.sp,
                                                    color: Colors.white,
                                                    fontWeight: FontWeight.normal,
                                                    fontFamily: 'task'),
                                              )
                                                  : InkWell(
                                                onTap:
                                                    () {
                                                  showDialog(
                                                    context:
                                                    context,
                                                    builder:
                                                        (context) {
                                                      return Stack(
                                                        children: [
                                                          Container(
                                                            padding: EdgeInsets.all(4.w),
                                                            margin: EdgeInsets.only(top: 1.h),
                                                            child: ClipRRect(
                                                              borderRadius: BorderRadius.circular(20),
                                                              child: CachedNetworkImage(
                                                                imageUrl: chatviewmodal?.data?.livechat?[index].message ?? "",
                                                                height: 90.h,
                                                                imageBuilder: (context, imageProvider) => Container(
                                                                  decoration: BoxDecoration(
                                                                    image: DecorationImage(
                                                                      image: imageProvider,
                                                                      fit: BoxFit.cover,
                                                                    ),
                                                                  ),
                                                                ),
                                                                placeholder: (context, url) => Center(child: CircularProgressIndicator()),
                                                                errorWidget: (context, url, error) => Icon(Icons.error),
                                                              ),
                                                            ),
                                                          ),
                                                          Positioned(
                                                            left: 83.5.w,
                                                            top: 3.51.h,
                                                            child: InkWell(
                                                              onTap: () {
                                                                Navigator.pop(context);
                                                              },
                                                              child: Container(
                                                                  decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Colors.red, border: Border.all(color: Colors.red)),
                                                                  padding: EdgeInsets.all(2.w),
                                                                  child: Icon(
                                                                    Icons.close_rounded,
                                                                    size: 22.sp,
                                                                    color: Colors.white,
                                                                  )),
                                                            ),
                                                          )
                                                        ],
                                                      );
                                                    },
                                                  );
                                                },
                                                child:
                                                ClipRRect(
                                                  borderRadius:
                                                  BorderRadius.circular(30),
                                                  child:
                                                  Image.network(
                                                    chatviewmodal?.data?.livechat?[index].message ??
                                                        "",
                                                    height:
                                                    30.h,
                                                    width:
                                                    70.w,
                                                  ),
                                                ),
                                              )),
                                        ),
                                        Padding(
                                          padding:
                                          EdgeInsets.only(
                                              left: 1.h),
                                          child: Text(
                                            chatviewmodal?.data?.livechat?[index].createdAt ??
                                                "",
                                            style: TextStyle(
                                                fontSize:
                                                10.sp,
                                                fontWeight:
                                                FontWeight
                                                    .normal,
                                                fontFamily:
                                                "volken",
                                                color: Colors
                                                    .white),
                                          ),
                                        ),
                                      ],
                                    ),
                                  );
                                },
                              ),
                            ),
                          ],
                        ),
                      ),
                      Column(
                        children: [
                          Row(
                            children: [
                              SizedBox(
                                width: 2.w,
                              ),
                              GestureDetector(
                                  onTap: () {
                                    // selectfile();
                                  },
                                  child: Icon(
                                    Icons.attach_file,
                                    size: 23.sp,
                                    color: Colors.orange,
                                  )),
                              SizedBox(
                                width: 2.w,
                              ),
                              Container(
                                alignment: Alignment.center,
                                width: 71.w,
                                height: 7.h,
                                child: TextFormField(
                                  controller: _sendmeasssges,
                                  style: TextStyle(color: Colors.grey),
                                  decoration: InputDecoration(
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(20),
                                        borderSide: BorderSide(color: Colors.grey)
                                    ),
                                    hintText: "Send Message",
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 3.w,
                              ),
                              send1 ? Center(child: Container( height: 5.5.h,
                                width: 12.w,
                                alignment: Alignment.center,
                                decoration: BoxDecoration(
                                  color: Colors.orange,
                                  borderRadius: BorderRadius.circular(10,),
                                ),child:CircularProgressIndicator()
                                ,),):Container(
                                  height: 5.5.h,
                                  width: 12.w,
                                  alignment: Alignment.center,
                                  decoration: BoxDecoration(
                                    color: Colors.orange,
                                    borderRadius: BorderRadius.circular(
                                      10,
                                    ),
                                  ),
                                  child: IconButton(
                                    onPressed: () {
                                      setState(() {
                                        send = true;
                                        send1 = true;
                                        type = 1;
                                      });
                                      _sendmeasssges.text == ''?Fluttertoast.showToast(
                                          msg: "You Can't Send Empty Messages",
                                          toastLength:
                                          Toast.LENGTH_SHORT,
                                          timeInSecForIosWeb: 1,
                                          backgroundColor:
                                          Colors.black,
                                          textColor: Colors.white,
                                          fontSize: 11.sp):"";
                                    },
                                    icon: Icon(
                                      Icons.send,
                                      color: Colors.black,
                                      size: 6.w,
                                    ),
                                  )),
                            ],
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),

              ],
            ),
          ),
          Row(
            children: [
              Expanded(child:Container(
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(25.0),
                    color: Colors.grey.shade100,
                    border: Border.all(color: Colors.grey)
                ),
                child: Row(
                  children: [
                    Expanded(
                      child: TextField(
                          controller: _sendmeasssges,
                          keyboardType: TextInputType.text,
                          decoration: InputDecoration(
                            enabledBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(25.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                )
                            ),
                            hintText: "Message",
                          )
                      ),
                    ),
                    IconButton(onPressed: () async{
                      final ImagePicker picker = ImagePicker();
                      final XFile? photo = await picker.pickImage(source: ImageSource.gallery);
                    },
                        icon: Icon(Icons.attach_file)),
                  ],
                ),
              )),
              (isloading)?CircularProgressIndicator():IconButton(onPressed: () async{
                var msg = _sendmeasssges.text.toString();
              }, icon: Icon(Icons.send)),
            ],
          ),
        ],
      ),
      // body: Stack(
      //   children: [
      //     isLoading
      //         ? Container()
      //         : SingleChildScrollView(
      //       child: Column(
      //         children: [
      //           Container(
      //             width: MediaQuery.of(context).size.width,
      //             height: 78.5.h,
      //             child:
      //             chatviewmodal?.data?.livechat?.length == 0 || chatviewmodal?.data?.livechat?.length == null
      //                 ? Center(
      //                 child: Text(
      //                   "No Message Available",
      //                   style: TextStyle(
      //                       fontFamily: "task",
      //                       fontWeight: FontWeight.bold,
      //                       fontSize: 20.sp,
      //                       color: Colors.black),
      //                 ))
      //                 : Column(
      //               children: [
      //                 Container(
      //                   width:
      //                   MediaQuery.of(context).size.width,
      //                   height: 77.h,
      //                   child: ListView.builder(
      //                     shrinkWrap: true,
      //                     reverse: false,
      //                     itemCount:  chatviewmodal?.data?.livechat?.length,
      //                     itemBuilder: (context, index) {
      //                       return chatviewmodal
      //                           ?.data?.livechat?[index].msgType == "1"
      //                           ? Align(
      //                         alignment: Alignment.topRight,
      //                         child: Column(
      //                           crossAxisAlignment: CrossAxisAlignment.end,
      //                           children: [
      //                             Container(
      //                                 margin: EdgeInsets
      //                                     .symmetric(
      //                                     horizontal:
      //                                     1.h,
      //                                     vertical:
      //                                     3.w),
      //                                 alignment: Alignment
      //                                     .centerLeft,
      //                                 padding: EdgeInsets
      //                                     .symmetric(
      //                                     horizontal:
      //                                     1.h,
      //                                     vertical:
      //                                     3.w),
      //                                 width: 70.w,
      //                                 decoration:
      //                                 BoxDecoration(
      //                                   borderRadius: BorderRadius
      //                                       .only(
      //                                       topLeft:
      //                                       Radius
      //                                           .circular(
      //                                         15,
      //                                       ),
      //                                       topRight:
      //                                       Radius
      //                                           .circular(
      //                                         15,
      //                                       ),
      //                                       bottomLeft:
      //                                       Radius.circular(
      //                                         15,
      //                                       )),
      //                                   color: Colors.orange.shade700,
      //                                 ),
      //                                 child: chatviewmodal
      //                                     ?.data?.livechat?[
      //                                 index]
      //                                     .msgType ==
      //                                     "1"
      //                                     ? Text(
      //                                   chatviewmodal
      //                                       ?.data?.livechat?[index]
      //                                       .message ??
      //                                       "",
      //                                   style: TextStyle(
      //                                       fontSize: 12
      //                                           .sp,
      //                                       color: Colors
      //                                           .black,
      //                                       fontWeight: FontWeight
      //                                           .bold,
      //                                       fontFamily:
      //                                       'task'),
      //                                 )
      //                                     : InkWell(
      //                                   onTap:
      //                                       () {
      //                                     showDialog(
      //                                       context:
      //                                       context,
      //                                       builder:
      //                                           (context) {
      //                                         return Stack(
      //                                           children: [
      //                                             Container(
      //                                               padding: EdgeInsets.all(4.w),
      //                                               margin: EdgeInsets.only(top: 1.h),
      //                                               child: ClipRRect(
      //                                                 borderRadius: BorderRadius.circular(20),
      //                                                 child: CachedNetworkImage(
      //                                                   imageUrl: chatviewmodal?.data?.livechat?[index].message ?? "",
      //                                                   height: 77.h,
      //                                                   imageBuilder: (context, imageProvider) => Container(
      //                                                     decoration: BoxDecoration(
      //                                                       image: DecorationImage(
      //                                                         image: imageProvider,
      //                                                         fit: BoxFit.cover,
      //                                                       ),
      //                                                     ),
      //                                                   ),
      //                                                   placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      //                                                   errorWidget: (context, url, error) => Icon(Icons.error),
      //                                                 ),
      //                                               ),
      //                                             ),
      //                                             Positioned(
      //                                               left: 84.5.w,
      //                                               top: 3.51.h,
      //                                               child: InkWell(
      //                                                 onTap: () {
      //                                                   Navigator.pop(context);
      //                                                 },
      //                                                 child: Container(
      //                                                     decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Colors.red, border: Border.all(color: Colors.red)),
      //                                                     padding: EdgeInsets.all(2.w),
      //                                                     child: Icon(
      //                                                       Icons.close_rounded,
      //                                                       color: Colors.white,
      //                                                     )),
      //                                               ),
      //                                             )
      //                                           ],
      //                                         );
      //                                       },
      //                                     );
      //                                   },
      //                                   child:
      //                                   ClipRRect(
      //                                     borderRadius:
      //                                     BorderRadius.circular(30),
      //                                     child: Image
      //                                         .network(
      //                                       chatviewmodal?.data?.livechat?[index].message ??
      //                                           "",
      //                                       height:
      //                                       30.h,
      //                                       width:
      //                                       70.w,
      //                                     ),
      //                                   ),
      //                                 )),
      //                             Padding(
      //                               padding:
      //                               EdgeInsets.only(
      //                                   right: 1.h),
      //                               child: Text(
      //                       chatviewmodal?.data?.livechat?[index].createdAt ?? "",
      //                                 style: TextStyle(
      //                                     fontSize:
      //                                     10.sp,
      //                                     fontWeight:
      //                                     FontWeight
      //                                         .normal,
      //                                     fontFamily: "task",
      //                                     color: Colors
      //                                         .white),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       )
      //                           : Align(
      //                         alignment:
      //                         Alignment.topLeft,
      //                         child: Column(
      //                           crossAxisAlignment:
      //                           CrossAxisAlignment
      //                               .start,
      //                           children: [
      //                             Container(
      //                               margin: EdgeInsets
      //                                   .symmetric(
      //                                   horizontal:
      //                                   1.h,
      //                                   vertical:
      //                                   3.w),
      //                               alignment: Alignment
      //                                   .center,
      //                               padding: EdgeInsets
      //                                   .symmetric(
      //                                 vertical: 1.5.h,
      //                               ),
      //                               width: 70.w,
      //                               decoration: BoxDecoration(
      //                                   borderRadius: BorderRadius.only(
      //                                       topLeft: Radius.circular(
      //                                         15,
      //                                       ),
      //                                       topRight: Radius.circular(
      //                                         15,
      //                                       ),
      //                                       bottomRight: Radius.circular(
      //                                         15,
      //                                       )),
      //                                   color: Colors.orange),
      //                               child: SizedBox(
      //                                   width: 60.w,
      //                                   child: chatviewmodal
      //                                       ?.data?.livechat?[index]
      //                                       .msgType ==
      //                                       "1"
      //                                       ? Text(
      //                                     chatviewmodal?.data?.livechat?[index].message ??
      //                                         "",
      //                                     style: TextStyle(
      //                                         fontSize:
      //                                         11.sp,
      //                                         color: Colors.white,
      //                                         fontWeight: FontWeight.normal,
      //                                         fontFamily: 'task'),
      //                                   )
      //                                       : InkWell(
      //                                     onTap:
      //                                         () {
      //                                       showDialog(
      //                                         context:
      //                                         context,
      //                                         builder:
      //                                             (context) {
      //                                           return Stack(
      //                                             children: [
      //                                               Container(
      //                                                 padding: EdgeInsets.all(4.w),
      //                                                 margin: EdgeInsets.only(top: 1.h),
      //                                                 child: ClipRRect(
      //                                                   borderRadius: BorderRadius.circular(20),
      //                                                   child: CachedNetworkImage(
      //                                                     imageUrl: chatviewmodal?.data?.livechat?[index].message ?? "",
      //                                                     height: 90.h,
      //                                                     imageBuilder: (context, imageProvider) => Container(
      //                                                       decoration: BoxDecoration(
      //                                                         image: DecorationImage(
      //                                                           image: imageProvider,
      //                                                           fit: BoxFit.cover,
      //                                                         ),
      //                                                       ),
      //                                                     ),
      //                                                     placeholder: (context, url) => Center(child: CircularProgressIndicator()),
      //                                                     errorWidget: (context, url, error) => Icon(Icons.error),
      //                                                   ),
      //                                                 ),
      //                                               ),
      //                                               Positioned(
      //                                                 left: 83.5.w,
      //                                                 top: 3.51.h,
      //                                                 child: InkWell(
      //                                                   onTap: () {
      //                                                     Navigator.pop(context);
      //                                                   },
      //                                                   child: Container(
      //                                                       decoration: BoxDecoration(borderRadius: BorderRadius.circular(90), color: Colors.red, border: Border.all(color: Colors.red)),
      //                                                       padding: EdgeInsets.all(2.w),
      //                                                       child: Icon(
      //                                                         Icons.close_rounded,
      //                                                         size: 22.sp,
      //                                                         color: Colors.white,
      //                                                       )),
      //                                                 ),
      //                                               )
      //                                             ],
      //                                           );
      //                                         },
      //                                       );
      //                                     },
      //                                     child:
      //                                     ClipRRect(
      //                                       borderRadius:
      //                                       BorderRadius.circular(30),
      //                                       child:
      //                                       Image.network(
      //                                         chatviewmodal?.data?.livechat?[index].message ??
      //                                             "",
      //                                         height:
      //                                         30.h,
      //                                         width:
      //                                         70.w,
      //                                       ),
      //                                     ),
      //                                   )),
      //                             ),
      //                             Padding(
      //                               padding:
      //                               EdgeInsets.only(
      //                                   left: 1.h),
      //                               child: Text(
      //                                 chatviewmodal?.data?.livechat?[index].createdAt ??
      //                                     "",
      //                                 style: TextStyle(
      //                                     fontSize:
      //                                     10.sp,
      //                                     fontWeight:
      //                                     FontWeight
      //                                         .normal,
      //                                     fontFamily:
      //                                     "volken",
      //                                     color: Colors
      //                                         .white),
      //                               ),
      //                             ),
      //                           ],
      //                         ),
      //                       );
      //                     },
      //                   ),
      //                 ),
      //               ],
      //             ),
      //           ),
      //           Column(
      //             children: [
      //               Row(
      //                 children: [
      //                   SizedBox(
      //                     width: 2.w,
      //                   ),
      //                   GestureDetector(
      //                       onTap: () {
      //                         // selectfile();
      //                       },
      //                       child: Icon(
      //                         Icons.attach_file,
      //                         size: 23.sp,
      //                         color: Colors.orange,
      //                       )),
      //                   SizedBox(
      //                     width: 2.w,
      //                   ),
      //                   Container(
      //                     alignment: Alignment.center,
      //                     width: 71.w,
      //                     height: 7.h,
      //                     child: TextFormField(
      //                       controller: _sendmeasssges,
      //                       style: TextStyle(color: Colors.grey),
      //                       decoration: InputDecoration(
      //                         border: OutlineInputBorder(
      //                           borderRadius: BorderRadius.circular(20),
      //                           borderSide: BorderSide(color: Colors.grey)
      //                         ),
      //                         hintText: "Send Message",
      //                       ),
      //                     ),
      //                   ),
      //                   SizedBox(
      //                     width: 3.w,
      //                   ),
      //                   send1 ? Center(child: Container( height: 5.5.h,
      //                     width: 12.w,
      //                     alignment: Alignment.center,
      //                     decoration: BoxDecoration(
      //                       color: Colors.orange,
      //                       borderRadius: BorderRadius.circular(10,),
      //                     ),child:CircularProgressIndicator()
      //                     ,),):Container(
      //                       height: 5.5.h,
      //                       width: 12.w,
      //                       alignment: Alignment.center,
      //                       decoration: BoxDecoration(
      //                         color: Colors.orange,
      //                         borderRadius: BorderRadius.circular(
      //                           10,
      //                         ),
      //                       ),
      //                       child: IconButton(
      //                         onPressed: () {
      //                           setState(() {
      //                             send = true;
      //                             send1 = true;
      //                             type = 1;
      //                           });
      //                           _sendmeasssges.text == ''?Fluttertoast.showToast(
      //                               msg: "You Can't Send Empty Messages",
      //                               toastLength:
      //                               Toast.LENGTH_SHORT,
      //                               timeInSecForIosWeb: 1,
      //                               backgroundColor:
      //                               Colors.black,
      //                               textColor: Colors.white,
      //                               fontSize: 11.sp):"";
      //                         },
      //                         icon: Icon(
      //                           Icons.send,
      //                           color: Colors.black,
      //                           size: 6.w,
      //                         ),
      //                       )),
      //                 ],
      //               ),
      //               SizedBox(
      //                 height: 1.5.h,
      //               ),
      //             ],
      //           ),
      //         ],
      //       ),
      //     ),
      //
      //     // today text
      //     // Row(
      //     //   mainAxisAlignment: MainAxisAlignment.center,
      //     //   children: [
      //     //     Container(
      //     //       padding: EdgeInsets.symmetric(vertical: 0.5.h, horizontal: 4.w),
      //     //       decoration: BoxDecoration(
      //     //         borderRadius: BorderRadius.circular(900),
      //     //         color: Colors.blue.withOpacity(0.3),
      //     //       ),
      //     //       child: Text(
      //     //         'vayo ja batli',
      //     //         style: TextStyle(
      //     //           fontFamily: 'volken',
      //     //           color: Colors.black,
      //     //           fontWeight: FontWeight.bold,
      //     //           fontSize: 12.5.sp,
      //     //           letterSpacing: 1,
      //     //         ),
      //     //       ),
      //     //     ),
      //     //   ],
      //     // )
      //   ],
      // ),

    );
  }
  // selectfile() {
  //   AlertDialog alert = AlertDialog(
  //     elevation: 0,
  //     alignment: Alignment.center,
  //     backgroundColor: Colors.orange.shade100,
  //     shape: RoundedRectangleBorder(
  //       borderRadius: BorderRadius.circular(10),
  //     ),
  //     actions: [
  //       Column(
  //         children: [
  //           SizedBox(
  //             height: 2.h,
  //           ),
  //           Row(
  //             mainAxisAlignment: MainAxisAlignment.spaceAround,
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Column(
  //                 children: [
  //                   IconButton(
  //                       onPressed: () async {
  //                         type = 2;
  //                         XFile? photo = await _picker.pickImage(
  //                             source: ImageSource.camera);
  //                         setState(() {
  //                           _pickedFile = File(photo!.path);
  //                           print(_pickedFile);
  //                           type = 2;
  //                         });
  //                         sendapitypevali();
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon: Icon(
  //                         Icons.camera_alt,
  //                         size: 20.sp,
  //                         color: Colors.black,
  //                       )),
  //                   Text(
  //                     "Camera",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 15.sp,
  //                         fontFamily: "task",
  //                         fontWeight: FontWeight.bold),
  //                   )
  //                 ],
  //               ),
  //               Column(
  //                 children: [
  //                   IconButton(
  //                       onPressed: () async {
  //                         XFile? photo = await _picker.pickImage(
  //                             source: ImageSource.gallery);
  //                         _pickedFile = File(photo!.path);
  //                         setState(() {
  //                           _pickedFile = File(photo!.path);
  //                           type = 2;
  //                         });
  //                         sendapitypevali();
  //                         Navigator.of(context).pop();
  //                       },
  //                       icon: Icon(
  //                         Icons.browse_gallery,
  //                         size: 20.sp,
  //                         color: primary,
  //                       )),
  //                   Text(
  //                     "Gallery",
  //                     style: TextStyle(
  //                         color: Colors.white,
  //                         fontSize: 15.sp,
  //                         fontFamily: "task",
  //                         fontWeight: FontWeight.bold),
  //                   ),
  //                 ],
  //               ),
  //             ],
  //           ),
  //         ],
  //       ),
  //     ],
  //   );
  //   showDialog(
  //       context: context,
  //       builder: (context) {
  //         return alert;
  //       });
  // }
  Chatmessageapi() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Chatapi(usermodal?.userId ?? "",widget.orderId,"6").then((response) async {
          chatviewmodal = ChatModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && chatviewmodal?.status == 1) {
            print("Live chat Sucessfully");
            if (mounted)
              setState(() {
                isloading = false;
              });
          } else {
            setState(() {
              isloading = false;
            });
          }
        });
      } else {
        setState(() {
          isloading = false;
        });
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }
}
