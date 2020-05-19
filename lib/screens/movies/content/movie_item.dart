import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/widgets/add_to_db.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/models/movie.dart';
import 'package:flutterfirebase/models/movie_api.dart';
import 'package:flutterfirebase/blocs/omdb_bloc.dart';


class MovieItem extends StatefulWidget {
  bool isSearch = false;
  Library movie;
  MovieItem.Search({this.isSearch, this.movieApi}){
      movie = Library(movie: Movie(year: movieApi.year,title: movieApi.title, read: false, id: movieApi.id));
  }
  MovieItem(this.movie);
  MovieApi movieApi;

  @override
  _MovieItemState createState() => _MovieItemState();
}

class _MovieItemState extends State<MovieItem> {
  Library movie;
  DbBloc _dbBloc;
  OmdbBloc _omdbBloc;

  @override
  void initState() {
    _dbBloc = BlocProvider.getBloc();
    movie = widget.movie;
    _omdbBloc = BlocProvider.getBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.blueAccent),
        ),
        child: ListTile(
          leading: Icon(Icons.movie , size: 50,),
          title: Text("Tytuł: ${movie.movie.title}", style: TextStyle(fontSize: 20,),),
          subtitle: Text("Autor: ${movie.movie.author} \nRok wydania: ${movie.movie.year}"),
          trailing: InkWell(
              onTap: widget.isSearch ?
                  (){ Navigator.of(context).push(MaterialPageRoute(
                    builder: (context) => AddToDb(RecordType.MOVIEEDIT, library: movie,), ));
                      //_dbBloc.addItemToFireBaseDatabase(movie);
                  } : (){Navigator.of(context).push(MaterialPageRoute(
                      builder: (context) => AddToDb(RecordType.MOVIEEDIT, library: movie,), ));
                      },
              child: widget.isSearch ? Icon(Icons.add) : Icon(Icons.edit)
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
