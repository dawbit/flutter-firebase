import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/movies/content/movie_item.dart';
import 'package:flutterfirebase/blocs/omdb_bloc.dart';
import 'package:flutterfirebase/models/movie_api_search.dart';


class SearchForMovieScreen extends StatefulWidget {
  @override
  _SearchForMovieScreenState createState() => _SearchForMovieScreenState();
}

class _SearchForMovieScreenState extends State<SearchForMovieScreen> {
  OmdbBloc _omdbBloc;
  StreamSubscription searchSubscription;
  SearchMovies listOfMovies;
  TextEditingController searchController;

  @override
  void initState() {
    _omdbBloc = BlocProvider.getBloc();
    listOfMovies = SearchMovies(results: []);
    searchSubscription = _omdbBloc.searchStream.listen(onSearchResult);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Theme(
        data: Theme.of(context).copyWith(accentColor: Colors.blueAccent),
        child: Container(
          child: SafeArea(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Expanded(
                  flex: 0,
                  child: Form(
                    child: Row(
                      children: [
                        Expanded(
                          child: Padding(
                            padding: EdgeInsets.only(left: 10.0),
                            child: TextFormField(
                              controller: searchController,
                              onChanged: (text)  => {_omdbBloc.fetchResults(text)},
                              decoration: InputDecoration(
                                hintText: 'Szukaj filmu...',
                              ),
                            ),
                          ),
                        ),
                        IconButton(
                          icon: Icon(Icons.search),
                          onPressed: () {
                          },
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  flex: 1,
                  child: ListView.builder(
                    itemCount: listOfMovies.results?.length ?? 0  ,
                    itemBuilder: (_, position) => MovieItem.Search(isSearch: true, movieApi: listOfMovies.results[position], ),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  void onSearchResult(SearchMovies list){
    setState(() {
      listOfMovies = list;
    });
  }

}
