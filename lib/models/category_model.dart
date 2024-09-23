class CategoryModel {
  final String id;
  final String name;
  const CategoryModel(this.id, this.name);

  factory CategoryModel.fromJson(Map<String, dynamic> json) => CategoryModel(
        json['id'],
        json['name'],
      );
}
