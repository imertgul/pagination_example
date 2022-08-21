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
    //get movie details as wanted
    getMovieDetail();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.movieResult.title),
      ),
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(
            image: isLoading || movie.backdropPath == null
                ? null
                : DecorationImage(
                    fit: BoxFit.fitHeight,
                    opacity: 0.1,
                    image: NetworkImage(
                        'https://image.tmdb.org/t/p/w500/${movie.backdropPath}'))),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisSize: MainAxisSize.min,
          children: [
            SizedBox(
              width: MediaQuery.of(context).size.width / 2,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: _buildPosterImage(),
              ),
            ),
            isLoading
                ? const Center(child: CircularProgressIndicator())
                : SizedBox(
                    width: MediaQuery.of(context).size.width / 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        children: [
                          Text(movie.overview),
                          Text(movie.genres.map((e) => e.name).toString()),
                        ],
                      ),
                    ),
                  ),
          ],
        ),
      ),
    );
  }

  Container _buildPosterImage() {
    return Container(
      height: 260,
      decoration: BoxDecoration(
        border: Border.all(),
      ),
      child: Stack(
        alignment: Alignment.center,
        children: [
          widget.movieResult.posterPath != null
              ? Image.network(
                  fit: BoxFit.fitWidth,
                  'https://image.tmdb.org/t/p/w500/${widget.movieResult.posterPath}')
              : const Center(child: Text('No image')),
          if (widget.movieResult.voteAverage != null)
            Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Container(
                  decoration:
                      BoxDecoration(color: Colors.white, border: Border.all()),
                  child: Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(widget.movieResult.voteAverage.toString()),
                  ),
                ),
              ),
            )
        ],
      ),
    );
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
}
