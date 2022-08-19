import 'package:dh_case/model/movie.dart';
import 'package:dh_case/model/search_response.dart';
import 'package:dh_case/repository/movie_repository.dart';
import 'package:dh_case/util/show_alert_dialog.dart';
import 'package:flutter/material.dart';

class MovieDetailPage extends StatefulWidget {
  final MovieResult movieResult;
  const MovieDetailPage({Key? key, required this.movieResult})
      : super(key: key);

  @override
  State<MovieDetailPage> createState() => _MovieDetailPageState();
}

class _MovieDetailPageState extends State<MovieDetailPage> {
  final repo = MovieRepository();
  late final Movie movie;
  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    getMovieDetail();
  }

  getMovieDetail() async {
    try {
      final resp = await repo.getMovieDetail(widget.movieResult.id);
      setState(() {
        movie = resp;
        isLoading = false;
      });
    } on Exception catch (e) {
      showAlertDialog(context, e.toString(), 'Error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieResult.title),
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : Container(
              width: double.infinity,
              height: double.infinity,
              decoration: BoxDecoration(
                  image: movie.backdropPath == null
                      ? null
                      : DecorationImage(
                          fit: BoxFit.fitHeight,
                          opacity: 0.1,
                          image: NetworkImage(
                              'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'))),
              child: Expanded(
                child: Text(movie.title),
              ),
            ),
    );
  }
}
