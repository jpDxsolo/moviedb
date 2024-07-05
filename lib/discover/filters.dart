import 'dart:ffi';

class Filters {
  //use in conjunction with region
  String? certification;
  //use in conjunction with region
  String? certificationGte;
  //use in conjunction with region
  String? certificationLte;
  //use in conjunction with the certification, certification.gte and certification.lte filters
  String? certificationCountry;
  bool? includeAdult = false;
  bool? includeVideo = false;
  //Defaults to en-US
  String? language = 'en-US';
  //Defaults to 1
  int? page = 1;
  DateTime? primaryReleaseDateYear;
  DateTime? primaryReleaseDateGte;
  DateTime? primaryReleaseDateLte;
  String? region;
  DateTime? releaseDateGte;
  DateTime? releaseDateLte;
  //Defaults to popularity.desc
  String? sortBy = 'popularity.desc';
  Float? voteAverageGte;
  Float? voteAverageLte;
  Float? voteCountGte;
  Float? voteCountLte;
  //use in conjunction with with_watch_monetization_types or with_watch_providers
  String? watchRegion;
  //can be a comma (AND) or pipe (OR) separated query
  String? withCast;
  //can be a comma (AND) or pipe (OR) separated query
  String? withCompanies;
  //can be a comma (AND) or pipe (OR) separated query
  String? withCrew;
  //can be a comma (AND) or pipe (OR) separated query
  String? withGenres;
  //can be a comma (AND) or pipe (OR) separated query
  String? withKeywords;
  String? withOriginalLanguage;
  String? withOriginCountry;
  //can be a comma (AND) or pipe (OR) separated query
  String? withPeople;
  //possible values are: [1, 2, 3, 4, 5, 6] can be a comma (AND) or pipe (OR) separated query, can be used in conjunction with region
  Int32? withReleaseType;
  Int32? withRuntimeGte;
  Int32? withRuntimeLte;
  //possible values are: [flatrate, free, ads, rent, buy] use in conjunction with watch_region, can be a comma (AND) or pipe (OR) separated query
  String? withWatchMonetizationTypes;
  //use in conjunction with watch_region, can be a comma (AND) or pipe (OR) separated query
  String? withWatchProviders;
  String? withoutGenres;
  String? withoutKeywords;
  String? withoutPeople;
  String? withoutCompanies;
  String? withoutWatchProviders;
  Int32? year;
}
