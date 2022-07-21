part of 'movie_bloc.dart';

abstract class MovieState extends Equatable {
  const MovieState();

  @override
  List<Object> get props => [];
}

class MovieLoadingState extends MovieState {}

class MovieLoadedState extends MovieState {
  final movie;

  const MovieLoadedState({required this.movie});

  @override
  List<Object> get props => [movie];
}
