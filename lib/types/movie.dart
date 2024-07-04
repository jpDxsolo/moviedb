class Movie {
  final String title;
  final String poster;
  final String overview;
  final DateTime releaseDate;
  final String language;

  const Movie({required this.title, this.poster = '', required this.overview, required this.releaseDate, this.language = 'en'});

    factory Movie.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'title': String title,
        'poster_path': String? poster,
        'overview': String overview,
        'release_date': String releaseDate,
        'original_language': String language,
      } =>
         Movie( title: title, poster: 'https://image.tmdb.org/t/p/original/$poster', overview: overview, releaseDate: DateTime.parse(releaseDate), language: language
        ),
      _ => throw const FormatException('Failed to load movie.'),
    };
  }
}

