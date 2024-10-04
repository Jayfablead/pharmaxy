class CheckOutModal {
  String? message;
  String? status;
  CartDetails? cartDetails;
  String? invoicePdf;
  String? finalTotal;
  String? totalTax;
  String? finalTotalWithTax;

  CheckOutModal(
      {this.message,
        this.status,
        this.cartDetails,
        this.invoicePdf,
        this.finalTotal,
        this.totalTax,
        this.finalTotalWithTax});

  CheckOutModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    cartDetails = json['cart_details'] != null
        ? new CartDetails.fromJson(json['cart_details'])
        : null;
    invoicePdf = json['invoice_pdf'];
    finalTotal = json['final_total'];
    totalTax = json['total_tax'];
    finalTotalWithTax = json['final_total_with_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.toJson();
    }
    data['invoice_pdf'] = this.invoicePdf;
    data['final_total'] = this.finalTotal;
    data['total_tax'] = this.totalTax;
    data['final_total_with_tax'] = this.finalTotalWithTax;
    return data;
  }
}

class CartDetails {
  String? userID;
  String? fname;
  String? lname;
  String? email;
  String? phoneno;
  String? country;
  String? state;
  String? city;
  String? address1;
  String? zipcode;
  String? orderDate;
  int? orderNumber;
  int? totalAmount;
  String? payment;
  String? orderStatus;

  CartDetails(
      {this.userID,
        this.fname,
        this.lname,
        this.email,
        this.phoneno,
        this.country,
        this.state,
        this.city,
        this.address1,
        this.zipcode,
        this.orderDate,
        this.orderNumber,
        this.totalAmount,
        this.payment,
        this.orderStatus});

  CartDetails.fromJson(Map<String, dynamic> json) {
    userID = json['UserID'];
    fname = json['fname'];
    lname = json['lname'];
    email = json['email'];
    phoneno = json['phoneno'];
    country = json['country'];
    state = json['state'];
    city = json['city'];
    address1 = json['address1'];
    zipcode = json['zipcode'];
    orderDate = json['OrderDate'];
    orderNumber = json['OrderNumber'];
    totalAmount = json['TotalAmount'];
    payment = json['payment'];
    orderStatus = json['OrderStatus'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['UserID'] = this.userID;
    data['fname'] = this.fname;
    data['lname'] = this.lname;
    data['email'] = this.email;
    data['phoneno'] = this.phoneno;
    data['country'] = this.country;
    data['state'] = this.state;
    data['city'] = this.city;
    data['address1'] = this.address1;
    data['zipcode'] = this.zipcode;
    data['OrderDate'] = this.orderDate;
    data['OrderNumber'] = this.orderNumber;
    data['TotalAmount'] = this.totalAmount;
    data['payment'] = this.payment;
    data['OrderStatus'] = this.orderStatus;
    return data;
  }
}
