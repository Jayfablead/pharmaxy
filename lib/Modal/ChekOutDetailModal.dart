class ChekOutDetailModal {
  String? status;
  String? message;
  UserDetails? userDetails;
  List<CheckoutData>? checkoutData;

  ChekOutDetailModal(
      {this.status, this.message, this.userDetails, this.checkoutData});

  ChekOutDetailModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
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
      data['user_details'] = this.userDetails!.toJson();
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
  String? deviceId;
  String? productId;
  String? quantity;
  String? productPrice;
  String? createdAt;

  UserDetails(
      {this.id,
        this.deviceId,
        this.productId,
        this.quantity,
        this.productPrice,
        this.createdAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    deviceId = json['device_id'];
    productId = json['product_id'];
    quantity = json['quantity'];
    productPrice = json['product_price'];
    createdAt = json['Created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['device_id'] = this.deviceId;
    data['product_id'] = this.productId;
    data['quantity'] = this.quantity;
    data['product_price'] = this.productPrice;
    data['Created_at'] = this.createdAt;
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
