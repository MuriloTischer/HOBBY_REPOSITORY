// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_filmes/models/movie_detail_model.dart';
import 'package:app_filmes/models/movie_model.dart';
import 'package:app_filmes/repositories/movies/movies_repository.dart';
import 'package:app_filmes/services/movies/movies_service.dart';

class MoviesServiceImpl implements MoviesService {
  final MoviesRepository _moviesRepository;
  MoviesServiceImpl({
    required MoviesRepository moviesRepository,
  }) : _moviesRepository = moviesRepository;

  @override
  Future<void> addOrRemoveFavorite(String userId, MovieModel movie) =>
      _moviesRepository.addOrRemoveFavoritie(userId, movie);

  @override
  Future<List<MovieModel>> getFavoritesMovies(String userId) =>
      _moviesRepository.getFavoritesMovies(userId);

  @override
  Future<List<MovieModel>> getPopularMovies() =>
      _moviesRepository.getPopularMovies();

  @override
  Future<List<MovieModel>> getTopRated() => _moviesRepository.getTopRated();

  @override
  Future<MovieDetailModel?> getDetail(int id) =>
      _moviesRepository.getDetail(id);
}
