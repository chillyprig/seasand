import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sea_sand/presenter/styles.dart';

class CPButtonPart extends StatelessWidget {
  CPButtonPart(
      {Key key,
      this.backgroundColor: Styles.sandColor,
      this.fontColor: Styles.whiteColor,
      @required this.onPressed, this.child})
      : super(key: key);

  final Color backgroundColor;
  final Color fontColor;
  final Function onPressed;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return new RaisedButton(
      color: Styles.facebookColor,
      textColor: Styles.whiteColor,
      onPressed: onPressed,
      child: child,
    );
  }
}
