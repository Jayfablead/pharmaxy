class FilterbyModel {
  String? status;
  String? message;
  List<SearchResults>? searchResults;

  FilterbyModel({this.status, this.message, this.searchResults});

  FilterbyModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['searchResults'] != null) {
      searchResults = <SearchResults>[];
      json['searchResults'].forEach((v) {
        searchResults!.add(new SearchResults.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.searchResults != null) {
      data['searchResults'] =
          this.searchResults!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class SearchResults {
  String? productID;
  String? productName;
  String? productShortDesc;
  String? productPrice;
  List<String>? allImages;
  int? wishlist;

  SearchResults(
      {this.productID,
        this.productName,
        this.productShortDesc,
        this.productPrice,
        this.allImages,
        this.wishlist});

  SearchResults.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productName = json['ProductName'];
    productShortDesc = json['ProductShortDesc'];
    productPrice = json['ProductPrice'];
    allImages = json['allImages'].cast<String>();
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductPrice'] = this.productPrice;
    data['allImages'] = this.allImages;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
