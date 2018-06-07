import 'package:flutter/material.dart';
import 'package:sea_sand/presenter/styles.dart';
import 'package:sea_sand/presenter/login/login_contract.dart';
import 'package:sea_sand/presenter/login/login_presenter.dart';
import 'package:sea_sand/presenter/components/button/cp_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  LoginScreenState createState() {
    return new LoginScreenState();
  }
}

class LoginScreenState extends State<LoginScreen> implements LoginContractView {
  LoginContractPresenter presenter;

  bool isFacebookLoading = false;

  @override
  void initState() {
    super.initState();

    if (presenter == null) {
      presenter = new LoginPresenter(this);
    }
  }

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

    return new Scaffold(
        body: new SafeArea(
      child: new Container(
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
                children: <Widget>[
                  new Expanded(
                      child: CPButton(
                        isLoading: isFacebookLoading,
                        onPressed: () {
                          presenter.performLoginFacebook();
                        },
                        backgroundColor: Styles.facebookColor,
                        fontColor: Styles.whiteColor,
                        child: new Text("Login with Facebook")
                      ))
                ],
              )
            ],
          )),
    ));
  }

  @override
  void showFacebookButtonLoading() {
    setState(() {
      isFacebookLoading = true;
    });
  }

  @override
  void hideFacebookButtonLoading() {
    setState(() {
//      isFacebookLoading = false;
    });
  }
}
