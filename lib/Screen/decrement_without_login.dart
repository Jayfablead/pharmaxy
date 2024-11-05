class decrement_without_login1 {
  String? message;
  String? status;

  decrement_without_login1({this.message, this.status});

  decrement_without_login1.fromJson(Map<String, dynamic> json) {
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
