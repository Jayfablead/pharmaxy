class ProductDetail2Modal {
  String? status;
  String? message;
  ProductData? productData;
  Shipping? shipping;
  List<RelatedProducts>? relatedProducts;

  ProductDetail2Modal(
      {this.status,
        this.message,
        this.productData,
        this.shipping,
        this.relatedProducts});

  ProductDetail2Modal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    productData = json['product_data'] != null
        ? new ProductData.fromJson(json['product_data'])
        : null;
    shipping = json['Shipping'] != null
        ? new Shipping.fromJson(json['Shipping'])
        : null;
    if (json['related_products'] != null) {
      relatedProducts = <RelatedProducts>[];
      json['related_products'].forEach((v) {
        relatedProducts!.add(new RelatedProducts.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    if (this.shipping != null) {
      data['Shipping'] = this.shipping!.toJson();
    }
    if (this.relatedProducts != null) {
      data['related_products'] =
          this.relatedProducts!.map((v) => v.toJson()).toList();
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
  String? productWeight;
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
        this.productWeight,
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
    productWeight = json['product_weight'];
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
    data['product_weight'] = this.productWeight;
    data['wishlist'] = this.wishlist;
    data['cartlist'] = this.cartlist;
    data['allimage'] = this.allimage;
    data['single_product_price'] = this.singleProductPrice;
    return data;
  }
}

class Shipping {
  String? id;
  String? shippingName;
  String? amount;
  String? shippingRate;
  String? createdAt;
  String? updatedAt;

  Shipping(
      {this.id,
        this.shippingName,
        this.amount,
        this.shippingRate,
        this.createdAt,
        this.updatedAt});

  Shipping.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    shippingName = json['shipping_name'];
    amount = json['amount'];
    shippingRate = json['shipping_rate'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['shipping_name'] = this.shippingName;
    data['amount'] = this.amount;
    data['shipping_rate'] = this.shippingRate;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}

class RelatedProducts {
  String? productID;
  String? productName;
  String? productImage;
  String? productPrice;
  String? saleProductPrice;
  String? productStock;
  int? wishlist;
  String? image;
  String? sellingPrice;

  RelatedProducts(
      {this.productID,
        this.productName,
        this.productImage,
        this.productPrice,
        this.saleProductPrice,
        this.productStock,
        this.wishlist,
        this.image,
        this.sellingPrice});

  RelatedProducts.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productName = json['ProductName'];
    productImage = json['ProductImage'];
    productPrice = json['ProductPrice'];
    saleProductPrice = json['Sale_ProductPrice'];
    productStock = json['ProductStock'];
    wishlist = json['wishlist'];
    image = json['image'];
    sellingPrice = json['selling_price'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['ProductImage'] = this.productImage;
    data['ProductPrice'] = this.productPrice;
    data['Sale_ProductPrice'] = this.saleProductPrice;
    data['ProductStock'] = this.productStock;
    data['wishlist'] = this.wishlist;
    data['image'] = this.image;
    data['selling_price'] = this.sellingPrice;
    return data;
  }
}
