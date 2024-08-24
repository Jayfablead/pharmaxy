import 'dart:convert';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce/Modal/bestsellerModel.dart';
import 'package:ecommerce/Provider/Authprovider.dart';
import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/buildErrorDialog.dart';
import 'package:ecommerce/Widget/loder.dart';
import 'package:flutter/material.dart';

class Bestselllerapi extends StatefulWidget {
  const Bestselllerapi({super.key});

  @override
  State<Bestselllerapi> createState() => _BestselllerapiState();
}

class _BestselllerapiState extends State<Bestselllerapi> {
  bool isLoading = true;
  bool _isLoading = false;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    bestsellerapi();
  }
  @override
  Widget build(BuildContext context) {
    return commanScreen(
      isLoading: isLoading,
      scaffold: Scaffold(
        appBar: AppBar(
          title: Text("Product List",style: TextStyle(fontWeight: FontWeight.bold,fontSize: 18.0),),
          centerTitle: true,
        ),
          body: isLoading?Container(): Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10.0),
            child: bestselllermodel?.productData==null||bestselllermodel?.productData==""? Container(
              child: Center(child: Text("No Data avalible",style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16.0
              ),)),
            ):Column(
              children: [
                CustomScrollView(
                  slivers: [
                    // This SliverGrid replaces the Expanded GridView.builder
                    SliverPadding(
                      padding: EdgeInsets.symmetric(vertical: 8),
                      sliver: SliverGrid(
                        gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                          maxCrossAxisExtent: 200,
                          mainAxisExtent: 250,
                          crossAxisSpacing: 10,
                          mainAxisSpacing: 10,
                        ),
                        delegate: SliverChildBuilderDelegate(
                              (BuildContext context, int index) {
                            return Card(
                              child: Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(18.0),
                                  color: Color(0xffFFFFFF),
                                ),
                                padding: EdgeInsets.all(15),
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    CachedNetworkImage(
                                      imageUrl: bestselllermodel?.productData?[index].imgData ?? '',
                                      placeholder: (context, url) => CircularProgressIndicator(),
                                      errorWidget: (context, url, error) => Icon(
                                        Icons.error_rounded,
                                        color: Colors.red,
                                      ),
                                      height: 80,
                                      width: 120,
                                    ),
                                    SizedBox(height: 8),
                                    // title
                                    Text(
                                      bestselllermodel?.productData?[index].productName == "" ||
                                          bestselllermodel?.productData?[index].productName == null
                                          ? "N/A"
                                          : bestselllermodel?.productData?[index].productName ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    // subtitle
                                    Text(
                                      bestselllermodel?.productData?[index].productShortDesc == "" ||
                                          bestselllermodel?.productData?[index].productShortDesc == null
                                          ? "N/A"
                                          : bestselllermodel?.productData?[index].productShortDesc ?? '',
                                      maxLines: 1,
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    // price
                                    Row(
                                      children: [
                                        Text(
                                          '₹' + (bestselllermodel?.productData?[index].productPrice).toString(),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                          ),
                                        ),
                                        SizedBox(width: 5),
                                        Text(
                                          bestselllermodel?.productData?[index].saleProductPrice ?? '',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                          style: TextStyle(
                                            fontSize: 13,
                                            decoration: TextDecoration.lineThrough,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                              ),
                            );
                          },
                          childCount: bestselllermodel?.productData?.length ?? 0,
                        ),
                      ),
                    ),
                    // Adding a gap before the button
                    SliverToBoxAdapter(
                      child: SizedBox(height: 20),
                    ),
                    // The "View More" or "View Less" button
                    SliverToBoxAdapter(
                      child: GestureDetector(
                        onTap: () {
                          setState(() {
                            _isLoading = !_isLoading;
                          });
                        },
                        child: (bestselllermodel?.productData?.length ?? 0) < 5
                            ? Container()
                            : Container(
                          alignment: Alignment.center,
                          height: 40,
                          width: 120,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(20),
                            color: Color(0xfff7941d),
                          ),
                          child: Text(
                            _isLoading ? "View Less.." : "View More..",
                            style: TextStyle(fontSize: 12, color: Colors.white),
                          ),
                        ),
                      ),
                    ),
                  ],
                )

                // Expanded(
                //   child: GridView.builder(
                //     gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                //       maxCrossAxisExtent: 200,
                //      mainAxisExtent: 250,
                //       crossAxisSpacing: 10,
                //       mainAxisSpacing: 10,
                //
                //     ),
                //     padding: EdgeInsets.symmetric(vertical: 8),
                //     // itemCount: 6,
                //      itemCount: bestselllermodel?.productData?.length,
                //      itemBuilder: (context, index) {
                //       return Card(
                //         child: Container(
                //           decoration: BoxDecoration(
                //             borderRadius: BorderRadius.circular(18.0),
                //             color: Color(0xffFFFFFF)
                //           ),
                //           padding: EdgeInsets.all(15),
                //           child: Column(
                //              crossAxisAlignment: CrossAxisAlignment.start,
                //             // mainAxisAlignment: MainAxisAlignment.center,
                //             children: [
                //              CachedNetworkImage(
                //                 imageUrl: bestselllermodel?.productData?[index].imgData??'',
                //                 placeholder: (context, url) => CircularProgressIndicator(),
                //                errorWidget: (context, url, error) => Icon(Icons.error_rounded,color: Colors.red,),
                //                height: 80,
                //                width: 120,
                //               ),
                //               SizedBox(height: 8,),
                //               // title
                //               Text(bestselllermodel?.productData?[index].productName == ""||bestselllermodel?.productData?[index].productName==null?"N/A"
                //                   :bestselllermodel?.productData?[index].productName??'',maxLines: 1,overflow:TextOverflow.ellipsis,style: TextStyle(
                //                   fontSize: 16,
                //                   fontWeight: FontWeight.bold
                //               ),),
                //               // subtitle
                //               Text(bestselllermodel?.productData?[index].productShortDesc==""||bestselllermodel?.productData?[index].productShortDesc==null?"N/A":
                //               bestselllermodel?.productData?[index].productShortDesc??'',maxLines: 1,overflow: TextOverflow.ellipsis,),
                //               //price
                //               Row(
                //                 children: [
                //                   Text('₹'+(bestselllermodel?.productData?[index].productPrice).toString(),maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontWeight: FontWeight.bold,),),
                //                   SizedBox(width: 5,),
                //                   Text(bestselllermodel?.productData?[index].saleProductPrice??'',maxLines: 1,overflow: TextOverflow.ellipsis,style: TextStyle(fontSize: 13,decoration: TextDecoration.lineThrough),),
                //                 ],
                //               ),
                //               // Padding(
                //               //   padding: const EdgeInsets.only(left: 8.0),
                //               //   child: Column(
                //               //     children: [
                //               //
                //               //     ],
                //               //   ),
                //               // )
                //             ],
                //           ),
                //         ),
                //       );
                //     },
                //   ),
                // ),
                // SizedBox(height: 20,),
                // GestureDetector(
                //   onTap: () {
                //     setState(() {
                //       _isLoading = !_isLoading;
                //     });
                //   },
                //   child: (bestselllermodel?.productData?.length ?? 0) < 5 ? Container() : Container(
                //         alignment: Alignment.center,
                //          height: 40,
                //          width: 120,
                //       decoration: BoxDecoration(
                //           borderRadius:
                //           BorderRadius.circular(20),
                //           color: Color(0xfff7941d)),
                //       child: Text(
                //         _isLoading
                //             ? "View Less.."
                //             : "View More..",
                //         style: TextStyle(
                //             fontSize: 12,
                //             color: Colors.white),
                //       )),
                // )

              ],
            ),
          ),
        ),
    );
  }
  bestsellerapi() async {
    final Map<String, String> data = {};
    data['user_id'] = (usermodal?.userId).toString();
    print(data);
    checkInternet().then((internet) async {
      if (internet) {
        authprovider().bestsellerapi(data).then((response) async {
          bestselllermodel = bestsellerModel.fromJson(json.decode(response.body));
          if (response.statusCode == 200 && bestselllermodel?.status == "success") {

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
