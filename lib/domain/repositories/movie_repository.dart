import 'package:flutter/cupertino.dart';
import 'package:plazma/domain/entities/movie_entity.dart';

abstract class MovieRepository {
  Future<MovieEntity> getPopularMovie(BuildContext context);
}