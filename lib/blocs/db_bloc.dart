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

  Stream<Library> get onMovieChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onMovieAdded => dataBaseManager.onMovieAdded();

  Stream<Library> get onGameChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onGameCAdded => dataBaseManager.onGameAdded();

  Stream<Library> get onBookChanged => dataBaseManager.catchMovieUpdate();
  Stream<Library> get onBookAdded => dataBaseManager.onBookAdded();

  Future addItemToFireBaseDatabase(Library library) async {
    dataBaseManager.saveDataToDatabase(userUid, library);
  }
  Future removeItemFromFireBaseDatabase(Library library) async {
    dataBaseManager.removeItem(userUid, library);
  }
}
