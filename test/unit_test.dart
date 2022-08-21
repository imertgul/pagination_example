import 'package:dh_case/repository/movie_repository.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test('Movie repository tester', () async {
    final repo = MovieRepository();
    //Search 'Fight Club' from search movie endpoint. 
    final resp = await repo.searchMovie('fight club');
    final first = resp.results.first;
    //Cross check for release date.
    expect(first.releaseDate, '1999-10-15');
    final figthClub = await repo.getMovieDetail(first.id);
    //Cross check for imdb id.
    expect(figthClub.imdbId, 'tt0137523');
  });
}
