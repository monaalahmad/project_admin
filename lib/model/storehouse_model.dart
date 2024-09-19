class StorehouseModel {
  final int id;
  final String image;
  final String name;
  StorehouseModel({required this.id, required this.image, required this.name});
  factory StorehouseModel.fromJson(jsonData) {
    return StorehouseModel(
        id: jsonData['id'],
        image: jsonData['image'] ?? '',
        name: jsonData['name']);
  }
}
