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
          padding: EdgeInsets.symmetric(horizontal: 2.w),
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
                padding: EdgeInsets.symmetric(horizontal: 0.w),
                sliver: SliverList(
                  delegate: SliverChildBuilderDelegate(
                        (context, index) {
                      return Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                            ),
                            width: MediaQuery.of(context).size.width,
                            height: 25.h,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(10),
                              child: CachedNetworkImage(
                                imageUrl: blocdetailsModal?.data?.image ?? "",
                                width: MediaQuery.of(context).size.width,
                                height: 30.h,
                                fit: BoxFit.cover,
                                placeholder: (context, url) {
                                  return Icon(Icons.error_rounded, color: Colors.blue);
                                },
                                errorWidget: (context, url, error) {
                                  return Image.asset('assets/mylogo.png',color: AppColors.primary,);
                                },
                              ),
                            ),
                          ),
                          SizedBox(
                            height: 2.h,
                          ),
                          Text(
                            blocdetailsModal?.data?.title?.isEmpty ??
                                true
                                ? "N/A"
                                : blocdetailsModal?.data?.title ?? "",
                            style: TextStyle(
                              fontFamily: "task",
                              fontSize: 12.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          Text(
                            blocdetailsModal
                                ?.data?.createdAt?.isEmpty ??
                                true
                                ? "N/A"
                                : blocdetailsModal?.data?.createdAt ??
                                "",
                            style: TextStyle(
                              fontFamily: "task",
                              fontSize: 11.sp,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(
                            height: 1.5.h,
                          ),
                          ReadMoreText(
                            blocdetailsModal
                                ?.data?.description?.isEmpty ??
                                true
                                ? "N/A"
                                : blocdetailsModal
                                ?.data?.description ??
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
                        ],
                      );
                    },
                    childCount: 1
                    // childCount: blocdetailsModal?.data?. ?? 0,
                  ),
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 2.h,
                ),
              ),
              SliverToBoxAdapter(
                child: Container(
                  width: 84.w,
                  height: 7.h,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(10.0),topRight: Radius.circular(10.0)),
                    color: Color(0xffFFFFFF),
                  ),

                  alignment: Alignment.center,
                  child: Text("Recent Post",style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "task",
                  ),),
                ),
              ),
              SliverToBoxAdapter(
                  child: Divider(
                    color: Colors.grey,
                  )
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 2.h,
                ),
              ),
              SliverToBoxAdapter(
                child: SizedBox(
                  height: 22.h,
                  width: 62.w,
                  child: ListView.builder(
                    padding: EdgeInsets.zero,
                    scrollDirection: Axis.horizontal,
                    itemCount:blogmodel?.data?.length,  // Change to use dynamic list length
                    itemBuilder: (context, index) {
                      return GestureDetector(
                        onTap: (){

                          Navigator.of(context).push(
                              MaterialPageRoute(builder: (context) => Blogdetailspage(
                                  iteamid: recentblogModel?.data?[index].id ?? '',
                                  id:recentblogModel?.data?[index].id ?? ''
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
                                  width: 65.w,
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.only(
                                      topLeft: Radius.circular(10),
                                      topRight: Radius.circular(10),
                                    ),
                                    child: CachedNetworkImage(
                                      fit: BoxFit.cover,
                                      imageUrl :recentblogModel
                                          ?.data?[index]
                                          .image ??
                                          '',
                                      width: 53.w,
                                      height: 15.h,
                                      progressIndicatorBuilder: (context, url, progress) =>
                                          Center(child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) => Image.asset('assets/mylogo.png',color: AppColors.primary,),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 60.w,
                                  child: Padding(
                                    padding: EdgeInsets.all(8.0),
                                    child: Text(
                                      recentblogModel
                                          ?.data?[index]
                                          .title ==
                                          '' ||
                                          recentblogModel
                                              ?.data?[index]
                                              .title ==
                                              null
                                          ? 'N/A'
                                          :recentblogModel
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
              )
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
