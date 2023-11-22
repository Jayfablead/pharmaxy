class StripeModal {
  String? status;
  String? message;
  String? paymentID;

  StripeModal({this.status, this.message, this.paymentID});

  StripeModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    paymentID = json['paymentID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    data['paymentID'] = this.paymentID;
    return data;
  }
}
