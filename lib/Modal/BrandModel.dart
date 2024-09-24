class BrandModel {
  String? status;
  List<Data>? data;

  BrandModel({this.status, this.data});

  BrandModel.fromJson(Map<String, dynamic> json) {
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
  String? brandID;
  String? brandName;
  String? image;

  Data({this.brandID, this.brandName, this.image});

  Data.fromJson(Map<String, dynamic> json) {
    brandID = json['BrandID'];
    brandName = json['BrandName'];
    image = json['image'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['BrandID'] = this.brandID;
    data['BrandName'] = this.brandName;
    data['image'] = this.image;
    return data;
  }
}
