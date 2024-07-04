import 'package:flutter/material.dart';
import 'package:moviedb/moviedb.dart';
import 'package:moviedb/types/movie.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});
  final String _token = "eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMDkzMzA4NjViNWM3YjJhNzJiNTE0Nzg1YzllM2RkYSIsIm5iZiI6MTcxOTg5MjYzMy42NDA1MzcsInN1YiI6IjY2ODMxYzFjYjI5YjNlZTQ4NGM4MzFkYSIsInNjb3BlcyI6WyJhcGlfcmVhZCJdLCJ2ZXJzaW9uIjoxfQ.0N25wXzFx0WK2n9ZQP7YTT8RpVsSVlkuO4bgaLkvYss";
    // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      title: 'Title',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // TRY THIS: Try running your application with "flutter run". You'll see
        // the application has a purple toolbar. Then, without quitting the app,
        // try changing the seedColor in the colorScheme below to Colors.green
        // and then invoke "hot reload" (save your changes or press the "hot
        // reload" button in a Flutter-supported IDE, or press "r" if you used
        // the command line to start the app).
        //
        // Notice that the counter didn't reset back to zero; the application
        // state is not lost during the reload. To reset the state, use hot
        // restart instead.
        //
        // This works for code too, not just values: Most code changes can be
        // tested with just a hot reload.
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late Future<Movie> movie;
  late Future<List<Movie>> movies;
  final  Moviedb moviedb = Moviedb('e09330865b5c7b2a72b514785c9e3dda', '_token', 'sessionId');
  @override
  void initState() {
    super.initState();
    movies = moviedb.getRandomMoviesByDateRange(DateTime(1980,01,01), DateTime(1981,01,01));
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
                                child: Text('Release Date ${snapshot.data![index].releaseDate.year.toString()}-${snapshot.data![index].releaseDate.month.toString()}-${snapshot.data![index].releaseDate.day.toString()}'),
                              )
                            ],
                          ),
                           Text(snapshot.data![index].overview)
                        ],
                      ),
                      subtitle: Image.network(snapshot.data![index].poster),

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
