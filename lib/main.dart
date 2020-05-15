import 'package:flutter/material.dart';
import 'package:flutterfirebase/blocs/account_bloc.dart';
//import 'package:flutterfirebase/screens/api_search/api_search.dart';
import 'package:flutterfirebase/screens/login_register/login_register_layout.dart';
//import 'package:flutterfirebase/screens/main/main_screen.dart';
import 'firebase/FirebaseAuthManager.dart';
import 'package:bloc_pattern/bloc_pattern.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: _blocs,
      dependencies: _dependencies,
      child: MaterialApp(
          title: 'GBM',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
              primaryColor: Colors.pink[900],
              accentColor: Colors.pink[500],
              brightness: Brightness.dark
          ),
          home: LoginRegisterScreen()
      ),
    );
  }

  List<Bloc> get _blocs => [
    Bloc((_) => AccountBloc()),
  ];

  List<Dependency> get _dependencies =>[
    Dependency((_) => FirebaseAuthManager())
  ];
}
