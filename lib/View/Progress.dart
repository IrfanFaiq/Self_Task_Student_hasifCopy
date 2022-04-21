import 'package:flutter/material.dart';

class Progress extends StatefulWidget {
  const Progress({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _ProgressScreen();
}

class _ProgressScreen extends State<Progress> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: Text('Class Progression'),
        centerTitle: true,
        backgroundColor: Colors.green,
      ),
    ));
  }
}
