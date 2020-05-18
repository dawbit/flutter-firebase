import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/games/content/game_item.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';

class GamesContent extends StatefulWidget {
  @override
  _GamesContentState createState() => _GamesContentState();
}

class _GamesContentState extends State<GamesContent> {

  List<Library> listOfGames = [];
  DbBloc _dbBloc;

  @override
  void initState() {
    _dbBloc = BlocProvider.getBloc();
    _dbBloc.deletedGameIdObservable.listen(onDeleteItem);
    _dbBloc.onGameCAdded.listen(onGameAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView.builder(
              itemCount: listOfGames.length,
              itemBuilder: (_, position) { return Dismissible(
                  direction: DismissDirection.startToEnd,
                  key: ObjectKey(listOfGames[position]),
                  onDismissed: (direction){
                    _dbBloc.removeItemFromFireBaseDatabase(listOfGames[position]);
                    setState(() {
                      listOfGames.removeAt(position);
                    });
                  },
                  child: GameItem(listOfGames[position]));},
            )
        )
    );
  }

  void onGameAdded(Library library){
    setState(() {
      listOfGames.add(library);
    });
  }

  void onDeleteItem(Library library){
    setState(() {
      listOfGames.remove(library);
    });
  }

}
