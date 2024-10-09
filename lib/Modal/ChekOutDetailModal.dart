class ChekOutDetailModal {
  String? status;
  String? message;
  List<UserDetails>? userDetails;
  List<CheckoutData>? checkoutData;

  ChekOutDetailModal(
      {this.status, this.message, this.userDetails, this.checkoutData});

  ChekOutDetailModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['user_details'] != null) {
      userDetails = <UserDetails>[];
      json['user_details'].forEach((v) {
        userDetails!.add(new UserDetails.fromJson(v));
      });
    }
    if (json['checkout_data'] != null) {
      checkoutData = <CheckoutData>[];
      json['checkout_data'].forEach((v) {
        checkoutData!.add(new CheckoutData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.map((v) => v.toJson()).toList();
    }
    if (this.checkoutData != null) {
      data['checkout_data'] =
          this.checkoutData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class UserDetails {
  String? id;
  String? userId;
  String? productId;
  String? quantity;
  String? variationTblId;
  String? productColor;
  String? productSize;
  String? productPrice;
  String? createdDate;

  UserDetails(
      {this.id,
        this.userId,
        this.productId,
        this.quantity,
        this.variationTblId,
        this.productColor,
        this.productSize,
        this.productPrice,
        this.createdDate});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    variationTblId = json['variation_tbl_id'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    productPrice = json['product_price'];
    createdDate = json['created_date'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['variation_tbl_id'] = this.variationTblId;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['product_price'] = this.productPrice;
    data['created_date'] = this.createdDate;
    return data;
  }
}

class CheckoutData {
  String? id;
  String? userId;
  String? deviceId;
  String? finalTotal;
  String? totalTax;
  String? finalTotalWithTax;
  String? coupon;
  String? discount;
  String? referral;
  String? createdAt;
  String? updatedAt;
  String? shippingTax;
  String? total;

  CheckoutData(
      {this.id,
        this.userId,
        this.deviceId,
        this.finalTotal,
        this.totalTax,
        this.finalTotalWithTax,
        this.coupon,
        this.discount,
        this.referral,
        this.createdAt,
        this.updatedAt,
        this.shippingTax,
        this.total});

  CheckoutData.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    deviceId = json['device_id'];
    finalTotal = json['final_total'];
    totalTax = json['total_tax'];
    finalTotalWithTax = json['final_total_with_tax'];
    coupon = json['coupon'];
    discount = json['discount'];
    referral = json['referral'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    shippingTax = json['shipping_tax'];
    total = json['total'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['device_id'] = this.deviceId;
    data['final_total'] = this.finalTotal;
    data['total_tax'] = this.totalTax;
    data['final_total_with_tax'] = this.finalTotalWithTax;
    data['coupon'] = this.coupon;
    data['discount'] = this.discount;
    data['referral'] = this.referral;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['shipping_tax'] = this.shippingTax;
    data['total'] = this.total;
    return data;
  }
}
