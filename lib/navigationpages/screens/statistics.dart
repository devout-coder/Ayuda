import 'dart:math';

import 'package:csi_hackathon/states.dart';
import 'package:fl_chart/fl_chart.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class StatisticsPage extends StatefulWidget {
  const StatisticsPage({super.key});

  @override
  State<StatisticsPage> createState() => _StatisticsPageState();
}

class _StatisticsPageState extends State<StatisticsPage> {
  States states = GetIt.I.get();
  double? positive;
  double? negative;
  double? neutral;

  @override
  void initState() {
    positive =
        (countOccurrencesUsingWhereMethod(states.sentimentDetails, "positive") /
                states.sentimentDetails.length) *
            100;

    negative =
        (countOccurrencesUsingWhereMethod(states.sentimentDetails, "negative") /
                states.sentimentDetails.length) *
            100;

    neutral =
        (countOccurrencesUsingWhereMethod(states.sentimentDetails, "neutral") /
                states.sentimentDetails.length) *
            100;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Text("${states.points} coins"),
          AspectRatio(
            aspectRatio: 2.0,
            child: PieChart(
              PieChartData(
                sections: _chartSections(positive!, negative!, neutral!),
                centerSpaceRadius: 48.0,
              ),
            ),
          ),
          Text("Glad to know that you are happy!"),
          Text("4 day streak"),
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
                  titlesData: FlTitlesData(
                    leftTitles: AxisTitles(
                        sideTitles: SideTitles(
                      showTitles: false,
                    )),
                    bottomTitles: AxisTitles(sideTitles: _bottomTitles),
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

int countOccurrencesUsingWhereMethod(List<String> list, String element) {
  if (list == null || list.isEmpty) {
    return 0;
  }

  var foundElements = list.where((e) => e == element);
  return foundElements.length;
}

List<PieChartSectionData> _chartSections(
    double positive, double negative, double neutral) {
  final List<PieChartSectionData> list = [];

  // for (var sector in sectors) {
  const double radius = 40.0;
  PieChartSectionData data = PieChartSectionData(
    color: Color.fromARGB(255, 91, 91, 91),
    value: negative,
    radius: radius,
    title: '😔',
  );
  list.add(data);
  data = PieChartSectionData(
    color: Color.fromARGB(255, 244, 244, 244),
    value: neutral,
    radius: radius,
    title: '😐',
  );
  list.add(data);

  data = PieChartSectionData(
    color: Colors.amber,
    value: positive,
    radius: radius,
    title: '😃',
  );
  list.add(data);
  return list;
}

Map colorData = {
  "Mindfulness": Colors.amber,
  "Muscle Relaxation": Colors.red,
  "Breathing": Colors.black,
  "5-4-3-2-1": Colors.grey,
};

List<BarChartGroupData> _chartGroups() {
  States states = GetIt.I.get();
  List<BarChartGroupData> list = [];
  states.activities.forEach((date, activityPoints) {
    // activityList.forEach((activity) {
    List<BarChartRodData> barChartRodData = [];
    activityPoints.forEach((activity, points) {
      BarChartRodData bd = BarChartRodData(
        color: colorData[activity],
        toY: points.toDouble(),
      );
      barChartRodData.add(bd);
    });
    BarChartGroupData bc = BarChartGroupData(
      x: states.activities.keys.toList().indexOf(date) + 1,
      barRods: barChartRodData,
    );
    list.add(bc);
    // });
  });
  return list;

  // return states.activities.map((time, activities) {
  //   Map sentimentMap = {"positive": 1, "negative": -1, "neutral": 0};
  //   final int y = sentimentMap[point.sentiment];

  //   return BarChartGroupData(
  //       x: states.sentimentDetails.indexOf(point) + 1,
  //       barRods: [
  //         BarChartRodData(
  //             toY: y.toDouble(),
  //             gradient: y > 0
  //                 ? LinearGradient(
  //                     colors: [Colors.yellow, Colors.orange],
  //                     begin: Alignment.topCenter,
  //                     end: Alignment.bottomCenter,
  //                   )
  //                 : LinearGradient(
  //                     colors: [Colors.grey, Colors.blue],
  //                     begin: Alignment.topCenter,
  //                     end: Alignment.bottomCenter,
  //                   )
  //             // color: y > 0 ? Colors.blue : Colors.red,
  //             )
  //       ]);
  // }).toList();
}

SideTitles get _bottomTitles => SideTitles(
      showTitles: true,
      getTitlesWidget: (value, meta) {
        // debugPrint(value.toString());
        String text = '';
        if (value == 1) {
          text = 'Jan 16';
        } else if (value == 2) {
          text = 'Jan 17';
        } else if (value == 3) {
          text = 'Jan 18';
        } else if (value == 4) {
          text = 'Jan 19';
        } else if (value == 5) {
          text = 'Jan 20';
        } else if (value == 6) {
          text = 'Jan 21';
        } else if (value == 7) {
          text = 'Jan 22';
        }
        return Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: Text(text),
        );
      },
    );
