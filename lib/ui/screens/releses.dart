import 'package:flutter/material.dart';
import 'package:flutter_cine_topia/app/services/search_movies_service.dart';
import 'package:flutter_cine_topia/ui/componets/movi_card.dart';

class Releses extends StatelessWidget {
 final SearchReleseMoviesService searchReleseMoviesService =
      SearchReleseMoviesService();

  Releses({super.key});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: searchReleseMoviesService.getMovies(),
      builder: (context, snapshot) {
        if (snapshot.hasData) {
          return CustomScrollView(
            slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/movie.png",
                  height: 80,
                  width: 80,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 40),
                    child: Text(
                      "Filmes Lançamento",
                      style:
                          TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) =>
                    MoviCard(movie: searchReleseMoviesService.movies[index]),
                itemCount: searchReleseMoviesService.movies.length,
              ),
            ],
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
