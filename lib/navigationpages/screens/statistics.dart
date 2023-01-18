import 'dart:math';

import 'package:csi_hackathon/states.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class SentimentDetails {
  String sentiment;
  SentimentDetails(
    this.sentiment,
  );
}

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Padding(
            padding: EdgeInsets.all(20),
            child: AspectRatio(
              aspectRatio: 2,
              child: BarChart(
                BarChartData(
                  barGroups: _chartGroups(),
                  borderData: FlBorderData(border: Border()),
                  gridData: FlGridData(
                    show: false,
                  ),
                  // barTouchData: BarTouchData(enabled: false),
                  titlesData: FlTitlesData(
                    bottomTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: false,
                    )),
                    leftTitles: AxisTitles(sideTitles: _bottomTitles),
                    topTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                    rightTitles:
                        AxisTitles(sideTitles: SideTitles(showTitles: false)),
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Point {
  final double x;
  final double y;
  Point(this.x, this.y);
}

List<BarChartGroupData> _chartGroups() {
  States states = GetIt.I.get();

  return states.sentimentDetails.map((point) {
    Map sentimentMap = {"positive": 1, "negative": -1, "neutral": 0};
    final int y = sentimentMap[point.sentiment];
    return BarChartGroupData(
        x: states.sentimentDetails.indexOf(point) + 1,
        barRods: [
          BarChartRodData(
              toY: y.toDouble(),
              gradient: y > 0
                  ? LinearGradient(
                      colors: [Colors.yellow, Colors.orange],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
                  : LinearGradient(
                      colors: [Colors.grey, Colors.blue],
                      begin: Alignment.topCenter,
                      end: Alignment.bottomCenter,
                    )
              // color: y > 0 ? Colors.blue : Colors.red,
              )
        ]);
  }).toList();
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        debugPrint(value.toString());
        String text = '';
        if (value == 0) {
          text = '😐';
        } else if (value == -1) {
          text = '😔';
        } else if (value == 1) {
          text = '😃';
        }
        return Text(text);
      },
    );
