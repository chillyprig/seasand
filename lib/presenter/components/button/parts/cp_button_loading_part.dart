import 'package:flutter/material.dart';
import 'package:sea_sand/presenter/styles.dart';

class CPButtonLoadingPart extends StatelessWidget {
  const CPButtonLoadingPart({
    Key key,
    this.backgroundColor: Styles.sandColor,
    this.fontColor: Styles.whiteColor
  }) : super(key: key);

  final Color backgroundColor;
  final Color fontColor;

  @override
  Widget build(BuildContext context) {
    return new Center(
      child: new RaisedButton(
        child: new CircularProgressIndicator(
          valueColor: AlwaysStoppedAnimation(fontColor),
        ),
        onPressed: null,
        shape: new CircleBorder(),
        disabledColor: backgroundColor,
        disabledTextColor: fontColor,
      ),
    );
  }
}