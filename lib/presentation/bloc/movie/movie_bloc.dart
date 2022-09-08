import 'dart:async';
import 'package:equatable/equatable.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:plazma/domain/entities/movie_entity.dart';
import 'package:plazma/domain/usecases/movies/get_popular_movie.dart';

part 'movie_event.dart';
part 'movie_state.dart';

class MovieBloc extends Bloc<MovieEvent, MovieState> {
  final GetPopularMovie getPopularMovie;

  MovieBloc({
    required this.getPopularMovie
}) : super(MovieLoadingState()) {
    on<MovieLoadEvent>(_onMovieLoadEvent);
  }

  FutureOr<void> _onMovieLoadEvent(
      MovieLoadEvent event,
      Emitter<MovieState> emit
      ) async {
    emit(MovieLoadingState());
    final movie = await getPopularMovie(event.context);
    emit(MovieLoadedState(movie: movie));
  }
}