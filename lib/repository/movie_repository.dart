import 'package:mert/decoder_extensions.dart';
import 'package:mert/request_helper.dart';

class MovieRepository extends Mert {
  final String apiKey;
  MovieRepository({this.apiKey = '35ef0461fc4557cf1d256d3335ed7545'})
      : super(base: 'developers.themoviedb.org/3');

  Future<Map<String, dynamic>> getMovieDetail(String movieId) async {
    final resp =
        await request(RequestType.GET, '/movie/$movieId', queryParameters: {
      'api_key': apiKey,
    });
    final decoded = resp.decodeMap();
    return decoded;
  }

  Future<Map<String, dynamic>> searchMovie(String query, int? page) async {
    Map<String, dynamic> queries = {
      'query': query,
      'api_key': apiKey,
    };
    if (page != null) {
      queries.addAll({'page': page});
    }
    final resp = await request(RequestType.GET, '/search/movie',
        queryParameters: queries);
    final decoded = resp.decodeMap();
    return decoded;
  }
}
