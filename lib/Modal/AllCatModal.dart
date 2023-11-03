class AllCatModal {
  String? status;
  String? message;
  List<Categories>? categories;
  List<SubCategories>? subCategories;

  AllCatModal({this.status, this.message, this.categories, this.subCategories});

  AllCatModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['categories'] != null) {
      categories = <Categories>[];
      json['categories'].forEach((v) {
        categories!.add(new Categories.fromJson(v));
      });
    }
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
    if (this.categories != null) {
      data['categories'] = this.categories!.map((v) => v.toJson()).toList();
    }
    if (this.subCategories != null) {
      data['subCategories'] =
          this.subCategories!.map((v) => v.toJson()).toList();
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

class SubCategories {
  String? subCategoryId;
  String? categoryId;
  String? subCategory;

  SubCategories({this.subCategoryId, this.categoryId, this.subCategory});

  SubCategories.fromJson(Map<String, dynamic> json) {
    subCategoryId = json['sub_category_id'];
    categoryId = json['category_id'];
    subCategory = json['sub_category'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['sub_category_id'] = this.subCategoryId;
    data['category_id'] = this.categoryId;
    data['sub_category'] = this.subCategory;
    return data;
  }
}
