import 'package:flutter/material.dart';
import 'styles.dart';

class LoginScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final logo = Hero(
      tag: 'Sea Sand app icon',
      child: CircleAvatar(
          backgroundColor: Colors.transparent,
          radius: 48.0,
          child: Image.asset('assets/logo.png')),
    );

    final emptySpace = new Expanded(child: new Container());

    final buttonLoginFacebook = new RaisedButton(
      color: Styles.facebookColor,
      textColor: Styles.whiteColor,
      onPressed: () {
        // TODO
      },
      child: new Text("Login with Facebook"),
    );

    return new Scaffold(
        body: new Container(
            decoration: new BoxDecoration(
                image: new DecorationImage(
                    image: new AssetImage("assets/seasand_splash.jpg"),
                    fit: BoxFit.cover),
            ),
            padding: new EdgeInsets.all(32.0),
            child: new Column(
              children: <Widget>[
                new Row(
                  children: <Widget>[
                    new Expanded(child: logo),
                  ],
                ),
                emptySpace,
                new Row(
                  children: <Widget>[new Expanded(child: buttonLoginFacebook)],
                )
              ],
            )));
  }
}
