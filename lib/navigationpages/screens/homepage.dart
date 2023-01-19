import 'package:csi_hackathon/navigationpages/screens/exercisewidget.dart';

import 'package:csi_hackathon/utils/color.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Container(
        color: mainpage,
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 160,
              decoration: const BoxDecoration(
                color: mainpageContainer,
                borderRadius: BorderRadius.only(
                  bottomLeft: Radius.circular(50),
                  bottomRight: Radius.circular(50),
                ),
              ),
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    const SizedBox(
                      height: 25,
                    ),
                    // User Name Phone and Bell icon
                    Row(
                      children: <Widget>[
                        Padding(
                          padding: const EdgeInsets.all(5.0),
                          child: Text(
                            'Exercise',
                            style: GoogleFonts.averiaGruesaLibre(
                                fontWeight: FontWeight.bold,
                                fontSize: 30,
                                color: mainpageContainertext),
                          ),
                        ),
                        const Spacer(),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          children: const [
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.phone,
                                color: Colors.red,
                                size: 27,
                              ),
                            ),
                            IconButton(
                              onPressed: null,
                              icon: Icon(
                                Icons.notifications_outlined,
                                color: Colors.black,
                                size: 27,
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 20,
                    ),
                    // Quote container
                    Container(
                      height: 50,
                      width: 320,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Row(
                            children: <Widget>[
                              const Center(
                                child: Icon(
                                  Icons.light,
                                  color: Colors.black,
                                  size: 20,
                                ),
                              ),
                              Text(
                                'Focus on a positive object and calm down',
                                style: GoogleFonts.averiaGruesaLibre(
                                  fontSize: 15,
                                  color: Colors.black,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    //////////////////////////////// panda Animation
                  ],
                ),
              ),
            ),
            ///// closing of above Container
            const SizedBox(
              height: 10,
            ),
            Container(
              width: 350,
              height: 50,
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(20),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 2,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 10),
                child: Row(
                  children: [
                    const Icon(
                      CupertinoIcons.search,
                      color: Colors.red,
                    ),
                    // ignore: sized_box_for_whitespace
                    Container(
                      height: 50,
                      width: 300,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15),
                        child: TextFormField(
                          decoration: const InputDecoration(
                              hintText: "Search...", border: InputBorder.none),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            const SizedBox(
              height: 10,
            ),
            const ExerciseWidget()
          ],
        ),
      ),
    );
  }
}
