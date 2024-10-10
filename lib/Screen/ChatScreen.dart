import 'dart:async';
import 'dart:convert';
import 'dart:io';


import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/ChatModel.dart';
import 'package:ecommerce/Modal/SendmsgModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:flutter_easyloading/flutter_easyloading.dart';
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
        toolbarHeight: 70,
        title: Row(
          children: [
            CircleAvatar(
              backgroundColor: Color(0xff0061b0),
              child: Icon(Icons.person_outline,color: Colors.white,),
            ),
            SizedBox(width: 10.0,),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text("Pharmaxy Support",style: TextStyle(
                      fontSize: 15.0,
                      fontWeight: FontWeight.bold,
                      fontFamily: "task"
                  ),
                  ),
                  Text("Order ID (${widget.orderId})",style: TextStyle(
                      fontSize: 13.0,
                      fontFamily: "task"
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
              child: chatviewmodal?.data?.livechat?.length == 0 || chatviewmodal?.data?.livechat?.length == null ?
              Center(
                child: Text("No Message Available",style: TextStyle(
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                    fontSize: 15.sp,
                    color: Colors.black
                ),),
              ):ListView.builder(
                reverse: true,
                itemCount: chatviewmodal?.data?.livechat?.length,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      chatviewmodal?.data?.livechat?[index].senderId == usermodal?.userId ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          chatviewmodal?.data?.livechat?[index].msgType=="1"?Text(
                            chatviewmodal?.data?.livechat?[index].createdAt == "" || chatviewmodal
                                ?.data
                                ?.livechat?[
                            index]
                                .createdAt ==
                                null
                                ? "N/A"
                                : chatviewmodal
                                ?.data
                                ?.livechat?[index]
                                .createdAt ??
                                '',
                            style: TextStyle(
                                fontSize: 13,
                                fontFamily: "task"
                            ),
                          ):Container(
                            child: CachedNetworkImage(
                              imageUrl: chatviewmodal?.data?.livechat?[index].message??'',
                              width: 30.w,
                              height: 30.h,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return Icon(Icons.error_rounded);
                              },
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Container(
                            alignment:
                            Alignment.centerRight,
                            margin: EdgeInsets.symmetric(
                                vertical: 1.h),
                            width: 40.w,
                            height: 5.h,
                            padding: EdgeInsets.only(right: 3.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                              BorderRadius.only(
                                bottomRight:
                                Radius.circular(7.w),
                                bottomLeft:
                                Radius.circular(7.w),
                                topLeft:
                                Radius.circular(7.w),
                              ),
                            ),
                            child: Text(
                              chatviewmodal
                                  ?.data
                                  ?.livechat?[index]
                                  .message ==
                                  "" ||
                                  chatviewmodal
                                      ?.data
                                      ?.livechat?[
                                  index]
                                      .message ==
                                      null
                                  ? "N/A"
                                  : chatviewmodal
                                  ?.data
                                  ?.livechat?[index]
                                  .message ??
                                  "",
                              style: TextStyle(
                                  fontFamily: "task",
                                  fontSize: 12,
                                  color: Colors.white
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          ClipRRect(
                            borderRadius: BorderRadius.circular(2000.w),
                            child: CachedNetworkImage(
                              imageUrl: chatviewmodal?.data?.loginUser?.userProfile ?? "",
                              width: 12.w,
                              height: 12.w,
                              fit: BoxFit.cover,
                              errorWidget: (context, url, error) {
                                return Icon(Icons.error_rounded,);
                              },
                              imageBuilder: (context,
                                  imageProvider) {
                                return Image(
                                  image:
                                  imageProvider,
                                  width: 12.w,
                                  height: 12.w,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                        ],
                      ) : Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(
                                2000.w),
                            child: CachedNetworkImage(
                              imageUrl:
                              chatviewmodal?.data?.chatUser?.userProfile ??
                                  "",
                              width: 12.w,
                              height: 12.w,
                              fit: BoxFit.cover,
                              errorWidget: (context,
                                  url, error) {
                                return Icon(Icons.error_rounded);
                              },
                              imageBuilder: (context,
                                  imageProvider) {
                                return Image(
                                  image:
                                  imageProvider,
                                  width: 12.w,
                                  height: 12.w,
                                  fit: BoxFit.cover,
                                );
                              },
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Container(
                            alignment:
                            Alignment.centerLeft,
                            margin: EdgeInsets.symmetric(
                                vertical: 1.h),
                            width: 40.w,
                            height:5.h,
                            padding: EdgeInsets.only(left: 3.w),
                            decoration: BoxDecoration(
                              color: AppColors.primary,
                              borderRadius:
                              BorderRadius.only(
                                topRight:
                                Radius.circular(7.w),
                                bottomLeft:
                                Radius.circular(7.w),
                                bottomRight:
                                Radius.circular(7.w),
                              ),
                            ),
                            child: chatviewmodal?.data?.livechat?[index].msgType=="1"?Text(
                              chatviewmodal
                                  ?.data
                                  ?.livechat?[
                              index]
                                  .message ==
                                  null ||
                                  chatviewmodal
                                      ?.data
                                      ?.livechat?[
                                  index]
                                      .message ==
                                      ""
                                  ? "N/A"
                                  : chatviewmodal
                                  ?.data
                                  ?.livechat?[index]
                                  .message ??
                                  '',
                              style: TextStyle(
                                color: Colors.white,
                                fontFamily: "task",
                                fontSize: 12.0,

                              ),
                            ):Container(
                              child: CachedNetworkImage(
                                imageUrl: chatviewmodal?.data?.livechat?[index].message??'',
                                width: 30.w,
                                height: 30.h,
                                fit: BoxFit.cover,
                                errorWidget: (context, url, error) {
                                  return Icon(Icons.error_rounded);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            width: 1.w,
                          ),
                          Text(
                            chatviewmodal
                                ?.data
                                ?.livechat?[
                            index]
                                .createdAt ==
                                null ||
                                chatviewmodal
                                    ?.data
                                    ?.livechat?[
                                index]
                                    .createdAt ==
                                    ""
                                ? "N/A"
                                : chatviewmodal
                                ?.data
                                ?.livechat?[index]
                                .createdAt ??
                                '',
                            style: TextStyle(
                              fontSize: 13.0,
                              fontFamily: "task",
                            ),
                          ),
                        ],
                      )
                    ],
                  );
                },
              )
          ),
          Row(
            children: [
              Expanded(child:Container(
                height: 7.h,
                width: MediaQuery.of(context).size.width,
                margin: EdgeInsets.all(10.0),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(11.0),
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
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                )
                            ),
                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(11.0),
                                borderSide: BorderSide(
                                  color: Colors.grey.shade100,
                                )
                            ),
                            hintText: "Message",
                          )
                      ),
                    ),
                    IconButton(onPressed: () async{
                      selectfile();
                      SendMessages();
                    },
                        icon: Icon(Icons.attach_file,size: 17.sp,color: AppColors.primary,)),
                  ],
                ),
              )),
              (isloading)?CircularProgressIndicator():IconButton(onPressed: () async{
                var msg = _sendmeasssges.text.toString();
                if( _sendmeasssges.text == ''|| _sendmeasssges.text == null){
                  Fluttertoast.showToast(
                      msg: "You Can't Send Empty Messages",
                      toastLength:
                      Toast.LENGTH_SHORT,
                      timeInSecForIosWeb: 1,
                      backgroundColor:
                      AppColors.primary,
                      textColor: Colors.white,
                      fontSize: 10.sp
                  );
                }
                else{
                  SendMessages();
                }
              }, icon: Icon(Icons.send,color: AppColors.primary,)),
            ],
          ),
        ],
      ),

    );
  }


  selectfile() {
    AlertDialog alert = AlertDialog(
      elevation: 0,
      alignment: Alignment.center,
      backgroundColor: Colors.grey.shade100,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(10),
      ),
      actions: [
        Column(
          children: [
            SizedBox(
              height: 2.h,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          type = 2;
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.camera);
                          setState(() {
                            _pickedFile = File(photo!.path);
                            print(_pickedFile);
                            type = 2;
                          });
                          SendMessages();
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.camera_alt,
                          size: 15.sp,
                          color: Color(0xff0061b0),
                        )),
                    Text(
                      "Camera",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                Column(
                  children: [
                    IconButton(
                        onPressed: () async {
                          XFile? photo = await _picker.pickImage(
                              source: ImageSource.gallery);
                          _pickedFile = File(photo!.path);
                          setState(() {
                            _pickedFile = File(photo!.path);
                            type = 2;
                          });
                          SendMessages();
                          Navigator.of(context).pop();
                        },
                        icon: Icon(
                          Icons.browse_gallery,
                          size: 15.sp,
                          color: Color(0xff0061b0),
                        )),
                    Text(
                      "Gallery",
                      style: TextStyle(
                          color: Colors.black,
                          fontSize: 13.sp,
                          fontFamily: "task",
                          fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ],
    );
    showDialog(
        context: context,
        builder: (context) {
          return alert;
        });
  }
  Chatmessageapi() {
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().Chatapi(usermodal?.userId ?? "","6",widget.orderId,).then((response) async {
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
  SendMessages() {
    final Map<String, String> data = {};
    data['mType'] = type == 1 ? "1" : "2";
    data['textMsg'] = type == 1 ? _sendmeasssges.text.toString() : _pickedFile?.path ?? '';
    data['order_id']= widget.orderId;
    print(data);
    print("adfdsfdsfdsf${data}");
    checkInternet().then((internet) async {
      if (internet) {
        authprovider()
            .sendmessgesapi(usermodal?.userId ?? "",adminID,widget.orderId, data)
            .then((response) async {
          sendmessagesmodal = SendMessage.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && sendmessagesmodal?.status == 1) {
            Chatmessageapi();
            EasyLoading.showSuccess('Message Sent Successfully');
            FocusScope.of(context).unfocus;
            setState(() {
              _sendmeasssges.clear();
            });
          } else {
            print("response${response.body}");

          }
        });
      } else {
        buildErrorDialog(context, 'Error', "Internet Required");
      }
    });
  }


}
