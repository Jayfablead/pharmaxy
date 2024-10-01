class Addtocart_withoutuser_Model {
  String? message;
  String? status;

  Addtocart_withoutuser_Model({this.message, this.status});

  Addtocart_withoutuser_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    return data;
  }
}
