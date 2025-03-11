import 'package:flutter/material.dart';
import 'package:flutter_cine_topia/app/model/movies.dart';

class MovieDescription extends StatelessWidget {
  final Movies movie;

  const MovieDescription({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        leading: IconButton(
            onPressed: () {
              Navigator.pop(context);
            },
            icon: Icon(Icons.arrow_back)),
      ),
      backgroundColor: Color(0xFF120326),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 54, 16, 0),
          child: Column(
            children: [
              Image.asset(
                "assets/upcoming.png",
                height: 80,
                width: 80,
              ),
              Text(
                movie.title,
                style: TextStyle(fontSize: 24, fontWeight: FontWeight.w700),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.only(top: 32, bottom: 40),
                  child: Container(
                    decoration: BoxDecoration(
                      image: DecorationImage(
                        image: NetworkImage(movie.getPosterImage()),
                        fit: BoxFit.cover,
                      ),
                      borderRadius: BorderRadius.circular(16),
                      color: Colors.black,
                    ),
                    height: 235,
                    width: 176.25,
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Descrição:",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                    textAlign: TextAlign.right,
                  ),
                  SizedBox(
                    height: 16,
                  ),
                  Text(movie.overview),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
