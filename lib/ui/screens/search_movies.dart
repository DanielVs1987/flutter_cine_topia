import 'package:flutter/material.dart';
import 'package:flutter_cine_topia/app/viewmodels/search_movies%20_viewmoel.dart';
import 'package:flutter_cine_topia/ui/componets/movi_card.dart';

class SearchMovies extends StatefulWidget {
  int counter;
  SearchMovies({
    super.key,
    required this.counter,
  });

  @override
  State<SearchMovies> createState() => SearchMoviesState();
}

class SearchMoviesState extends State<SearchMovies> {
  final SearchMoviesViewmoel vielmodel = SearchMoviesViewmoel();
  final TextEditingController textController = TextEditingController();
  int counter = 1;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: vielmodel.getMovie(textController.text),
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return CustomScrollView(slivers: [
              SliverToBoxAdapter(
                child: Image.asset(
                  "assets/popular.png",
                  height: 80,
                  width: 80,
                ),
              ),
              SliverToBoxAdapter(
                child: Center(
                    child: Padding(
                  padding: const EdgeInsets.only(bottom: 40),
                  child: Text(
                    "Filmes Populares",
                    style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
                  ),
                )),
              ),
              SliverToBoxAdapter(
                child: TextField(
                  controller: textController,
                  onEditingComplete: () {
                    FocusScope.of(context).unfocus();
                    setState(() {});
                  },
                  decoration: InputDecoration(
                    hintText: "Pesquisar",
                    border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(18),
                    ),
                  ),
                ),
              ),
              SliverList.builder(
                itemBuilder: (context, index) =>
                    MoviCard(movie: vielmodel.moviesList[index]),
                itemCount: vielmodel.moviesList.length,
              )
            ]);
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          setState(() {
            counter++;
            vielmodel.moviesList.clear;
            vielmodel.getPopularMovies();           
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SearchMovies(counter: counter),
              ),
            );
          });
        },
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  }
}
