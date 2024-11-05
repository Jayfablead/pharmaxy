class BannerModel {
  String? status;
  List<Data>? data;

  BannerModel({this.status, this.data});

  BannerModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
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
    if (this.data != null) {
      data['data'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Data {
  String? bannerID;
  String? bannerTitle;
  String? bannerPosition;
  String? bannerText;
  String? bannerImg;
  String? bannerUrl;
  String? bannerLive;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.bannerID,
      this.bannerTitle,
      this.bannerPosition,
      this.bannerText,
      this.bannerImg,
      this.bannerUrl,
      this.bannerLive,
      this.createdAt,
      this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    bannerID = json['BannerID'];
    bannerTitle = json['BannerTitle'];
    bannerPosition = json['BannerPosition'];
    bannerText = json['BannerText'];
    bannerImg = json['BannerImg'];
    bannerUrl = json['BannerUrl'];
    bannerLive = json['BannerLive'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BannerID'] = this.bannerID;
    data['BannerTitle'] = this.bannerTitle;
    data['BannerPosition'] = this.bannerPosition;
    data['BannerText'] = this.bannerText;
    data['BannerImg'] = this.bannerImg;
    data['BannerUrl'] = this.bannerUrl;
    data['BannerLive'] = this.bannerLive;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    return data;
  }
}
