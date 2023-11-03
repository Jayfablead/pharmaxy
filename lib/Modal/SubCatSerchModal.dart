class SubCatSerchModal {
  String? status;
  String? message;
  List<SearchResults>? searchResults;

  SubCatSerchModal({this.status, this.message, this.searchResults});

  SubCatSerchModal.fromJson(Map<String, dynamic> json) {
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
  String? saleProductPrice;
  String? allImages;
  int? wishlist;

  SearchResults(
      {this.productID,
      this.productName,
      this.productShortDesc,
      this.productPrice,
      this.saleProductPrice,
      this.allImages,
      this.wishlist});

  SearchResults.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productName = json['ProductName'];
    productShortDesc = json['ProductShortDesc'];
    productPrice = json['ProductPrice'];
    saleProductPrice = json['Sale_ProductPrice'];
    allImages = json['allImages'];
    wishlist = json['wishlist'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductName'] = this.productName;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductPrice'] = this.productPrice;
    data['Sale_ProductPrice'] = this.saleProductPrice;
    data['allImages'] = this.allImages;
    data['wishlist'] = this.wishlist;
    return data;
  }
}
