import 'package:flutter_cine_topia/app/chave_api.dart';
import 'package:flutter_cine_topia/ui/screens/search_movies.dart';

SearchMoviesState page = SearchMoviesState();




String popularMouviesUrl =
    'https://api.themoviedb.org/3/movie/popular?language=pt-BR&page=${page.counter}';

const String prefixMovieSearch =
    "https://api.themoviedb.org/3/search/movie?query=";

const String sufixMovieSearch = "&include_adult=false&language=pt-BR&page=1";

const infoHeaders = {
  "accept": 'application/json',
  "Authorization": 'Bearer $chaveApi'
};
const String imageUrlPrefix = "https://image.tmdb.org/t/p/w500";

const String upcoming =
    'https://api.themoviedb.org/3/movie/upcoming?language=pt-BR&page=1';
