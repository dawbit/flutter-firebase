import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:flutterfirebase/blocs/account_bloc.dart';

typedef void OnClick();

class RegisterContent extends StatefulWidget {

  final OnClick onPress;

  RegisterContent({this.onPress});
  @override
  _RegisterContentState createState() => _RegisterContentState();
}

class _RegisterContentState extends State<RegisterContent> {

  AccountBloc _accountBloc;
  final _passwordController = TextEditingController();

  String email;
  String password;
  String confirmPassword;

  @override
  void initState() {
    super.initState();
    _accountBloc = BlocProvider.getBloc();
  }

  @override
  void dispose() {
    _accountBloc.dispose();
    super.dispose();
  }
  final _emailFormKey = GlobalKey<FormState>();
  final _passwordFormKey = GlobalKey<FormState>();
  final _confirmPasswordFormKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Form(
            key: _emailFormKey,
            child: TextFormField(
              validator: (text) {if(text.isNotEmpty) {
                if(emailValidator(email))
                  {return "Błędny email";}
                else{
                  return null;
                }
              }
                  return null;},
              onChanged: (text)  {
                email=text;
                _emailFormKey.currentState.validate();},
              style: TextStyle(fontSize: 17 ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Email:",
              ),
            ),
          ),

          SizedBox(height: 20,),
          Form(
            key: _passwordFormKey,
            child: TextFormField(
              controller: _passwordController,
              validator: (text) {if(text.length<8) {return "Za krótkie hasło. Minimum 6 znaków";} return null;},
              onChanged: (text)  {
                _passwordFormKey.currentState.validate();
                password = text;
              },
              style: TextStyle(fontSize: 17 ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Hasło:",
              ),
            ),
          ),
          SizedBox(height: 20,),
          Form(
            key: _confirmPasswordFormKey,
            child: TextFormField(
              validator: (text) {if(confirmPassword!= password && confirmPassword.isNotEmpty) {
                return "Hasła nie są identyczne";
              } return null;},
              onChanged: (text)  {
                confirmPassword = text;
                _confirmPasswordFormKey.currentState.validate();},
              style: TextStyle(fontSize: 17 ),
              decoration: InputDecoration(
                contentPadding: EdgeInsets.zero,
                labelText: "Powtórz hasło:",
              ),
            ),
          ),
          SizedBox(height: 60,),
          InkWell(
            onTap: () {registerAction();},
            child: Container(
              height: 50,
              child: Center(child:
              Text("Zarejestruj", style: TextStyle(color: Colors.white),)),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(50),
                color: Color(0xfffa526c),
              ),
            ),
          ),
        ],
      ),
    );
  }

  void registerAction(){
    if(!emailValidator(email) && password.length>5 && password == confirmPassword){
      _accountBloc.registerUser(email.trim(), password.trim());
    }
    else{
      _confirmPasswordFormKey.currentState.validate();
      _emailFormKey.currentState.validate();
      _passwordFormKey.currentState.validate();
    }
  }

  bool emailValidator(String email){
    Pattern pattern = r'^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$';
    RegExp regexp = new RegExp(pattern);
    if(!regexp.hasMatch(email)){
      return true;
    }
    return false;
  }
}

