class CouponModel {
  String? message;
  String? status;
  List<CartDetails>? cartDetails;
  String? totalAmount;
  String? totalTax;
  String? discountApplied;
  String? agentDiscountApplied;
  String? finalTotalWithTax;
  String? allTotal;
  String? couponMessage;

  CouponModel(
      {this.message,
        this.status,
        this.cartDetails,
        this.totalAmount,
        this.totalTax,
        this.discountApplied,
        this.agentDiscountApplied,
        this.finalTotalWithTax,
        this.allTotal,
        this.couponMessage});

  CouponModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    status = json['status'];
    if (json['cart_details'] != null) {
      cartDetails = <CartDetails>[];
      json['cart_details'].forEach((v) {
        cartDetails!.add(new CartDetails.fromJson(v));
      });
    }
    totalAmount = json['total_amount'];
    totalTax = json['total_tax'];
    discountApplied = json['discount_applied'];
    agentDiscountApplied = json['Agent_discount_applied'];
    finalTotalWithTax = json['final_total_with_tax'];
    allTotal = json['all_total'];
    couponMessage = json['coupon_message'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['status'] = this.status;
    if (this.cartDetails != null) {
      data['cart_details'] = this.cartDetails!.map((v) => v.toJson()).toList();
    }
    data['total_amount'] = this.totalAmount;
    data['total_tax'] = this.totalTax;
    data['discount_applied'] = this.discountApplied;
    data['Agent_discount_applied'] = this.agentDiscountApplied;
    data['final_total_with_tax'] = this.finalTotalWithTax;
    data['all_total'] = this.allTotal;
    data['coupon_message'] = this.couponMessage;
    return data;
  }
}

class CartDetails {
  String? productID;
  String? productSKU;
  String? productType;
  String? categoryID;
  String? subCategoryID;
  Null? variationTypeID;
  Null? variationID;
  String? brandID;
  Null? tagID;
  String? shippingID;
  String? productName;
  String? productPrice;
  String? saleProductPrice;
  Null? productCartDesc;
  String? productShortDesc;
  String? productLongDesc;
  String? productImage;
  String? productStock;
  Null? productLowStock;
  String? stockStatus;
  String? productLive;
  String? productWeight;
  String? productDimensions;
  Null? productQuantity;
  Null? priceProduct;
  String? isTaxable;
  String? taxClassId;
  String? slug;
  String? createdAt;
  String? updatedAt;
  String? cartProductQuantity;
  Null? productColor;
  Null? productSize;
  String? productPriceMain;
  Null? variationTblId;
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
