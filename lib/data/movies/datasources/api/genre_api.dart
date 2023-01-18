import 'dart:convert';

import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'package:plazma/core/theme/const.dart';
import 'package:plazma/data/movies/models/genre_model.dart';

abstract class GenreApi {
  Future<List<GenreModel>> getListGenres(BuildContext context);
}

class GenreApiImpl implements GenreApi {
  http.Client client = http.Client();

  @override
  Future<List<GenreModel>> getListGenres(BuildContext context) async {
    List<GenreModel> result = [];
    final response = await client.get(Uri.parse(
        "genre/movie/list?api_key=${Const.apiKey}&language=${EasyLocalization.of(context)?.currentLocale?.languageCode}"));
    Map<String, dynamic> jsonData = json.decode(response.body);
    List<dynamic> data = jsonData["genres"];
    if (response.statusCode == 200) {
      for (final item in data) {
        GenreModel movie =
            GenreModel(id: item["id"] ?? 0, name: item["name"] ?? "");
        result.add(movie);
      }
    }
    return result;
  }
}
