class Movie {
  final String title;
  final String overview;
  final DateTime releaseDate;
  final String language;
  final double voteAverage;
  final String backdropPath;
  final int id;
  final String originalTitle;
  final String posterPath;
  final bool adult;
  final List<int> genreIds;
  final double popularity;
  final bool video;
  final int voteCount;
  int runtime;

  Movie(
      {required this.title,
      this.posterPath = '',
      required this.overview,
      required this.releaseDate,
      this.language = 'en',
      this.voteAverage = 0.0,
      this.backdropPath = '',
      this.id = 0,
      this.originalTitle = '',
      this.adult = false,
      this.genreIds = const [],
      this.popularity = 0.0,
      this.video = false,
      this.voteCount = 0,
      this.runtime = 0});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      title: json['title'],
      posterPath: 'https://image.tmdb.org/t/p/original${json['poster_path']}',
      overview: json['overview'],
      releaseDate: DateTime.parse(json['release_date']),
      language: json['original_language'],
      voteAverage: json['vote_average'],
      backdropPath: 'https://image.tmdb.org/t/p/original${json['backdrop_path']}',
      id: json['id'],
      originalTitle: json['original_title'],
      adult: json['adult'],
      genreIds: List<int>.from(json['genre_ids']),
      popularity: json['popularity'],
      video: json['video'],
      voteCount: json['vote_count'],
      runtime: json.containsKey('runtime') ? json['runtime'] : 0,
    );
  }
}
