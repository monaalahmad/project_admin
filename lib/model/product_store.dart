// import 'package:project_admin/model/product_model.dart';
//
// class StoreProduct {
//   int id;
//   int storehouseId;
//   int productId;
//   int quantity;
//   ProductModel product;
//
//   StoreProduct({
//     required this.id,
//     required this.storehouseId,
//     required this.productId,
//     required this.quantity,
//     required this.product,
//   });
//
//   factory StoreProduct.fromJson(Map<String, dynamic> json) {
//     return StoreProduct(
//       id: _parseInt(json['id']),
//       quantity: _parseInt(json['quantity']),
//       storehouseId: _parseInt(json['storehouse_id']),
//       productId: _parseInt(json['product_id']),
//       product: json['product'] != null ? ProductModel.fromJson(json['product']),
//     );
//   }
//
//
//
// }
