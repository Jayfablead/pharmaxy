// class CatWiceProductModal {
//   String? status;
//   List<CategoriesWiseProduct>? categoriesWiseProduct;
//
//   CatWiceProductModal({this.status, this.categoriesWiseProduct});
//
//   CatWiceProductModal.fromJson(Map<String, dynamic> json) {
//     status = json['status'];
//     if (json['categories_wise_product'] != null) {
//       categoriesWiseProduct = <CategoriesWiseProduct>[];
//       json['categories_wise_product'].forEach((v) {
//         categoriesWiseProduct!.add(new CategoriesWiseProduct.fromJson(v));
//       });
//     }
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['status'] = this.status;
//     if (this.categoriesWiseProduct != null) {
//       data['categories_wise_product'] =
//           this.categoriesWiseProduct!.map((v) => v.toJson()).toList();
//     }
//     return data;
//   }
// }
//
// class CategoriesWiseProduct {
//   String? productID;
//   String? productSKU;
//   String? productType;
//   String? categoryID;
//   String? subCategoryID;
//   String? variationTypeID;
//   String? variationID;
//   String? brandID;
//   String? tagID;
//   String? shippingID;
//   String? productName;
//   String? productPrice;
//   String? productCartDesc;
//   String? productShortDesc;
//   String? productLongDesc;
//   String? productImage;
//   String? productStock;
//   String? productLowStock;
//   String? stockStatus;
//   String? productLive;
//   String? productWeight;
//   String? productDimensions;
//   String? productQuantity;
//   String? priceProduct;
//   String? createdAt;
//   String? updatedAt;
//   String? productImage1;
//   int? wishlist;
//
//   CategoriesWiseProduct(
//       {this.productID,
//       this.productSKU,
//       this.productType,
//       this.categoryID,
//       this.subCategoryID,
//       this.variationTypeID,
//       this.variationID,
//       this.brandID,
//       this.tagID,
//       this.shippingID,
//       this.productName,
//       this.productPrice,
//       this.productCartDesc,
//       this.productShortDesc,
//       this.productLongDesc,
//       this.productImage,
//       this.productStock,
//       this.productLowStock,
//       this.stockStatus,
//       this.productLive,
//       this.productWeight,
//       this.productDimensions,
//       this.productQuantity,
//       this.priceProduct,
//       this.createdAt,
//       this.updatedAt,
//       this.productImage1,
//       this.wishlist});
//
//   CategoriesWiseProduct.fromJson(Map<String, dynamic> json) {
//     productID = json['ProductID'];
//     productSKU = json['ProductSKU'];
//     productType = json['ProductType'];
//     categoryID = json['CategoryID'];
//     subCategoryID = json['SubCategoryID'];
//     variationTypeID = json['VariationTypeID'];
//     variationID = json['VariationID'];
//     brandID = json['BrandID'];
//     tagID = json['TagID'];
//     shippingID = json['ShippingID'];
//     productName = json['ProductName'];
//     productPrice = json['ProductPrice'];
//     productCartDesc = json['ProductCartDesc'];
//     productShortDesc = json['ProductShortDesc'];
//     productLongDesc = json['ProductLongDesc'];
//     productImage = json['ProductImage'];
//     productStock = json['ProductStock'];
//     productLowStock = json['ProductLowStock'];
//     stockStatus = json['Stock_Status'];
//     productLive = json['ProductLive'];
//     productWeight = json['product_weight'];
//     productDimensions = json['product_dimensions'];
//     productQuantity = json['product_quantity'];
//     priceProduct = json['price_product'];
//     createdAt = json['Created_at'];
//     updatedAt = json['Updated_at'];
//     productImage1 = json['product_image1'];
//     wishlist = json['wishlist'];
//   }
//
//   Map<String, dynamic> toJson() {
//     final Map<String, dynamic> data = new Map<String, dynamic>();
//     data['ProductID'] = this.productID;
//     data['ProductSKU'] = this.productSKU;
//     data['ProductType'] = this.productType;
//     data['CategoryID'] = this.categoryID;
//     data['SubCategoryID'] = this.subCategoryID;
//     data['VariationTypeID'] = this.variationTypeID;
//     data['VariationID'] = this.variationID;
//     data['BrandID'] = this.brandID;
//     data['TagID'] = this.tagID;
//     data['ShippingID'] = this.shippingID;
//     data['ProductName'] = this.productName;
//     data['ProductPrice'] = this.productPrice;
//     data['ProductCartDesc'] = this.productCartDesc;
//     data['ProductShortDesc'] = this.productShortDesc;
//     data['ProductLongDesc'] = this.productLongDesc;
//     data['ProductImage'] = this.productImage;
//     data['ProductStock'] = this.productStock;
//     data['ProductLowStock'] = this.productLowStock;
//     data['Stock_Status'] = this.stockStatus;
//     data['ProductLive'] = this.productLive;
//     data['product_weight'] = this.productWeight;
//     data['product_dimensions'] = this.productDimensions;
//     data['product_quantity'] = this.productQuantity;
//     data['price_product'] = this.priceProduct;
//     data['Created_at'] = this.createdAt;
//     data['Updated_at'] = this.updatedAt;
//     data['product_image1'] = this.productImage1;
//     data['wishlist'] = this.wishlist;
//     return data;
//   }
// }
class CatWiceProductModal {
  String? status;
  List<CategoriesWiseProduct>? categoriesWiseProduct;

  CatWiceProductModal({this.status, this.categoriesWiseProduct});

  CatWiceProductModal.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['categories_wise_product'] != null) {
      categoriesWiseProduct = <CategoriesWiseProduct>[];
      json['categories_wise_product'].forEach((v) {
        categoriesWiseProduct!.add(new CategoriesWiseProduct.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.categoriesWiseProduct != null) {
      data['categories_wise_product'] =
          this.categoriesWiseProduct!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class CategoriesWiseProduct {
  String? productID;
  String? productSKU;
  String? productType;
  String? categoryID;
  String? subCategoryID;
  String? variationTypeID;
  String? variationID;
  String? brandID;
  String? tagID;
  String? shippingID;
  String? productName;
  String? productPrice;
  String? saleProductPrice;
  String? productCartDesc;
  String? productShortDesc;
  String? productLongDesc;
  String? productImage;
  String? productStock;
  String? productLowStock;
  String? stockStatus;
  String? productLive;
  String? productWeight;
  String? productDimensions;
  String? productQuantity;
  String? priceProduct;
  String? isTaxable;
  String? taxClassId;
  String? slug;
  String? batch;
  String? package;
  String? expriceDate;
  String? createdAt;
  String? updatedAt;
  String? productImage1;
  int? wishlist;
  int? incart;

  CategoriesWiseProduct(
      {this.productID,
      this.productSKU,
      this.productType,
      this.categoryID,
      this.subCategoryID,
      this.variationTypeID,
      this.variationID,
      this.brandID,
      this.tagID,
      this.shippingID,
      this.productName,
      this.productPrice,
      this.saleProductPrice,
      this.productCartDesc,
      this.productShortDesc,
      this.productLongDesc,
      this.productImage,
      this.productStock,
      this.productLowStock,
      this.stockStatus,
      this.productLive,
      this.productWeight,
      this.productDimensions,
      this.productQuantity,
      this.priceProduct,
      this.isTaxable,
      this.taxClassId,
      this.slug,
      this.batch,
      this.package,
      this.expriceDate,
      this.createdAt,
      this.updatedAt,
      this.productImage1,
      this.wishlist,
      this.incart});

  CategoriesWiseProduct.fromJson(Map<String, dynamic> json) {
    productID = json['ProductID'];
    productSKU = json['ProductSKU'];
    productType = json['ProductType'];
    categoryID = json['CategoryID'];
    subCategoryID = json['SubCategoryID'];
    variationTypeID = json['VariationTypeID'];
    variationID = json['VariationID'];
    brandID = json['BrandID'];
    tagID = json['TagID'];
    shippingID = json['ShippingID'];
    productName = json['ProductName'];
    productPrice = json['ProductPrice'];
    saleProductPrice = json['Sale_ProductPrice'];
    productCartDesc = json['ProductCartDesc'];
    productShortDesc = json['ProductShortDesc'];
    productLongDesc = json['ProductLongDesc'];
    productImage = json['ProductImage'];
    productStock = json['ProductStock'];
    productLowStock = json['ProductLowStock'];
    stockStatus = json['Stock_Status'];
    productLive = json['ProductLive'];
    productWeight = json['product_weight'];
    productDimensions = json['product_dimensions'];
    productQuantity = json['product_quantity'];
    priceProduct = json['price_product'];
    isTaxable = json['is_taxable'];
    taxClassId = json['tax_class_id'];
    slug = json['slug'];
    batch = json['batch'];
    package = json['package'];
    expriceDate = json['exprice_date'];
    createdAt = json['Created_at'];
    updatedAt = json['Updated_at'];
    productImage1 = json['product_image1'];
    wishlist = json['wishlist'];
    incart = json['incart'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['ProductID'] = this.productID;
    data['ProductSKU'] = this.productSKU;
    data['ProductType'] = this.productType;
    data['CategoryID'] = this.categoryID;
    data['SubCategoryID'] = this.subCategoryID;
    data['VariationTypeID'] = this.variationTypeID;
    data['VariationID'] = this.variationID;
    data['BrandID'] = this.brandID;
    data['TagID'] = this.tagID;
    data['ShippingID'] = this.shippingID;
    data['ProductName'] = this.productName;
    data['ProductPrice'] = this.productPrice;
    data['Sale_ProductPrice'] = this.saleProductPrice;
    data['ProductCartDesc'] = this.productCartDesc;
    data['ProductShortDesc'] = this.productShortDesc;
    data['ProductLongDesc'] = this.productLongDesc;
    data['ProductImage'] = this.productImage;
    data['ProductStock'] = this.productStock;
    data['ProductLowStock'] = this.productLowStock;
    data['Stock_Status'] = this.stockStatus;
    data['ProductLive'] = this.productLive;
    data['product_weight'] = this.productWeight;
    data['product_dimensions'] = this.productDimensions;
    data['product_quantity'] = this.productQuantity;
    data['price_product'] = this.priceProduct;
    data['is_taxable'] = this.isTaxable;
    data['tax_class_id'] = this.taxClassId;
    data['slug'] = this.slug;
    data['batch'] = this.batch;
    data['package'] = this.package;
    data['exprice_date'] = this.expriceDate;
    data['Created_at'] = this.createdAt;
    data['Updated_at'] = this.updatedAt;
    data['product_image1'] = this.productImage1;
    data['wishlist'] = this.wishlist;
    data['incart'] = this.incart;
    return data;
  }
}
