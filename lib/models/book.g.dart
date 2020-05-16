// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Book _$BookFromJson(Map<String, dynamic> json) {
  return Book(
    title: json['title'] as String,
    year: json['year'] as String,
    genre: json['genre'] as String,
    author: json['author'] as String,
    read: json['read'] as bool,
    id: json['id'] as String,
  );
}

Map<String, dynamic> _$BookToJson(Book instance) => <String, dynamic>{
      'title': instance.title,
      'year': instance.year,
      'genre': instance.genre,
      'author': instance.author,
      'read': instance.read,
      'id': instance.id,
    };
