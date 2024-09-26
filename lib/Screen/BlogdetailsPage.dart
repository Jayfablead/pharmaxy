import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/RecentBlogModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/BlocdetailModel.dart';
import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';

class Blogdetailspage extends StatefulWidget {
  String id = "";
  String iteamid = "";

  Blogdetailspage({required this.id,required this.iteamid});

  @override
  State<Blogdetailspage> createState() => _BlogdetailspageState();
}

class _BlogdetailspageState extends State<Blogdetailspage> {
  bool isLoading = true;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    blogdetailap();
    recentblog();
  }

  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w),
          child: CustomScrollView(
            slivers: [
              isLoading
                  ? SliverToBoxAdapter(
                      child: Container()) // A placeholder when loading
                  : SliverPadding(
                      padding: EdgeInsets.symmetric(),
                      sliver: SliverList(
                        delegate: SliverChildListDelegate(
                          [
                            SizedBox(
                              height: 3.h,
                            ),
                            // APP BAR
                            Container(
                              width: MediaQuery.of(context).size.width,
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  IconButton(
                                    onPressed: () {
                                      Navigator.pushReplacement(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) =>
                                              HomePage(sel: 1),
                                        ),
                                      );
                                    },
                                    icon: Icon(
                                      Icons.arrow_back_ios_new_outlined,
                                      size: 17.sp,
                                    ),
                                  ),
                                  Text(
                                    "Blog Details",
                                    style: TextStyle(
                                      fontSize: 13.sp,
                                      fontFamily: "task",
                                      fontWeight: FontWeight.bold,
                                    ),
                                  ),
                                  IconButton(
                                    onPressed: () {},
                                    icon: Icon(null),
                                  ),
                                ],
                              ),
                            ),
                            SizedBox(
                              height: 1.h,
                            ),
                          ],
                        ),
                      ),
                    ),
              SliverPadding(
                padding: EdgeInsets.symmetric(horizontal: 1.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                    (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            width: MediaQuery.of(context).size.width,
                            height: 25.h,
                            child: CachedNetworkImage(
                              imageUrl:
                                  blocdetailsModal?.data?[index].image ?? "",
                              width: MediaQuery.of(context).size.width,
                              height: 30.h,
                              fit: BoxFit.cover,
                              placeholder: (context, url) {
                                return Icon(Icons.error_rounded,
                                    color: Colors.blue);
                              },
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Text(
                              blocdetailsModal?.data?[index].title?.isEmpty ??
                                      true
                                  ? "N/A"
                                  : blocdetailsModal?.data?[index].title ?? "",
                              style: TextStyle(
                                fontFamily: "task",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: Text(
                              blocdetailsModal
                                          ?.data?[index].createdAt?.isEmpty ??
                                      true
                                  ? "N/A"
                                  : blocdetailsModal?.data?[index].createdAt ??
                                      "",
                              style: TextStyle(
                                fontFamily: "task",
                                fontSize: 11.sp,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Padding(
                            padding: EdgeInsets.only(left: 4.w),
                            child: ReadMoreText(
                              blocdetailsModal
                                          ?.data?[index].description?.isEmpty ??
                                      true
                                  ? "N/A"
                                  : blocdetailsModal
                                          ?.data?[index].description ??
                                      "",
                              trimLines: 3,
                              trimMode: TrimMode.Line,
                              style: TextStyle(
                                fontFamily: "task",
                                fontSize: 12.sp,
                                fontWeight: FontWeight.bold,
                                color: Colors.grey,
                              ),
                              trimCollapsedText: ' Show more',
                              trimExpandedText: ' Show less',
                              lessStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'task',
                                color: Color(0xff0061b0),
                                fontSize: 10.sp,
                              ),
                              moreStyle: TextStyle(
                                fontWeight: FontWeight.bold,
                                fontFamily: 'task',
                                color: Color(0xff0061b0),
                                fontSize: 10.sp,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                    childCount: blocdetailsModal?.data?.length ?? 0,
                  ),
                ),
              ),
              SliverPadding(
                  padding: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
                  // Add padding here
                  sliver: SliverList(
                    delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        return Container(
                          margin: EdgeInsets.symmetric(vertical: 8),
                          alignment: Alignment.center,
                          height: 18.h,
                          width: 84.w,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.green
                          ),
                          child: Row(
                            children: [
                              Image.network(
                               blogmodel
                                    ?.data?[index]
                                    .image ?? "",

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
                                        recentblogModel?.data?[index].title ?? "",
                                        style: TextStyle(
                                          fontSize: 10.5.sp,
                                          fontWeight: FontWeight.bold,
                                          fontFamily: 'task',
                                          color: Colors.white,
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
                      childCount: recentblogModel?.data?.length ??
                          0, // Dynamic list length
                    ),
                  ))
            ],
          ),
        ),
      ),
    );
  }

  blogdetailap() async {
    final Map<String, String> data = {};
    data['blog_id'] = widget.id;
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().blogdetailap(data).then((response) async {
          blocdetailsModal =
              BlocdetailsModal.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              blocdetailsModal?.status == "success") {
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


  recentblog() async {
    final Map<String, String> data = {};
    data['order_item_id'] = widget.iteamid;
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().recentblogapi(data).then((response) async {
          recentblogModel =
              RecentBlogModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 &&
              recentblogModel?.status == "success") {
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
