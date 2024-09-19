class BranchModel {
  final int id;
  final String image;
  final String name;
  BranchModel({required this.id, required this.image, required this.name});
  factory BranchModel.fromJson(jsonData) {
    return BranchModel(
        id: jsonData['id'],
        image: jsonData['image'] ?? '',
        name: jsonData['name']);
  }
}
