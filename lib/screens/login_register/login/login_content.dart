import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/blocs/account_bloc.dart';

typedef void OnClick();

class LoginContent extends StatefulWidget {

  final OnClick onPress;

  LoginContent({this.onPress});

  @override
  _LoginContentState createState() => _LoginContentState();
}

class _LoginContentState extends State<LoginContent> {

  final _formKey = GlobalKey<FormState>();
  String email;
  String password;
  AccountBloc _accountBloc;

  @override
  void initState() {
    _accountBloc = BlocProvider.getBloc();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Form(
        key: _formKey,
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: <Widget>[
            TextFormField(
              onChanged: (text) {email=text;},
              style: TextStyle(fontSize: 17 ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Email:",
              ),
            ),

            SizedBox(height: 20,),
            TextFormField(
              obscureText: true,
              style: TextStyle(fontSize: 17 ),
              onChanged: (text) {password=text;},
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Hasło:",
              ),
            ),
            SizedBox(height: 60,),
            InkWell(
              onTap: () {loginUser();},
              child: Container(
                height: 50,
                child: Center(child:
                Text("Zaloguj", style: TextStyle(color: Colors.white),)),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  color: Colors.indigoAccent[200],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  void loginUser(){
    _accountBloc.loginUser(email.trim(), password.trim());
  }
}
