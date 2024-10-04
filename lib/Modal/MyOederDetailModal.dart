class MyOederDetailModal {
  String? message;
  String? status;
  List<OrderDetails>? orderDetails;
  UserDetail? userDetail;

  MyOederDetailModal(
      {this.message, this.status, this.orderDetails, this.userDetail});

  MyOederDetailModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['order_details'] != null) {
      orderDetails = <OrderDetails>[];
      json['order_details'].forEach((v) {
        orderDetails!.add(new OrderDetails.fromJson(v));
      });
    }
    userDetail = json['user_detail'] != null
        ? new UserDetail.fromJson(json['user_detail'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.orderDetails != null) {
      data['order_details'] =
          this.orderDetails!.map((v) => v.toJson()).toList();
    }
    if (this.userDetail != null) {
      data['user_detail'] = this.userDetail!.toJson();
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
  Null? variationDetails;
  Null? packageDate;
  Null? expriceDate;
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
  String? invoicePdf;
  String? cityName;
  String? stateName;
  String? countryName;

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
        this.packageDate,
        this.expriceDate,
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
        this.invoicePdf,
        this.cityName,
        this.stateName,
        this.countryName});

  OrderDetails.fromJson(Map<String, dynamic> json) {
    orderItemID = json['OrderItemID'];
    orderID = json['OrderID'];
    productID = json['ProductID'];
    quantity = json['Quantity'];
    price = json['Price'];
    variationTableId = json['variation_table_id'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    variationDetails = json['variation_details'];
    packageDate = json['package_date'];
    expriceDate = json['exprice_date'];
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
    invoicePdf = json['invoice_pdf'];
    cityName = json['city_name'];
    stateName = json['state_name'];
    countryName = json['country_name'];
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
    data['variation_details'] = this.variationDetails;
    data['package_date'] = this.packageDate;
    data['exprice_date'] = this.expriceDate;
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
    data['invoice_pdf'] = this.invoicePdf;
    data['city_name'] = this.cityName;
    data['state_name'] = this.stateName;
    data['country_name'] = this.countryName;
    return data;
  }
}

class UserDetail {
  String? orderID;
  String? userID;
  String? fname;
  String? lname;
  String? email;
  String? phoneno;
  String? country;
  String? state;
  String? city;
  String? address1;
  String? address2;
  String? zipcode;
  String? company;
  String? orderDate;
  String? orderNumber;
  String? totalTax;
  String? totalShipingCost;
  String? totalDiscount;
  String? totalAmount;
  String? payment;
  String? orderStatus;
  String? expriceDate;
  String? packageDate;
  String? invoicePdf;
  String? createdAt;
  String? updatedAt;

  UserDetail(
      {this.orderID,
        this.userID,
        this.fname,
        this.lname,
        this.email,
        this.phoneno,
        this.country,
        this.state,
        this.city,
        this.address1,
        this.address2,
        this.zipcode,
        this.company,
        this.orderDate,
        this.orderNumber,
        this.totalTax,
        this.totalShipingCost,
        this.totalDiscount,
        this.totalAmount,
        this.payment,
        this.orderStatus,
        this.expriceDate,
        this.packageDate,
        this.invoicePdf,
        this.createdAt,
        this.updatedAt});

  UserDetail.fromJson(Map<String, dynamic> json) {
    orderID = json['OrderID'];
    userID = json['UserID'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phoneno = json['phoneno'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address1 = json['address1'];
    address2 = json['address2'];
    zipcode = json['zipcode'];
    company = json['company'];
    orderDate = json['OrderDate'];
    orderNumber = json['OrderNumber'];
    totalTax = json['totalTax'];
    totalShipingCost = json['totalShipingCost'];
    totalDiscount = json['totalDiscount'];
    totalAmount = json['TotalAmount'];
    payment = json['payment'];
    orderStatus = json['OrderStatus'];
    expriceDate = json['exprice_date'];
    packageDate = json['package_date'];
    invoicePdf = json['invoice_pdf'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['OrderID'] = this.orderID;
    data['UserID'] = this.userID;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['phoneno'] = this.phoneno;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['zipcode'] = this.zipcode;
    data['company'] = this.company;
    data['OrderDate'] = this.orderDate;
    data['OrderNumber'] = this.orderNumber;
    data['totalTax'] = this.totalTax;
    data['totalShipingCost'] = this.totalShipingCost;
    data['totalDiscount'] = this.totalDiscount;
    data['TotalAmount'] = this.totalAmount;
    data['payment'] = this.payment;
    data['OrderStatus'] = this.orderStatus;
    data['exprice_date'] = this.expriceDate;
    data['package_date'] = this.packageDate;
    data['invoice_pdf'] = this.invoicePdf;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}
