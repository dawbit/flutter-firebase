import 'dart:async';

import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:flutterfirebase/blocs/account_bloc.dart';
import 'package:flutterfirebase/blocs/db_bloc.dart';
import 'package:flutterfirebase/screens/login_register/login/login_content.dart';
import 'package:flutterfirebase/screens/login_register/register/register_content.dart';
import 'package:flutterfirebase/screens/main/main_content.dart';
import 'package:progress_dialog/progress_dialog.dart';


class LoginRegisterScreen extends StatefulWidget{
@override
  State<StatefulWidget> createState() {
    return LoginRegisterScreenState();
  }
}


class LoginRegisterScreenState extends State<LoginRegisterScreen> with SingleTickerProviderStateMixin{
  ProgressDialog progressDialog;
  AccountBloc _accountBloc;
  StreamSubscription _registerSubscription;
  StreamSubscription _toastMessage;
  StreamSubscription _currentUser;
  TabController _tabController;
  DbBloc _dbBloc;

  @override
  void initState() {
    super.initState();
    _tabController = TabController(vsync: this, length: 2, initialIndex: 0);
    _accountBloc = BlocProvider.getBloc();
    _registerSubscription = _accountBloc.loadingLoginRegister.listen(loadingScreen);
    _toastMessage = _accountBloc.messageObservable.listen(showtoast);
    _currentUser = _accountBloc.currentUser.listen(changeViewIfLoggedIn);
  }

  @override
  void dispose() {
    super.dispose();
    _registerSubscription.cancel();
    _toastMessage.cancel();
  }

  @override
  Widget build(BuildContext context) {
    progressDialog = ProgressDialog(context, type: ProgressDialogType.Normal);
    progressDialog.style(
      message: "Ładowanie..."
    );

    return Scaffold(
      body: SingleChildScrollView(
        child: Container(
          height: MediaQuery.of(context).size.height,
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Expanded(
                flex: 0,
                child: SizedBox(
                  height: 70,
                ),
              ),
              Expanded(
                flex: 0,
                child: Padding(
                    padding: EdgeInsets.only(left: 20, right: 20, top: 20),
                    child: Image(
                      image: AssetImage('images/cooltext.png'),
                    )
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(left: 30, right: 30),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: <Widget>[
                      Expanded(
                        flex: 0,
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: TabBar(
                                controller: _tabController,
                                tabs: <Widget>[
                                  Tab(
                                    text: "Zaloguj",
                                  ),
                                  Tab(
                                    text: "Zarejestruj",
                                  ),
                                ],
                              ),
                              flex: 3,
                            ),
                            Expanded(
                              flex: 2,
                              child: Container(
                                width: 80,
                                height: 50,
                              ),
                            )
                          ],
                        ),
                      ),

                      Expanded( flex:0 ,child: SizedBox(height: 30,)),
                      Expanded(
                        flex: 1,
                        child: TabBarView(
                          physics: NeverScrollableScrollPhysics(),
                          controller: _tabController,
                          children: <Widget>[
                            LoginContent(),
                            RegisterContent(),
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }

  void changeViewIfLoggedIn(FirebaseUser user){
    if (user.uid != null){
      Navigator.of(context).pushReplacement(MaterialPageRoute(
          builder: (context) => MainScreen(),
      ));
      _dbBloc.userUid = user.uid;
    }
  }

  void loadingScreen(bool b){
    if(b) progressDialog.show();
    else progressDialog.hide();
  }

  void showtoast(String message){
    Fluttertoast.showToast(
        msg: message,
        gravity: ToastGravity.BOTTOM,
        toastLength: Toast.LENGTH_LONG,
    );
  }

}