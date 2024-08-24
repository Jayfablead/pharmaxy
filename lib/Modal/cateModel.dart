class cateModel {
  String? status;
  String? message;
  List<Categories>? categories;

  cateModel({this.status, this.message, this.categories});

  cateModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Categories {
  String? categoryID;
  String? catagoryimage;
  String? categoryName;
  String? categoryDesc;

  Categories(
      {this.categoryID,
        this.catagoryimage,
        this.categoryName,
        this.categoryDesc});

  Categories.fromJson(Map<String, dynamic> json) {
    categoryID = json['CategoryID'];
    catagoryimage = json['Catagoryimage'];
    categoryName = json['CategoryName'];
    categoryDesc = json['CategoryDesc'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['CategoryID'] = this.categoryID;
    data['Catagoryimage'] = this.catagoryimage;
    data['CategoryName'] = this.categoryName;
    data['CategoryDesc'] = this.categoryDesc;
    return data;
  }
}
