// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class CastModel {
  final String name;
  final String image;
  final String character;

  CastModel(this.name, this.image, this.character);

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'original_name': name,
      'profile_path': image,
      'character': character,
    };
  }

  factory CastModel.fromMap(Map<String, dynamic> map) {
    return CastModel(
      map['original_name'] ?? '',
      'https://image.tmdb.org/t/p/w200/${map['profile_path'] ?? ''}',
      map['character'] ?? '',
    );
  }

  String toJson() => json.encode(toMap());

  factory CastModel.fromJson(String source) =>
      CastModel.fromMap(json.decode(source));
}
