class CartItem {
  int? id;
  String? productName;
  int? productQuantity;
  String? productImage;
  double? productPrice;
  double? initialPrice;
  String? productDescription;
  String? productId;
  String? VariationTblId;
  String? Color;
  String? Size;

  CartItem({
    this.id,
    required this.productName,
    required this.productQuantity,
    required this.productImage,
    required this.productPrice,
    required this.initialPrice,
    required this.productDescription,
    required this.productId,
    required this.VariationTblId,
    required this.Color,
    required this.Size,
  });

  Map<String, dynamic> toMap() {
    return {
      'productName': productName,
      'productQuantity': productQuantity,
      'productImage': productImage,
      'productPrice': productPrice,
      'initialPrice': initialPrice,
      'productDescription': productDescription,
      'productId': productId,
      'VariationTblId': VariationTblId,
      'Color': Color,
      'Size': Size,
    };
  }

  CartItem.fromMap(Map<String, dynamic> map) {
    id = map['id'];
    productName = map['productName'];
    productQuantity = map['productQuantity'];
    productImage = map['productImage'];
    productPrice = map['productPrice'];
    initialPrice = map['initialPrice'];
    productDescription = map['productDescription'];
    productId = map['productId'];
    VariationTblId = map['VariationTblId'];
    Color = map['Color'];
    Size = map['Size'];
  }
}
