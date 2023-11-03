class SelectColorModal {
  String? status;
  String? message;
  VariationData? variationData;

  SelectColorModal({this.status, this.message, this.variationData});

  SelectColorModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    variationData = json['variation_data'] != null
        ? new VariationData.fromJson(json['variation_data'])
        : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.variationData != null) {
      data['variation_data'] = this.variationData!.toJson();
    }
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
  String? createdAt;
  String? updatedAt;
  List<String>? allimage;

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
      this.createdAt,
      this.updatedAt,
      this.allimage});

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
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
    allimage = json['allimage'].cast<String>();
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
    data['allimage'] = this.allimage;
    return data;
  }
}
