import 'package:jp_moviedb/api.dart';
import 'package:jp_moviedb/filters/movie.dart';
import 'dart:async';
import 'package:jp_moviedb/types/movie.dart';
import 'package:jp_moviedb/utils/enums.dart';

class Discover extends TmdbApi {
  final String _apiKey;

  Discover(this._apiKey) : super(_apiKey);

  Future<List<Movie>> getMovies([MovieFilters? filters]) async {
    filters ??= MovieFilters();
    final response = await query('discover/movie', HttpMethod.get, constructQuery(filters));

    if (response.statusCode == 200) {
      final List<Movie> movies = List<Movie>.from(response.data["results"].map((x) => Movie.fromJson(x)));
      return movies.where((movie) => movie.language == filters!.language).toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load movies');
    }
  }

  Future<Movie> getMovieDetails(Movie movie) async {
    MovieFilters filters = MovieFilters();
    filters.language = 'en-US';
    try {
      final response = await query('movie/${movie.id}', HttpMethod.get, constructQuery(filters));

      if (response.statusCode == 200) {
        var responseDetails = response.data;
        movie.runtime = responseDetails['runtime'];
      }
      return movie;
    } catch (e) {
      throw Exception('Failed to load movie details');
    }
  }

  String constructQuery(MovieFilters filters) {
    Map<String, String> queryParams = {
      'api_key': _apiKey,
      if (filters.certification != null) 'certification': filters.certification!,
      if (filters.certificationGte != null) 'certification.gte': filters.certificationGte!,
      if (filters.certificationLte != null) 'certification.lte': filters.certificationLte!,
      if (filters.certificationCountry != null) 'certification_country': filters.certificationCountry!,
      if (filters.includeAdult != null) 'include_adult': filters.includeAdult.toString(),
      if (filters.includeVideo != null) 'include_video': filters.includeVideo.toString(),
      if (filters.language != null) 'language': filters.language!,
      if (filters.page != null) 'page': filters.page.toString(),
      if (filters.primaryReleaseDateYear != null)
        'primary_release_date_year': filters.primaryReleaseDateYear!.toIso8601String(),
      if (filters.primaryReleaseDateGte != null)
        'primary_release_date.gte': filters.primaryReleaseDateGte!.toIso8601String(),
      if (filters.primaryReleaseDateLte != null)
        'primary_release_date.lte': filters.primaryReleaseDateLte!.toIso8601String(),
      if (filters.region != null) 'region': filters.region!,
      if (filters.releaseDateGte != null) 'release_date.gte': filters.releaseDateGte!.toIso8601String(),
      if (filters.releaseDateLte != null) 'release_date.lte': filters.releaseDateLte!.toIso8601String(),
      if (filters.sortBy != null) 'sort_by': filters.sortBy!,
      if (filters.voteAverageGte != null) 'vote_average.gte': filters.voteAverageGte.toString(),
      if (filters.voteAverageLte != null) 'vote_average.lte': filters.voteAverageLte.toString(),
      if (filters.voteCountGte != null) 'vote_count.gte': filters.voteCountGte.toString(),
      if (filters.voteCountLte != null) 'vote_count.lte': filters.voteCountLte.toString(),
      if (filters.watchRegion != null) 'watch_region': filters.watchRegion!,
      if (filters.withCast != null) 'with_cast': filters.withCast!,
      if (filters.withCompanies != null) 'with_companies': filters.withCompanies!,
      if (filters.withCrew != null) 'with_crew': filters.withCrew!,
      if (filters.withGenres != null) 'with_genres': filters.withGenres!,
      if (filters.withKeywords != null) 'with_keywords': filters.withKeywords!,
      if (filters.withOriginalLanguage != null) 'with_original_language': filters.withOriginalLanguage!,
      if (filters.withOriginCountry != null) 'with_origin_country': filters.withOriginCountry!,
      if (filters.withPeople != null) 'with_people': filters.withPeople!,
      if (filters.withReleaseType != null) 'with_release_type': filters.withReleaseType.toString(),
      if (filters.withRuntimeGte != null) 'with_runtime.gte': filters.withRuntimeGte.toString(),
      if (filters.withRuntimeLte != null) 'with_runtime.lte': filters.withRuntimeLte.toString(),
      if (filters.withWatchMonetizationTypes != null)
        'with_watch_monetization_types': filters.withWatchMonetizationTypes!,
      if (filters.withWatchProviders != null) 'with_watch_providers': filters.withWatchProviders!,
      if (filters.withoutGenres != null) 'without_genres': filters.withoutGenres!,
      if (filters.withoutKeywords != null) 'without_keywords': filters.withoutKeywords!,
      if (filters.withoutPeople != null) 'without_people': filters.withoutPeople!,
      if (filters.withoutCompanies != null) 'without_companies': filters.withoutCompanies!,
      if (filters.withoutWatchProviders != null) 'without_watch_providers': filters.withoutWatchProviders!,
      if (filters.year != null) 'year': filters.year.toString(),
    };

    String queryString = queryParams.entries.map((entry) => '${entry.key}=${entry.value}').join('&');
    return '?$queryString';
  }
}
