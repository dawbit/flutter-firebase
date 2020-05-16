// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'game.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Game _$GameFromJson(Map<String, dynamic> json) {
  return Game(
    title: json['title'] as String,
    year: json['year'] as String,
    genre: json['genre'] as String,
    studio: json['studio'] as String,
    played: json['played'] as bool,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$GameToJson(Game instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'genre': instance.genre,
      'studio': instance.studio,
      'played': instance.played,
      'id': instance.id,
    };
