import 'package:flutter/material.dart';
import 'package:mercado_artesao/models/user_model.dart';
import 'package:mercado_artesao/screens/signup_screen.dart';
import 'package:scoped_model/scoped_model.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final _emailController = TextEditingController();
  final _passController = TextEditingController();

  final _formKey = GlobalKey<FormState>();
  final _scaffoldKey = GlobalKey<ScaffoldState>();

  bool isLoggedIn = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.blueAccent,
        key: _scaffoldKey,
        body: ScopedModelDescendant<UserModel>(
          builder: (context, child, model) {
            if (model.isLoading)
              return Center(
                child: CircularProgressIndicator(),
              );

            return Form(
              key: _formKey,
              child: ListView(
                padding: EdgeInsets.all(16.0),
                children: <Widget>[
                  Align(
                    alignment: Alignment.center,
                    child: RaisedButton(
                      child: Text(
                        "Entrar com Facebook",
                        textAlign: TextAlign.center,
                      ),
                      padding: EdgeInsets.zero,
                    ),
                  ),
                  SizedBox(height: 20),
                  // SizedBox(
                  //   height: 44.0,
                  //   child: RaisedButton(
                  //     child: Text(
                  //       "Entrar",
                  //       style: TextStyle(
                  //         fontSize: 18.0,
                  //       ),
                  //     ),
                  //     textColor: Colors.white,
                  //     color: Theme.of(context).primaryColor,
                  //     onPressed: () {
                  //       if (_formKey.currentState.validate()) {}
                  //       model.signIn(
                  //           email: _emailController.text,
                  //           pass: _passController.text,
                  //           onSuccess: _onSuccess,
                  //           onFail: _onFail);
                  //     },
                  //   ),
                  // ),
                ],
              ),
            );
          },
        ));
  }

  void _onSuccess() {
    Navigator.of(context).pop();
  }

  void _onFail() {
    _scaffoldKey.currentState.showSnackBar(SnackBar(
      content: Text("Falha ao Entrar!"),
      backgroundColor: Colors.redAccent,
      duration: Duration(seconds: 2),
    ));
  }
}
