class StoreProductModelForDelete {
  final int id;
  final int storeId;
  final int productId;
  final int quantity;

  StoreProductModelForDelete({
    required this.id,
    required this.storeId,
    required this.productId,
    required this.quantity,
  });

  factory StoreProductModelForDelete.fromJson(Map<String, dynamic> json) {
    return StoreProductModelForDelete(
      id: json['id'] as int,
      storeId: json['store_id'] as int,
      productId: json['product_id'] as int,
      quantity: json['quantity'] as int,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'store_id': storeId,
      'product_id': productId,
      'quantity': quantity,
    };
  }
}
