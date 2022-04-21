import 'package:flutter/material.dart';

import 'presentation/Account/Login.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Self-Task Student',
      theme: ThemeData(
        primaryColor: Colors.green,
      ),
      home: Login(),
    );
  }
}
