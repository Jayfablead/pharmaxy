import 'package:ecommerce/Screen/HomePage.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

class ReturnPolicy extends StatefulWidget {
  const ReturnPolicy({super.key});

  @override
  State<ReturnPolicy> createState() => _ReturnPolicyState();
}

class _ReturnPolicyState extends State<ReturnPolicy> {
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    return  commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: isLoading
              ? Container()
              : Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  height: 5.h,
                ),
                // app bar
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    IconButton(
                        onPressed: () {
                          Navigator.pushReplacement(
                              context,
                              MaterialPageRoute(
                                builder: (context) => HomePage(sel: 1),
                              ));
                        },
                        icon: Icon(
                          Icons.arrow_back_ios_new_outlined,
                          size: 18.sp,
                        )),
                    Text(
                      "Refund Policy",
                      style: TextStyle(
                        fontSize: 13.sp,
                        fontFamily: "task",
                        fontWeight: FontWeight.bold,

                      ),
                    ),
                    IconButton(onPressed: () {}, icon: Icon(null)),
                  ],
                ),
                SizedBox(
                  height: 2.h,
                ),
                Padding(
                  padding: EdgeInsets.only(left:8.w),
                  child: Text("A. Cancellation Policy",style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),),
                ),
                SizedBox(height: 2.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Text("1. How can I cancel an order?",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("1.1 Medicines and Healthcare Products",style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("An order for medicines or healthcare"
                      " products can be cancelled from the"
                      " ‘Order Details’ screen on the"
                      " Pharmaxy website/ app (‘Platform’) or by "
                      "calling our customer care number 7666100300 before it is marked as “Out"
                      " for Delivery”. Else, you can refuse it at the time of delivery and a refund will be "
                      "processed as per the Refund Policy.",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                Padding(
                  padding: EdgeInsets.only(left:8.w),
                  child: Text("B. Return Policy",style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),),
                ),
                SizedBox(height: 2.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Text("1. What is the time period for return of orders",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("1.1 Medicines Orders",style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("We have product specific return policy. "
                      "The return window ranges from 0-7 "
                      "days from the date of delivery."
                      " The information regarding the return policy"
                      " can be found on the product page."
                      " Please check the return policy before"
                      " placing any order.",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("1.2  Healthcare Products",style: TextStyle(
                    decoration: TextDecoration.underline,
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("All healthcare products have specific"
                      " return and replacement policy. The"
                      " return/replacement window ranges"
                      " from 0-10 days from the date of delivery"
                      ".The information regarding the"
                      " return policy can be found on the product page."
                      " Please check the return policy before placing any order.",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                SizedBox(height: 2.h,),
                Padding(
                  padding: EdgeInsets.only(left:8.w),
                  child: Text("C. Refund Policy",style: TextStyle(
                    fontSize: 14.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                    decoration: TextDecoration.underline,
                  ),),
                ),
                SizedBox(height: 2.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 10.w),
                  child: Text("1. When can I expect the amount to be refunded?",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                    fontWeight: FontWeight.bold,
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("1.1 Please note that the refund amount"
                      " mentioned at the time of return on the"
                      " Platform is an estimate and will be finalised"
                      " after completion of verification. Once the"
                      " pick-up is completed and the product is"
                      " verified by the seller, a refund of the total"
                      " amount paid for the products returned by"
                      " you will be initiated for eligible returns as mentioned above.",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
                SizedBox(height: 1.h,),
                Padding(
                  padding:  EdgeInsets.only(left: 12.w),
                  child: Text("We have product specific return policy. "
                      "The return window ranges from 0-7 "
                      "days from the date of delivery."
                      " The information regarding the return policy"
                      " can be found on the product page."
                      " Please check the return policy before"
                      " placing any order.",style: TextStyle(
                    fontSize: 12.sp,
                    fontFamily: "task",
                  ),),
                ),
              ]
          ),
        ),
      ),
    );
  }
}
