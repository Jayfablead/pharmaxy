class EditShippingAdd {
  String? message;
  String? status;

  EditShippingAdd({this.message, this.status});

  EditShippingAdd.fromJson(Map<String, dynamic> json) {
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
