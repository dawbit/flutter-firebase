import 'dart:async';

import 'package:rxdart/rxdart.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/foundation.dart';
import 'package:flutterfirebase/firebase/FirebaseAuthManager.dart';
import 'package:flutterfirebase/firebase/FirebaseDatabaseManager.dart';
import 'package:flutterfirebase/models/library.dart';

class DbBloc extends BlocBase {
  String userUid = "user";
  final dataBaseManager = FBDataBaseManager();

  BehaviorSubject<bool> _changesInDbItem = BehaviorSubject();
  Stream<bool> get changesInDbObservable => _changesInDbItem.stream;

  BehaviorSubject<Library> _deletedMovie = BehaviorSubject();
  Stream<Library> get deletedMovieIdObservable => _deletedMovie.stream;

  BehaviorSubject<Library> _deletedGame = BehaviorSubject();
  Stream<Library> get deletedGameIdObservable => _deletedGame.stream;

  BehaviorSubject<Library> _deletedBook = BehaviorSubject();
  Stream<Library> get deletedBookIdObservable => _deletedBook.stream;

  Stream<Library> get onMovieChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onMovieAdded => dataBaseManager.onMovieAdded();

  Stream<Library> get onGameChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onGameCAdded => dataBaseManager.onGameAdded();

  Stream<Library> get onBookChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onBookAdded => dataBaseManager.onBookAdded();

  Future addItemToFireBaseDatabase(Library library) async {
    dataBaseManager.saveDataToDatabase(userUid, library);
    _changesInDbItem.add(true);
    _changesInDbItem.add(false);
  }

  Future removeItemFromFireBaseDatabase(Library library) async {
    if(library.game!=null){
      _deletedGame.add(library);
    }
    else if(library.movie!=null){
      _deletedMovie.add(library);
    }
    else if(library.book!=null){
      _deletedBook.add(library);
    }

    dataBaseManager.removeItem(userUid, library);
    _changesInDbItem.add(true);
    _changesInDbItem.add(false);
  }
}

enum RecordType{
  BOOKADD, BOOKEDIT ,GAMEADD, GAMEEDIT
}
