import 'package:dh_case/model/search_response.dart';
import 'package:flutter/material.dart';

class MovieResultWidget extends StatelessWidget {
  const MovieResultWidget({Key? key, required this.movie}) : super(key: key);
  final MovieResult movie;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        // height: 700,
        width: 250,
        child: Column(
          children: [
            Expanded(
                child: Stack(
              children: [
                Container(
                  width: double.infinity,
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  child: movie.posterPath != null
                      ? Image.network(
                          fit: BoxFit.fitWidth,
                          'https://image.tmdb.org/t/p/w500/${movie.posterPath}')
                      : const Center(child: Text('Resim Bulunamadi')),
                ),
                if (movie.voteAverage != null)
                  Align(
                    alignment: Alignment.bottomLeft,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Container(
                        decoration: BoxDecoration(
                            color: Colors.white, border: Border.all()),
                        child: Padding(
                          padding: const EdgeInsets.all(4.0),
                          child: Text(movie.voteAverage.toString()),
                        ),
                      ),
                    ),
                  )
              ],
            )),
            Align(
              alignment: Alignment.bottomLeft,
              child: Container(
                width: double.infinity,
                decoration:
                    BoxDecoration(color: Colors.white, border: Border.all()),
                child: Text(movie.title),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
