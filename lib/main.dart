import 'package:flutter/material.dart';
import 'presenter/styles.dart';
import 'package:sea_sand/presenter/login/login_screen.dart';

void main() => runApp(new SeaSandApp());

class SeaSandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sea Sand',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: Styles.sandColor,
        primaryColorDark: Styles.brickColor,
        backgroundColor: Styles.skyBlueColor,
        disabledColor: Styles.grayColor,
        accentColor: Styles.whiteColor,
      ),
      home: new LoginScreen(),
    );
  }
}