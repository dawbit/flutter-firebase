import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/games/content/game_item.dart';

class GamesContent extends StatefulWidget {
  @override
  _GamesContentState createState() => _GamesContentState();
}

class _GamesContentState extends State<GamesContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
          child: ListView(
            children: <Widget>[
              GameItem()
            ],
          ),
        )
    );
  }
}
