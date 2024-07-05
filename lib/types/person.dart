class Person {
  bool? adult;
  int? gender;
  int? id;
  String? knownForDepartment;
  String? name;
  String? originalName;
  double? popularity;
  String? profilePath;
  //List<KnownFor>? knownFor;

  Person(
      {this.adult,
      this.gender,
      this.id,
      this.knownForDepartment,
      this.name,
      this.originalName,
      this.popularity,
      this.profilePath});

  factory Person.fromJson(Map<String, dynamic> json) {
    return switch (json) {
      {
        'adult': bool? adult,
        'gender': int? gender,
        'id': int id,
        'known_for_department': String? knownForDepartment,
        'name': String name,
        'original_name': String? originalName,
        'popularity': double? popularity,
        'profile_path': String? profilePath,
        //'known_for': List<KnownFor>,
      } =>
        Person(
            adult: adult,
            gender: gender,
            id: id,
            knownForDepartment: knownForDepartment,
            name: name,
            originalName: originalName,
            popularity: popularity,
            profilePath: 'https://image.tmdb.org/t/p/original$profilePath'),
      _ => throw const FormatException('Failed to load person.'),
    };
  }
}
