import 'package:dio/dio.dart';
import 'package:jpMoviedb/discover.dart';
import 'package:jpMoviedb/genres.dart';
import 'package:jpMoviedb/search.dart';
import 'package:jpMoviedb/utils/enums.dart';

class TmdbApi {
  final String _apiKey;
  final Dio dio = Dio();
  String baseUrl = 'https://api.themoviedb.org/3';
  late Discover discover = Discover(_apiKey);
  late Search search = Search(_apiKey);
  late Genres genres = Genres(_apiKey);
  TmdbApi(this._apiKey);

  Future<Response> query(String endpoint, HttpMethod httpMethod, String query) async {
    Response response;
    switch (httpMethod) {
      case HttpMethod.get:
        response = await dio.get('$baseUrl/$endpoint$query');
        break;
      default:
        throw Exception('Invalid HttpMethod');
      // case HttpMethod.POST:
      //   response = await dio.post('$baseUrl/$endpoint', data: query);
      //   break;
      // case HttpMethod.PUT:
      //   response = await dio.put('$baseUrl/$endpoint', data: query);
      //   break;
      // case HttpMethod.DELETE:
      //   response = await dio.delete('$baseUrl/$endpoint', data: query);
      //   break;
    }
    return response;
  }
}
