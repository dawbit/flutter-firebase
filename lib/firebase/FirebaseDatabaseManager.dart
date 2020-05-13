//import 'package:firebase_database/firebase_database.dart';
//import 'package:pr0ject2/model/book.dart';
//import 'package:uuid/uuid.dart';
//
//class FBDataBaseManager{
//  final database = FirebaseDatabase.instance;
//  List<Book> tesst;
//  Future addBook(Book book) {
//    final uid = Uuid().v4();
//    book.setUuid(uid);
//    Future ref = database.reference().child("finalfinal").child(uid).set(
//        book.toJson());
//
//
//    database.reference().child("finalfinal").once().then(onValue);
//  }
//
//  void onValue(DataSnapshot snapshot) {
//
//    var testtt = snapshot.value.map((key, value) => MapEntry(key as String, value));
//    Book tester;
//    testtt.forEach((key, values){
//      Map<String,dynamic> asdd = (values as Map).map((key, value) => MapEntry(key as String, value));
//      tester = Book.fromJson(asdd);
//      print(tester.year);
//    });
//
//  }
//}