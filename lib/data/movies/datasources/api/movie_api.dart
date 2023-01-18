import 'dart:convert';
import 'dart:math';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:plazma/core/theme/const.dart';
import 'package:plazma/data/movies/models/genre_model.dart';
import 'package:plazma/data/movies/models/movie_model.dart';

abstract class MovieApi {
  Future<MovieModel> getPopularMovie(BuildContext context);
}

class MovieApiImpl implements MovieApi {
  http.Client client = http.Client();
  Random random = Random();
  String type = "";

  @override
  Future<MovieModel> getPopularMovie(BuildContext context) async {
    int randomNumber = random.nextInt(2) + 1;
    randomNumber == 1 ? type = "movie" : type = "tv";
    // final response = await client.get(Uri.parse(
    //     "${Const.baseUrl}/$type/popular?api_key=${Const.apiKey}&language=${EasyLocalization.of(context)?.currentLocale?.languageCode}"));
    final response = await client.get(Uri.parse(
        "${Const.movieUrl}/popular?api_key=${Const.apiKey}&language=${EasyLocalization.of(context)?.currentLocale?.languageCode}"));
    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> data = jsonData["results"];
    if (response.statusCode == 200) {
      MovieModel movie = MovieModel(
        id: data[0]["id"],
        // title: randomNumber == 1 ? data[0]["title"] : data[0]["name"],
        title: data[3]["title"],
        posterPath: data[0]["poster_path"] ?? "",
        overview: data[0]["overview"] ?? "",
        genres: data[0]["genre_ids"],
      );
      return movie;
    } else {
      throw Exception('Failed to load movie');
    }
  }
}
