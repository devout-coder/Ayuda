import 'package:animated_check/animated_check.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Rewards extends StatefulWidget {
  int points;
  Rewards({super.key, required this.points});

  @override
  State<Rewards> createState() => _RewardsState();
}

class _RewardsState extends State<Rewards> with SingleTickerProviderStateMixin {
  AnimationController? _animationController;
  Animation<double>? _animation;
  @override
  void initState() {
    super.initState();

    _animationController =
        AnimationController(vsync: this, duration: Duration(seconds: 1));

    _animation = new Tween<double>(begin: 0, end: 1).animate(
        new CurvedAnimation(
            parent: _animationController!, curve: Curves.easeInOutCirc));
    _animationController!.forward();
  }

  @override
  Widget build(BuildContext context) {
    return WillPopScope(
      onWillPop: () {
        Navigator.pop(context);
        Navigator.pop(context);
        return Future.value(false);
      },
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              Container(
                child: AnimatedCheck(
                  progress: _animation!,
                  size: 200,
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                slidingBeginOffset: Offset(0, 2),
                child: Text(
                  "Congrats champ! One step closer to bliss!!",
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 35.0,
                  ),
                ),
              ),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                slidingBeginOffset: Offset(0, 2),
                child: AnimatedDigitWidget(
                    value: widget.points,
                    duration: Duration(milliseconds: 2500)),
              ),
              Text("points earned")
            ],
          ),
        ),
      ),
    );
  }
}
