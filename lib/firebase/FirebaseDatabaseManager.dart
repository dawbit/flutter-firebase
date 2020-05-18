import 'dart:async';

import 'package:uuid/uuid.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:flutterfirebase/models/book.dart';
import 'package:flutterfirebase/models/game.dart';
import 'package:flutterfirebase/models/movie.dart';
import 'package:flutterfirebase/models/library.dart';

class FBDataBaseManager{
  final database = FirebaseDatabase.instance;
  List<Book> tesst;
  Future addBook(Book book) {
    final uid = Uuid().v4();
    book.setUuid(uid);
    Future ref = database.reference().child("finalfinal").child(uid).set(
        book.toJson());


    database.reference().child("finalfinal").once().then(onValue);
  }

  void onValue(DataSnapshot snapshot) {

    var testtt = snapshot.value.map((key, value) => MapEntry(key as String, value));
    Book tester;
    testtt.forEach((key, values){
      Map<String,dynamic> asdd = (values as Map).map((key, value) => MapEntry(key as String, value));
      tester = Book.fromJson(asdd);
    });

  }

  saveDataToDatabase(String uid, Library library) => database
      .reference()
      .child(uid).reference()
      .child(library.type()).reference()
      .child(library.getItemId()).reference()
      .update(library.returnLibrary());

  removeItem(String uid, Library library) => database.reference().child(uid).reference().child(library.type()).child(library.getItemId()).remove();

  Stream <Library> catchMovieUpdate(String uid) => database.reference().child(uid).child("Movies").onChildChanged
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => Library(movie: Movie.fromJson(event)));

  Stream <Library> onMovieAdded(String uid) => database.reference().child(uid).child("Movies").onChildAdded
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => Library(movie: Movie.fromJson(event)));

  Stream <Library> catchGameUpdate(String uid) => database.reference().child(uid).child("Games").onChildChanged
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => Library(game: Game.fromJson(event)));

  Stream <Library> onGameAdded(String uid) => database.reference().child(uid).child("Games").onChildAdded
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => Library(game: Game.fromJson(event)));

  Stream <Library> catchBookUpdate(String uid) => database.reference().child(uid).child("Books").onChildChanged
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => Library(book: Book.fromJson(event)));

  Stream <Library> onBookAdded(String uid) => database.reference().child(uid).child("Books").onChildAdded
      .map((event) => (event.snapshot.value as Map).map((key, value) => MapEntry(key as String, value)))
      .map((event) => Library(book: Book.fromJson(event)));
}
