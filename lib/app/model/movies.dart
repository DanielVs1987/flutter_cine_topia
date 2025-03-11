import 'dart:convert';
import 'package:flutter_cine_topia/app/helpers/consts.dart';


class Movies {
  final int id;
  final String title;
  final String imageUrl;
  final String reliaseDate;
  final String overview;

  Movies({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.reliaseDate,
    required this.overview,
  });

  String getPosterImage () {
    return imageUrlPrefix + imageUrl;
  }


  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'title': title,
      'imageUrl': imageUrl,
      'reliaseDate': reliaseDate,
      'overview': overview,
    };
  }

  factory Movies.fromMap(Map<String, dynamic> map) {
    return Movies(
      id: map['id'] as int,
      title: map['title'] as String,
      imageUrl: map['poster_path'] as String,
      reliaseDate: map['release_date'] as String,
      overview: map['overview'] as String,
    );
  }

  String toJson() => json.encode(toMap());

  factory Movies.fromJson(String source) => Movies.fromMap(json.decode(source) as Map<String, dynamic>);
}
