import 'package:plazma/data/movies/models/genre_model.dart';
import 'package:plazma/domain/entities/movie_entity.dart';

class MovieModel extends MovieEntity {
  const MovieModel ({
    required int id,
    required String title,
    required String posterPath,
    required String overview,
    required List genres,
}) : super(
    id: id,
    title: title,
    posterPath: posterPath,
    overview: overview,
    genres: genres,
  );

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      id: json['id'],
      title: json['original_title'],
      posterPath: json['poster_path'],
      overview: json['overview'],
      genres: json["genre_ids"]
    );
  }
}