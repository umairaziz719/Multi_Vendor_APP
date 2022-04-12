import 'dart:convert';

class CategoryModel {
  String? name;
  String? image;
  String? category;
  CategoryModel({
    this.name,
    this.image,
    this.category,
  });
  

  CategoryModel copyWith({
    String? name,
    String? image,
    String? category,
  }) {
    return CategoryModel(
      name: name ?? this.name,
      image: image ?? this.image,
      category: category ?? this.category,
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'image': image,
      'category': category,
    };
  }

  factory CategoryModel.fromMap(Map<String, dynamic> map) {
    return CategoryModel(
      name: map['name'],
      image: map['image'],
      category: map['category'],
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoryModel.fromJson(String source) => CategoryModel.fromMap(json.decode(source));

  @override
  String toString() => 'CategoryModel(name: $name, image: $image, category: $category)';

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
  
    return other is CategoryModel &&
      other.name == name &&
      other.image == image &&
      other.category == category;
  }

  @override
  int get hashCode => name.hashCode ^ image.hashCode ^ category.hashCode;
}
