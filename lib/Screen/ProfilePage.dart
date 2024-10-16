import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/EditProfile.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Modal/ProfileModal.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});

  @override
  State<ProfilePage> createState() => _ProfilePageState();
}
bool isLoading = true;

class _ProfilePageState extends State<ProfilePage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    viewap();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottombar(selected: 5,),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(50),),
                    color:Color(0xff0061b0),
                  ),
                  height: 30.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(right: 9.w, bottom: 2.h),
                  ),
                ),
                SizedBox(
                  height: 5.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 24,
                        color: Colors.black.withOpacity(0.6),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 75.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Gender",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18,
                                  fontFamily: "task"),
                            ),
                            Text(
                              profilemodal?.profileDetails?.userGander == '' ||
                                      profilemodal
                                              ?.profileDetails?.userGander ==
                                          null
                                  ? 'N/A'
                                  : profilemodal?.profileDetails?.userGander ??
                                      '',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "task",
                                  fontSize: 16),
                            ),
                            Divider(
                              endIndent: 10,
                              indent: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.phone,
                        size: 24,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 75.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text("Phone",
                                style: TextStyle(
                                    color: Colors.black.withOpacity(0.6),
                                    fontSize: 18,
                                    fontFamily: "task")),
                            Text(
                              profilemodal?.profileDetails?.userPhone == '' ||
                                      profilemodal?.profileDetails?.userPhone ==
                                          null
                                  ? 'N/A'
                                  : profilemodal?.profileDetails?.userPhone ??
                                      '',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "task",
                                  fontSize: 16),
                            ),
                            Divider(
                              endIndent: 10,
                              indent: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.location_on,
                        size: 24,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                      Container(
                        width: 75.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Address",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18,
                                  fontFamily: "task"),
                            ),
                            Text(
                              profilemodal?.profileDetails?.userAddress == '' ||
                                      profilemodal
                                              ?.profileDetails?.userAddress ==
                                          null
                                  ? 'N/A'
                                  : profilemodal?.profileDetails?.userAddress ??
                                      '',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "task",
                                  fontSize: 16),
                            ),
                            Divider(
                              endIndent: 10,
                              indent: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),

                SizedBox(
                  height: 3.h,
                ),
                profilemodal?.profileDetails?.referCode == '' ||
                    profilemodal
                        ?.profileDetails?.referCode ==
                        null
                    ? Container():   SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.qr_code_scanner,
                        size: 24,
                        color: Colors.black.withOpacity(0.4),
                      ),
                      SizedBox(
                        width: 3.w,
                      ),
                   Container(
                        width: 75.w,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "Referred Code",
                              style: TextStyle(
                                  color: Colors.black.withOpacity(0.6),
                                  fontSize: 18,
                                  fontFamily: "task"),
                            ),
                            Text(
                              profilemodal?.profileDetails?.referCode == '' ||
                                  profilemodal
                                      ?.profileDetails?.referCode ==
                                      null
                                  ? 'N/A'
                                  : profilemodal?.profileDetails?.referCode ??
                                  '',
                              style: TextStyle(
                                  color: Colors.black87,
                                  fontFamily: "task",
                                  fontSize: 16),
                            ),
                            Divider(
                              endIndent: 10,
                              indent: 1,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                SizedBox(
                  height: 3.h,
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushReplacement(
                        MaterialPageRoute(builder: (context) => EditProfile()));
                  },
                  child: Container(
                    width: 75.w,
                    margin: EdgeInsets.only(right: 7.w, left: 7.w),
                    alignment: Alignment.center,
                    height: 6.h,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: Color(0xff0061b0)),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 12.0.sp,
                        color: Colors.white,
                        fontWeight: FontWeight.bold,
                        fontFamily: "task",
                      ),
                    ),
                  ),
                ),
              ],
            ),
            Positioned(
              top: 13.h,
              right: 4.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 23.w,
                      height: 23.5.w,
                      decoration: BoxDecoration(
                          border: Border.all(width: 4, color: Colors.white),
                          borderRadius: BorderRadius.circular(100),
                          color: Colors.white),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(150),
                        child: CachedNetworkImage(
                          imageUrl:
                              profilemodal?.profileDetails?.profileimage ?? '',
                          imageBuilder: (context, imageProvider) => Container(
                            decoration: BoxDecoration(
                              image: DecorationImage(
                                image: imageProvider,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                          placeholder: (context, url) =>
                              CircularProgressIndicator(),
                          errorWidget: (context, url, error) =>
                              Icon(Icons.error),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 3.w,
                    ),
                    Container(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 2.w),
                            child: Row(
                              children: [
                                Text(
                                  profilemodal?.profileDetails?.userFirstName ==
                                              '' ||
                                          profilemodal?.profileDetails
                                                  ?.userFirstName ==
                                              null
                                      ? 'N/A'
                                      : profilemodal
                                              ?.profileDetails?.userFirstName ??
                                          '',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "task",
                                      color: Colors.white),
                                ),
                                SizedBox(
                                  width: 2.w,
                                ),
                                Text(
                                  profilemodal?.profileDetails?.userLastName ==
                                              '' ||
                                          profilemodal?.profileDetails
                                                  ?.userLastName ==
                                              null
                                      ? 'N/A'
                                      : profilemodal
                                              ?.profileDetails?.userLastName ??
                                          '',
                                  style: TextStyle(
                                      fontSize: 13.sp,
                                      fontWeight: FontWeight.bold,
                                      fontFamily: "task",
                                      color: Colors.white),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:  EdgeInsets.only(left: 8.0),
                            child: Text(
                              profilemodal?.profileDetails?.userEmail == '' ||
                                      profilemodal?.profileDetails?.userEmail ==
                                          null
                                  ? 'N/A'
                                  : profilemodal?.profileDetails?.userEmail ?? '',
                              style: TextStyle(
                                fontSize: 13.sp,
                                fontWeight: FontWeight.w500,
                                fontFamily: "task",
                                color: Colors.white,
                              ),
                            ),
                          )
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Positioned(
              top: 5.h,
              right: 83.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).push(
                            MaterialPageRoute(builder: (context) => HomePage(sel: 1)));
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 20.sp,
                      )
                  ),
                ],
              ),
            ),
            Positioned(
              top: 6.h,
              right: 37.w,
              child: Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'task',
                  fontSize: 14.sp,
                  color: Colors.white,
                ),
              ),
            ),
            profilemodal?.profileDetails?.referType =="1"?Positioned(
              top: 25.h,
              right: 4.w,
              child: Container(
                padding: EdgeInsets.symmetric(vertical: 0.5.h,horizontal: 2.w),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: Colors.white
                ),
                child: Text(
                  "Referred User",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontFamily: 'task',
                    fontSize: 11.sp,
                    color: AppColors.primary,
                  ),
                ),
              ),
            ):Container(),
          ],
        ),
      ),
    );
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
}
