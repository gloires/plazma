import 'package:flutter/cupertino.dart';
import 'package:plazma/domain/entities/movie_entity.dart';
import 'package:plazma/domain/repositories/movie_repository.dart';

class GetPopularMovie {
  final MovieRepository movieRepository;

  GetPopularMovie({required this.movieRepository});

  Future<MovieEntity> call(BuildContext context) async {
    return await movieRepository.getPopularMovie(context);
  }
}