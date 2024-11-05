class ShippedOrderModel {
  String? status;
  List<Data>? data;

  ShippedOrderModel({this.status, this.data});

  ShippedOrderModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? orderId;
  String? orderNumber;
  String? orderStatus;
  String? totalAmount;
  String? firstImage;

  Data(
      {this.orderId,
      this.orderNumber,
      this.orderStatus,
      this.totalAmount,
      this.firstImage});

  Data.fromJson(Map<String, dynamic> json) {
    orderId = json['order_id'];
    orderNumber = json['order_number'];
    orderStatus = json['order_status'];
    totalAmount = json['total_amount'];
    firstImage = json['first_image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['order_id'] = this.orderId;
    data['order_number'] = this.orderNumber;
    data['order_status'] = this.orderStatus;
    data['total_amount'] = this.totalAmount;
    data['first_image'] = this.firstImage;
    return data;
  }
}
