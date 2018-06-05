import 'package:flutter/material.dart';
import '../styles.dart';
import 'login_contract.dart';
import 'login_presenter.dart';

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

    final loadingButton = new Center(
      child: new RaisedButton(
        child: new CircularProgressIndicator(
          backgroundColor: Styles.whiteColor,
        ),
        onPressed: null,
        shape: new CircleBorder(),
        disabledColor: Styles.facebookColor,
        disabledTextColor: Styles.whiteColor,
      ),
    );

    final buttonLoginFacebook = new RaisedButton(
      color: Styles.facebookColor,
      textColor: Styles.whiteColor,
      onPressed: () {
        presenter.performLoginFacebook();
      },
      child: new Text("Login with Facebook"),
    );

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
                      child: isFacebookLoading
                          ? loadingButton
                          : buttonLoginFacebook)
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
