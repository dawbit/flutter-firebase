import 'package:json_annotation/json_annotation.dart';

part 'movie_api.g.dart';

@JsonSerializable()
class MovieApi{
  @JsonKey(name: "imdbID")
  String id;
  @JsonKey(name: "Title")
  String title;
  @JsonKey(name: "Poster")
  String poster;
  @JsonKey(name: "Year")
  String year;
  @JsonKey(name: "Type")
  String type;

  MovieApi({this.id, this.type, this.year, this.title, this.poster});

  factory MovieApi.fromJson(Map<String, dynamic> json) => _$MovieApiFromJson(json);

  Map<String, dynamic> get json => _$MovieApiToJson(this);

}
