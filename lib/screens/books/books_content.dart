import 'package:flutter/material.dart';
import 'package:flutterfirebase/screens/books/content/book_item.dart';

class BooksContent extends StatefulWidget {
  @override
  _BooksContentState createState() => _BooksContentState();
}

class _BooksContentState extends State<BooksContent> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: SafeArea(
        child: ListView(
          children: <Widget>[
            BookItem()
          ],
          ),
      )
    );
  }
}
