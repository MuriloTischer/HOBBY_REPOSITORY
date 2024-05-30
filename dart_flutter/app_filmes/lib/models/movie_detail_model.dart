// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:app_filmes/models/cast_model.dart';
import 'package:app_filmes/models/genre_model.dart';

class MovieDetailModel {
  final String title;
  final double stars;
  final List<GenreModel> genres;
  final List<String> urlImages;
  final DateTime releaseDate;
  final String overview;
  final List<String> productionCompanies;
  final String originalLanguage;
  final List<CastModel> casts;

  MovieDetailModel(
    this.title,
    this.stars,
    this.genres,
    this.urlImages,
    this.releaseDate,
    this.overview,
    this.productionCompanies,
    this.originalLanguage,
    this.casts,
  );

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'title': title,
      'vote_average': stars,
      'genres': genres.map((genre) => genre.toMap()).toList(),
      'file_path': urlImages,
      'release_date': releaseDate.millisecondsSinceEpoch,
      'overview': overview,
      'production_companies': productionCompanies,
      'original_language': originalLanguage,
      'cast': casts.map((item) => item.toMap()).toList(),
    };
  }

  factory MovieDetailModel.fromMap(Map<String, dynamic> map) {
    var urlImagesPoster = map['images']['posters'];
    var urlImages = urlImagesPoster
            ?.map<String>((images) =>
                'https://image.tmdb.org/t/p/w200${images['file_path']}')
            .toList() ??
        const [];

    return MovieDetailModel(
      map['title'] ?? '',
      map['vote_average'] ?? 0.0,
      List<GenreModel>.from(
        map['genres']?.map(
              (genres) => GenreModel.fromMap(genres),
            ) ??
            const [],
      ),
      urlImages,
      DateTime.parse(map['release_date']),
      map['overview'] ?? '',
      List<dynamic>.from(map['production_companies'] ?? '')
          .map<String>((p) => p['name'])
          .toList(),
      map['original_language'] ?? '',
      List<CastModel>.from(
        map['cast']?.map((c) => CastModel.fromMap(c)) ?? const [],
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MovieDetailModel.fromJson(String source) =>
      MovieDetailModel.fromMap(json.decode(source));
}
