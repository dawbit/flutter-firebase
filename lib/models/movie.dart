import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'movie.g.dart';

@JsonSerializable(explicitToJson: true)
class Movie{
  String title;
  String year;
  String genre;
  String author;
  bool read;
  String id;

  Movie({this.title, this.year, this.genre, this.author, this.read});

  void setUuid(String uuid){
    this.id = uuid;
  }

  factory Movie.fromJson(Map<String, dynamic> json) => _$MovieFromJson(json);
  Map<String, dynamic> toJson() => _$MovieToJson(this);

}