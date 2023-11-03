import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Widget/bottombar.dart';

import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage extends StatefulWidget {
  const ProductDetailPage({super.key});

  @override
  State<ProductDetailPage> createState() => _ProductDetailPageState();
}

int age = 0;

final controller = PageController(viewportFraction: 0.8, keepPage: true);
final pages = List.generate(
    6,
    (index) => Container(
          width: 80.w,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
          ),
          margin: EdgeInsets.symmetric(horizontal: 7.5.w, vertical: 4),
          child: Container(
            height: 280,
            child: Center(
                child: Image.network(
              "https://jamoon.in/wp-content/uploads/2021/09/verse-smartwatch.png",
            )),
          ),
        ));

class _ProductDetailPageState extends State<ProductDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      bottomNavigationBar: bottombar(),
      body: SingleChildScrollView(
        child: Stack(
          children: [
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    height: 2.h,
                  ),
                  Container(
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        IconButton(
                            onPressed: () {},
                            icon: Icon(
                              Icons.menu,
                              size: 25.sp,
                            )),
                        Text(
                          "Product Detail Page",
                          style: TextStyle(
                            fontSize: 18.sp,
                            fontFamily: "task",
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                        Row(
                          children: [
                            Container(
                              margin: EdgeInsets.symmetric(horizontal: 1.w),
                              height: 5.5.h,
                              width: 11.5.w,
                              padding: EdgeInsets.all(1.w),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(90),
                                child: CachedNetworkImage(
                                    fit: BoxFit.cover,
                                    imageUrl:
                                        'https://cdn.pixabay.com/photo/2013/07/25/13/01/stones-167089_640.jpg',
                                    progressIndicatorBuilder:
                                        (context, url, progress) =>
                                            CircularProgressIndicator(),
                                    errorWidget: (context, url, error) =>
                                        Icon(Icons.error_outline_rounded)),
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
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      SizedBox(height: 16),
                      SizedBox(
                        height: 250,
                        child: PageView.builder(
                          controller: controller,
                          // itemCount: pages.length,
                          itemBuilder: (_, index) {
                            return pages[index % pages.length];
                          },
                        ),
                      ),
                      SizedBox(
                        height: 1.h,
                      ),
                      SmoothPageIndicator(
                        controller: controller,
                        count: pages.length,
                        effect: WormEffect(
                          dotColor: Colors.grey.shade100,
                          activeDotColor: Color(0xfff7941d),
                          dotHeight: 1.5.h,
                          dotWidth: 4.w,
                          type: WormType.thinUnderground,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  SizedBox(
                    height: 1.h,
                  ),
                  Text(
                    "Pebble Verse Smartwatch (Big 1.55” HD Full Touch LCD Display) ",
                    style: TextStyle(
                      fontSize: 15.sp,
                      color: Colors.black,
                      fontWeight: FontWeight.bold,
                      fontFamily: "task",
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Text("4.0",
                              style: TextStyle(
                                  fontSize: 15.sp, fontFamily: "task")),
                          SizedBox(
                            width: 0.3.w,
                          ),
                          // Image.network("https://cdn.pixabay.com/photo/2013/07/12/17/39/star-152151_640.png",height: 2.5.h,width: 6.w
                          //   ,),
                          Icon(
                            Icons.star,
                            color: Colors.yellow,
                            size: 19.sp,
                          ),
                          SizedBox(
                            width: 0.3.w,
                          ),
                          Text(
                            "5",
                            style:
                                TextStyle(fontSize: 15.sp, fontFamily: "task"),
                          ),
                        ],
                      ),

                      // Container(
                      //     alignment: Alignment.center,
                      //     height: 4.h,
                      //     width: 29.w,
                      //     decoration: BoxDecoration(
                      //         borderRadius: BorderRadius.circular(30),
                      //         color:  Color(0xfff7941d).withOpacity(0.5)
                      //     ),
                      //     child: Text("70 % Off",style:
                      //     TextStyle(
                      //         fontSize: 15.sp,
                      //         color: Colors.white,
                      //         fontFamily: "task",
                      //       fontWeight: FontWeight.bold
                      //     ),)
                      // ),
                      // Row(
                      //   children: [
                      //     InkWell(onTap: () {
                      //       setState(() {
                      //         age--;
                      //       });
                      //     },
                      //       child: Container(
                      //           height: 10.w,
                      //           width: 10.w,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(25),
                      //             color: Color(0xfff7941d),
                      //           ),
                      //
                      //           child:Icon(Icons.remove,size: 20.sp,color: Colors.white,)),
                      //     ),
                      //
                      //     SizedBox(
                      //       width: 3.5.w,
                      //     ),
                      //     Container(
                      //       child: Row(
                      //         children: [
                      //           Container(
                      //             child:    Text(
                      //               age.toString(),
                      //               style: TextStyle(
                      //                 fontWeight: FontWeight.bold,
                      //                 fontFamily: "task",
                      //                 fontSize: 16.sp,
                      //               ),
                      //             ),
                      //           )
                      //         ],
                      //       ),
                      //     ),
                      //     SizedBox(
                      //       width: 3.5.w,
                      //     ),
                      //     InkWell(onTap: () {
                      //       setState(() {
                      //         age++;
                      //       });
                      //     },
                      //       child: Container(
                      //           height: 10.w,
                      //           width: 10.w,
                      //           decoration: BoxDecoration(
                      //             borderRadius: BorderRadius.circular(25),
                      //             color: Color(0xfff7941d),
                      //           ),
                      //
                      //           child:Icon(Icons.add,size: 20.sp,color: Colors.white,)),
                      //     ),
                      //   ],
                      // )

                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          // Icon(Icons.arrow_forward_ios,  color: Color(0xfff7941d),size: 20.sp,),
                          Row(
                            children: [
                              Text(
                                '₹500',
                                style: TextStyle(
                                  fontSize: 15.sp,
                                  fontFamily: 'task',
                                  fontWeight: FontWeight.bold,
                                  letterSpacing: 1,
                                  color: Colors.black,
                                ),
                              ),
                              SizedBox(
                                width: 1.w,
                              ),
                              Padding(
                                padding: EdgeInsets.only(top: 0.4.h),
                                child: Text(
                                  '₹300',
                                  style: TextStyle(
                                    decoration: TextDecoration.lineThrough,
                                    fontSize: 12.sp,
                                    fontFamily: 'task',
                                    fontWeight: FontWeight.normal,
                                    letterSpacing: 1,
                                    color: Colors.black,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                  SizedBox(
                    height: 2.h,
                  ),
                  Divider(
                    endIndent: 2.w,
                    color: Colors.grey.shade300,
                  ),
                  SizedBox(
                    height: 1.5.h,
                  ),
                  Text(
                    "Description",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        fontFamily: "task"),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Text(
                    "Is a German multinational manufacturer of luxury vehicles BMW is headquartered in Munich"
                    "and produces motor vehicles in Germany.Is a German multinational Is a German multinational Is..  ",
                    style: TextStyle(
                        fontSize: 15.sp,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey,
                        fontFamily: "task"),
                  ),
                  SizedBox(
                    height: 3.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      // Container(
                      //   alignment: Alignment.center,
                      //   width: 45.w,
                      //   height: 7.h,
                      //   decoration: BoxDecoration(
                      //     borderRadius: BorderRadius.circular(20),
                      //     color: Colors.white
                      //   ),
                      //   child: Row(
                      //     crossAxisAlignment: CrossAxisAlignment.center,
                      //     mainAxisAlignment: MainAxisAlignment.center,
                      //     children: [
                      //       InkWell(onTap: () {
                      //         setState(() {
                      //           age--;
                      //         });
                      //       },
                      //         child: Container(
                      //             height: 10.w,
                      //             width: 10.w,
                      //           decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(25),
                      //             color: Color(0xfff7941d),
                      //           ),
                      //
                      //           child:Icon(Icons.remove,size: 20.sp,color: Colors.white,)),
                      //       ),
                      //
                      //       SizedBox(
                      //         width: 5.w,
                      //       ),
                      //       Container(
                      //         child: Row(
                      //           children: [
                      //             Container(
                      //               child:    Text(
                      //                 age.toString(),
                      //                 style: TextStyle(
                      //                   fontWeight: FontWeight.bold,
                      //                   fontFamily: "task",
                      //                   fontSize: 16.sp,
                      //                 ),
                      //               ),
                      //             )
                      //           ],
                      //         ),
                      //       ),
                      //       SizedBox(
                      //         width: 5.w,
                      //       ),
                      //       InkWell(onTap: () {
                      //         setState(() {
                      //           age++;
                      //         });
                      //       },
                      //         child: Container(
                      //             height: 10.w,
                      //             width: 10.w,
                      //             decoration: BoxDecoration(
                      //               borderRadius: BorderRadius.circular(25),
                      //               color: Color(0xfff7941d),
                      //             ),
                      //
                      //             child:Icon(Icons.add,size: 20.sp,color: Colors.white,)),
                      //       ),
                      //     ],
                      //   ),
                      // ),

                      Container(
                        alignment: Alignment.center,
                        height: 6.h,
                        width: 80.w,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color(0xfff7941d)),
                        child: Text(
                          "Add To Cart",
                          style: TextStyle(
                              fontSize: 13.sp,
                              color: Colors.white,
                              fontFamily: "task"),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            Positioned(
              right: 1.w,
              top: 10.h,
              child: IconButton(
                  onPressed: () {},
                  icon: Icon(
                    Icons.favorite_border,
                    size: 25.sp,
                  )),
            ),
          ],
        ),
      ),
    );
  }
}
