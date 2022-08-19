import 'package:dh_case/model/movie.dart';
import 'package:dh_case/model/search_response.dart';
import 'package:mert/decoder_extensions.dart';
import 'package:mert/request_helper.dart';

class MovieRepository extends Mert {
  final String apiKey;
  MovieRepository({this.apiKey = '35ef0461fc4557cf1d256d3335ed7545'})
      : super(base: 'api.themoviedb.org');

  Future<Movie> getMovieDetail(int movieId) async {
    final resp =
        await request(RequestType.GET, '/3/movie/$movieId', queryParameters: {
      'api_key': apiKey,
    });
    return Movie.fromJson(resp.decodeMap());
  }

  Future<SearchResponse> searchMovie(String query, {int? page}) async {
    Map<String, dynamic> queries = {
      'api_key': apiKey,
      'query': query,
      if (page != null) 'page': page.toString()
    };
    final resp = await request(RequestType.GET, '/3/search/movie',
        queryParameters: queries);
    return SearchResponse.fromJson(resp.decodeMap());
  }
}
