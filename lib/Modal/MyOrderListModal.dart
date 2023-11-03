class MyOrderListModal {
  String? message;
  String? status;
  List<CartDetails>? cartDetails;

  MyOrderListModal({this.message, this.status, this.cartDetails});

  MyOrderListModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CartDetails {
  String? fname;
  String? lname;
  String? email;
  String? address1;
  String? address2;
  String? orderNumber;
  String? payment;
  String? totalAmount;
  String? orderStatus;
  String? orderid;
  String? orderitemid;
  String? productid;
  String? singleProductPrice;
  String? productName;
  String? productColorId;
  String? productSizeId;
  String? productVariationTablId;
  String? imgData;

  CartDetails(
      {this.fname,
      this.lname,
      this.email,
      this.address1,
      this.address2,
      this.orderNumber,
      this.payment,
      this.totalAmount,
      this.orderStatus,
      this.orderid,
      this.orderitemid,
      this.productid,
      this.singleProductPrice,
      this.productName,
      this.productColorId,
      this.productSizeId,
      this.productVariationTablId,
      this.imgData});

  CartDetails.fromJson(Map<String, dynamic> json) {
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    address1 = json['address1'];
    address2 = json['address2'];
    orderNumber = json['OrderNumber'];
    payment = json['payment'];
    totalAmount = json['TotalAmount'];
    orderStatus = json['OrderStatus'];
    orderid = json['orderid'];
    orderitemid = json['orderitemid'];
    productid = json['productid'];
    singleProductPrice = json['single_product_price'];
    productName = json['product_name'];
    productColorId = json['product_color_id'];
    productSizeId = json['product_size_id'];
    productVariationTablId = json['product_variation_tabl_id'];
    imgData = json['img_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['address1'] = this.address1;
    data['address2'] = this.address2;
    data['OrderNumber'] = this.orderNumber;
    data['payment'] = this.payment;
    data['TotalAmount'] = this.totalAmount;
    data['OrderStatus'] = this.orderStatus;
    data['orderid'] = this.orderid;
    data['orderitemid'] = this.orderitemid;
    data['productid'] = this.productid;
    data['single_product_price'] = this.singleProductPrice;
    data['product_name'] = this.productName;
    data['product_color_id'] = this.productColorId;
    data['product_size_id'] = this.productSizeId;
    data['product_variation_tabl_id'] = this.productVariationTablId;
    data['img_data'] = this.imgData;
    return data;
  }
}
