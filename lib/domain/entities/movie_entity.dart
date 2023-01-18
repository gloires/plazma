import 'package:equatable/equatable.dart';
import 'package:plazma/domain/entities/genre_entity.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;
  final List genres;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
    required this.genres,
});

  @override
  List<Object?> get props => [id, title, posterPath, overview, genres];
}