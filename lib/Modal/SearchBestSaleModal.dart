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
  String? productType;
  String? productName;
  String? productPrice;
  String? saleProductPrice;
  String? productShortDesc;
  String? productLongDesc;
  String? imgData;
  int? wishlist;

  ProductData(
      {this.productID,
      this.productType,
      this.productName,
      this.productPrice,
      this.saleProductPrice,
      this.productShortDesc,
      this.productLongDesc,
      this.imgData,
      this.wishlist});

  ProductData.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productType = json['ProductType'];
    productName = json['ProductName'];
    productPrice = json['ProductPrice'];
    saleProductPrice = json['Sale_ProductPrice'];
    productShortDesc = json['ProductShortDesc'];
    productLongDesc = json['ProductLongDesc'];
    imgData = json['img_data'];
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductType'] = this.productType;
    data['ProductName'] = this.productName;
    data['ProductPrice'] = this.productPrice;
    data['Sale_ProductPrice'] = this.saleProductPrice;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductLongDesc'] = this.productLongDesc;
    data['img_data'] = this.imgData;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
