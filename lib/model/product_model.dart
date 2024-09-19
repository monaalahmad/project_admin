class ProductModel {
  final int id;
  final int product_classification_id;
  final int? product_id;
  final String image;
  final String name;
  final String price;
  final int quantity;

  ProductModel({
    required this.id,
    required this.product_classification_id,
    required this.product_id,
    required this.image,
    required this.name,
    required this.price,
    required this.quantity,
  });

  factory ProductModel.fromJson(Map<String, dynamic> jsonData) {
    return ProductModel(
      id: jsonData['id'] ?? 0,
      product_classification_id: jsonData['product_classification_id'] ?? 0,
      product_id: jsonData['product_id'] ?? 0,
      image: jsonData['image'] ?? '',
      name: jsonData['name'] ?? '',
      price: jsonData['price'] ?? 0,
      quantity: jsonData['quantity'] ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'product_classification_id': product_classification_id,
      'product_id': product_id,
      'price': price,
      'quantity': quantity,
    };
  }
}