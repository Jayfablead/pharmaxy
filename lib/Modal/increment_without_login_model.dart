class increment_without_login_model1 {
  String? message;
  String? status;

  increment_without_login_model1({this.message, this.status});

  increment_without_login_model1.fromJson(Map<String, dynamic> json) {
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
