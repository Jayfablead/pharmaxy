import 'dart:io';

import 'package:ecommerce/Widget/Const.dart';
import 'package:ecommerce/Widget/CustomExpection.dart';
import 'package:ecommerce/Widget/response.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class authprovider with ChangeNotifier {
  Map<String, String> headers = {
    'Authorization': 'hXuRUGsEGuhGf6KG',
  };

  Future<http.Response> signupapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/SignUp";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> loginapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/LogIn";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    print(response.headers);
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> ViewProfile(Map<String, String> bodyData) async {
    const url = "$baseUrl/userProfile";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> PaymethodApi() async {
    const url = "$baseUrl/paymentgateway";
    var responseJson;
    final response = await http.get(Uri.parse(url), headers: headers).timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> profileupdateapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/updateProfile";
    var responseJson;
    if (bodyData['profile_img'] != "") {
      print("hiii");
      try {
        final imageUploadRequest =
            http.MultipartRequest('POST', Uri.parse(url));
        imageUploadRequest.headers.addAll(headers);
        if (bodyData['profile_img']?.isNotEmpty ?? false) {
          final file = await http.MultipartFile.fromPath(
              'profile_img', bodyData['profile_img'] ?? '');
          imageUploadRequest.files.add(file);
        }
        imageUploadRequest.fields.addAll(bodyData);
        print(imageUploadRequest.files);
        final streamResponse = await imageUploadRequest.send();
        print(streamResponse.statusCode);
        responseJson =
            responses(await http.Response.fromStream(streamResponse));
        print(responseJson);
      } on SocketException {
        throw FetchDataException('No Internet connection');
      }
      return responseJson;
    } else {
      print("a helllooo");
      final response = await http
          .post(Uri.parse(url), body: bodyData, headers: headers)
          .timeout(
        const Duration(seconds: 30),
        onTimeout: () {
          throw const SocketException('Something went wrong');
        },
      );
      print(response.statusCode);
      responseJson = responses(response);
      print(responseJson);
      return responseJson;
    }
  }

  Future<http.Response> allcatapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/allCategory";
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> maincatapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/category";
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> subcatapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/subCategory";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  // Future<http.Response>allproductapi(Map<String, String> bodyData) async {
  //   const url = "$baseUrl/allProducts";
  //   var responseJson;
  //   final response = await http
  //       .get(Uri.parse(url),)
  //       .timeout(
  //     const Duration(seconds: 30),
  //     onTimeout: () {
  //       throw const SocketException('Something went wrong');
  //     },
  //   );
  //   responseJson = responses(response);
  //   return responseJson;
  // }

  Future<http.Response> catwiceproductapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/category_wice_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> subcatwiceallproductapi(
      Map<String, String> bodyData) async {
    const url = "$baseUrl/subcategory_wice_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> serapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/searchProducts";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> userwishlistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/userWishList";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> subcatserchapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/searchproduct_by_subcategory";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> addtowishlistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/addToWishList";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> removewishlistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/removeFromWishList";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> addcartapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/addtocart";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> addReviewApi(Map<String, String> bodyData) async {
    const url = "$baseUrl/add_review";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> viewcartapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/view_cart_list";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> removecartapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/remove_cart";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> ChangePasswordapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/change_client_password";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> incrementapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/increment_quantity";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> disincrementapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/decrement_quantity";
    var responseJson;

    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> productdetailapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/product_details";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> colorapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/product_color";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> sizeapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/product_size";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> selectcolorapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/product_data_get_from_color";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> colormatchapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/product_data_match_with_coler_size";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> contryapi() async {
    const url = "$baseUrl/countries";
    var responseJson;
    final response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> stateapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/states";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> cityapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/cities";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> checkoutapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/checkout_details";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    print(response.body);
    return responseJson;
  }

  Future<http.Response> checkoutpaypalapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/success_paypal";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> checkoutstripeapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/stripe_payment ";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> checkoutcodapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/checkout";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> myorderlistapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/my_orders";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> myorderdetailapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/order_details";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> salesproductapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/sales_price_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> salesproductlistapi(
      Map<String, String> bodyData) async {
    const url = "$baseUrl/all_sales_list_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> bestsellerproductapi(
      Map<String, String> bodyData) async {
    const url = "$baseUrl/best_selling_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> shippingaddapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/change_shipping_address";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> userallshippingapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/user_all_shipping_address";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> userselectapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/user_select_shipping_address";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> editshippingapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/edit_shipping_address";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> removeshippingadressapi(
      Map<String, String> bodyData) async {
    const url = "$baseUrl/delete_shipping_address";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> bestsalesserchapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/search_best_selling_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> salesserchapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/search_all_sales_list_product";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> deliveredapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/complete_myorders";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> pendingorderapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/pending_myorders";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> cancelorderapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/cancelled_myorders";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> forgotapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/forgot_password_app";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> viewreviewapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/view_Review";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }

  Future<http.Response> deletereviewapi(Map<String, String> bodyData) async {
    const url = "$baseUrl/delete_review";
    var responseJson;
    final response = await http
        .post(Uri.parse(url), body: bodyData, headers: headers)
        .timeout(
      const Duration(seconds: 30),
      onTimeout: () {
        throw const SocketException('Something went wrong');
      },
    );
    responseJson = responses(response);
    return responseJson;
  }
}
