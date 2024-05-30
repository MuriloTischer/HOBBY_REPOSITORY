// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

class MovieModel {
  final int id;
  final String title;
  final String releaseDate;
  final String posterPath;
  final List<int> genres;
  final bool favorite;

  MovieModel(
    this.id,
    this.title,
    this.releaseDate,
    this.posterPath,
    this.genres,
    this.favorite,
  );

  MovieModel copyWith({
    int? id,
    String? title,
    String? releaseDate,
    String? posterPath,
    List<int>? genres,
    bool? favorite,
  }) {
    return MovieModel(
      id ?? this.id,
      title ?? this.title,
      releaseDate ?? this.releaseDate,
      posterPath ?? this.posterPath,
      genres ?? this.genres,
      favorite ?? this.favorite,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'release_date': releaseDate,
      'poster_path': posterPath,
      'genre_ids': genres,
      'favorite': favorite,
    };
  }

  factory MovieModel.fromMap(Map<String, dynamic> map) {
    return MovieModel(
      map['id'] ?? 0,
      map['title'] ?? '',
      map['release_date'] ?? '',
      map['poster_path'],
      List<int>.from(
        (map['genre_ids'] ?? const []),
      ),
      map['favorite'] ?? false,
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieModel.fromJson(String source) =>
      MovieModel.fromMap(json.decode(source) as Map<String, dynamic>);
}
