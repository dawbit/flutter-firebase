// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'omdb.dart';

// **************************************************************************
// RetrofitGenerator
// **************************************************************************

class _Omdb implements Omdb {
  _Omdb(this._dio, {this.baseUrl}) {
    ArgumentError.checkNotNull(_dio, '_dio');
    this.baseUrl ??= 'http://www.omdbapi.com/';
  }

  final Dio _dio;

  String baseUrl;

  @override
  getMovieList(text, {apiKey = "c358b74"}) async {
    ArgumentError.checkNotNull(text, 'text');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r's': text, r'apikey': apiKey};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'http://www.omdbapi.com/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = SearchMovies.fromJson(_result.data);
    return Future.value(value);
  }

  @override
  getCurrentMovie(text, {apiKey = "c358b74"}) async {
    ArgumentError.checkNotNull(text, 'text');
    const _extra = <String, dynamic>{};
    final queryParameters = <String, dynamic>{r't': text, r'apikey': apiKey};
    queryParameters.removeWhere((k, v) => v == null);
    final _data = <String, dynamic>{};
    final Response<Map<String, dynamic>> _result = await _dio.request(
        'http://www.omdbapi.com/',
        queryParameters: queryParameters,
        options: RequestOptions(
            method: 'GET',
            headers: <String, dynamic>{},
            extra: _extra,
            baseUrl: baseUrl),
        data: _data);
    final value = Movie.fromJson(_result.data);
    return Future.value(value);
  }
}
