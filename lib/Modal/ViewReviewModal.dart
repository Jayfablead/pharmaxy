class ViewReviewModal {
  String? status;
  List<ReviewData>? reviewData;

  ViewReviewModal({this.status, this.reviewData});

  ViewReviewModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['review_data'] != null) {
      reviewData = <ReviewData>[];
      json['review_data'].forEach((v) {
        reviewData!.add(new ReviewData.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.reviewData != null) {
      data['review_data'] = this.reviewData!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class ReviewData {
  String? reviewId;
  String? name;
  String? rating;
  String? email;
  String? comments;
  String? userId;
  String? date;
  String? userProfile;

  ReviewData(
      {this.reviewId,
      this.name,
      this.rating,
      this.email,
      this.comments,
      this.userId,
      this.date,
      this.userProfile});

  ReviewData.fromJson(Map<String, dynamic> json) {
    reviewId = json['review_id'];
    name = json['name'];
    rating = json['rating'];
    email = json['email'];
    comments = json['comments'];
    userId = json['user_id'];
    date = json['date'];
    userProfile = json['user_profile'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['review_id'] = this.reviewId;
    data['name'] = this.name;
    data['rating'] = this.rating;
    data['email'] = this.email;
    data['comments'] = this.comments;
    data['user_id'] = this.userId;
    data['date'] = this.date;
    data['user_profile'] = this.userProfile;
    return data;
  }
}
