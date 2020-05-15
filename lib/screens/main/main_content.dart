import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/api_search/api_search.dart';
import 'package:flutterfirebase/screens/books/books_screen.dart';
import 'package:flutterfirebase/screens/games/games_screen.dart';
import 'package:flutterfirebase/screens/movies/movies_screen.dart';
import 'package:flutterfirebase/widgets/add_to_db.dart';

class MainScreen extends StatefulWidget {
  @override
  _MainScreenState createState() => _MainScreenState();
}

class _MainScreenState extends State<MainScreen> with SingleTickerProviderStateMixin {

  TabController _tabController;

  List<Widget> _widgetOptions = <Widget>[
    GamesScreen(),
    MoviesScreen(),
    BooksScreen(),
  ];

  @override
  void initState() {
    _tabController = TabController(length: 3, vsync: this, initialIndex: 0);
    _tabController.addListener(_handleTabIndex);
    super.initState();
  }

  void _handleTabIndex(){
    setState(() {
    });
  }

  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        floatingActionButton: _bottomButtons(),
        body: TabBarView(
          controller: _tabController,
          children: <Widget>[
            MoviesScreen(),
            GamesScreen(),
            BooksScreen(),
          ],
        ),
        bottomNavigationBar: TabBar(
          indicatorColor: _indicatorColor(),
          controller: _tabController,
          tabs: <Widget>[
            Tab(
              icon: Icon(Icons.movie),
              text: "Filmy",
            ),
            Tab(
              icon: Icon(Icons.videogame_asset),
              text: "Gry",
            ),
            Tab(
              icon: Icon(Icons.book),
              text: "Książki",
            )
          ],
        ),
      ),

    );
  }

  Color _indicatorColor(){
    if(_tabController.index==0){
      return Colors.blueAccent;
    }
    else if (_tabController.index==1 ){
      return Colors.orangeAccent;
    }
    else if( _tabController.index==2){
      return Colors.greenAccent;
    }
  }

  Widget _bottomButtons(){
    if(_tabController.index==0){
      return
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => SearchForMovieScreen(), ));},
          backgroundColor: Colors.blueAccent,
          child: Icon(Icons.add, size: 20,),
        );
    }
    else if(_tabController.index==1){
      return
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddToDb(appBarTitle: "Dodaj Grę", appBarColor: Colors.orangeAccent, authorOrProducer: "Producent",), ));},
          backgroundColor: Colors.orangeAccent,
          child: Icon(Icons.add, size: 20,),
        );
    }
    else if(_tabController.index==2){
      return
        FloatingActionButton(
          shape: StadiumBorder(),
          onPressed: (){Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => AddToDb(appBarTitle: "Dodaj Książkę" , appBarColor: Colors.greenAccent, authorOrProducer: "Autor",), ));},
          backgroundColor: Colors.greenAccent,
          child: Icon(Icons.add, size: 20,),
        );
    }


  }
}
