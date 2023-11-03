class SubCatModal {
  String? status;
  String? message;
  List<SubCategories>? subCategories;

  SubCatModal({this.status, this.message, this.subCategories});

  SubCatModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['subCategories'] != null) {
      subCategories = <SubCategories>[];
      json['subCategories'].forEach((v) {
        subCategories!.add(new SubCategories.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SubCategories {
  String? subCategoryId;
  String? categoryId;
  String? subCategory;
  String? subCategoryImg;

  SubCategories(
      {this.subCategoryId,
      this.categoryId,
      this.subCategory,
      this.subCategoryImg});

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    categoryId = json['category_id'];
    subCategory = json['sub_category'];
    subCategoryImg = json['sub_category_img'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['category_id'] = this.categoryId;
    data['sub_category'] = this.subCategory;
    data['sub_category_img'] = this.subCategoryImg;
    return data;
  }
}
