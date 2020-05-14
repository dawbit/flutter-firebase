import 'package:firebase_database/firebase_database.dart';
import 'package:json_annotation/json_annotation.dart';

part 'game.g.dart';

@JsonSerializable(explicitToJson: true)
class Game{
  String title;
  String year;
  String genre;
  String studio;
  bool played;
  String id;

  Game({this.title, this.year, this.genre, this.studio, this.played});

  void setUuid(String uuid){
    this.id = uuid;
  }

  factory Game.fromJson(Map<String, dynamic> json) => _$GameFromJson(json);
  Map<String, dynamic> toJson() => _$GameToJson(this);

}