import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/movies/content/movie_item.dart';

class SearchForMovieScreen extends StatefulWidget {
  @override
  _SearchForMovieScreenState createState() => _SearchForMovieScreenState();
}

class _SearchForMovieScreenState extends State<SearchForMovieScreen> {
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
                    itemCount: 7,
                    itemBuilder: (_, position) =>
                        MovieItem.Search(is_Search: true,),
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
