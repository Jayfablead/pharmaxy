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
  String? userID;
  String? userType;
  String? userEmail;
  String? userPassword;
  String? userFirstName;
  String? userLastName;
  String? dOB;
  String? userGander;
  String? userProfile;
  String? userCity;
  String? userState;
  String? userZip;
  String? userEmailVerified;
  String? userRegistrationDate;
  String? userVerificationCode;
  String? referCode;
  String? forgotPassKey;
  String? userPhone;
  String? userCountry;
  String? userAddress;
  String? userAddress2;
  String? createdAt;
  String? updatedAt;

  UserDetails(
      {this.userID,
        this.userType,
        this.userEmail,
        this.userPassword,
        this.userFirstName,
        this.userLastName,
        this.dOB,
        this.userGander,
        this.userProfile,
        this.userCity,
        this.userState,
        this.userZip,
        this.userEmailVerified,
        this.userRegistrationDate,
        this.userVerificationCode,
        this.referCode,
        this.forgotPassKey,
        this.userPhone,
        this.userCountry,
        this.userAddress,
        this.userAddress2,
        this.createdAt,
        this.updatedAt});

  UserDetails.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    userType = json['UserType'];
    userEmail = json['UserEmail'];
    userPassword = json['UserPassword'];
    userFirstName = json['UserFirstName'];
    userLastName = json['UserLastName'];
    dOB = json['DOB'];
    userGander = json['UserGander'];
    userProfile = json['UserProfile'];
    userCity = json['UserCity'];
    userState = json['UserState'];
    userZip = json['UserZip'];
    userEmailVerified = json['UserEmailVerified'];
    userRegistrationDate = json['UserRegistrationDate'];
    userVerificationCode = json['UserVerificationCode'];
    referCode = json['refer_code'];
    forgotPassKey = json['forgot_pass_key'];
    userPhone = json['UserPhone'];
    userCountry = json['UserCountry'];
    userAddress = json['UserAddress'];
    userAddress2 = json['UserAddress2'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['UserType'] = this.userType;
    data['UserEmail'] = this.userEmail;
    data['UserPassword'] = this.userPassword;
    data['UserFirstName'] = this.userFirstName;
    data['UserLastName'] = this.userLastName;
    data['DOB'] = this.dOB;
    data['UserGander'] = this.userGander;
    data['UserProfile'] = this.userProfile;
    data['UserCity'] = this.userCity;
    data['UserState'] = this.userState;
    data['UserZip'] = this.userZip;
    data['UserEmailVerified'] = this.userEmailVerified;
    data['UserRegistrationDate'] = this.userRegistrationDate;
    data['UserVerificationCode'] = this.userVerificationCode;
    data['refer_code'] = this.referCode;
    data['forgot_pass_key'] = this.forgotPassKey;
    data['UserPhone'] = this.userPhone;
    data['UserCountry'] = this.userCountry;
    data['UserAddress'] = this.userAddress;
    data['UserAddress2'] = this.userAddress2;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}

class CheckoutData {
  String? id;
  String? userId;
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
