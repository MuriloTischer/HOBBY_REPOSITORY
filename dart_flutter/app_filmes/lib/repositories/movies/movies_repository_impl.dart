import 'package:app_filmes/aplication/rest_client/rest_client.dart';
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_remote_config/firebase_remote_config.dart';
import 'package:flutter/material.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final RestClient _restClient;

  MoviesRepositoryImpl({required RestClient restClient})
      : _restClient = restClient;

  @override
  Future<void> addOrRemoveFavoritie(String userId, MovieModel movie) async {
    try {
      var favoriteColletion = FirebaseFirestore.instance
          .collection('favorites')
          .doc(userId)
          .collection('movies');
      if (movie.favorite) {
        favoriteColletion.add(movie.toMap());
      } else {
        var favoriteData = await favoriteColletion
            .where('id', isEqualTo: movie.id)
            .limit(1)
            .get();
        favoriteData.docs.first.reference.delete();
      }
    } catch (e) {
      debugPrint('Erro ao favoritar um filme');
      rethrow;
    }
  }

  @override
  Future<MovieDetailModel?> getDetail(int id) async {
    final result = await _restClient.get<MovieDetailModel>(
      '/movie/$id',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'append_to_response': 'images, credits',
        'include_image_language': 'en, pt-br',
      },
      decoder: (data) {
        return MovieDetailModel.fromMap(data);
      },
    );

    if (result.hasError) {
      debugPrint('Erro ao buscar detalhes dos filmes [${result.statusText}]');
      throw Exception('Erro ao buscar detalhes dos filmes');
    }
    return result.body;
  }

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) async {
    var favoriteMovies = await FirebaseFirestore.instance
        .collection('favorites')
        .doc(userId)
        .collection('movies')
        .get();
    final listFavorites = <MovieModel>[];

    for (var movie in favoriteMovies.docs) {
      listFavorites.add(MovieModel.fromMap(movie.data()));
    }
    return listFavorites;
  }

  @override
  Future<List<MovieModel>> getPopularMovies() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/popular',
      query: {
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results.map<MovieModel>((m) => MovieModel.fromMap(m)).toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      debugPrint('Erro ao buscar filme popular [${result.statusText}]');
      throw Exception('Erro ao buscar filmes populares');
    }
    return result.body ?? <MovieModel>[];
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final result = await _restClient.get<List<MovieModel>>(
      '/movie/top_rated',
      query: <String, String>{
        'api_key': FirebaseRemoteConfig.instance.getString('api_token'),
        'language': 'pt-br',
        'page': '1',
      },
      decoder: (data) {
        final results = data['results'];
        if (results != null) {
          return results
              .map<MovieModel>((result) => MovieModel.fromMap(result))
              .toList();
        }
        return <MovieModel>[];
      },
    );
    if (result.hasError) {
      debugPrint('Erro ao buscar filmes mais odiado [${result.statusText}]');
      throw Exception('Erro ao buscar filmes mais odiados');
    }
    return result.body ?? <MovieModel>[];
  }
}
