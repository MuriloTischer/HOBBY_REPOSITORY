// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class GenreModel {
  final int id;
  final String name;

  GenreModel(this.id, this.name);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
    };
  }

  factory GenreModel.fromMap(Map<String, dynamic> map) {
    return GenreModel(
      map['id'] ?? 0,
      map['name'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory GenreModel.fromJson(String source) =>
      GenreModel.fromMap(json.decode(source));
}
