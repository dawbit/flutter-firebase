import 'package:json_annotation/json_annotation.dart';

part 'movie_details.g.dart';

@JsonSerializable()
class MovieDetails{
  @JsonKey(name: "Title")
  String title;
  @JsonKey(name: "Runtime")
  String runtime;
  @JsonKey(name: "Poster")
  String poster;
  @JsonKey(name: "Genre")
  String genre;
  @JsonKey(name: "Released")
  String released;
  @JsonKey(name: "imdbRating")
  String imdbRate;
  @JsonKey(name: "Actors")
  String actors;
  @JsonKey(name: "imdbVotes")
  String imdbVotes;
  @JsonKey(name: "Director")
  String director;
  @JsonKey(name: "Type")
  String type;
  @JsonKey(name: "Plot")
  String plot;

  MovieDetails({this.title, this.type, this.poster, this.director, this.genre, this.imdbRate, this.imdbVotes, this.plot, this.runtime});

  factory MovieDetails.fromJson(Map<String, dynamic> json) => _$MovieDetailsFromJson(json);

  Map<String, dynamic> get json => _$MovieDetailsToJson(this);

  List<String> actorsList(){
    return actors.split(", ");
  }

}
