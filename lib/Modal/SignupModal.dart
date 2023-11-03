class SignupModal {
  String? status;
  String? message;
  int? info;

  SignupModal({this.status, this.message, this.info});

  SignupModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    info = json['info'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['info'] = this.info;
    return data;
  }
}
