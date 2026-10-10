class SpecialtyModel {
  final String id;
  final String name;
  final String slug;

  const SpecialtyModel({
    required this.id,
    required this.name,
    required this.slug,
  });

  factory SpecialtyModel.fromJson(Map<String, dynamic> json) {
    return SpecialtyModel(
      id: json['id'] as String,
      name: json['name'] as String,
      slug: json['slug'] as String,
    );
  }
}
