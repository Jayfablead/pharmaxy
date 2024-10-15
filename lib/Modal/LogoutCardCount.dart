class LogoutCardCount {
  String? status;
  int? cartCount;

  LogoutCardCount({this.status, this.cartCount});

  LogoutCardCount.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    cartCount = json['cart_count'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['cart_count'] = this.cartCount;
    return data;
  }
}
