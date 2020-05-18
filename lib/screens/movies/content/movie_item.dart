import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/widgets/add_to_db.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/models/movie.dart';
import 'package:flutterfirebase/models/movie_api.dart';


class MovieItem extends StatefulWidget {
  bool isSearch = false;
  Library movie;
  MovieItem.Search({this.isSearch, this.movieApi}){
    movie = Library(movie: Movie(year: movieApi.year,title: movieApi.title,id: movieApi.id));
  }
  MovieItem(this.movie);
  MovieApi movieApi;

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  Library movie;
  DbBloc _dbBloc;

  @override
  void initState() {
    _dbBloc = BlocProvider.getBloc();
    movie = widget.movie;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Color(0xff2e2e2e),
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blueAccent),
          boxShadow: [
            BoxShadow(
              color: Colors.blueAccent[100],
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.movie , size: 50,),
          title: Text("Tytuł: ${movie.movie.title}", style: TextStyle(fontSize: 20,),),
          subtitle: Text("Autor: ${movie.movie.author} \nRok wydania: ${movie.movie.year}"),
          trailing: InkWell(
              onTap: widget.isSearch ?
                  (){
                    _dbBloc.addItemToFireBaseDatabase(movie);
                  } : (){
                DeleteMovie();
              },
              child: widget.isSearch ? Icon(Icons.add) : Icon(Icons.delete)
          ),
          isThreeLine: true,
        ),
      ),
    );
  }

  void DeleteMovie(){
    _dbBloc.removeItemFromFireBaseDatabase(movie);
  }

}
