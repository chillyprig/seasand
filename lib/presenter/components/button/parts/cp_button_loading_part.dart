import 'dart:math';

import 'package:flutter/material.dart';
import 'package:sea_sand/presenter/styles.dart';

class CPButtonLoadingPart extends StatefulWidget {
  const CPButtonLoadingPart({
    Key key,
    this.backgroundColor: Styles.sandColor,
    this.fontColor: Styles.whiteColor
  }) : super(key: key);

  final Color backgroundColor;
  final Color fontColor;

  @override
  CPButtonLoadingPartState createState() {
    return new CPButtonLoadingPartState();
  }
}

class CPButtonLoadingPartState extends State<CPButtonLoadingPart>
    with SingleTickerProviderStateMixin {

  static const FACE_LEFT_ANGLE = pi / 2;

  AnimationController animationController;
  Animation animation;

  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    animationController = new AnimationController(
        vsync: this,
        duration: new Duration(milliseconds: 1000)
    );
    animationController.addListener(() {
      setState(() {});
    });
    animationController.addStatusListener((status) {
      if (status == AnimationStatus.completed) {
        animationController.forward(from: -pi * 2);
      } else if (status == AnimationStatus.dismissed) {
        animationController.forward();
      }
    });

    Tween tween = new Tween<double>(
      begin: 0.0,
      end: pi * 2
    );

    final CurvedAnimation curve = new CurvedAnimation(parent: animationController, curve: Curves.easeInOut);

    animation = tween.animate(curve);

    animationController.forward();
  }

  @override
  Widget build(BuildContext context) {

    return new Center(
        child: new Transform.rotate(
          angle: animation.value,
          child: new Icon(
            Icons.wb_sunny,
            size: 80.0,
            color: Colors.orangeAccent,
          ),
        )
    );
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }
}