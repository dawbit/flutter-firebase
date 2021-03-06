import 'package:flutter/material.dart';
import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:dio/dio.dart';

import 'package:flutterfirebase/blocs/account_bloc.dart';
import 'package:flutterfirebase/screens/login_register/login_register_layout.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/firebase/FirebaseAuthManager.dart';
import 'package:flutterfirebase/blocs/omdb_bloc.dart';
import 'package:flutterfirebase/repositories/omdb_repository.dart';
import 'package:flutterfirebase/api/omdb.dart';

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
              primaryColor: Colors.indigo[500],
              accentColor: Colors.indigo[400],
              brightness: Brightness.dark
          ),
          home: LoginRegisterScreen()
      ),
    );
  }

  List<Bloc> get _blocs => [
    Bloc((_) => AccountBloc()),
    Bloc((_) => DbBloc()),
    Bloc((i) => OmdbBloc(i.get())),
  ];

  List<Dependency> get _dependencies =>[
    Dependency((_) => FirebaseAuthManager()),
    Dependency((_) => Dio()),
    Dependency((i) => Omdb(i.get())),
    Dependency((i) => OmdbRepository(i.get())),
  ];
}
