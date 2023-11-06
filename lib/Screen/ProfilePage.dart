import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/EditProfile.dart';
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

      bottomNavigationBar: bottombar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Column(
              children: [
                Container(
                  alignment: Alignment.bottomRight,
                  decoration: BoxDecoration(
                    borderRadius:
                        BorderRadius.only(bottomLeft: Radius.circular(100)),
                    color: Color(0xfff7941d),
                  ),
                  height: 37.h,
                  width: double.infinity,
                  child: Padding(
                    padding: EdgeInsets.only(right: 9.w, bottom: 2.h),
                    // child: Text("My Profile",style: TextStyle(
                    //     fontWeight: FontWeight.bold,
                    //     fontFamily: 'task',
                    //     fontSize: 30.sp,
                    //     color: Colors.white io9o
                    // ),),
                  ),
                ),
                SizedBox(
                  height: 6.h,
                ),
                SizedBox(
                  width: 90.w,
                  child: Row(
                    children: [
                      Icon(
                        Icons.people,
                        size: 27,
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
                                  fontSize: 22,
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
                                  fontSize: 24),
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
                        size: 27,
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
                                    fontSize: 22,
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
                                  fontSize: 23),
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
                        size: 27,
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
                                  fontSize: 22,
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
                                  fontSize: 24),
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
                        borderRadius: BorderRadius.circular(30),
                        color: Color(0xfff7941d)),
                    child: Text(
                      "Edit Profile",
                      style: TextStyle(
                        fontSize: 20.5.sp,
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
              top: 15.h,
              right: 5.w,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 25),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      width: 25.5.w,
                      height: 25.5.w,
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
                    SizedBox(
                      width: 200,
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            height: 1.h,
                          ),
                          Row(
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
                                    fontSize: 18.sp,
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
                                    fontSize: 18.sp,
                                    fontWeight: FontWeight.bold,
                                    fontFamily: "task",
                                    color: Colors.white),
                              ),
                            ],
                          ),
                          Text(
                            profilemodal?.profileDetails?.userEmail == '' ||
                                    profilemodal?.profileDetails?.userEmail ==
                                        null
                                ? 'N/A'
                                : profilemodal?.profileDetails?.userEmail ?? '',
                            style: TextStyle(
                              fontSize: 18.sp,
                              fontWeight: FontWeight.normal,
                              fontFamily: "task",
                              color: Colors.white,
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
              top: 4.h,
              right: 88.w,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                      icon: Icon(
                        Icons.arrow_back_ios_new_outlined,
                        color: Colors.white,
                        size: 25.sp,
                      )),
                ],
              ),
            ),
            Positioned(
              top: 4.4.h,
              right: 32.w,
              child: Text(
                "My Profile",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontFamily: 'task',
                  fontSize: 22.sp,
                  color: Colors.white,
                ),
              ),
            ),
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
