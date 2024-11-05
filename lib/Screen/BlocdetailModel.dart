// class BlocdetailsModal {
//   String? status;
//   List<Data>? data;
//
//   BlocdetailsModal({this.status, this.data});
//
//   BlocdetailsModal.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['data'] != null) {
//       data = <Data>[];
//       json['data'].forEach((v) {
//         data!.add(new Data.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.data != null) {
//       data['data'] = this.data!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class Data {
//   String? id;
//   String? title;
//   String? image;
//   String? description;
//   String? category;
//   String? tags;
//   String? createdBy;
//   String? createdAt;
//   String? updatedAt;
//   String? comments;
//   String? commentName;
//   String? commentEmail;
//   String? authorName;
//   String? categoryName;
//
//   Data(
//       {this.id,
//         this.title,
//         this.image,
//         this.description,
//         this.category,
//         this.tags,
//         this.createdBy,
//         this.createdAt,
//         this.updatedAt,
//         this.comments,
//         this.commentName,
//         this.commentEmail,
//         this.authorName,
//         this.categoryName});
//
//   Data.fromJson(Map<String, dynamic> json) {
//     id = json['id'];
//     title = json['title'];
//     image = json['image'];
//     description = json['description'];
//     category = json['category'];
//     tags = json['tags'];
//     createdBy = json['created_by'];
//     createdAt = json['created_at'];
//     updatedAt = json['updated_at'];
//     comments = json['comments'];
//     commentName = json['comment_name'];
//     commentEmail = json['comment_email'];
//     authorName = json['author_name'];
//     categoryName = json['category_name'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['id'] = this.id;
//     data['title'] = this.title;
//     data['image'] = this.image;
//     data['description'] = this.description;
//     data['category'] = this.category;
//     data['tags'] = this.tags;
//     data['created_by'] = this.createdBy;
//     data['created_at'] = this.createdAt;
//     data['updated_at'] = this.updatedAt;
//     data['comments'] = this.comments;
//     data['comment_name'] = this.commentName;
//     data['comment_email'] = this.commentEmail;
//     data['author_name'] = this.authorName;
//     data['category_name'] = this.categoryName;
//     return data;
//   }
// }
class BlocdetailsModal {
  String? status;
  Data? data;

  BlocdetailsModal({this.status, this.data});

  BlocdetailsModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    data = json['data'] != null ? new Data.fromJson(json['data']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.data != null) {
      data['data'] = this.data!.toJson();
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
  String? authorName;
  String? categoryName;
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
      this.authorName,
      this.categoryName,
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
    authorName = json['author_name'];
    categoryName = json['category_name'];
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
    data['author_name'] = this.authorName;
    data['category_name'] = this.categoryName;
    if (this.comments != null) {
      data['comments'] = this.comments!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Comments {
  String? comments;
  String? commentName;
  String? commentEmail;

  Comments({this.comments, this.commentName, this.commentEmail});

  Comments.fromJson(Map<String, dynamic> json) {
    comments = json['comments'];
    commentName = json['comment_name'];
    commentEmail = json['comment_email'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['comments'] = this.comments;
    data['comment_name'] = this.commentName;
    data['comment_email'] = this.commentEmail;
    return data;
  }
}
