import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/movies/content/movie_item.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/api/omdb.dart';
import 'package:flutterfirebase/blocs/omdb_bloc.dart';
import 'package:flutterfirebase/repositories/omdb_repository.dart';


class MoviesContent extends StatefulWidget {
  @override
  _MoviesContentState createState() => _MoviesContentState();
}

class _MoviesContentState extends State<MoviesContent> {
  List<Library> listOfMovies = [];
  DbBloc _dbBloc;
  Key _key;

  @override
  void initState() {
    _dbBloc = BlocProvider.getBloc();
    _dbBloc.deletedMovieIdObservable.listen(onDeletedMovie);
    _dbBloc.onMovieAdded.listen(onMovieAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView.builder(
              itemCount: listOfMovies.length,
              itemBuilder: (_, position) {
                return Dismissible(
                    direction: DismissDirection.startToEnd,
                    key: ObjectKey(listOfMovies[position]),
                    onDismissed: (direction){
                      _dbBloc.removeItemFromFireBaseDatabase(listOfMovies[position]);
                      setState(() {
                        listOfMovies.removeAt(position);
                      });
                    },
                    child: MovieItem(listOfMovies[position]));},
            )
        )
    );
  }

  void onMovieAdded(Library library){
    setState(() {
      listOfMovies.add(library);
    });
  }

  void onDeletedMovie(Library library){
    setState(() {
      listOfMovies.remove(library);
    });
  }

  void _scrollListener(){}

}
