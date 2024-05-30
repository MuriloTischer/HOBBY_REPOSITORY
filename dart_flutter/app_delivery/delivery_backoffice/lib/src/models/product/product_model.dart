import 'dart:convert';

class ProductModel {
  final int? id;
  final String name;
  final String description;
  final double price;
  final String image;
  final bool enabled;

  ProductModel(
    this.id,
    this.name,
    this.description,
    this.price,
    this.image,
    this.enabled,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'description': description,
      'price': price,
      'image': image,
      'enabled': enabled,
    };
  }

  factory ProductModel.fromMap(Map<String, dynamic> map) {
    return ProductModel(
      map['id'] != null ? map['id'] as int : null,
      map['name'] as String,
      map['description'] as String,
      map['price'] as double,
      map['image'] as String,
      map['enabled'] as bool,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductModel.fromJson(String source) =>
      ProductModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
