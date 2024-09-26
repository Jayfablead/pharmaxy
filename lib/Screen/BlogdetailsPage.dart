import 'dart:convert';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Screen/BlocdetailModel.dart';
import 'package:ecommerce/Screen/HomePage.dart';

import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:readmore/readmore.dart';

class Blogdetailspage extends StatefulWidget {
  String id = "";

  Blogdetailspage({required this.id});
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
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.grey.shade50,
        body: CustomScrollView(
          slivers: [
            isLoading
                ? SliverToBoxAdapter(child: Container()) // A placeholder when loading
                : SliverPadding(
              padding: EdgeInsets.symmetric(
                horizontal: 2.w,
                vertical: 2.h,
              ),
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
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          IconButton(
                            onPressed: () {
                              Navigator.pushReplacement(
                                context,
                                MaterialPageRoute(
                                  builder: (context) => HomePage(sel: 1),
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
                            imageUrl: blocdetailsModal?.data?[index].image ?? "",
                            width: MediaQuery.of(context).size.width,
                            height: 30.h,
                            fit: BoxFit.cover,
                            placeholder: (context, url) {
                              return Icon(Icons.error_rounded, color: Colors.blue);
                            },
                          ),
                        ),
                        SizedBox(
                          height: 2.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 4.w),
                          child: Text(
                            blocdetailsModal?.data?[index].title?.isEmpty ?? true
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
                            blocdetailsModal?.data?[index].createdAt?.isEmpty ?? true
                                ? "N/A"
                                : blocdetailsModal?.data?[index].createdAt ?? "",
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
                            blocdetailsModal?.data?[index].description?.isEmpty ?? true
                                ? "N/A"
                                : blocdetailsModal?.data?[index].description ?? "",
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
          ],
        ),

        // body: SingleChildScrollView(
        //   child: isLoading
        //       ? Container()
        //       : Padding(
        //     padding: EdgeInsets.symmetric(
        //       horizontal: 2.w,
        //       vertical: 2.h,
        //     ),
        //     child: Column(
        //       mainAxisAlignment: MainAxisAlignment.start,
        //       crossAxisAlignment: CrossAxisAlignment.start,
        //       children: [
        //         SizedBox(
        //           height: 3.h,
        //         ),
        //         // APP BAR
        //         Container(
        //           width: MediaQuery.of(context).size.width,
        //           child: Row(
        //             mainAxisAlignment: MainAxisAlignment.spaceBetween,
        //             children: [
        //               IconButton(
        //                   onPressed: () {
        //                     Navigator.pushReplacement(
        //                       context,
        //                       MaterialPageRoute(
        //                         builder: (context) => HomePage(sel: 1),
        //                       ),
        //                     );
        //                   },
        //                   icon: Icon(
        //                     Icons.arrow_back_ios_new_outlined,
        //                     size: 18.sp,
        //                   )),
        //               Text(
        //                 "Blog Details",
        //                 style: TextStyle(
        //                   fontSize: 16.sp,
        //                   fontFamily: "task",
        //                   fontWeight: FontWeight.bold,
        //                 ),
        //               ),
        //               IconButton(
        //                 onPressed: () {},
        //                 icon: Icon(null),
        //               ),
        //             ],
        //           ),
        //         ),
        //         SizedBox(
        //           height: 3.h,
        //         ),
        //         Container(
        //           width: MediaQuery.of(context).size.width,
        //           height: MediaQuery.of(context).size.height,
        //           margin: EdgeInsets.symmetric(horizontal: 1.w,),
        //           decoration: BoxDecoration(
        //             color: Colors.grey.shade100
        //           ),
        //           child: ListView.builder(
        //             itemCount: blocdetailsModal?.data?.length,
        //             itemBuilder: (context, index) {
        //               return Column(
        //                 crossAxisAlignment: CrossAxisAlignment.start,
        //                 children: [
        //                   Container(
        //                     width: MediaQuery.of(context).size.width,
        //                     height: 30.h,
        //                     child: CachedNetworkImage(
        //                       imageUrl: blocdetailsModal?.data?[index].image??"",
        //                         width: MediaQuery.of(context).size.width,
        //                         height: 30.h,
        //                         fit: BoxFit.cover,
        //                       placeholder: (context, url) {
        //                         return Icon(Icons.error_rounded,color: Colors.blue,);
        //                       },
        //                     ),
        //                   ),
        //                   SizedBox(
        //                     height: 2.h,
        //                   ),
        //                   Padding(
        //                     padding:  EdgeInsets.only(left:4.w),
        //                     child: Text(blocdetailsModal?.data?[index].title==""||blocdetailsModal?.data?[index].title==null?"N/A"
        //                       :blocdetailsModal?.data?[index].title??"",style: TextStyle(
        //                         fontFamily: "task",
        //                         fontSize: 14.sp,
        //                         fontWeight: FontWeight.bold
        //                     ),),
        //                   ),
        //                   SizedBox(
        //                     height: 2.h,
        //                   ),
        //                   Padding(
        //                     padding: EdgeInsets.only(left:4.w),
        //                     child: Text(blocdetailsModal?.data?[index].createdAt==""||blocdetailsModal?.data?[index].createdAt==null?"N/A"
        //                       :blocdetailsModal?.data?[index].createdAt??"",style: TextStyle(
        //                         fontFamily: "task",
        //                         fontSize: 12.sp,
        //                         fontWeight: FontWeight.bold
        //                     ),),
        //                   ),
        //                   SizedBox(
        //                     height: 3.h,
        //                   ),
        //                   Padding(
        //                     padding:  EdgeInsets.only(left:4.w),
        //                     child: ReadMoreText(blocdetailsModal?.data?[index].description==""||blocdetailsModal?.data?[index].description==null?"N/A"
        //                       :blocdetailsModal?.data?[index].description??"",trimLines: 3,
        //                       trimMode: TrimMode.Line,
        //                       style: TextStyle(
        //                         fontFamily: "task",
        //                         fontSize: 12.sp,
        //                         fontWeight: FontWeight.bold,
        //                         color: Colors.grey,
        //
        //                     ),
        //                       trimCollapsedText: ' Show more',
        //                       trimExpandedText: '  Show less',
        //                       lessStyle: TextStyle(
        //                           fontWeight: FontWeight.bold,
        //                           fontFamily: 'task',
        //                           color: Color(0xff0061b0),
        //                           fontSize: 10.sp),
        //                       moreStyle: TextStyle(
        //                           fontWeight: FontWeight.bold,
        //                           fontFamily: 'task',
        //                           color: Color(0xff0061b0),
        //                           fontSize: 10.sp),
        //                     ),
        //                   )
        //                 ],
        //               );
        //             },
        //
        //           ),
        //         )
        //
        //       ],
        //     ),
        //   ),
        // ),
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
          if (response.statusCode == 200 && blocdetailsModal?.status == "success") {
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
