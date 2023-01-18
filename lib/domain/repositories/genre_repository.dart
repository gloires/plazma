import 'package:flutter/cupertino.dart';

import '../entities/genre_entity.dart';

abstract class GenreRepository {
  Future<List<GenreEntity>> getGenres(BuildContext context);
}