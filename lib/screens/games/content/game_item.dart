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
          color: Colors.orangeAccent,
          borderRadius: BorderRadius.circular(10),
          border: Border.all(width: 1, color: Colors.orangeAccent)
        ),
        child: ListTile(
          leading: Icon(Icons.videogame_asset , size: 50,),
          title: Text("${game.game.title}", style: TextStyle(fontSize: 24,),),
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
