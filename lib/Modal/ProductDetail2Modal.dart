class ProductDetail2Modal {
  String? status;
  String? message;
  ProductData? productData;

  ProductDetail2Modal({this.status, this.message, this.productData});

  ProductDetail2Modal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    productData = json['product_data'] != null
        ? new ProductData.fromJson(json['product_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    return data;
  }
}

class ProductData {
  String? productID;
  String? productType;
  String? categoryID;
  String? subCategoryID;
  String? productName;
  String? productShortDesc;
  String? productLongDesc;
  String? productImage;
  String? productLive;
  String? productPrice;
  String? saleProductPrice;
  String? productStock;
  int? wishlist;
  int? cartlist;
  List<String>? allimage;
  String? singleProductPrice;

  ProductData(
      {this.productID,
        this.productType,
        this.categoryID,
        this.subCategoryID,
        this.productName,
        this.productShortDesc,
        this.productLongDesc,
        this.productImage,
        this.productLive,
        this.productPrice,
        this.saleProductPrice,
        this.productStock,
        this.wishlist,
        this.cartlist,
        this.allimage,
        this.singleProductPrice});

  ProductData.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productType = json['ProductType'];
    categoryID = json['CategoryID'];
    subCategoryID = json['SubCategoryID'];
    productName = json['ProductName'];
    productShortDesc = json['ProductShortDesc'];
    productLongDesc = json['ProductLongDesc'];
    productImage = json['ProductImage'];
    productLive = json['ProductLive'];
    productPrice = json['ProductPrice'];
    saleProductPrice = json['Sale_ProductPrice'];
    productStock = json['ProductStock'];
    wishlist = json['wishlist'];
    cartlist = json['cartlist'];
    allimage = json['allimage'].cast<String>();
    singleProductPrice = json['single_product_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductType'] = this.productType;
    data['CategoryID'] = this.categoryID;
    data['SubCategoryID'] = this.subCategoryID;
    data['ProductName'] = this.productName;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductLongDesc'] = this.productLongDesc;
    data['ProductImage'] = this.productImage;
    data['ProductLive'] = this.productLive;
    data['ProductPrice'] = this.productPrice;
    data['Sale_ProductPrice'] = this.saleProductPrice;
    data['ProductStock'] = this.productStock;
    data['wishlist'] = this.wishlist;
    data['cartlist'] = this.cartlist;
    data['allimage'] = this.allimage;
    data['single_product_price'] = this.singleProductPrice;
    return data;
  }
}
