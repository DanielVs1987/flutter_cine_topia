import 'package:flutter_cine_topia/app/model/movies.dart';
import 'package:flutter_cine_topia/app/services/search_movies_service.dart';


class SearchMoviesViewmoel {
  List<Movies> _moviesList = <Movies>[];

  Future<List<Movies>> getPopularMovies() async {
    final SearchMoviesService service = SearchPopularMoviesService();

    _moviesList = await service.getMovies();

    return _moviesList;
  }

  Future<List<Movies>> getMovie(String query) async {
    if (query.isEmpty) {
      _moviesList = await getPopularMovies();
    } else {
      final SearchMoviesService service = SearchForMovies(query: query);
      _moviesList = await service.getMovies();
    }
    return _moviesList;
  }

  List<Movies> get moviesList => _moviesList;

}


