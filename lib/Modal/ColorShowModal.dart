class ColorShowModal {
  String? status;
  String? message;
  List<VariationData>? variationData;
  List<ProductData>? productData;

  ColorShowModal(
      {this.status, this.message, this.variationData, this.productData});

  ColorShowModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['variation_data'] != null) {
      variationData = <VariationData>[];
      json['variation_data'].forEach((v) {
        variationData!.add(new VariationData.fromJson(v));
      });
    }
    if (json['product_data'] != null) {
      productData = <ProductData>[];
      json['product_data'].forEach((v) {
        productData!.add(new ProductData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.variationData != null) {
      data['variation_data'] =
          this.variationData!.map((v) => v.toJson()).toList();
    }
    if (this.productData != null) {
      data['product_data'] = this.productData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class VariationData {
  String? variationID;
  String? variationTypeID;
  String? variationName;
  String? variationImage;
  String? varImg;
  String? variationIdd;

  VariationData(
      {this.variationID,
      this.variationTypeID,
      this.variationName,
      this.variationImage,
      this.varImg,
      this.variationIdd});

  VariationData.fromJson(Map<String, dynamic> json) {
    variationID = json['VariationID'];
    variationTypeID = json['VariationTypeID'];
    variationName = json['VariationName'];
    variationImage = json['Variation_image'];
    varImg = json['var_img'];
    variationIdd = json['variation_idd'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationID'] = this.variationID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationName'] = this.variationName;
    data['Variation_image'] = this.variationImage;
    data['var_img'] = this.varImg;
    data['variation_idd'] = this.variationIdd;
    return data;
  }
}

class ProductData {
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
  String? createdAt;
  String? updatedAt;

  ProductData(
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
      this.createdAt,
      this.updatedAt});

  ProductData.fromJson(Map<String, dynamic> json) {
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
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
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
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}
