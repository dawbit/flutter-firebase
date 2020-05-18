import 'package:json_annotation/json_annotation.dart';
import 'package:flutterfirebase/models/movie_api.dart';

part 'movie_api_search.g.dart';

@JsonSerializable()
class SearchMovies{
  @JsonKey(name: "Search")
  List<MovieApi> results;

  SearchMovies({this.results});

  factory SearchMovies.fromJson(Map<String, dynamic> json) => _$SearchMoviesFromJson(json);
  Map<String, dynamic> get json => _$SearchMoviesToJson(this);

}
