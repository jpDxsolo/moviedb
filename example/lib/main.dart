import 'package:flutter/material.dart';
import 'package:jp_moviedb/api.dart';
import 'package:jp_moviedb/filters/movie.dart';
import 'package:jp_moviedb/types/movie.dart';
import 'package:jp_moviedb/types/person.dart';
import 'package:jp_moviedb/types/genre.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final TmdbApi api = TmdbApi('YOUR_API_KEY');
  late Future<List<Movie>> movies;
  late Future<List<Person>> persons;
  late Future<List<Genre>> genres;
  @override
  void initState() {
    super.initState();
    MovieFilters filters = MovieFilters();
    filters.page = 10;
    filters.language = 'en';
    filters.primaryReleaseDateGte = DateTime(1980, 01, 01);
    filters.primaryReleaseDateLte = DateTime(1981, 01, 01);
    movies = api.discover.getMovies();
    persons = api.search.getPerson('Tom Hanks');
    genres = api.genres.getGenres();
  }

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
      ),
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Fetch Data Example'),
        ),
        body: Center(
          child: FutureBuilder<List<Movie>>(
            future: movies,
            builder: (context, snapshot) {
              if (snapshot.hasData) {
                return ListView.builder(
                  itemCount: snapshot.data!.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      title: Column(
                        children: [
                          Row(
                            children: [
                              Text(snapshot.data![index].title),
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text(
                                    'Release Date ${snapshot.data![index].releaseDate.year.toString()}-${snapshot.data![index].releaseDate.month.toString()}-${snapshot.data![index].releaseDate.day.toString()}'),
                              )
                            ],
                          ),
                          Text(snapshot.data![index].overview)
                        ],
                      ),
                      subtitle: Image.network(snapshot.data![index].posterPath),
                    );
                  },
                );
                //return Text(snapshot.data!.overview);
              } else if (snapshot.hasError) {
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const CircularProgressIndicator();
            },
          ),
        ),
      ),
    );
  }
}
