class ChekOutDetailModal {
  String? message;
  String? status;
  UserDetails? userDetails;
  int? finalTotal;
  double? totalTax;
  double? finalTotalWithTax;
  int? shippingRate;
  double? totalWithTaxShip;

  ChekOutDetailModal(
      {this.message,
        this.status,
        this.userDetails,
        this.finalTotal,
        this.totalTax,
        this.finalTotalWithTax,
        this.shippingRate,
        this.totalWithTaxShip});

  ChekOutDetailModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    finalTotal = json['final_total'];
    totalTax = json['total_tax'];
    finalTotalWithTax = json['final_total_with_tax'];
    shippingRate = json['shipping_rate'];
    totalWithTaxShip = json['total_with_tax_ship'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.userDetails != null) {
      data['user_details'] = this.userDetails!.toJson();
    }
    data['final_total'] = this.finalTotal;
    data['total_tax'] = this.totalTax;
    data['final_total_with_tax'] = this.finalTotalWithTax;
    data['shipping_rate'] = this.shippingRate;
    data['total_with_tax_ship'] = this.totalWithTaxShip;
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
