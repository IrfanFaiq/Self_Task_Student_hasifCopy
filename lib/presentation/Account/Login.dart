import 'package:flutter/material.dart';

import '../../View/Home.dart';
import 'Register.dart';

class Login extends StatefulWidget {
  Login({Key? key}) : super(key: key);
  @override
  _Login createState() => _Login();
}

class _Login extends State<Login> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Login'),
        centerTitle: true,
        actions: <Widget>[
          FlatButton(
            textColor: Colors.white,
            onPressed: () {
              Navigator.push(
                  context, MaterialPageRoute(builder: (context) => Register()));
            },
            child: const Text("Register"),
          )
        ],
        backgroundColor: Colors.green,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: 40),
        child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
          _usernameField(),
          SizedBox(height: 10),
          _passwordField(),
          SizedBox(height: 10),
          _loginButton(context),
        ]),
      ),
    );
  }

  Widget _usernameField() {
    return TextFormField(
      decoration: InputDecoration(
        hintText: 'Username',
        icon: Icon(Icons.person),
      ),
    );
  }

  Widget _passwordField() {
    return TextFormField(
      obscureText: true,
      decoration:
          InputDecoration(hintText: 'password', icon: Icon(Icons.security)),
    );
  }

  Widget _loginButton(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Home()));
      },
      style: ElevatedButton.styleFrom(
          primary: Colors.green,
          fixedSize: const Size(300, 60),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(50))),
      child: Text('Login'),
    );
  }
}
