import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
// import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:gap/gap.dart';

Color primary = const Color(0xFF42A5F5);
Color mainpageContainer = const Color.fromRGBO(158, 205, 211, 1);

class Styles {
  static Color primaryColor = primary;
  static Color therapyPageColor = mainpageContainer;
  static Color textColor = const Color(0xFF3b3b3b);
  static Color bgColor = const Color(0xFFeeedf2);
  static Color orangeColor = const Color(0xFFF37B67);
  static Color kakiColor = const Color(0xFFd2bdb6);
  static TextStyle textStyle = TextStyle(
    fontSize: 16,
    color: textColor,
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLineStyle1 = TextStyle(
    fontSize: 26,
    color: textColor,
    fontFamily: 'EuclidCircular',
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLineStyle2 = TextStyle(
    fontSize: 21,
    color: textColor,
    fontFamily: 'EuclidCircular',
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLineStyle3 = TextStyle(
    fontSize: 17,
    color: Color.fromARGB(255, 83, 16, 151),
    fontFamily: 'EuclidCircular',
    fontWeight: FontWeight.w500,
  );
  static TextStyle headLineStyle4 = TextStyle(
    fontSize: 14,
    color: Colors.grey.shade500,
    fontFamily: 'EuclidCircular',
    fontWeight: FontWeight.w500,
  );
}

class Psychiatrist extends StatefulWidget {
  const Psychiatrist({super.key});

  @override
  State<Psychiatrist> createState() => _PsychiatristState();
}

class _PsychiatristState extends State<Psychiatrist> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Container(
        decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [Color(0xffA88BEB), Color(0xffF8CEEC)],
          ),
        ),
        child: ListView(
          children: [
            Container(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                children: [
                  Container(
                    margin: const EdgeInsets.only(top: 20),
                    height: 100,
                    width: 100,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(60),
                      image: const DecorationImage(
                        fit: BoxFit.cover,
                        image: AssetImage('assets/pic3.png'),
                      ),
                    ),
                  ),
                  const Gap(15),
                  Text(
                    'Dr. Zac Wolff',
                    style: TextStyle(
                        fontFamily: 'EuclidCircular',
                        fontWeight: FontWeight.w600,
                        fontSize: 23),
                  ),
                  const Gap(5),
                  Text(
                    'Cognitive Psychiatrist',
                    style: Styles.headLineStyle3,
                  ),
                  const Gap(7),
                  Text(
                    '\$50/h',
                    style: Styles.headLineStyle1,
                  ),
                  const Gap(50),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 83, 16, 151),
                              minimumSize: Size(50, 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            child: const Icon(
                              Icons.call_outlined,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () async {
                              // FlutterPhoneDirectCaller.callNumber("+11224553567");
                            },
                          ),
                          const Gap(5),
                          Text(
                            'Schedule a session',
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                      Column(
                        children: [
                          ElevatedButton(
                            style: ElevatedButton.styleFrom(
                              backgroundColor: Color.fromARGB(255, 83, 16, 151),
                              minimumSize: Size(50, 50),
                              shape: const RoundedRectangleBorder(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                              ),
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                              size: 24.0,
                            ),
                            onPressed: () {},
                          ),
                          const Gap(5),
                          Text(
                            'Add to favourite',
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          ),
                        ],
                      ),
                    ],
                  ),
                  const Gap(50),
                  // Container(
                  //   child: ,
                  // ),
                  Row(
                    children: [
                      Container(
                        height: 60,
                        width: 100,
                        padding: const EdgeInsets.only(top: 10),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Patients',
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.amber),
                            ),
                            const Gap(7),
                            Text(
                              '54',
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      const Gap(10),
                      Container(
                        height: 60,
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Reviews',
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.amber),
                            ),
                            const Gap(5),
                            Text(
                              '12',
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      ),
                      Gap(10),
                      Container(
                        height: 60,
                        width: 100,
                        padding: const EdgeInsets.only(top: 10, bottom: 5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(15),
                          color: Colors.white,
                        ),
                        child: Column(
                          children: [
                            Text(
                              'Rating',
                              style: Styles.headLineStyle4
                                  .copyWith(color: Colors.amber),
                            ),
                            const Gap(5),
                            Text(
                              '4.5',
                              style: Styles.headLineStyle3
                                  .copyWith(color: Colors.black),
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                  const Gap(40),
                  Text(
                    'Nearest available dates for sessions',
                    style: Styles.headLineStyle3.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Gap(20),
                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        Container(
                          height: 40,
                          width: 170,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 185, 32, 212),
                          ),
                          child: Text(
                            '23 Jan at 4:00 PM',
                            style: Styles.headLineStyle3.copyWith(
                                color: Color.fromARGB(255, 251, 228, 255)),
                          ),
                        ),
                        const Gap(10),
                        Container(
                          height: 40,
                          width: 170,
                          padding: const EdgeInsets.only(top: 10, left: 10),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(5),
                            color: Color.fromARGB(255, 185, 32, 212),
                          ),
                          child: Text(
                            '23 Jan at 10:00 PM',
                            style: Styles.headLineStyle3.copyWith(
                                color: Color.fromARGB(255, 251, 228, 255)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const Gap(30),
                  Text(
                    'I specialise in',
                    style: Styles.headLineStyle3.copyWith(
                        color: Colors.black, fontWeight: FontWeight.bold),
                  ),
                  const Gap(25),
                  Row(
                    children: [
                      Container(
                        height: 40,
                        width: 140,
                        padding: const EdgeInsets.only(top: 10, left: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(
                          'Psychoanalysis',
                          style: Styles.headLineStyle3.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        height: 40,
                        width: 70,
                        padding: const EdgeInsets.only(top: 10, left: 5),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(
                          'Psychotherapy',
                          style: Styles.headLineStyle3.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                      const Gap(10),
                      Container(
                        height: 40,
                        width: 110,
                        padding: const EdgeInsets.only(top: 10, left: 15),
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Text(
                          'Cognitive',
                          style: Styles.headLineStyle3.copyWith(
                              color: Colors.black, fontWeight: FontWeight.bold),
                        ),
                      ),
                    ],
                  ),
                  const Gap(40),
                  Text(
                    'Personal Information',
                    style: Styles.headLineStyle2,
                  ),
                  const Gap(25),
                  Text(
                    'Highly focused, confident, dedicated and committed ..more',
                    style: Styles.headLineStyle3,
                  ),
                  const Gap(50),
                  const Text(
                    'Education',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24,
                      fontFamily: 'EuclidCircular',
                    ),
                  ),
                  const Gap(30),
                  Column(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(
                          left: 20,
                        ),
                        height: 150,
                        width: double.infinity,
                        decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                            color: Colors.white),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              height: 70,
                              width: 70,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(20),
                                image: const DecorationImage(
                                  fit: BoxFit.cover,
                                  image: AssetImage(
                                    "assets/arizona.png",
                                  ),
                                ),
                              ),
                            ),
                            Column(
                              children: [
                                Container(
                                  margin:
                                      const EdgeInsets.only(right: 20, top: 35),
                                  child: Text(
                                    'Harvard University',
                                    style: Styles.headLineStyle2,
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  padding: const EdgeInsets.only(right: 45),
                                  child: Text(
                                    'Doctor of Psychiatrist (PHD)',
                                    style: Styles.headLineStyle4,
                                  ),
                                ),
                                const Gap(7),
                                Container(
                                  padding: const EdgeInsets.only(right: 83),
                                  child: Text(
                                    'Education Psychiatrist',
                                    style: Styles.headLineStyle4,
                                  ),
                                ),
                                const Gap(10),
                                Container(
                                  padding: const EdgeInsets.only(right: 85),
                                  child: Text(
                                    'May 2014 - Dec 2019',
                                    style: Styles.headLineStyle4
                                        .copyWith(color: Colors.black),
                                  ),
                                )
                              ],
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
