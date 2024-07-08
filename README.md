```markdown
# TMDB Flutter Wrapper

A Flutter package that serves as a wrapper for The Movie Database (TMDB) API. This package simplifies the interaction with TMDB by providing easy-to-use methods for accessing various endpoints.

## Features

This package currently supports the following TMDB API endpoints:

1. **Discover Movies**
2. **Search Person**
3. **Genres Movies**

## Installation

Add the following to your `pubspec.yaml` file:

```yaml
dependencies:
  tmdb_flutter_wrapper:
    git:
      url: https://github.com/yourusername/tmdb_flutter_wrapper.git
```

Then, run:

```sh
flutter pub get
```

## Usage

First, import the package:

```dart
import 'package:tmdb_flutter_wrapper/tmdb_flutter_wrapper.dart';
```

### Discover Movies

To discover movies:

```dart
final movies = await TmdbWrapper.discoverMovies();
```

### Search Person

To search for a person:

```dart
final person = await TmdbWrapper.searchPerson('John Doe');
```

### Get Movie Genres

To get a list of movie genres:

```dart
final genres = await TmdbWrapper.getMovieGenres();
```

## Contributing

Contributions are welcome! Please open an issue or submit a pull request.

## License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## Acknowledgements

This package uses the TMDB API but is not endorsed or certified by TMDB.
```