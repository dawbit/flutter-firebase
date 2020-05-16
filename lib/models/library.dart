import 'package:flutterfirebase/models/book.dart';
import 'package:flutterfirebase/models/game.dart';
import 'package:flutterfirebase/models/movie.dart';

class Library{
  Game game;
  Movie movie;
  Book book;

  Library({this.book, this.movie, this.game});

  Map<String, dynamic> returnLibrary(){
    if(book!=null){
      return book.toJson();
    }
    else if(movie!=null){
      return movie.toJson();
    }
    else if(game!=null){
      return game.toJson();
    }
  }

  String type(){
    if(book!=null){
      return "Books";
    }
    else if(movie!=null){
      return "Movies";
    }
    else if(game!=null){
      return "Games";
    }
  }

  String getItemId(){
    if(book!=null){
      return book.id;
    }
    else if(movie!=null){
      return movie.id;
    }
    else if(game!=null){
      return game.id;
    }
  }
}
