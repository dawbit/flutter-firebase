import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/firebase/FirebaseDatabaseManager.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/models/book.dart';
import 'package:flutterfirebase/models/movie.dart';

class TestScr extends StatefulWidget {
  @override
  _TestScrState createState() => _TestScrState();
}

class _TestScrState extends State<TestScr> {

  DbBloc _dbBloc;
  StreamSubscription _registerSubscription;

  @override
  void initState() {
    _dbBloc = BlocProvider.getBloc();
    _registerSubscription = _dbBloc.onMovieAdded.listen(testowyvoid);
//        .loadingLoginRegister.listen(loadingScreen)
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: RaisedButton(
          onPressed: (){

            FBDataBaseManager test = FBDataBaseManager();

            Book book1 = Book( year: "1970", title: "test1", author: "test", read: true, id: "AAA");
            Book book2 = Book( year: "2020", title: "test2", author: "test", read: true, id: "AAB");
            Library lib1 = Library(book: book1);
            Library lib2 = Library(book: book2);
            test.saveDataToDatabase("user", lib1);
            test.saveDataToDatabase("user", lib2);
          },
        ),
      ),
    );
  }

  void testowyvoid(Library lista){
    print(lista.movie.year);
  }

}
