class SearchBestSaleModal {
  String? message;
  String? status;
  List<ProductData>? productData;

  SearchBestSaleModal({this.message, this.status, this.productData});

  SearchBestSaleModal.fromJson(Map<String, dynamic> json) {
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
  String? productName;
  String? productShortDesc;
  String? regularPrice;
  String? salePrice;
  String? variationId;
  String? imgData;
  int? wishlist;

  ProductData(
      {this.productID,
      this.productName,
      this.productShortDesc,
      this.regularPrice,
      this.salePrice,
      this.variationId,
      this.imgData,
      this.wishlist});

  ProductData.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productName = json['ProductName'];
    productShortDesc = json['ProductShortDesc'];
    regularPrice = json['regular_price'];
    salePrice = json['sale_price'];
    variationId = json['variation_id'];
    imgData = json['img_data'];
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['ProductShortDesc'] = this.productShortDesc;
    data['regular_price'] = this.regularPrice;
    data['sale_price'] = this.salePrice;
    data['variation_id'] = this.variationId;
    data['img_data'] = this.imgData;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
