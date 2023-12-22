class ProductDetailModal {
  String? status;
  String? message;
  ProductData? productData;
  List<VariationData>? variationData;
  FilterVariationData? filterVariationData;
  List<String>? filterKeys;

  ProductDetailModal(
      {this.status,
      this.message,
      this.productData,
      this.variationData,
      this.filterVariationData,
      this.filterKeys});

  ProductDetailModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    productData = json['product_data'] != null
        ? new ProductData.fromJson(json['product_data'])
        : null;
    if (json['variation_data'] != null) {
      variationData = <VariationData>[];
      json['variation_data'].forEach((v) {
        variationData!.add(new VariationData.fromJson(v));
      });
    }
    filterVariationData = json['filter_variation_data'] != null
        ? new FilterVariationData.fromJson(json['filter_variation_data'])
        : null;
    filterKeys = json['filter_keys'].cast<String>();
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.productData != null) {
      data['product_data'] = this.productData!.toJson();
    }
    if (this.variationData != null) {
      data['variation_data'] =
          this.variationData!.map((v) => v.toJson()).toList();
    }
    if (this.filterVariationData != null) {
      data['filter_variation_data'] = this.filterVariationData!.toJson();
    }
    data['filter_keys'] = this.filterKeys;
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
    data['wishlist'] = this.wishlist;
    data['cartlist'] = this.cartlist;
    data['allimage'] = this.allimage;
    data['single_product_price'] = this.singleProductPrice;
    return data;
  }
}

class VariationData {
  String? variationID;
  String? productID;
  String? variationTypeID;
  String? variationName;
  String? variationPrice;
  String? saleVariationPrice;
  String? variationStock;
  String? defaultProduct;
  String? productLive;
  String? productVariationImage;
  String? variationIsTaxable;
  String? variationTaxClassId;
  String? createdAt;
  String? updatedAt;
  String? singleProductPrice;
  List<VariationSubData>? variationSubData;

  VariationData(
      {this.variationID,
      this.productID,
      this.variationTypeID,
      this.variationName,
      this.variationPrice,
      this.saleVariationPrice,
      this.variationStock,
      this.defaultProduct,
      this.productLive,
      this.productVariationImage,
      this.variationIsTaxable,
      this.variationTaxClassId,
      this.createdAt,
      this.updatedAt,
      this.singleProductPrice,
      this.variationSubData});

  VariationData.fromJson(Map<String, dynamic> json) {
    variationID = json['VariationID'];
    productID = json['ProductID'];
    variationTypeID = json['VariationTypeID'];
    variationName = json['VariationName'];
    variationPrice = json['VariationPrice'];
    saleVariationPrice = json['Sale_VariationPrice'];
    variationStock = json['VariationStock'];
    defaultProduct = json['defaultProduct'];
    productLive = json['ProductLive'];
    productVariationImage = json['product_variation_image'];
    variationIsTaxable = json['variation_is_taxable'];
    variationTaxClassId = json['variation_tax_class_id'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
    singleProductPrice = json['single_product_price'];
    if (json['variation_sub_data'] != null) {
      variationSubData = <VariationSubData>[];
      json['variation_sub_data'].forEach((v) {
        variationSubData!.add(new VariationSubData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationID'] = this.variationID;
    data['ProductID'] = this.productID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationName'] = this.variationName;
    data['VariationPrice'] = this.variationPrice;
    data['Sale_VariationPrice'] = this.saleVariationPrice;
    data['VariationStock'] = this.variationStock;
    data['defaultProduct'] = this.defaultProduct;
    data['ProductLive'] = this.productLive;
    data['product_variation_image'] = this.productVariationImage;
    data['variation_is_taxable'] = this.variationIsTaxable;
    data['variation_tax_class_id'] = this.variationTaxClassId;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    data['single_product_price'] = this.singleProductPrice;
    if (this.variationSubData != null) {
      data['variation_sub_data'] =
          this.variationSubData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VariationSubData {
  String? variationID;
  String? variationTypeID;
  String? variationName;
  String? variationImage;
  String? variationTypeName;

  VariationSubData(
      {this.variationID,
      this.variationTypeID,
      this.variationName,
      this.variationImage,
      this.variationTypeName});

  VariationSubData.fromJson(Map<String, dynamic> json) {
    variationID = json['VariationID'];
    variationTypeID = json['VariationTypeID'];
    variationName = json['VariationName'];
    variationImage = json['Variation_image'];
    variationTypeName = json['VariationTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationID'] = this.variationID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationName'] = this.variationName;
    data['Variation_image'] = this.variationImage;
    data['VariationTypeName'] = this.variationTypeName;
    return data;
  }
}

class FilterVariationData {
  List<ColorData>? colorData;
  List<Size>? size;

  FilterVariationData({this.colorData, this.size});

  FilterVariationData.fromJson(Map<String, dynamic> json) {
    if (json['color_data'] != null) {
      colorData = <ColorData>[];
      json['color_data'].forEach((v) {
        colorData!.add(new ColorData.fromJson(v));
      });
    }
    if (json['size'] != null) {
      size = <Size>[];
      json['size'].forEach((v) {
        size!.add(new Size.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.colorData != null) {
      data['color_data'] = this.colorData!.map((v) => v.toJson()).toList();
    }
    if (this.size != null) {
      data['size'] = this.size!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Size {
  String? variationID;
  String? variationTypeID;
  String? variationName;
  String? variationImage;
  String? variationTypeName;

  Size(
      {this.variationID,
      this.variationTypeID,
      this.variationName,
      this.variationImage,
      this.variationTypeName});

  Size.fromJson(Map<String, dynamic> json) {
    variationID = json['VariationID'];
    variationTypeID = json['VariationTypeID'];
    variationName = json['VariationName'];
    variationImage = json['Variation_image'];
    variationTypeName = json['VariationTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationID'] = this.variationID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationName'] = this.variationName;
    data['Variation_image'] = this.variationImage;
    data['VariationTypeName'] = this.variationTypeName;
    return data;
  }
}

class ColorData {
  String? variationID;
  String? variationTypeID;
  String? variationName;
  String? variationImage;
  String? variationTypeName;

  ColorData(
      {this.variationID,
      this.variationTypeID,
      this.variationName,
      this.variationImage,
      this.variationTypeName});

  ColorData.fromJson(Map<String, dynamic> json) {
    variationID = json['VariationID'];
    variationTypeID = json['VariationTypeID'];
    variationName = json['VariationName'];
    variationImage = json['Variation_image'];
    variationTypeName = json['VariationTypeName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationID'] = this.variationID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationName'] = this.variationName;
    data['Variation_image'] = this.variationImage;
    data['VariationTypeName'] = this.variationTypeName;
    return data;
  }
}
