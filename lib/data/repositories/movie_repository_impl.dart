import 'package:flutter/cupertino.dart';
import 'package:plazma/data/datasources/api/movie_api.dart';
import 'package:plazma/domain/entities/movie_entity.dart';
import 'package:plazma/domain/repositories/movie_repository.dart';

class MovieRepositoryImpl implements MovieRepository {
  final MovieApi movieApi;

  MovieRepositoryImpl({required this.movieApi});

  @override
  Future<MovieEntity> getPopularMovie(BuildContext context) async {
    return await movieApi.getPopularMovie(context);
  }
}