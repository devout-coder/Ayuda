import 'package:animated_check/animated_check.dart';
import 'package:animated_digit/animated_digit.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:csi_hackathon/colors.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

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
        body: Container(
          decoration: const BoxDecoration(
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              colors: [
                // Color.fromARGB(255, 216, 216, 216),
                // Color.fromARGB(255, 215, 215, 255),
                // Color.fromARGB(255, 196, 196, 255),
                Color(0xffA88BEB),
                Color(0xffF8CEEC)
              ],
            ),
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(
                height: 120,
                child: OverflowBox(
                  minHeight: 170,
                  maxHeight: 170,
                  child: LottieBuilder.network(
                    'https://assets9.lottiefiles.com/packages/lf20_og612HbgWj.json',
                    height: 200,
                    width: 180,
                  ),
                ),
              ),
              Container(
                child: AnimatedCheck(
                  progress: _animation!,
                  size: 200,
                  color: darkPurple,
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.93,
                child: DelayedDisplay(
                  delay: Duration(seconds: 1),
                  slidingBeginOffset: Offset(0, 2),
                  child: Text(
                    "Congrats champ! One step closer to bliss!!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color.fromARGB(255, 27, 16, 105),
                      fontSize: 35,
                      fontFamily: 'EuclidCircular',
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20),
              DelayedDisplay(
                delay: Duration(seconds: 1),
                slidingBeginOffset: Offset(0, 2),
                child: AnimatedDigitWidget(
                    value: widget.points,
                    textStyle: TextStyle(
                      fontSize: 30,
                      fontFamily: 'EuclidCircular',
                      fontWeight: FontWeight.w500,
                    ),
                    duration: Duration(
                      milliseconds: 2500,
                    )),
              ),
              Text(
                "points earned",
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'EuclidCircular',
                  fontWeight: FontWeight.w500,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
