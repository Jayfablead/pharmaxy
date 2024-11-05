class AllProductModal {
  String? status;
  String? message;
  List<AllProducts>? allProducts;

  AllProductModal({this.status, this.message, this.allProducts});

  AllProductModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['allProducts'] != null) {
      allProducts = <AllProducts>[];
      json['allProducts'].forEach((v) {
        allProducts!.add(new AllProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.allProducts != null) {
      data['allProducts'] = this.allProducts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class AllProducts {
  String? productID;
  String? productName;
  String? productShortDesc;
  String? productPrice;
  String? saleProductPrice;
  List<String>? allImages;
  int? wishlist;

  AllProducts(
      {this.productID,
      this.productName,
      this.productShortDesc,
      this.productPrice,
      this.saleProductPrice,
      this.allImages,
      this.wishlist});

  AllProducts.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productName = json['ProductName'];
    productShortDesc = json['ProductShortDesc'];
    productPrice = json['ProductPrice'];
    saleProductPrice = json['Sale_ProductPrice'];
    allImages = json['allImages'].cast<String>();
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductPrice'] = this.productPrice;
    data['Sale_ProductPrice'] = this.saleProductPrice;
    data['allImages'] = this.allImages;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
