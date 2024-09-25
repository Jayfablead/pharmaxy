class AllCouponModal {
  String? status;
  String? userId;
  List<Data>? data;

  AllCouponModal({this.status, this.userId, this.data});

  AllCouponModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    userId = json['user_id'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['user_id'] = this.userId;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? couponID;
  String? productCoupon;
  String? categoryID;
  String? productID;
  String? userID;
  String? couponName;
  String? productSpecification;
  String? couponCode;
  String? couponType;
  String? couponValue;
  String? minimunPrice;
  String? maximunPrice;
  String? userStatus;
  String? startDate;
  String? endDate;
  String? couponLive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.couponID,
        this.productCoupon,
        this.categoryID,
        this.productID,
        this.userID,
        this.couponName,
        this.productSpecification,
        this.couponCode,
        this.couponType,
        this.couponValue,
        this.minimunPrice,
        this.maximunPrice,
        this.userStatus,
        this.startDate,
        this.endDate,
        this.couponLive,
        this.createdAt,
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    couponID = json['CouponID'];
    productCoupon = json['ProductCoupon'];
    categoryID = json['CategoryID'];
    productID = json['ProductID'];
    userID = json['UserID'];
    couponName = json['CouponName'];
    productSpecification = json['ProductSpecification'];
    couponCode = json['CouponCode'];
    couponType = json['CouponType'];
    couponValue = json['CouponValue'];
    minimunPrice = json['MinimunPrice'];
    maximunPrice = json['MaximunPrice'];
    userStatus = json['UserStatus'];
    startDate = json['StartDate'];
    endDate = json['EndDate'];
    couponLive = json['CouponLive'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CouponID'] = this.couponID;
    data['ProductCoupon'] = this.productCoupon;
    data['CategoryID'] = this.categoryID;
    data['ProductID'] = this.productID;
    data['UserID'] = this.userID;
    data['CouponName'] = this.couponName;
    data['ProductSpecification'] = this.productSpecification;
    data['CouponCode'] = this.couponCode;
    data['CouponType'] = this.couponType;
    data['CouponValue'] = this.couponValue;
    data['MinimunPrice'] = this.minimunPrice;
    data['MaximunPrice'] = this.maximunPrice;
    data['UserStatus'] = this.userStatus;
    data['StartDate'] = this.startDate;
    data['EndDate'] = this.endDate;
    data['CouponLive'] = this.couponLive;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}
