import 'package:get_it/get_it.dart';
import 'package:plazma/data/movies/datasources/api/movie_api.dart';
import 'package:plazma/data/repositories/movie_repository_impl.dart';
import 'package:plazma/data/user/user_datasource.dart';
import 'package:plazma/data/user/user_repository_impl.dart';
import 'package:plazma/domain/repositories/movie_repository.dart';
import 'package:plazma/domain/repositories/user_repository.dart';
import 'package:plazma/domain/usecases/movies/get_popular_movie.dart';
import 'package:plazma/domain/usecases/user/get_user.dart';
import 'package:plazma/domain/usecases/user/initial_user.dart';
import 'package:plazma/domain/usecases/user/update_user.dart';
import 'package:plazma/presentation/bloc/movie/movie_bloc.dart';
import 'package:plazma/presentation/bloc/user/user_bloc.dart';
import 'package:sqflite/sqflite.dart';

final sl = GetIt.instance;

Future<void> init() async {
  /// BloC

  sl.registerLazySingleton(
    () => MovieBloc(
      getPopularMovie: sl(),
    ),
  );

  sl.registerLazySingleton(
    () => UserBloc(
      initialUser: sl(),
      getUser: sl(),
      updateUser: sl(),
    ),
  );

  /// Usecases

  //Movies
  sl.registerLazySingleton(
    () => GetPopularMovie(
      movieRepository: sl(),
    ),
  );

  //User
  sl.registerLazySingleton(
    () => InitialUser(
      userRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => GetUser(
      userRepository: sl(),
    ),
  );
  sl.registerLazySingleton(
    () => UpdateUser(
      userRepository: sl(),
    ),
  );

  /// Repository

  sl.registerLazySingleton<MovieRepository>(
    () => MovieRepositoryImpl(
      movieApi: sl(),
    ),
  );

  sl.registerLazySingleton<UserRepository>(
    () => UserRepositoryImpl(
      userDatasource: sl(),
    ),
  );

  /// API

  sl.registerLazySingleton<MovieApi>(
    () => MovieApiImpl(),
  );

  /// Datasource

  sl.registerLazySingleton<UserDatasource>(
    () => UserDatasourceImpl(
      database: sl(),
    ),
  );

  ///DB

  var databasesPath = await getDatabasesPath();
  String path = '$databasesPath/data.db';
  Database database = await openDatabase(
    path,
    version: 1,
    onCreate: (Database db, int version) async {
      await db.execute("""
      CREATE TABLE user (
        id INTEGER PRIMARY KEY, 
        name TEXT,
        image_path TEXT
      )""");
      await db.rawQuery(
        """
    INSERT INTO 
      user(name, image_path)
    VALUES(?,?)
    """,
        [
          "User",
          "assets/images/avatar.png",
        ],
      );
    },
  );

  sl.registerLazySingleton(() => database);
}
