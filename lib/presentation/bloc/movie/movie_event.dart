part of 'movie_bloc.dart';

abstract class MovieEvent extends Equatable {
  const MovieEvent();

  @override
  List<Object> get props => [];
}

class MovieLoadEvent extends MovieEvent {
  final BuildContext context;

  const MovieLoadEvent({
    required this.context
});
  @override
  List<Object> get props => [context];
}