import 'package:moviedb/api.dart';
import 'package:moviedb/types/person.dart';
import 'package:moviedb/utils/enums.dart';

class Search extends TmdbApi {
  final String _apiKey;

  Search(this._apiKey) : super(_apiKey);

  Future<List<Person>> getPerson(String search) async {
    final response = await query('search/person', HttpMethod.get, constructQuery(search));

    if (response.statusCode == 200) {
      final List<Person> persons = List<Person>.from(response.data["results"].map((x) => Person.fromJson(x)));
      return persons.toList();
    } else {
      // If the server did not return a 200 OK response,
      // then throw an exception.
      throw Exception('Failed to load Person');
    }
  }

  String constructQuery(String search) {
    Map<String, String> queryParams = {
      'api_key': _apiKey,
      'include_adult': 'false',
      'language': 'en',
      'page': 1.toString(),
      'query': search,
    };

    String queryString = queryParams.entries.map((entry) => '${entry.key}=${entry.value}').join('&');
    return '?$queryString';
  }
}
