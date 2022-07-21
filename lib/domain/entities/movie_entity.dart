import 'package:equatable/equatable.dart';

class MovieEntity extends Equatable {
  final int id;
  final String title;
  final String posterPath;
  final String overview;

  const MovieEntity({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overview,
});

  @override
  List<Object?> get props => [id, title, posterPath, overview];
}