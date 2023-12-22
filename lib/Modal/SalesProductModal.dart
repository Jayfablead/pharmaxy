class SalesProductModal {
  String? message;
  String? status;
  List<ProductData>? productData;

  SalesProductModal({this.message, this.status, this.productData});

  SalesProductModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.productData != null) {
      data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ProductData {
  String? productID;
  String? productType;
  int? discount;
  String? imgData;

  ProductData({this.productID, this.productType, this.discount, this.imgData});

  ProductData.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productType = json['ProductType'];
    discount = json['discount'];
    imgData = json['img_data'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductType'] = this.productType;
    data['discount'] = this.discount;
    data['img_data'] = this.imgData;
    return data;
  }
}
