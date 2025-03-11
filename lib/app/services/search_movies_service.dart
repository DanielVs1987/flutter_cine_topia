import 'dart:convert';
import 'package:flutter_cine_topia/app/helpers/consts.dart';
import 'package:flutter_cine_topia/app/model/movies.dart';
import 'package:http/http.dart' as http;

abstract class SearchMoviesService {
  Future<List<Movies>> getMovies();
}

class SearchPopularMoviesService implements SearchMoviesService {
  final List<Movies> _movies = <Movies>[];


  @override
  Future<List<Movies>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(popularMouviesUrl),
        headers: infoHeaders,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          _movies.add(Movies.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return _movies;
    } catch (e) {
      print(e);
      return _movies;
    }
  }


  List<Movies> get movies => _movies;
}

class SearchReleseMoviesService implements SearchMoviesService {
  List<Movies> movies = <Movies>[];

  @override
  Future<List<Movies>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(upcoming),
        headers: infoHeaders,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movies.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}

class SearchForMovies implements SearchMoviesService {
  final String query;

  SearchForMovies({required this.query});

  List<Movies> movies = <Movies>[];

  @override
  Future<List<Movies>> getMovies() async {
    try {
      final response = await http.get(
        Uri.parse(prefixMovieSearch + query + sufixMovieSearch),
        headers: infoHeaders,
      );
      if (response.statusCode == 200) {
        for (dynamic movie in json.decode(response.body)["results"]) {
          movies.add(Movies.fromMap(movie));
        }
      } else {
        throw Exception(response.body);
      }
      return movies;
    } catch (e) {
      print(e);
      return movies;
    }
  }
}
