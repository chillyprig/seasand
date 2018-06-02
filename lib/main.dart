import 'package:flutter/material.dart';

import 'package:sea_sand/learning/random_words.dart';

void main() => runApp(new SeaSandApp());

class SeaSandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Welcome my friend',
      home: new Scaffold(
        appBar: new AppBar(
          title: new Text('Welcome welcome'),
          centerTitle: true,
        ),
        body: new Center(
          child: new RandomWords(),
        )
      ),
    );
  }
}