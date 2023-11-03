

import 'package:connectivity/connectivity.dart';
import 'package:ecommerce/Modal/AddCartModal.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/AllCatModal.dart';
import 'package:ecommerce/Modal/AllProductModal.dart';
import 'package:ecommerce/Modal/AllSubcatWiceProduct.dart';
import 'package:ecommerce/Modal/AllUserAddModal.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/CatWiceProductModal.dart';
import 'package:ecommerce/Modal/ChangePasswordModal.dart';
import 'package:ecommerce/Modal/CheckOutModal.dart';
import 'package:ecommerce/Modal/ChekOutDetailModal.dart';
import 'package:ecommerce/Modal/CityModal.dart';
import 'package:ecommerce/Modal/ColorMatchModal.dart';
import 'package:ecommerce/Modal/ColorShowModal.dart';
import 'package:ecommerce/Modal/CountryModal.dart';
import 'package:ecommerce/Modal/DeliveredOrderModal.dart';
import 'package:ecommerce/Modal/DisIncrementModal.dart';
import 'package:ecommerce/Modal/EditShippingAdd.dart';
import 'package:ecommerce/Modal/EditprofileModal.dart';
import 'package:ecommerce/Modal/IncrementModal.dart';
import 'package:ecommerce/Modal/MainCatModal.dart';
import 'package:ecommerce/Modal/MyOederDetailModal.dart';
import 'package:ecommerce/Modal/MyOrderListModal.dart';
import 'package:ecommerce/Modal/OrderCancelModal.dart';
import 'package:ecommerce/Modal/PaypalModal.dart';
import 'package:ecommerce/Modal/PendingOrderModal.dart';
import 'package:ecommerce/Modal/ProductDetailModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RemoveAddressModal.dart';
import 'package:ecommerce/Modal/RemoveCartModal.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/SaleListSerachModal.dart';
import 'package:ecommerce/Modal/SalesProductListModal.dart';
import 'package:ecommerce/Modal/SalesProductModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
import 'package:ecommerce/Modal/SearchModal.dart';
import 'package:ecommerce/Modal/SelectColorModal.dart';
import 'package:ecommerce/Modal/ShippingAddModal.dart';
import 'package:ecommerce/Modal/SignupModal.dart';
import 'package:ecommerce/Modal/SizeShowModal.dart';
import 'package:ecommerce/Modal/StateModal.dart';
import 'package:ecommerce/Modal/SubCatModal.dart';
import 'package:ecommerce/Modal/SubCatSerchModal.dart';
import 'package:ecommerce/Modal/UserModal.dart';
import 'package:ecommerce/Modal/UserSelectAddModal.dart';
import 'package:ecommerce/Modal/UserWishLIstModal.dart';
import 'package:ecommerce/Modal/ViewCartModal.dart';
import 'package:flutter/material.dart';



Color bgcolor = Colors.grey.shade100;

const String baseUrl = 'https://ecomweb.fableadtechnolabs.com/api';

SignupModal? signupmodal;
UserModal? usermodal;
ProfileModal? profilemodal;
EditprofileModal? editprofilemodal;
AllCatModal? allcatmodal;
MainCatModal? maincatmodal;
SubCatModal? subcatmodal;
AllProductModal? allproductmodal;
CatWiceProductModal? catwiceproductmodal;
AllSubcatWiceProduct? allsubcatwiceproduct;
SearchModal? searchmodal;
UserWishLIstModal? userwishlIstmodal;
SubCatSerchModal? subcatserchmodal;
AddToWishLIstModal? addtowishlIstmodal;
RemoveWishListModal? removewishlistmodal;
AddCartModal? addcartmodal;
ViewCartModal? viewcartmodal;
RemoveCartModal? removecartmodal;
ChangePasswordModal? changepasswordmodal;
IncrementModal? incrementmodal;
DisIncrementModal? disincrementmodal;
ProductDetailModal? productdetailmodal;
ColorShowModal? colorshowmodal;
SizeShowModal? sizeshowmodal;
SelectColorModal? selectcolormodal;
ColorMatchModal? colormatchmodal;
ChekOutDetailModal? chekoutdetailmodal;
CheckOutModal? checkoutmodal;
MyOrderListModal? myorderlistmodal;
MyOederDetailModal? myoederdetailmodal;
SalesProductModal? salesproductmodal;
SalesProductListModal? salesproductlistmodal;
BestSellerProductModal? bestsellerproductmodal;
ShippingAddModal? shippingaddmodal;
AllUserAddModal? alluseraddmodal;
UserSelectAddModal? userselectaddmodal;
EditShippingAdd? editshippingadd;
RemoveAddressModal? removeaddressmodal;
SearchBestSaleModal? searchbestsaleModal;
SaleListSerachModal? salelistserachmodal;
DeliveredOrderModal? deliveredordermodal;
PendingOrderModal? pendingordermodal;
OrderCancelModal? ordercancelmodal;
PaypalModal? paypalmodal;
CountryModal?countrymodal;
StateModal?statemodal;
CityModal?citymodal;

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}
