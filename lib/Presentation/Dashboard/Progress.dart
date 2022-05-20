import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgressScreen();
}

class _ProgressScreen extends State<Progress> {
  final user = FirebaseAuth.instance.currentUser!;
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('${user.uid}'),
        //Text('Class Progression'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    ));
  }
}
