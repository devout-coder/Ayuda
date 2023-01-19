import 'package:csi_hackathon/colors.dart';
import 'package:csi_hackathon/navigationpages/screens/chat.dart';
import 'package:csi_hackathon/navigationpages/screens/Activities.dart';
import 'package:csi_hackathon/navigationpages/screens/statistics.dart';
import 'package:csi_hackathon/states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BpNavigation extends StatefulWidget {
  const BpNavigation({super.key});

  @override
  State<BpNavigation> createState() => _BpNavigationState();
}

class _BpNavigationState extends State<BpNavigation> {
  late PageController _pageController;
  final List<Widget> _tabItems = [
    ActivitivesPage(),
    StatisticsPage(),
    ChatScreen(),
    Container(
      color: Colors.red,
    ),
    Container(
      color: Colors.yellow,
    )
  ];
  int _activePage = 0;
  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox.expand(
        child: _tabItems[_activePage],
      ),
      bottomNavigationBar: CurvedNavigationBar(
        // color: Colors.black,
        height: 60,
        color: lighterPurple,
        backgroundColor: Color(0xffF8CEEC),
        items: <Widget>[
          Icon(Icons.local_activity_outlined, size: 30),
          Icon(Icons.sentiment_satisfied_outlined, size: 30),
          Icon(Icons.chat, size: 30),
          Icon(Icons.health_and_safety, size: 30),
          Icon(Icons.settings, size: 30),
        ],
        onTap: (index) {
          setState(() {
            _activePage = index;
          });
        },
      ),
    );
  }
}
