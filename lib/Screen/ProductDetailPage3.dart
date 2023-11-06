import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Widget/bottombar.dart';
import 'package:flutter/material.dart';
import 'package:readmore/readmore.dart';
import 'package:sizer/sizer.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

class ProductDetailPage3 extends StatefulWidget {
  const ProductDetailPage3({super.key});

  @override
  State<ProductDetailPage3> createState() => _ProductDetailPage3State();
}

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
              "https://parspng.com/wp-content/uploads/2023/02/shoespng.parspng.com-12.png",
            )),
          ),
        ));

class _ProductDetailPage3State extends State<ProductDetailPage3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

      bottomNavigationBar: bottombar(),
      body: Stack(
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
                        "Product Detail",
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
                  height: 15.h,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    SizedBox(height: 16),
                    SizedBox(
                      height: 230,
                      child: PageView.builder(
                        controller: controller,
                        // itemCount: pages.length,
                        itemBuilder: (_, index) {
                          return pages[index % pages.length];
                        },
                      ),
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
                  height: 2.h,
                ),
                Container(
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.only(
                          topLeft: Radius.circular(10),
                          topRight: Radius.circular(10)),
                      color: Colors.white),
                  child: Padding(
                    padding: EdgeInsets.symmetric(horizontal: 3.w),
                    child: Column(
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 1.h,
                            ),
                            ReadMoreText(
                              "Is a German multinational manufacturer of luxury vehicles BMW is headquartered "
                              "in Munich"
                              "and produces motor vehicles in multinational Is  ",
                              trimLines: 3,
                              colorClickableText: Colors.pink,
                              trimMode: TrimMode.Line,
                              style: TextStyle(
                                  fontSize: 13.sp,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.grey,
                                  fontFamily: "task"),
                              trimCollapsedText: 'Show more',
                              trimExpandedText: 'Show less',
                              lessStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'task',
                                  color: Color(
                                    0xfff7941d,
                                  ),
                                  fontSize: 12.sp),
                              moreStyle: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontFamily: 'task',
                                  color: Color(0xfff7941d),
                                  fontSize: 12.sp),
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  child: Center(
                                    child: Text(
                                      "Color :",
                                      style: TextStyle(
                                          fontFamily: 'task',
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 9.w,
                                      width: 9.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.blue.shade300),
                                      child: Icon(
                                        Icons.check,
                                        color: Colors.white,
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 9.w,
                                      width: 9.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.orangeAccent.shade400),
                                      // child: Icon(Icons.check),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 9.w,
                                      width: 9.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.purple.shade300),
                                      // child: Icon(Icons.check),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      height: 9.w,
                                      width: 9.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(100),
                                          color: Colors.yellow.shade400),
                                      // child: Icon(Icons.check),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            SizedBox(
                              height: 2.h,
                            ),
                            Row(
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  height: 5.h,
                                  child: Center(
                                    child: Text(
                                      "Size :",
                                      style: TextStyle(
                                          fontFamily: 'task',
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black87),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 11.w,
                                      width: 11.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Color(0xfff7941d)
                                              .withOpacity(0.4)),
                                      child: Text(
                                        "Xs",
                                        style: TextStyle(
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp,
                                            color: Colors.white),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade100),
                                      child: Text(
                                        "S",
                                        style: TextStyle(
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade100),
                                      child: Text(
                                        "M",
                                        style: TextStyle(
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade100),
                                      child: Text(
                                        "L",
                                        style: TextStyle(
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  width: 4.w,
                                ),
                                Column(
                                  children: [
                                    Container(
                                      alignment: Alignment.center,
                                      height: 10.w,
                                      width: 10.w,
                                      decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
                                          color: Colors.grey.shade100),
                                      child: Text(
                                        "XL",
                                        style: TextStyle(
                                            fontFamily: 'task',
                                            fontWeight: FontWeight.bold,
                                            fontSize: 12.sp),
                                      ),
                                    ),
                                    SizedBox(
                                      height: 0.5.h,
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ],
                        ),
                        SizedBox(height: 4.h),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Container(
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  Container(
                                    alignment: Alignment.center,
                                    height: 6.h,
                                    width: 45.w,
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
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
            top: 15.h,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 3.w),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  SizedBox(
                    width: 60.w,
                    child: Text(
                      "Nike Air VaporMax FlyKnit 2 ",
                      style: TextStyle(
                        fontSize: 17.sp,
                        color: Colors.black,
                        fontWeight: FontWeight.bold,
                        fontFamily: "task",
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text("4.0",
                          style:
                              TextStyle(fontSize: 15.sp, fontFamily: "task")),
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
                        width: 0.5.w,
                      ),
                      Text(
                        "5",
                        style: TextStyle(fontSize: 15.sp, fontFamily: "task"),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        '₹500',
                        style: TextStyle(
                          fontSize: 18.sp,
                          fontFamily: 'task',
                          fontStyle: FontStyle.italic,
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
                            fontSize: 14.sp,
                            fontStyle: FontStyle.italic,
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
            ),
          ),
          Positioned(
            right: 1.w,
            top: 14.h,
            child: IconButton(
              onPressed: () {},
              icon: Icon(
                Icons.favorite_border,
                size: 25.sp,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
