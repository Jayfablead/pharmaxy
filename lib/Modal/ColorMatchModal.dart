class ColorMatchModal {
  String? status;
  String? message;
  List<PriceData>? priceData;

  ColorMatchModal({this.status, this.message, this.priceData});

  ColorMatchModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['Price_data'] != null) {
      priceData = <PriceData>[];
      json['Price_data'].forEach((v) {
        priceData!.add(new PriceData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.priceData != null) {
      data['Price_data'] = this.priceData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class PriceData {
  String? variationPrice;
  String? saleVariationPrice;
  String? productVariationImage;
  String? variationMatchId;
  List<String>? allimage;
  int? cartlist;

  PriceData(
      {this.variationPrice,
      this.saleVariationPrice,
      this.productVariationImage,
      this.variationMatchId,
      this.allimage,
      this.cartlist});

  PriceData.fromJson(Map<String, dynamic> json) {
    variationPrice = json['VariationPrice'];
    saleVariationPrice = json['Sale_VariationPrice'];
    productVariationImage = json['product_variation_image'];
    variationMatchId = json['variation_match_id'];
    allimage = json['allimage'].cast<String>();
    cartlist = json['cartlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['VariationPrice'] = this.variationPrice;
    data['Sale_VariationPrice'] = this.saleVariationPrice;
    data['product_variation_image'] = this.productVariationImage;
    data['variation_match_id'] = this.variationMatchId;
    data['allimage'] = this.allimage;
    data['cartlist'] = this.cartlist;
    return data;
  }
}
