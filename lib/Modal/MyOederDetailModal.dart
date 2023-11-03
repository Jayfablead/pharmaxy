class MyOederDetailModal {
  String? message;
  String? status;
  OrderDetails? orderDetails;

  MyOederDetailModal({this.message, this.status, this.orderDetails});

  MyOederDetailModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    orderDetails = json['order_details'] != null
        ? new OrderDetails.fromJson(json['order_details'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.orderDetails != null) {
      data['order_details'] = this.orderDetails!.toJson();
    }
    return data;
  }
}

class OrderDetails {
  String? orderItemID;
  String? orderID;
  String? productID;
  String? quantity;
  String? price;
  String? variationTableId;
  String? productColor;
  String? productSize;
  String? createdAt;
  String? updatedAt;
  String? productName;
  String? imgData;
  String? orderData;
  String? orderNumber;
  String? payment;
  String? orderStatus;
  String? firstname;
  String? lastname;
  String? phoneno;
  String? address1;
  String? zipcode;

  OrderDetails(
      {this.orderItemID,
      this.orderID,
      this.productID,
      this.quantity,
      this.price,
      this.variationTableId,
      this.productColor,
      this.productSize,
      this.createdAt,
      this.updatedAt,
      this.productName,
      this.imgData,
      this.orderData,
      this.orderNumber,
      this.payment,
      this.orderStatus,
      this.firstname,
      this.lastname,
      this.phoneno,
      this.address1,
      this.zipcode});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderItemID = json['OrderItemID'];
    orderID = json['OrderID'];
    productID = json['ProductID'];
    quantity = json['Quantity'];
    price = json['Price'];
    variationTableId = json['variation_table_id'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
    productName = json['product_name'];
    imgData = json['img_data'];
    orderData = json['order_data'];
    orderNumber = json['OrderNumber'];
    payment = json['payment'];
    orderStatus = json['OrderStatus'];
    firstname = json['firstname'];
    lastname = json['lastname'];
    phoneno = json['phoneno'];
    address1 = json['address1'];
    zipcode = json['zipcode'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderItemID'] = this.orderItemID;
    data['OrderID'] = this.orderID;
    data['ProductID'] = this.productID;
    data['Quantity'] = this.quantity;
    data['Price'] = this.price;
    data['variation_table_id'] = this.variationTableId;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    data['product_name'] = this.productName;
    data['img_data'] = this.imgData;
    data['order_data'] = this.orderData;
    data['OrderNumber'] = this.orderNumber;
    data['payment'] = this.payment;
    data['OrderStatus'] = this.orderStatus;
    data['firstname'] = this.firstname;
    data['lastname'] = this.lastname;
    data['phoneno'] = this.phoneno;
    data['address1'] = this.address1;
    data['zipcode'] = this.zipcode;
    return data;
  }
}
