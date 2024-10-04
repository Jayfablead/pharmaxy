import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/Drawer.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class MyOrderDetailPage extends StatefulWidget {
  MyOrderDetailPage({
    super.key,
  });

  @override
  State<MyOrderDetailPage> createState() => _MyOrderDetailPageState();
}

bool isLoading = true;
final GlobalKey<ScaffoldState> _scaffoldKeyordet = GlobalKey<ScaffoldState>();

class order {
  String? image;
  String? name;
  String? dec;
  String? price;

  order(this.image, this.name, this.price, this.dec);
}

List<order> orderdetail = [
  order(
    'https://www.transparentpng.com/thumb/-iphone-x/dO1Aqf-apple-iphone-caracteru-edsticas-especificaciones.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.transparentpng.com/thumb/computer/6o4Q2H-png-windows-desktop-set-software-game-coding-.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://pngimg.com/d/book_PNG51058.png',
    'Samsung Mobile.. ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.transparentpng.com/thumb/watch/dOleGR-skin-watch-clipart-transparent.png',
    'Samsung Mobile ',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png',
    'Toys',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
  order(
    'https://www.pngall.com/wp-content/uploads/5/Baby-Toy-PNG-Free-Download.png',
    'Toys',
    "24500",
    "Samsung Galaxy M34 price in India starts from Rs. 18,999. The lowest price of Samsung Galaxy",
  ),
];

class _MyOrderDetailPageState extends State<MyOrderDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: _scaffoldKeyordet,
      drawer: drawer1(),
      backgroundColor: bgcolor,
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.symmetric(horizontal: 3.w, vertical: 2.h),
          child: Column(
            children: [
              SizedBox(
                height: 2.h,
              ),
              Container(
                width: MediaQuery.of(context).size.width,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          _scaffoldKeyordet.currentState?.openDrawer();
                        },
                        icon: Icon(
                          Icons.menu,
                          size: 25.sp,
                        )),
                    Text(
                      "OrderDetailPage",
                      style: TextStyle(
                        fontSize: 20.sp,
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
                height: 1.h,
              ),
              Padding(
                padding: EdgeInsets.only(left: 1.w),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 1.w),
                      child: Column(
                        children: [
                          Row(
                            children: [
                              Text(
                                "Order ID :",
                                style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontFamily: 'task',
                                    fontSize: 15.sp,
                                    color: Colors.black45),
                              ),
                              Text(
                                "Fn415854656574",
                                style: TextStyle(
                                    fontWeight: FontWeight.normal,
                                    fontFamily: 'task',
                                    fontSize: 12.sp,
                                    color: Colors.grey),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                height: 23.h,
                child: ListView.builder(
                  padding: EdgeInsets.only(top: 1.h),
                  itemCount: orderdetail.length,
                  // The number of items in the grid
                  itemBuilder: (BuildContext context, int index) {
                    // Build each item in the grid
                    return Card(
                        color: Colors.white,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.start,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                SizedBox(
                                  width: 2.w,
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                      borderRadius:
                                          BorderRadius.all(Radius.circular(20)),
                                      color: Colors.grey.shade200),
                                  child: Padding(
                                    padding: EdgeInsets.all(3.0),
                                    child: CachedNetworkImage(
                                      imageUrl: orderdetail[index].image ?? "",
                                      fit: BoxFit.cover,
                                      height: 31.w,
                                      width: 31.w,
                                      imageBuilder: (context, imageProvider) =>
                                          Container(
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(25),
                                          image: DecorationImage(
                                            image: imageProvider,
                                            // fit: BoxFit.cover,
                                          ),
                                        ),
                                      ),
                                      placeholder: (context, url) => Center(
                                          child: CircularProgressIndicator()),
                                      errorWidget: (context, url, error) =>
                                          Icon(Icons.error),
                                    ),
                                  ),
                                ),
                                SizedBox(
                                  width: 3.w,
                                ),
                                Padding(
                                  padding: EdgeInsets.symmetric(
                                      vertical: 1.h, horizontal: 1.w),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.start,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      SizedBox(
                                        height: 2.h,
                                      ),
                                      Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: SizedBox(
                                              width: 45.w,
                                              child: Text(
                                                orderdetail[index].name ?? "",
                                                style: TextStyle(
                                                    color: Colors.black,
                                                    fontSize: 12.sp,
                                                    fontWeight: FontWeight.w600,
                                                    fontFamily: "task"),
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              "Delivered",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'task',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              "Delivered On 10 Sep",
                                              style: TextStyle(
                                                fontSize: 13.sp,
                                                fontFamily: 'task',
                                                fontWeight: FontWeight.normal,
                                                letterSpacing: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                          Padding(
                                            padding: EdgeInsets.only(left: 1.w),
                                            child: Text(
                                              '₹2520',
                                              style: TextStyle(
                                                fontSize: 15.sp,
                                                fontFamily: 'task',
                                                fontWeight: FontWeight.bold,
                                                letterSpacing: 1,
                                                color: Colors.black,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                      SizedBox(
                                        height: 3.h,
                                      ),
                                    ],
                                  ),
                                )
                              ],
                            ),
                          ],
                        ));
                  },
                ),
              ),
              SizedBox(
                height: 1.h,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: EdgeInsets.only(left: 2.3.w),
                    child: Text(
                      "Shipping Address",
                      style: TextStyle(
                        fontSize: 12.sp,
                        fontFamily: "task",
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ),
                  SizedBox(
                    height: 0.5.h,
                  ),
                  Padding(
                    padding: EdgeInsets.symmetric(horizontal: 2.w),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Column(
                          children: [
                            Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(10),
                                  color: Colors.white),
                              child: Padding(
                                padding: EdgeInsets.symmetric(
                                    horizontal: 3.w, vertical: 2.h),
                                child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    SizedBox(
                                      width: 72.w,
                                      child: Column(
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        mainAxisSize: MainAxisSize.min,
                                        children: [
                                          Text(
                                            'jane deo',
                                            style: TextStyle(
                                                fontSize: 15.sp,
                                                fontWeight: FontWeight.bold,
                                                fontFamily: "task"),
                                          ),
                                          SizedBox(
                                            height: 1.h,
                                          ),
                                          Text(
                                            '19 udaynage soc katargam neargaytri school opp hariom..',
                                            style: TextStyle(
                                                fontSize: 13.5.sp,
                                                color: Colors.black,
                                                fontWeight: FontWeight.normal,
                                                fontFamily: "task"),
                                          ),
                                        ],
                                      ),
                                    ),
                                    Icon(Icons.arrow_forward_ios)
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 2.w),
                          child: Text(
                            "Payment",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "task",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.white),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 2.h),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  mainAxisSize: MainAxisSize.min,
                                  children: [
                                    Image.network(
                                      "https://freepngimg.com/save/13626-paypal-logo-png/2272x864",
                                      width: 25.w,
                                    ),
                                    SizedBox(
                                      height: 1.h,
                                    ),
                                    Row(
                                      children: [
                                        Container(
                                            decoration: BoxDecoration(
                                              borderRadius:
                                                  BorderRadius.circular(10),
                                              color: Colors.grey.shade50,
                                            ),
                                            height: 7.h,
                                            width: 16.w,
                                            child: Image.network(
                                              "https://www.mastercard.com/content/dam/public/mastercardcom/us/en/logos/mastercard-og-image.png",
                                            )),
                                        SizedBox(
                                          width: 3.w,
                                        ),
                                        Text(
                                          "**** **** **** 3954",
                                          style: TextStyle(
                                              fontWeight: FontWeight.normal,
                                              fontSize: 13.5.sp,
                                              fontFamily: "task",
                                              color: Colors.black),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                Icon(Icons.arrow_forward_ios)
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Padding(
                          padding: EdgeInsets.only(left: 1.7.w),
                          child: Text(
                            "Order Info",
                            style: TextStyle(
                              fontSize: 15.sp,
                              fontFamily: "task",
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 0.5.h,
                        ),
                        Container(
                          width: 95.w,
                          height: 20.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffffffff),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 2.h),
                            child: Column(
                              children: [
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Sub Total',
                                      style: TextStyle(
                                          fontFamily: 'task',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '₹12456',
                                      style: TextStyle(
                                          fontFamily: 'task',
                                          fontSize: 15.sp,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black),
                                    ),
                                  ],
                                ),
                                SizedBox(
                                  height: 0.5.h,
                                ),
                                Row(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    Text(
                                      'Tax(15%)',
                                      style: TextStyle(
                                          fontFamily: 'task',
                                          fontSize: 14.sp,
                                          fontWeight: FontWeight.normal,
                                          color: Colors.black),
                                    ),
                                    Text(
                                      '₹20',
                                      style: TextStyle(
                                        fontFamily: 'task',
                                        fontSize: 15.sp,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 1.h,
                        ),
                        Container(
                          width: 93.w,
                          height: 8.h,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Color(0xffffffff),
                          ),
                          child: Padding(
                            padding: EdgeInsets.symmetric(
                                horizontal: 3.w, vertical: 2.h),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total Amount',
                                  style: TextStyle(
                                    fontFamily: 'task',
                                    fontSize: 17.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                                Text(
                                  '₹12444',
                                  style: TextStyle(
                                    fontFamily: 'task',
                                    fontSize: 15.sp,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 3.h,
              ),
              Container(
                margin: EdgeInsets.only(right: 7.w, left: 7.w),
                alignment: Alignment.center,
                height: 6.h,
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(30),
                    color: Color(0xfff7941d)),
                child: Text(
                  "Pay Now",
                  style: TextStyle(
                      fontSize: 17.sp,
                      color: Colors.white,
                      fontWeight: FontWeight.bold,
                      fontFamily: "task"),
                ),
              ),

            ],
          ),
        ),
      ),
    );
  }
}
