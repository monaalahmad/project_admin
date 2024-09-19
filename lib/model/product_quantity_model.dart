class ProductQuantityModel {
  final int id;
  final int quantityReceived;
  final int quantityRemaining;
  final String expirationDate;
  final String expirationTimeRemaining;

  ProductQuantityModel({
    required this.id,
    required this.quantityReceived,
    required this.quantityRemaining,
    required this.expirationDate,
    required this.expirationTimeRemaining,
  });

  // Factory constructor to create a ProductStore instance from JSON
  factory ProductQuantityModel.fromJson(Map<String, dynamic> json) {
    return ProductQuantityModel(
      id: json['id'],
      quantityReceived: json['quantity_received'],
      quantityRemaining: json['quantity_remaining'],
      expirationDate: json['expiration_date'],
      expirationTimeRemaining: json['expiration_time_remaining'],
    );
  }

  // Method to convert ProductStore instance to JSON
  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'quantity_received': quantityReceived,
      'quantity_remaining': quantityRemaining,
      'expiration_date': expirationDate,
      'expiration_time_remaining': expirationTimeRemaining,
    };
  }
}
