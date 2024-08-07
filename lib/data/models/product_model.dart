class ProductModel {
  final String docId;
  final String productName;
  final String productDescription;
  final double price;
  final String imageUrl;
  final String categoryId;
  final String storagePath;

  ProductModel({
    required this.price,
    required this.imageUrl,
    required this.productName,
    required this.docId,
    required this.productDescription,
    required this.categoryId,
    required this.storagePath
  });

  factory ProductModel.fromJson(Map<String, dynamic> json) {
    return ProductModel(
      docId: json["doc_id"] as String? ?? "",
      imageUrl: json["image_url"] as String? ?? "",
      categoryId: json["category_id"] as String? ?? "",
      productName: json["product_name"] as String? ?? "",
      productDescription: json["product_description"] as String? ?? "",
      price: json["price"] as double? ?? 0.0,
      storagePath: json["storage_path"] as String? ?? "",
    );
  }

  Map<String, dynamic> toJson() {
    return {
      "doc_id": "",
      "image_url": imageUrl,
      "product_name": productName,
      "product_description": productDescription,
      "price": price,
      "category_id": categoryId,
      "storage_path": storagePath,
    };
  }

  Map<String, dynamic> toJsonForUpdate() {
    return {
      "image_url": imageUrl,
      "product_name": productName,
      "product_description": productDescription,
      "price": price,
      "category_id": categoryId,
      "storage_path": storagePath,
    };
  }
}
