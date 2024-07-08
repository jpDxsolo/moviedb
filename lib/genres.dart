import 'package:jp_moviedb/api.dart';
import 'package:jp_moviedb/types/genre.dart';
import 'package:jp_moviedb/utils/enums.dart';

class Genres extends TmdbApi {
  final String _apiKey;

  Genres(this._apiKey) : super(_apiKey);

  Future<List<Genre>> getGenres() async {
    final response = await query('genre/movie/list', HttpMethod.get, constructQuery());

    if (response.statusCode == 200) {
      final List<Genre> genres = List<Genre>.from(response.data["genres"].map((x) => Genre.fromJson(x)));
      return genres.toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Genres');
    }
  }

  String constructQuery() {
    Map<String, String> queryParams = {
      'api_key': _apiKey,
      'language': 'en',
    };

    String queryString = queryParams.entries.map((entry) => '${entry.key}=${entry.value}').join('&');
    return '?$queryString';
  }
}
