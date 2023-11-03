class ProfileModal {
  String? status;
  String? message;
  ProfileDetails? profileDetails;

  ProfileModal({this.status, this.message, this.profileDetails});

  ProfileModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    profileDetails = json['profileDetails'] != null
        ? new ProfileDetails.fromJson(json['profileDetails'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.profileDetails != null) {
      data['profileDetails'] = this.profileDetails!.toJson();
    }
    return data;
  }
}

class ProfileDetails {
  String? profileimage;
  String? userFirstName;
  String? userLastName;
  String? userGander;
  String? userEmail;
  String? userPhone;
  String? userCity;
  String? userState;
  String? userAddress;
  String? userAddress2;

  ProfileDetails(
      {this.profileimage,
      this.userFirstName,
      this.userLastName,
      this.userGander,
      this.userEmail,
      this.userPhone,
      this.userCity,
      this.userState,
      this.userAddress,
      this.userAddress2});

  ProfileDetails.fromJson(Map<String, dynamic> json) {
    profileimage = json['Profileimage'];
    userFirstName = json['UserFirstName'];
    userLastName = json['UserLastName'];
    userGander = json['UserGander'];
    userEmail = json['UserEmail'];
    userPhone = json['UserPhone'];
    userCity = json['UserCity'];
    userState = json['UserState'];
    userAddress = json['UserAddress'];
    userAddress2 = json['UserAddress2'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['Profileimage'] = this.profileimage;
    data['UserFirstName'] = this.userFirstName;
    data['UserLastName'] = this.userLastName;
    data['UserGander'] = this.userGander;
    data['UserEmail'] = this.userEmail;
    data['UserPhone'] = this.userPhone;
    data['UserCity'] = this.userCity;
    data['UserState'] = this.userState;
    data['UserAddress'] = this.userAddress;
    data['UserAddress2'] = this.userAddress2;
    return data;
  }
}
