import 'package:flutter/material.dart';
import 'package:flutter_cine_topia/app/model/movies.dart';
import 'package:flutter_cine_topia/ui/screens/movie_description.dart';

class MoviCard extends StatelessWidget {
  final Movies movie;
  const MoviCard({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32),
      child: Row(
        children: [
          Container(
            width: 90,
            height: 120,
            decoration: BoxDecoration(
              color: Color(0xff000000),
              borderRadius: BorderRadius.circular(8),
              image: DecorationImage(
                image: NetworkImage(movie.getPosterImage()),
                fit: BoxFit.cover,
              ),
            ),
            margin: EdgeInsets.only(right: 16),
          ),
          Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(bottom: 6),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDescription(movie: movie),
                      ),
                    );
                  },
                  child: Text(
                    movie.title,
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              Text(
                "Lançamento: ${movie.reliaseDate}",
                style: TextStyle(
                  color: Color(0xffa5a5a5),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
