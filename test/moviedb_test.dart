import 'package:flutter_test/flutter_test.dart';
import 'package:jp_moviedb/api.dart';
import 'package:jp_moviedb/filters/movie.dart';

import 'package:jp_moviedb/types/movie.dart';

void main() {
  test('check value of movie details', () async {
    final TmdbApi api = TmdbApi('YOUR+API+KEY');

    Movie movie =
        Movie(id: 5825, title: 'Movie Title', overview: 'Movie Overview', releaseDate: DateTime(2022, 01, 01));
    var result = await api.discover.getMovieDetails(movie);
    Movie movieDetails = result!;
    expect(movieDetails.runtime, 97);
  });

  test("is this even working", () async {
    final TmdbApi api = TmdbApi('YOUR+API+KEY');

    MovieFilters filters = MovieFilters();
    filters.page = 1;
    filters.language = 'en';
    filters.primaryReleaseDateGte = DateTime(1986, 01, 01);
    filters.primaryReleaseDateLte = DateTime(1991, 01, 01);
    var result = await api.discover.getMovies(filters);
    var movie = result.first;
  });
}
