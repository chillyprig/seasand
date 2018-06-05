import 'package:flutter/material.dart';
import 'package:sea_sand/presenter/login/login_screen.dart';

void main() => runApp(new SeaSandApp());

class SeaSandApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
      title: 'Sea Sand',
      theme: new ThemeData(
        brightness: Brightness.light,
        primaryColor: const Color(0xFFD87D4C),
        primaryColorDark: const Color(0xFF4E0C07),
        backgroundColor: const Color(0xFF719BC7),
        disabledColor: const Color(0xFFC8CACB),
        accentColor: const Color(0xFFEEEEEE),
      ),
      home: new LoginScreen(),
    );
  }
}