class ChekOutDetailModal {
  String? message;
  String? status;
  UserDetails? userDetails;
  String? finalTotal;
  String? totalTax;
  String? finalTotalWithTax;

  ChekOutDetailModal(
      {this.message,
      this.status,
      this.userDetails,
      this.finalTotal,
      this.totalTax,
      this.finalTotalWithTax});

  ChekOutDetailModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    userDetails = json['user_details'] != null
        ? new UserDetails.fromJson(json['user_details'])
        : null;
    finalTotal = json['final_total'];
    totalTax = json['total_tax'];
    finalTotalWithTax = json['final_total_with_tax'];
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
    data['UserPhone'] = this.userPhone;
    data['UserCountry'] = this.userCountry;
    data['UserAddress'] = this.userAddress;
    data['UserAddress2'] = this.userAddress2;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}
