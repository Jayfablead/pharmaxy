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
        ? UserDetails.fromJson(json['user_details'])
        : null;
    finalTotal = json['final_total'];
    totalTax = (json['total_tax'] as num?)?.toDouble();
    finalTotalWithTax = (json['final_total_with_tax'] as num?)?.toDouble();
    shippingRate = json['shipping_rate'];
    totalWithTaxShip = (json['total_with_tax_ship'] as num?)?.toDouble();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['message'] = message;
    data['status'] = status;
    if (userDetails != null) {
      data['user_details'] = userDetails!.toJson();
    }
    data['final_total'] = finalTotal;
    data['total_tax'] = totalTax;
    data['final_total_with_tax'] = finalTotalWithTax;
    data['shipping_rate'] = shippingRate;
    data['total_with_tax_ship'] = totalWithTaxShip;
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
    final Map<String, dynamic> data = <String, dynamic>{};
    data['UserID'] = userID;
    data['UserType'] = userType;
    data['UserEmail'] = userEmail;
    data['UserPassword'] = userPassword;
    data['UserFirstName'] = userFirstName;
    data['UserLastName'] = userLastName;
    data['DOB'] = dOB;
    data['UserGander'] = userGander;
    data['UserProfile'] = userProfile;
    data['UserCity'] = userCity;
    data['UserState'] = userState;
    data['UserZip'] = userZip;
    data['UserEmailVerified'] = userEmailVerified;
    data['UserRegistrationDate'] = userRegistrationDate;
    data['UserVerificationCode'] = userVerificationCode;
    data['forgot_pass_key'] = forgotPassKey;
    data['UserPhone'] = userPhone;
    data['UserCountry'] = userCountry;
    data['UserAddress'] = userAddress;
    data['UserAddress2'] = userAddress2;
    data['Created_at'] = createdAt;
    data['Updated_at'] = updatedAt;
    return data;
  }
}
