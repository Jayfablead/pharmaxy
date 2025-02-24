class Remove_cart_withoutlogin_Model {
  String? status;
  String? message;

  Remove_cart_withoutlogin_Model({this.status, this.message});

  Remove_cart_withoutlogin_Model.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    return data;
  }
}
