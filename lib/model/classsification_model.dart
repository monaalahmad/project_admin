class ClassificationModel {
  final int id;
  final String name;
  final String follow_to;

  ClassificationModel({required this.id, required this.name , required this.follow_to,});

  factory ClassificationModel.fromJson(Map<String, dynamic> json) {
    return ClassificationModel(
      id: json['id'],
      name: json['name'],
      follow_to: json['follow_to'],
    );
  }
}
