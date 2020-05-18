// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'movie_api_search.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

SearchMovies _$SearchMoviesFromJson(Map<String, dynamic> json) {
  return SearchMovies(
    results: (json['Search'] as List)
        ?.map((e) =>
            e == null ? null : MovieApi.fromJson(e as Map<String, dynamic>))
        ?.toList(),
  );
}

Map<String, dynamic> _$SearchMoviesToJson(SearchMovies instance) =>
    <String, dynamic>{
      'Search': instance.results,
    };
