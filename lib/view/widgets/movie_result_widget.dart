import 'package:dh_case/model/search_response.dart';
import 'package:flutter/material.dart';

class MovieResultWidget extends StatelessWidget {
  const MovieResultWidget({Key? key, required this.movie}) : super(key: key);
  final MovieResult movie;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          image: DecorationImage(
              image: NetworkImage(
                  'https://image.tmdb.org/t/p/w500/${movie.posterPath ?? movie.backdropPath}'))),
      child: Text(movie.title),
    );
  }
}
