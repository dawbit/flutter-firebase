// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Movie _$MovieFromJson(Map<String, dynamic> json) {
  return Movie(
    title: json['title'] as String,
    year: json['year'] as String,
    genre: json['genre'] as String,
    author: json['author'] as String,
    read: json['read'] as bool,
  )..id = json['id'] as String;
}

Map<String, dynamic> _$MovieToJson(Movie instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'genre': instance.genre,
      'author': instance.author,
      'read': instance.read,
      'id': instance.id,
    };
