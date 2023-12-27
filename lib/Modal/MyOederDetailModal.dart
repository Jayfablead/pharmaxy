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
  List<VariationDetails>? variationDetails;
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
  String? countryName;
  String? stateName;
  String? cityName;

  OrderDetails(
      {this.orderItemID,
      this.orderID,
      this.productID,
      this.quantity,
      this.price,
      this.variationTableId,
      this.productColor,
      this.productSize,
      this.variationDetails,
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
      this.zipcode,
      this.countryName,
      this.stateName,
      this.cityName});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderItemID = json['OrderItemID'];
    orderID = json['OrderID'];
    productID = json['ProductID'];
    quantity = json['Quantity'];
    price = json['Price'];
    variationTableId = json['variation_table_id'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    if (json['variation_details'] != null) {
      variationDetails = <VariationDetails>[];
      json['variation_details'].forEach((v) {
        variationDetails!.add(new VariationDetails.fromJson(v));
      });
    }
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
    countryName = json['country_name'];
    stateName = json['state_name'];
    cityName = json['city_name'];
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
    if (this.variationDetails != null) {
      data['variation_details'] =
          this.variationDetails!.map((v) => v.toJson()).toList();
    }
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
    data['country_name'] = this.countryName;
    data['state_name'] = this.stateName;
    data['city_name'] = this.cityName;
    return data;
  }
}

class VariationDetails {
  String? variationsDetailsID;
  String? variationID;
  String? variationVlueID;
  String? variationName;
  String? variationTypeName;
  String? variationTypeID;

  VariationDetails(
      {this.variationsDetailsID,
      this.variationID,
      this.variationVlueID,
      this.variationName,
      this.variationTypeName,
      this.variationTypeID});

  VariationDetails.fromJson(Map<String, dynamic> json) {
    variationsDetailsID = json['VariationsDetailsID'];
    variationID = json['VariationID'];
    variationVlueID = json['VariationVlueID'];
    variationName = json['VariationName'];
    variationTypeName = json['VariationTypeName'];
    variationTypeID = json['VariationTypeID'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationsDetailsID'] = this.variationsDetailsID;
    data['VariationID'] = this.variationID;
    data['VariationVlueID'] = this.variationVlueID;
    data['VariationName'] = this.variationName;
    data['VariationTypeName'] = this.variationTypeName;
    data['VariationTypeID'] = this.variationTypeID;
    return data;
  }
}
