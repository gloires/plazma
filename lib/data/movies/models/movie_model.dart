import 'package:plazma/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel ({
    required int id,
    required String title,
    required String posterPath,
    required String overview,
}) : super(
    id: id,
    title: title,
    posterPath: posterPath,
    overview: overview,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
    );
  }
}