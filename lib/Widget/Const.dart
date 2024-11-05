import 'package:connectivity/connectivity.dart';
import 'package:ecommerce/Modal/AddCartModal.dart';
import 'package:ecommerce/Modal/AddToWishLIstModal.dart';
import 'package:ecommerce/Modal/Addtocart_withoutuser_Model.dart';
import 'package:ecommerce/Modal/AllCatModal.dart';
import 'package:ecommerce/Modal/AllCouponModal.dart';
import 'package:ecommerce/Modal/AllProductModal.dart';
import 'package:ecommerce/Modal/AllProductSerchModel.dart';
import 'package:ecommerce/Modal/AllSubcatWiceProduct.dart';
import 'package:ecommerce/Modal/AllUserAddModal.dart';
import 'package:ecommerce/Modal/BannerModel.dart';
import 'package:ecommerce/Modal/BestSellerProductModal.dart';
import 'package:ecommerce/Modal/BlogModel.dart';
import 'package:ecommerce/Modal/BrandModel.dart';
import 'package:ecommerce/Modal/BrandWiceProductModel.dart';
import 'package:ecommerce/Modal/BrandWiceProductsearchModel.dart';
import 'package:ecommerce/Modal/CancelOrderModel.dart';
import 'package:ecommerce/Modal/CartcountModel.dart';
import 'package:ecommerce/Modal/CatWiceProductModal.dart';
import 'package:ecommerce/Modal/CateWisePageViewModel.dart';
import 'package:ecommerce/Modal/ChangePasswordModal.dart';
import 'package:ecommerce/Modal/ChatModel.dart';
import 'package:ecommerce/Modal/CheckOutModal.dart';
import 'package:ecommerce/Modal/CheckOutSendModel.dart';
import 'package:ecommerce/Modal/ChekOutDetailModal.dart';
import 'package:ecommerce/Modal/CityModal.dart';
import 'package:ecommerce/Modal/ColorMatchModal.dart';
import 'package:ecommerce/Modal/ColorShowModal.dart';
import 'package:ecommerce/Modal/CountryModal.dart';
import 'package:ecommerce/Modal/CouponModel.dart';
import 'package:ecommerce/Modal/DeleteReviewModal.dart';
import 'package:ecommerce/Modal/DeleteUserModel.dart';
import 'package:ecommerce/Modal/DeliveredOrderModal.dart';
import 'package:ecommerce/Modal/DisIncrementModal.dart';
import 'package:ecommerce/Modal/EditShippingAdd.dart';
import 'package:ecommerce/Modal/EditprofileModal.dart';
import 'package:ecommerce/Modal/FilterbyModel.dart';
import 'package:ecommerce/Modal/ForgotModal.dart';
import 'package:ecommerce/Modal/IncrementModal.dart';
import 'package:ecommerce/Modal/LogoutCardCount.dart';
import 'package:ecommerce/Modal/MainCatModal.dart';
import 'package:ecommerce/Modal/MyOederDetailModal.dart';
import 'package:ecommerce/Modal/MyOrderListModal.dart';
import 'package:ecommerce/Modal/OrderCancelModal.dart';
import 'package:ecommerce/Modal/PaginationModel.dart';
import 'package:ecommerce/Modal/PaidOrderModel.dart';
import 'package:ecommerce/Modal/PaymentMthodsModal.dart';
import 'package:ecommerce/Modal/PaypalModal.dart';
import 'package:ecommerce/Modal/PendingOrderModal.dart';
import 'package:ecommerce/Modal/PlacedOrderModel.dart';
import 'package:ecommerce/Modal/PrescriptionModel.dart';
import 'package:ecommerce/Modal/ProductDetailModal.dart';
import 'package:ecommerce/Modal/ProfileModal.dart';
import 'package:ecommerce/Modal/RecentBlogModel.dart';
import 'package:ecommerce/Modal/RefillModel.dart';
import 'package:ecommerce/Modal/RemoveAddressModal.dart';
import 'package:ecommerce/Modal/RemoveCartModal.dart';
import 'package:ecommerce/Modal/RemoveCouponModel.dart';
import 'package:ecommerce/Modal/RemoveWishListModal.dart';
import 'package:ecommerce/Modal/Remove_cart_withoutlogin_Model.dart';
import 'package:ecommerce/Modal/RequestMedicineModel.dart';
import 'package:ecommerce/Modal/RequestformModel.dart';
import 'package:ecommerce/Modal/SaleListSerachModal.dart';
import 'package:ecommerce/Modal/SalesProductListModal.dart';
import 'package:ecommerce/Modal/SearchBestSaleModal.dart';
import 'package:ecommerce/Modal/SearchModal.dart';
import 'package:ecommerce/Modal/SelectColorModal.dart';
import 'package:ecommerce/Modal/SendmsgModel.dart';
import 'package:ecommerce/Modal/ShippedOrderModel.dart';
import 'package:ecommerce/Modal/ShippingAddModal.dart';
import 'package:ecommerce/Modal/ShortbyModel.dart';
import 'package:ecommerce/Modal/SignupModal.dart';
import 'package:ecommerce/Modal/SizeShowModal.dart';
import 'package:ecommerce/Modal/StateModal.dart';
import 'package:ecommerce/Modal/SubCatModal.dart';
import 'package:ecommerce/Modal/SubCatSerchModal.dart';
import 'package:ecommerce/Modal/UserModal.dart';
import 'package:ecommerce/Modal/UserSelectAddModal.dart';
import 'package:ecommerce/Modal/UserWishLIstModal.dart';
import 'package:ecommerce/Modal/ViewCartModal.dart';
import 'package:ecommerce/Modal/ViewReviewModal.dart';
import 'package:ecommerce/Modal/View_withoutuser_Model.dart';
import 'package:ecommerce/Modal/bestsellerModel.dart';
import 'package:ecommerce/Modal/brandwicePageViewModel.dart';
import 'package:ecommerce/Modal/cateModel.dart';
import 'package:ecommerce/Modal/increment_without_login_model.dart';
import 'package:ecommerce/Screen/BlocdetailModel.dart';
import 'package:ecommerce/Screen/decrement_without_login.dart';
import 'package:flutter/material.dart';
import 'package:sizer/sizer.dart';

import '../Modal/ProductDetail2Modal.dart';
import '../Modal/StripeModal.dart';
import '../Modal/addReviewModal.dart';

Color bgcolor = Colors.grey.shade100;

class AppColors {
  static const Color primary = Color(0xff0061b0);
  static const Color btnColor = Color(0xffE49B52);
  static const Color btnColorSecondary = Color(0xff31ad89);
  static const Color btnColorThird = Color(0xff3190ad);
}

// const String baseUrl = 'https://ecomweb.fableadtechnolabs.com/api';
// const String baseUrl = 'https://pharmato.fableadtechnolabs.com/api/';
const String baseUrl = 'https://pharmaxy.org/api';

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
//SubCatSerchModal? subcatserchmodal;
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
// SalesProductModal? salesproductmodal;
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
CountryModal? countrymodal;
StateModal? statemodal;
CityModal? citymodal;
ForgotModal? forgotmodal;
PaymethodModal? paymethodmodal;
addReviewModal? addreview;
ViewReviewModal? viewReviewmodal;
DeleteReviewModal? deletereviewmodal;
StripeModal? strpiepay;
ProductDetail2Modal? productdetail2modal;
cateModel? catemodel;
bestsellerModel? bestselllermodel;
ChatModel? chatviewmodal;
SendMessage? sendmessagesmodal;
AllCouponModal? allcouponmodal;
CatSerchModal? catSerchModal;

// Ram Api
BlogModel? blogmodel;
BrandModel? brandmodel;
BrandWiceProductModel? brandWiceProductmodel;
BrandWiceProductsearchModel? brandWiceProductsearchmodel;
CouponModel? couponmodel;
CheckOutSendModel? checkOutsendModel;
BlocdetailsModal? blocdetailsModal;
PlacedOrderModel? placedorderModel;
PaidOrderModel? paidorderModel;
ShippedOrderModel? shippedorderModel;
RecentBlogModel? recentblogModel;
CartcountModel? cartcountmodel;
FilterbyModel? filterbymodel;
ShortbyModel? shortbymodel;
AllProductSerachModel? allProductserachModel;
BannerModel? bannermodel;
CateWisePageViewModel? catewisePageViewModel;
BrandwicePageViewModel? brandwicePageviewmodel;
RemoveCouponModel? removecouponModel;

//Prit Api
RequestformModel? requestformModel;
PrescriptionformModel? prescriptionformModel;
RequestMedicineModel? requestMedicineModel;
RefillModel? refillModel;
DeleteUserModel? deleteuserModel;
CancelOrderModel? cancelOrderModel;
LogoutCardCount? logoutCardCount;
PaginationModel? paginationModel;

// without user Apis

Addtocart_withoutuser_Model? addtocartwithoutuserModel;
View_withoutuser_Model? viewwithoutuserModel;
Remove_cart_withoutlogin_Model? removecartwithoutloginModel;
increment_without_login_model1? Incrementwithoutloginmodel;
decrement_without_login1? Decrementwithoutlogin;

Future<bool> checkInternet() async {
  var connectivityResult = await (Connectivity().checkConnectivity());
  if (connectivityResult == ConnectivityResult.mobile) {
    return true;
  } else if (connectivityResult == ConnectivityResult.wifi) {
    return true;
  }
  return false;
}

InputDecoration inputDecoration({
  required String hintText,
  Icon? icon,
  IconButton? ico,
  Color? cr,
}) {
  return InputDecoration(
    contentPadding: EdgeInsets.symmetric(vertical: 2.h, horizontal: 4.w),
    suffixIcon: ico,
    hintText: hintText,
    prefixIcon: icon,
    errorStyle: TextStyle(
      fontFamily: 'task',
      color: Colors.red,
      fontWeight: FontWeight.normal,
      fontSize: 11.sp,
      letterSpacing: 1,
    ),
    hintStyle: TextStyle(
        fontFamily: 'task',
        color: cr,
        fontWeight: FontWeight.normal,
        fontSize: 15.sp,
        letterSpacing: 1),
    fillColor: Color(0x59bbbbbb),
    filled: true,
    disabledBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink.withOpacity(0.1), width: 1),
      //ram
      borderRadius: BorderRadius.circular(10),
    ),
    errorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1), //ram
      borderRadius: BorderRadius.circular(10),
    ),
    enabledBorder: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(10),
    ),
    focusedErrorBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.red, width: 1), //ram
      borderRadius: BorderRadius.circular(10),
    ),
    focusedBorder: OutlineInputBorder(
      borderSide: BorderSide(color: Colors.pink.withOpacity(0.1), width: 1),
      //ram
      borderRadius: BorderRadius.circular(10),
    ),
    border: OutlineInputBorder(
      borderSide: BorderSide.none,
      borderRadius: BorderRadius.circular(30),
    ),
  );
}

// ******************* Custom Search Field
TextField searchfield({
  required TextEditingController controller,
  required ValueChanged<String> onChanged,
  required String hint,
  Color? clrs,
}) {
  return TextField(
    onChanged: onChanged,
    controller: controller,
    style: TextStyle(
        fontFamily: 'task',
        color: clrs,
        fontWeight: FontWeight.bold,
        fontSize: 12.5.sp,
        letterSpacing: 1.5),
    decoration: inputDecoration(
      hintText: hint.toString(),
      icon: Icon(
        Icons.search,
        color: clrs,
        size: 22.sp,
      ),
    ),
  );
}
