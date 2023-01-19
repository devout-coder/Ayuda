import 'package:csi_hackathon/navigationpages/screens/chat.dart';
import 'package:csi_hackathon/navigationpages/screens/Activities.dart';
import 'package:csi_hackathon/navigationpages/screens/statistics.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';

class BpNavigation extends StatefulWidget {
  const BpNavigation({super.key});

  @override
  State<BpNavigation> createState() => _BpNavigationState();
}

class _BpNavigationState extends State<BpNavigation> {
  int _currentindex = 0;
  late PageController _pageController;

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
        child: PageView(
          controller: _pageController,
          onPageChanged: (index) {
            setState(() {
              _currentindex = index;
            });
          },
          children: [
            const ActivitivesPage(),
            // ExerciseWidget(),
            const StatisticsPage(),
            const ChatScreen(),
            Container(
              color: Colors.red,
            ),
            Container(
              color: Colors.yellow,
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavyBar(
        selectedIndex: _currentindex,
        onItemSelected: (index) {
          setState(() {
            _pageController.jumpToPage(index);
          });
        },
        items: <BottomNavyBarItem>[
          BottomNavyBarItem(
              icon: const Icon(Icons.local_activity_outlined),
              title: const Text('Activities')),
          BottomNavyBarItem(
              icon: const Icon(Icons.sentiment_satisfied_outlined),
              title: const Text('Statistics')),
          BottomNavyBarItem(
              icon: const Icon(Icons.chat), title: const Text('Chats')),
          BottomNavyBarItem(
              icon: const Icon(Icons.health_and_safety),
              title: const Text('Therapists')),
          BottomNavyBarItem(
              icon: const Icon(Icons.settings), title: const Text('Settings')),
        ],
      ),
    );
  }
}
