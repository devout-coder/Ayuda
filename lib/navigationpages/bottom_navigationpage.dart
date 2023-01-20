import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:csi_hackathon/colors.dart';
import 'package:csi_hackathon/navigationpages/screens/Communities.dart';
import 'package:csi_hackathon/navigationpages/screens/chat.dart';
import 'package:csi_hackathon/navigationpages/screens/Activities.dart';
import 'package:csi_hackathon/navigationpages/screens/statistics.dart';
import 'package:csi_hackathon/states.dart';
import 'package:curved_navigation_bar/curved_navigation_bar.dart';
import 'package:flutter/material.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:get_it/get_it.dart';
import 'package:lottie/lottie.dart';

class BpNavigation extends StatefulWidget {
  const BpNavigation({super.key});

  @override
  State<BpNavigation> createState() => _BpNavigationState();
}

class _BpNavigationState extends State<BpNavigation> {
  late PageController _pageController;
  States states = GetIt.I.get();
  final List<Widget> _tabItems = [
    ChatScreen(),
    ActivitivesPage(),
    StatisticsPage(),
    CommunityScreen(),
    Container(
      color: Colors.yellow,
    )
  ];
  int _activePage = 0;
  void moveToActivities() {
    setState(() {
      _activePage = 1;
    });
  }

  @override
  void initState() {
    super.initState();
    states.moveToActivity = moveToActivities;
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topLeft,
          end: Alignment.bottomRight,
          colors: [Color(0xffA88BEB), Color(0xffF8CEEC)],
        ),
      ),
      child: Scaffold(
        // resizeToAvoidBottomInset: false,
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          automaticallyImplyLeading: false,
          elevation: 0.0,
          title: Text(
            _activePage == 0
                ? "Chat"
                : _activePage == 1
                    ? "Activities"
                    : _activePage == 2
                        ? "Analysis"
                        : _activePage == 3
                            ? "Communities"
                            : "Help",
            style: TextStyle(
              fontSize: 22,
              fontFamily: 'EuclidCircular',
              fontWeight: FontWeight.w600,
              color: Color.fromRGBO(
                8,
                8,
                8,
                1,
              ),
            ),
          ),
          actions: [
            _activePage == 3
                ? IconButton(
                    color: const Color.fromRGBO(
                      8,
                      8,
                      38,
                      1,
                    ),
                    onPressed: () {},
                    icon: const Icon(Icons.search),
                  )
                : Container(),
            _activePage == 2
                ? SizedBox(
                    height: 50,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          states.points.toString(),
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 18,
                            fontFamily: 'EuclidCircular',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        LottieBuilder.network(
                          "https://assets7.lottiefiles.com/packages/lf20_knayiqhb.json",
                          height: 40,
                          width: 40,
                        ),
                      ],
                    ),
                  )
                : Container(),
            SizedBox(
              width: 10,
            ),
            IconButton(
              color: const Color.fromRGBO(
                8,
                8,
                38,
                1,
              ),
              onPressed: () {},
              icon: const Icon(Icons.call),
            ),
          ],
        ),
        body: Container(
          child: SizedBox.expand(
            child: _tabItems[_activePage],
          ),
        ),
        bottomNavigationBar: CurvedNavigationBar(
          // color: Colors.black,
          height: 60, color: lighterPurple,
          backgroundColor: Colors.transparent,
          items: <Widget>[
            Icon(Icons.chat, size: 30),
            Icon(
              Icons.local_activity_outlined,
              size: 30,
              // color: Colors.white,
            ),
            Icon(Icons.sentiment_satisfied_outlined, size: 30),
            Icon(Icons.health_and_safety, size: 30),
            Icon(Icons.settings, size: 30),
          ],
          onTap: (index) {
            setState(() {
              _activePage = index;
            });
          },
        ),
      ),
    );
  }
}
