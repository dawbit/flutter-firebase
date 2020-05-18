import 'package:flutterfirebase/models/movie.dart';
import 'package:flutterfirebase/models/movie_api_search.dart';
import 'package:flutterfirebase/models/movie_details.dart';
import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

part 'omdb.g.dart';

@RestApi(baseUrl: 'http://www.omdbapi.com/')
abstract class Omdb{
  factory Omdb(Dio dio, {String baseUrl}) = _Omdb;

  @GET("http://www.omdbapi.com/")
  Future<SearchMovies> getMovieList(@Query("s") String text, {@Query ("apikey") String apiKey = "c358b74"});

  @GET("http://www.omdbapi.com/")
  Future<MovieDetails> getCurrentMovie(@Query("i") String text, {@Query ("apikey") String apiKey = "c358b74"});
}
