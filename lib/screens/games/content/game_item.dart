import 'package:flutter/material.dart';
import 'package:flutterfirebase/widgets/add_to_db.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';

class GameItem extends StatefulWidget {
  Library game;
  GameItem(this.game);

  @override
  _GameItemState createState() => _GameItemState();
}

class _GameItemState extends State<GameItem> {
  Library game;

  @override
  void initState() {
    game = widget.game;
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
          border: Border.all(width: 1, color: Colors.orangeAccent),
          boxShadow: [
            BoxShadow(
              color: Colors.orangeAccent[100],
              spreadRadius: 0,
              blurRadius: 4,
              offset: Offset(0, 3), // changes position of shadow
            ),
          ],
        ),
        child: ListTile(
          leading: Icon(Icons.videogame_asset , size: 50,),
          title: Text("Tytuł: ${game.game.title}", style: TextStyle(fontSize: 20,),),
          subtitle: Text("Producent: ${game.game.studio} \nRok wydania: ${game.game.year}"),
          trailing: InkWell(
            onTap: (){Navigator.of(context).push(MaterialPageRoute(
              builder: (context) => AddToDb(RecordType.GAMEEDIT, library: game,), ));},
              child: Icon(Icons.edit)),
          isThreeLine: true,
        ),
      ),
    );
  }
}
