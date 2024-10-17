class RemoveCouponModel {
  String? message;
  String? status;
  List<CartDetails>? cartDetails;
  String? finalTotal;
  String? headingCharge;
  String? finalTotalWithCharge;
  String? referralDiscountApplied;
  String? referralDiscountValue;
  String? referralDiscountAmount;

  RemoveCouponModel(
      {this.message,
        this.status,
        this.cartDetails,
        this.finalTotal,
        this.headingCharge,
        this.finalTotalWithCharge,
        this.referralDiscountApplied,
        this.referralDiscountValue,
        this.referralDiscountAmount});

  RemoveCouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
    finalTotal = json['final_total'];
    headingCharge = json['heading_charge'];
    finalTotalWithCharge = json['final_total_with_charge'];
    referralDiscountApplied = json['referral_discount_applied'];
    referralDiscountValue = json['referral_discount_value'];
    referralDiscountAmount = json['referral_discount_amount'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    data['final_total'] = this.finalTotal;
    data['heading_charge'] = this.headingCharge;
    data['final_total_with_charge'] = this.finalTotalWithCharge;
    data['referral_discount_applied'] = this.referralDiscountApplied;
    data['referral_discount_value'] = this.referralDiscountValue;
    data['referral_discount_amount'] = this.referralDiscountAmount;
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
  String? batch;
  String? package;
  String? expriceDate;
  String? createdAt;
  String? updatedAt;
  int? cartProductQuantity;
  String? productColor;
  String? productSize;
  int? productPriceMain;
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
        this.batch,
        this.package,
        this.expriceDate,
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
    batch = json['batch'];
    package = json['package'];
    expriceDate = json['exprice_date'];
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
    data['batch'] = this.batch;
    data['package'] = this.package;
    data['exprice_date'] = this.expriceDate;
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
