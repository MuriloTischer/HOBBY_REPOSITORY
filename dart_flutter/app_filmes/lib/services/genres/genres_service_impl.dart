// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:app_filmes/models/genre_model.dart';
import 'package:app_filmes/repositories/genres/genres_repository.dart';
import 'package:app_filmes/services/genres/genres_service.dart';

class GenresServiceImpl implements GenresService {
  final GenresRepository _genresRepository;

  //? o construtor dessa forma é importante para que o atributo/propriedade não fique publico e deixe outros lugares ter acesso a ele
  GenresServiceImpl({
    required GenresRepository genresRepository,
  }) : _genresRepository = genresRepository;

  @override
  Future<List<GenreModel>> getGenres() => _genresRepository.getGenres();
}
