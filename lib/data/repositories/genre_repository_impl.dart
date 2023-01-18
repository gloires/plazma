import 'package:flutter/cupertino.dart';
import 'package:plazma/domain/entities/genre_entity.dart';
import 'package:plazma/domain/repositories/genre_repository.dart';

import '../movies/datasources/api/genre_api.dart';

class GenreRepositoryImpl implements GenreRepository {
  final GenreApi movieApi;

  GenreRepositoryImpl({required this.movieApi});

  @override
  Future<List<GenreEntity>> getGenres(BuildContext context) async {
    return await movieApi.getListGenres(context);
  }
}