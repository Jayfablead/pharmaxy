class UserSelectAddModal {
  String? message;
  String? status;
  SelectShippingAddress? selectShippingAddress;

  UserSelectAddModal({this.message, this.status, this.selectShippingAddress});

  UserSelectAddModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    selectShippingAddress = json['select_shipping_address'] != null
        ? new SelectShippingAddress.fromJson(json['select_shipping_address'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.selectShippingAddress != null) {
      data['select_shipping_address'] = this.selectShippingAddress!.toJson();
    }
    return data;
  }
}

class SelectShippingAddress {
  String? id;
  String? userId;
  String? firstName;
  String? lastName;
  String? city;
  String? state;
  String? country;
  String? zipcode;
  String? address;
  String? number;
  String? createdAt;

  SelectShippingAddress(
      {this.id,
      this.userId,
      this.firstName,
      this.lastName,
      this.city,
      this.state,
      this.country,
      this.zipcode,
      this.address,
      this.number,
      this.createdAt});

  SelectShippingAddress.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    userId = json['user_id'];
    firstName = json['first_name'];
    lastName = json['last_name'];
    city = json['city'];
    state = json['state'];
    country = json['country'];
    zipcode = json['zipcode'];
    address = json['address'];
    number = json['number'];
    createdAt = json['Created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['user_id'] = this.userId;
    data['first_name'] = this.firstName;
    data['last_name'] = this.lastName;
    data['city'] = this.city;
    data['state'] = this.state;
    data['country'] = this.country;
    data['zipcode'] = this.zipcode;
    data['address'] = this.address;
    data['number'] = this.number;
    data['Created_at'] = this.createdAt;
    return data;
  }
}
