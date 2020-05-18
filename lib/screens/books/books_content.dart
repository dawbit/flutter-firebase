import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/models/library.dart';
import 'package:flutterfirebase/screens/books/content/book_item.dart';

class BooksContent extends StatefulWidget {
  @override
  _BooksContentState createState() => _BooksContentState();
}

class _BooksContentState extends State<BooksContent> {
  List<Library> listOfBooks = [];
  DbBloc _dbBloc;

  @override
  void initState() {
    _dbBloc = BlocProvider.getBloc();
    _dbBloc.deletedBookIdObservable.listen(onBookDeleted);
    _dbBloc.onBookAdded.listen(onBookAdded);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
        child: SafeArea(
            child: ListView.builder(
              itemCount: listOfBooks.length,
              itemBuilder: (_, position) { return Dismissible(
                  direction: DismissDirection.startToEnd,
                  key: ObjectKey(listOfBooks[position]),
                  onDismissed: (direction){
                    _dbBloc.removeItemFromFireBaseDatabase(listOfBooks[position]);
                    setState(() {
                      listOfBooks.removeAt(position);
                    });
                  },
                  child: BookItem(listOfBooks[position]));},
            )
        )
    );
  }

  void onBookAdded(Library library){
    setState(() {
      listOfBooks.add(library);
    });
  }

  void onBookDeleted(Library library){
    setState(() {
      listOfBooks.remove(library);
    });
  }
}
