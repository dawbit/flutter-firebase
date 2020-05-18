import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutterfirebase/models/movie_api_search.dart';
import 'package:flutterfirebase/models/movie_details.dart';
import 'package:flutterfirebase/repositories/omdb_repository.dart';
import 'package:rxdart/rxdart.dart';

class OmdbBloc extends BlocBase{
  OmdbRepository _omdbRepository;

  PublishSubject<String> _searchSubject = PublishSubject();
  Stream<SearchMovies> searchStream;
  PublishSubject<MovieDetails> _searchTitle = PublishSubject();
  Stream<MovieDetails> get movieStream => _searchTitle.stream;


  OmdbBloc(this._omdbRepository){
    searchStream = _searchSubject
        .debounceTime(Duration(seconds: 1))
        .switchMap((query) => query != ''
        ? _omdbRepository.fetchResults(query).asStream()
        : Stream.fromIterable({SearchMovies(results: [])})
    );
  }

  Function(String title) get fetchResults => _searchSubject.add;

  void getTitle(String id){
    _omdbRepository.getTitle(id).then(_searchTitle.add).catchError(_searchTitle.addError);
  }

  @override
  void dispose() {
    _searchSubject.close();
    super.dispose();
  }

}
