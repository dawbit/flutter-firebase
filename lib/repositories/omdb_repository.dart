import 'package:flutterfirebase/api/omdb.dart';
import 'package:flutterfirebase/models/movie_api_search.dart';
import 'package:flutterfirebase/models/movie_details.dart';

class OmdbRepository{
  Omdb _omdb;

  OmdbRepository(this._omdb);

  Future<SearchMovies> fetchResults(String title)  => _omdb.getMovieList(title);
}
