class SalesProductListModal {
  String? message;
  String? status;
  List<ProductData>? productData;

  SalesProductListModal({this.message, this.status, this.productData});

  SalesProductListModal.fromJson(Map<String, dynamic> json) {
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
  int? discount;
  String? productID;
  String? productName;
  String? productShortDesc;
  String? regularPrice;
  String? salePrice;
  String? variationId;
  String? productType;
  String? imgData;
  int? wishlist;

  ProductData(
      {this.discount,
      this.productID,
      this.productName,
      this.productShortDesc,
      this.regularPrice,
      this.salePrice,
      this.variationId,
      this.productType,
      this.imgData,
      this.wishlist});

  ProductData.fromJson(Map<String, dynamic> json) {
    discount = json['discount'];
    productID = json['ProductID'];
    productName = json['ProductName'];
    productShortDesc = json['ProductShortDesc'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    variationId = json['variation_id'];
    productType = json['ProductType'];
    imgData = json['img_data'];
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['discount'] = this.discount;
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['ProductShortDesc'] = this.productShortDesc;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['variation_id'] = this.variationId;
    data['ProductType'] = this.productType;
    data['img_data'] = this.imgData;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
