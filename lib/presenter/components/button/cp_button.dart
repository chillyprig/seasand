import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:sea_sand/presenter/components/button/parts/cp_button_loading_part.dart';
import 'package:sea_sand/presenter/components/button/parts/cp_button_part.dart';

class CPButton extends StatefulWidget {
  CPButton(
      {Key key,
      @required this.onPressed,
      this.child,
      this.isLoading = false,
      this.backgroundColor,
      this.fontColor})
      : super(key: key);

  final Function onPressed;
  final Widget child;
  final Color backgroundColor;
  final Color fontColor;
  final bool isLoading;

  @override
  _CPButtonState createState() {
    return new _CPButtonState();
  }
}

class _CPButtonState extends State<CPButton> {
  @override
  Widget build(BuildContext context) {
    // Access parent props via widget
    return CPButtonPart(
        child: widget.child,
        backgroundColor: widget.backgroundColor,
        fontColor: widget.fontColor,
        onPressed: widget.onPressed);
  }
}
