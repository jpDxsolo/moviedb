import 'package:moviedb/types/movie.dart';
//comment

class Person {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  List<Movie>? knownFor;

  Person(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath,
      this.knownFor});

  factory Person.fromJson(Map<String, dynamic> json) {
    return Person(
      adult: json['adult'],
      gender: json['gender'],
      id: json['id'],
      knownForDepartment: json['known_for_department'],
      name: json['name'],
      originalName: json['original_name'],
      popularity: json['popularity'],
      profilePath: 'https://image.tmdb.org/t/p/original${json['profile_path']}',
      knownFor: (json['known_for'] as List).map((item) => Movie.fromJson(item)).toList(),
    );
  }
}
