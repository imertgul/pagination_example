///
/// Code generated by jsonToDartModel https://ashamp.github.io/jsonToDartModel/
///
class MovieResult {
/*
{
  "poster_path": "/cezWGskPY5x7GaglTTRN4Fugfb8.jpg",
  "adult": false,
  "overview": "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!",
  "release_date": "2012-04-25",
  "genre_ids": [
    878
  ],
  "id": 24428,
  "original_title": "The Avengers",
  "original_language": "en",
  "title": "The Avengers",
  "backdrop_path": "/hbn46fQaRmlpBuUrEiFqv0GDL6Y.jpg",
  "popularity": 7.353212,
  "vote_count": 8503,
  "video": false,
  "vote_average": 7.33
} 
*/

  String posterPath;
  bool adult;
  String overview;
  String releaseDate;
  List<dynamic> genreIds;
  int id;
  String originalTitle;
  String originalLanguage;
  String title;
  String backdropPath;
  double popularity;
  int voteCount;
  bool video;
  double voteAverage;
  Map<String, dynamic> __origJson = {};

  MovieResult({
    required this.posterPath,
    required this.adult,
    required this.overview,
    required this.releaseDate,
    required this.genreIds,
    required this.id,
    required this.originalTitle,
    required this.originalLanguage,
    required this.title,
    required this.backdropPath,
    required this.popularity,
    required this.voteCount,
    required this.video,
    required this.voteAverage,
  });

  factory MovieResult.fromJson(Map<String, dynamic> json) {
    return MovieResult(
        posterPath: json['poster_path'].toString(),
        adult: json['adult'],
        overview: json['overview'].toString(),
        releaseDate: json['release_date'].toString(),
        genreIds: json['genre_ids'],
        id: json['id'].toInt(),
        originalTitle: json['original_title'].toString(),
        originalLanguage: json['original_language'].toString(),
        title: json['title'].toString(),
        backdropPath: json['backdrop_path'].toString(),
        popularity: json['popularity'].toDouble(),
        voteCount: json['vote_count'].toInt(),
        video: json['video'],
        voteAverage: json['vote_average'].toDouble());
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['poster_path'] = posterPath;
    data['adult'] = adult;
    data['overview'] = overview;
    data['release_date'] = releaseDate;
    if (genreIds != null) {
      final v = genreIds;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v);
      });
      data['genre_ids'] = arr0;
    }
    data['id'] = id;
    data['original_title'] = originalTitle;
    data['original_language'] = originalLanguage;
    data['title'] = title;
    data['backdrop_path'] = backdropPath;
    data['popularity'] = popularity;
    data['vote_count'] = voteCount;
    data['video'] = video;
    data['vote_average'] = voteAverage;
    return data;
  }

  Map<String, dynamic> origJson() => __origJson;
}

class SearchResponse {
/*
{
  "page": 1,
  "results": [
    {
      "poster_path": "/cezWGskPY5x7GaglTTRN4Fugfb8.jpg",
      "adult": false,
      "overview": "When an unexpected enemy emerges and threatens global safety and security, Nick Fury, director of the international peacekeeping agency known as S.H.I.E.L.D., finds himself in need of a team to pull the world back from the brink of disaster. Spanning the globe, a daring recruitment effort begins!",
      "release_date": "2012-04-25",
      "genre_ids": [
        878
      ],
      "id": 24428,
      "original_title": "The Avengers",
      "original_language": "en",
      "title": "The Avengers",
      "backdrop_path": "/hbn46fQaRmlpBuUrEiFqv0GDL6Y.jpg",
      "popularity": 7.353212,
      "vote_count": 8503,
      "video": false,
      "vote_average": 7.33
    }
  ],
  "total_results": 14,
  "total_pages": 1
} 
*/

  int page;
  List<MovieResult> results;
  int totalResults;
  int totalPages;
  Map<String, dynamic> __origJson = {};

  SearchResponse({
    required this.page,
    required this.results,
    required this.totalResults,
    required this.totalPages,
  });
  factory SearchResponse.fromJson(Map<String, dynamic> json) {
    return SearchResponse(
        page: json['page'].toInt(),
        results: (json['results'] as List<dynamic>)
            .map((e) => MovieResult.fromJson(e))
            .toList(),
        totalResults: json['total_results'].toInt(),
        totalPages: json['total_pages'].toInt());
  }
  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['page'] = page;
    if (results != null) {
      final v = results;
      final arr0 = [];
      v.forEach((v) {
        arr0.add(v.toJson());
      });
      data['results'] = arr0;
    }
    data['total_results'] = totalResults;
    data['total_pages'] = totalPages;
    return data;
  }

  Map<String, dynamic> origJson() => __origJson;
}
