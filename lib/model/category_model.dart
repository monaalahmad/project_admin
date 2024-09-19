class CategoryModel {
  final int id;
  final int classification_category_id;
  final String name;
  final String image;

  CategoryModel({required this.id, required this.name, required this.classification_category_id, required this.image});

  factory CategoryModel.fromJson(Map<String, dynamic> json) {
    return CategoryModel(
      id: json['id'],
      classification_category_id: json['classification_category_id'],
      name: json['name'],
      image: json['image'],
    );
  }
}
