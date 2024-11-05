class BlogModel {
  String? status;
  List<Data>? data;

  BlogModel({this.status, this.data});

  BlogModel.fromJson(Map<String, dynamic> json) {
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
  String? id;
  String? title;
  String? image;
  String? description;
  String? category;
  String? tags;
  String? createdBy;
  String? createdAt;
  String? updatedAt;
  List<Comments>? comments;

  Data(
      {this.id,
      this.title,
      this.image,
      this.description,
      this.category,
      this.tags,
      this.createdBy,
      this.createdAt,
      this.updatedAt,
      this.comments});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    title = json['title'];
    image = json['image'];
    description = json['description'];
    category = json['category'];
    tags = json['tags'];
    createdBy = json['created_by'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    if (json['comments'] != null) {
      comments = <Comments>[];
      json['comments'].forEach((v) {
        comments!.add(new Comments.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['title'] = this.title;
    data['image'] = this.image;
    data['description'] = this.description;
    data['category'] = this.category;
    data['tags'] = this.tags;
    data['created_by'] = this.createdBy;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? comment;
  String? name;
  String? email;

  Comments({this.comment, this.name, this.email});

  Comments.fromJson(Map<String, dynamic> json) {
    comment = json['comment'];
    name = json['name'];
    email = json['email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comment'] = this.comment;
    data['name'] = this.name;
    data['email'] = this.email;
    return data;
  }
}
