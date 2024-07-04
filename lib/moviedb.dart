library moviedb;
import 'package:http/http.dart' as http;
import 'dart:async';
import 'dart:convert';
import 'dart:math';
import 'package:moviedb/types/movie.dart';
/// A Calculator.
class Calculator {
  /// Returns [value] plus 1.
  int addOne(int value) => value + 1;
}


class Moviedb {
   final String _apiKey;
   final String _token;
   String baseUrl = 'https://api.themoviedb.org/3/';
   String sessionId;

   Moviedb(this._apiKey,this._token,this.sessionId);


   Future<Movie> fetchMovie(int id) async {
        final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/movie/$id?api_key=$_apiKey'));
    if (response.statusCode == 200) {
      return Movie.fromJson(jsonDecode(response.body) as Map<String, dynamic>);
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movie');
    }
  }

  Future<List<Movie>> getMovies() async {
      final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Movie> movies = List<Movie>.from(jsonData['results'].map((x) => Movie.fromJson(x)));
      return movies;
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getMoviesByDateRange(DateTime start, DateTime end, {String language = 'en'}) async {
      final String startDate = '${start.year}-${start.month}-${start.day}';
      final String endDate = '${end.year}-${end.month}-${end.day}';
      final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&original_language=en&include_adult=false&primary_release_date.gte=$startDate&primary_release_date.lte=$endDate'));

    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Movie> movies = List<Movie>.from(jsonData['results'].map((x) => Movie.fromJson(x)));
      return movies.where((movie) => movie.language == language).toList();
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  Future<List<Movie>> getRandomMoviesByDateRange(DateTime start, DateTime end, {String language = 'en'}) async {
      final int pages = await getTotalPages(start, end);
      final int totalPages = pages > 500 ? 500 : pages;
      final String startDate = '${start.year}-${start.month}-${start.day}';
      final String endDate = '${end.year}-${end.month}-${end.day}';
      Random random = Random();
      int page = 1 + random.nextInt(totalPages - 1 + 1);
      final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&page=$page&original_language=en&include_adult=false&primary_release_date.gte=$startDate&primary_release_date.lte=$endDate'));

 
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      final List<Movie> movies = List<Movie>.from(jsonData['results'].map((x) => Movie.fromJson(x)));
      return movies.where((movie) => movie.language == language ).toList();
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

   Future<int> getTotalPages(DateTime start, DateTime end, {String language = 'en'}) async {
      final String startDate = '${start.year}-${start.month}-${start.day}';
      final String endDate = '${end.year}-${end.month}-${end.day}';
      final response = await http
        .get(Uri.parse('https://api.themoviedb.org/3/discover/movie?api_key=$_apiKey&original_language=en&include_adult=false&primary_release_date.gte=$startDate&primary_release_date.lte=$endDate'));
    if (response.statusCode == 200) {
      final jsonData = json.decode(response.body);
      return jsonData['total_pages'];
    }
    else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }
}
