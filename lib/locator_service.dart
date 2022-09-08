import 'package:get_it/get_it.dart';
import 'package:plazma/data/movies/datasources/api/movie_api.dart';
import 'package:plazma/data/repositories/movie_repository_impl.dart';
import 'package:plazma/domain/repositories/movie_repository.dart';
import 'package:plazma/domain/usecases/movies/get_popular_movie.dart';
import 'package:plazma/presentation/bloc/movie/movie_bloc.dart';

final sl = GetIt.instance;

Future<void> init() async {

  /// BloC

  sl.registerLazySingleton(() => MovieBloc(getPopularMovie: sl()));

  /// Usecases

  sl.registerLazySingleton(() => GetPopularMovie(movieRepository: sl()));

  /// Repository

  sl.registerLazySingleton<MovieRepository>(() => MovieRepositoryImpl(movieApi: sl()));

  /// API

  sl.registerLazySingleton<MovieApi>(() => MovieApiImpl());
}
