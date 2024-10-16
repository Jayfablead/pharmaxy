class CateWisePageViewModel {
  String? status;
  int? currentPage;
  int? limit;
  int? totalPages;
  int? totalItems;
  List<Data>? data;

  CateWisePageViewModel(
      {this.status,
        this.currentPage,
        this.limit,
        this.totalPages,
        this.totalItems,
        this.data});

  CateWisePageViewModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    currentPage = json['current_page'];
    limit = json['limit'];
    totalPages = json['total_pages'];
    totalItems = json['total_items'];
    if (json['data'] != null) {
      data = <Data>[];
      json['data'].forEach((v) {
        data!.add(new Data.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['current_page'] = this.currentPage;
    data['limit'] = this.limit;
    data['total_pages'] = this.totalPages;
    data['total_items'] = this.totalItems;
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
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
  List<String>? allProductImage;
  int? wishlist;

  Data(
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
        this.allProductImage,
        this.wishlist});

  Data.fromJson(Map<String, dynamic> json) {
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
    allProductImage = json['AllProductImage'].cast<String>();
    wishlist = json['wishlist'];
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
    data['AllProductImage'] = this.allProductImage;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
