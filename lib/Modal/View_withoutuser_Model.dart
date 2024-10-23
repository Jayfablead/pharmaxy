class View_withoutuser_Model {
  String? message;
  String? status;
  List<CartDetails>? cartDetails;
  String? finalTotal;
  String? handlingCharge;
  String? finalTotalWithHandling;
  String? finalTotalWithTax;
  String? couponDiscountAmount;

  View_withoutuser_Model(
      {this.message,
        this.status,
        this.cartDetails,
        this.finalTotal,
        this.handlingCharge,
        this.finalTotalWithHandling,
        this.finalTotalWithTax,
        this.couponDiscountAmount});

  View_withoutuser_Model.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
    finalTotal = json['final_total'];
    handlingCharge = json['handling_charge'];
    finalTotalWithHandling = json['final_total_with_handling'];
    finalTotalWithTax = json['final_total_with_tax'];
    couponDiscountAmount = json['coupon_discount_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    data['final_total'] = this.finalTotal;
    data['handling_charge'] = this.handlingCharge;
    data['final_total_with_handling'] = this.finalTotalWithHandling;
    data['final_total_with_tax'] = this.finalTotalWithTax;
    data['coupon_discount_amount'] = this.couponDiscountAmount;
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
  String? saleProductPrice;
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
  String? isTaxable;
  String? taxClassId;
  String? slug;
  String? createdAt;
  String? updatedAt;
  int? cartProductQuantity;
  num? productPriceMain;
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
        this.saleProductPrice,
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
        this.isTaxable,
        this.taxClassId,
        this.slug,
        this.createdAt,
        this.updatedAt,
        this.cartProductQuantity,
        this.productPriceMain,
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
    saleProductPrice = json['Sale_ProductPrice'];
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
    isTaxable = json['is_taxable'];
    taxClassId = json['tax_class_id'];
    slug = json['slug'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
    cartProductQuantity = json['cart_product_quantity'];
    productPriceMain = json['product_price_main'];
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
    data['Sale_ProductPrice'] = this.saleProductPrice;
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
    data['is_taxable'] = this.isTaxable;
    data['tax_class_id'] = this.taxClassId;
    data['slug'] = this.slug;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    data['cart_product_quantity'] = this.cartProductQuantity;
    data['product_price_main'] = this.productPriceMain;
    data['cart_tbl_id'] = this.cartTblId;
    data['allImages'] = this.allImages;
    return data;
  }
}
