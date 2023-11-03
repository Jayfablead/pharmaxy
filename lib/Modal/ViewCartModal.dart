class ViewCartModal {
  String? message;
  String? status;
  List<CartDetails>? cartDetails;
  String? finalTotal;
  String? totalTax;
  String? finalTotalWithTax;

  ViewCartModal(
      {this.message,
      this.status,
      this.cartDetails,
      this.finalTotal,
      this.totalTax,
      this.finalTotalWithTax});

  ViewCartModal.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
    finalTotal = json['final_total'];
    totalTax = json['total_tax'];
    finalTotalWithTax = json['final_total_with_tax'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    data['final_total'] = this.finalTotal;
    data['total_tax'] = this.totalTax;
    data['final_total_with_tax'] = this.finalTotalWithTax;
    return data;
  }
}

class CartDetails {
  String? productID;
  String? productSKU;
  String? productType;
  String? categoryID;
  String? subCategoryID;
  String? variationTypeID;
  String? variationID;
  String? brandID;
  String? tagID;
  String? shippingID;
  String? productName;
  String? productPrice;
  String? productCartDesc;
  String? productShortDesc;
  String? productLongDesc;
  String? productImage;
  String? productStock;
  String? productLowStock;
  String? stockStatus;
  String? productLive;
  String? productWeight;
  String? productDimensions;
  String? productQuantity;
  String? priceProduct;
  String? createdAt;
  String? updatedAt;
  String? cartProductQuantity;
  String? productColor;
  String? productSize;
  String? productPriceMain;
  String? variationTblId;
  String? cartTblId;
  String? allImages;

  CartDetails(
      {this.productID,
      this.productSKU,
      this.productType,
      this.categoryID,
      this.subCategoryID,
      this.variationTypeID,
      this.variationID,
      this.brandID,
      this.tagID,
      this.shippingID,
      this.productName,
      this.productPrice,
      this.productCartDesc,
      this.productShortDesc,
      this.productLongDesc,
      this.productImage,
      this.productStock,
      this.productLowStock,
      this.stockStatus,
      this.productLive,
      this.productWeight,
      this.productDimensions,
      this.productQuantity,
      this.priceProduct,
      this.createdAt,
      this.updatedAt,
      this.cartProductQuantity,
      this.productColor,
      this.productSize,
      this.productPriceMain,
      this.variationTblId,
      this.cartTblId,
      this.allImages});

  CartDetails.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productSKU = json['ProductSKU'];
    productType = json['ProductType'];
    categoryID = json['CategoryID'];
    subCategoryID = json['SubCategoryID'];
    variationTypeID = json['VariationTypeID'];
    variationID = json['VariationID'];
    brandID = json['BrandID'];
    tagID = json['TagID'];
    shippingID = json['ShippingID'];
    productName = json['ProductName'];
    productPrice = json['ProductPrice'];
    productCartDesc = json['ProductCartDesc'];
    productShortDesc = json['ProductShortDesc'];
    productLongDesc = json['ProductLongDesc'];
    productImage = json['ProductImage'];
    productStock = json['ProductStock'];
    productLowStock = json['ProductLowStock'];
    stockStatus = json['Stock_Status'];
    productLive = json['ProductLive'];
    productWeight = json['product_weight'];
    productDimensions = json['product_dimensions'];
    productQuantity = json['product_quantity'];
    priceProduct = json['price_product'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
    cartProductQuantity = json['cart_product_quantity'];
    productColor = json['product_color'];
    productSize = json['product_size'];
    productPriceMain = json['product_price_main'];
    variationTblId = json['variation_tbl_id'];
    cartTblId = json['cart_tbl_id'];
    allImages = json['allImages'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductSKU'] = this.productSKU;
    data['ProductType'] = this.productType;
    data['CategoryID'] = this.categoryID;
    data['SubCategoryID'] = this.subCategoryID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationID'] = this.variationID;
    data['BrandID'] = this.brandID;
    data['TagID'] = this.tagID;
    data['ShippingID'] = this.shippingID;
    data['ProductName'] = this.productName;
    data['ProductPrice'] = this.productPrice;
    data['ProductCartDesc'] = this.productCartDesc;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductLongDesc'] = this.productLongDesc;
    data['ProductImage'] = this.productImage;
    data['ProductStock'] = this.productStock;
    data['ProductLowStock'] = this.productLowStock;
    data['Stock_Status'] = this.stockStatus;
    data['ProductLive'] = this.productLive;
    data['product_weight'] = this.productWeight;
    data['product_dimensions'] = this.productDimensions;
    data['product_quantity'] = this.productQuantity;
    data['price_product'] = this.priceProduct;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    data['cart_product_quantity'] = this.cartProductQuantity;
    data['product_color'] = this.productColor;
    data['product_size'] = this.productSize;
    data['product_price_main'] = this.productPriceMain;
    data['variation_tbl_id'] = this.variationTblId;
    data['cart_tbl_id'] = this.cartTblId;
    data['allImages'] = this.allImages;
    return data;
  }
}
