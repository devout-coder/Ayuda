import 'dart:math';

import 'package:csi_hackathon/navigationpages/screens/Rewards.dart';
import 'package:csi_hackathon/states.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class Breathing extends StatefulWidget {
  const Breathing({super.key});

  @override
  State<Breathing> createState() => _BreathingState();
}

class _BreathingState extends State<Breathing> {
  States states = GetIt.I.get();

  List<int> _digits = [100, 200, 300, 400, 500, 600, 700, 800, 900, 1000];
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Center(
          child: Column(
            children: [
              TextButton(
                onPressed: () {
                  DateTime today = DateTime(DateTime.now().year,
                      DateTime.now().month, DateTime.now().day);
                  if (!states.activities.containsKey(today)) {
                    states.activities[today] = ["Breathing"];
                  } else {
                    states.activities[today] = [
                      ...states.activities[today]!,
                      "Breathing"
                    ];
                  }
                  final random = new Random();
                  var i = random.nextInt(_digits.length);
                  Random rnd;
                  int min = 100;
                  int max = 1000;
                  rnd = new Random();
                  int r = min + rnd.nextInt(max - min);
                  states.points += r;

                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => Rewards(points: r)),
                  );
                },
                child: Text("Breathing done"),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
