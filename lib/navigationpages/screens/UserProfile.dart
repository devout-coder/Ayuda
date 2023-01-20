import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

import './Therapists.dart';

class UserProfile extends StatefulWidget {
  const UserProfile({super.key});

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // backgroundColor: const Color.fromRGBO(158, 205, 211, 1),
      backgroundColor: Colors.transparent,
      // appBar: AppBar(
      //   elevation: 0.0,
      //   backgroundColor: const Color.fromRGBO(158, 205, 211, 1),
      //   centerTitle: true,
      //   leading: const Icon(
      //     Icons.menu,
      //     color: Colors.white,
      //   ),
      //   actions: [
      //     GestureDetector(
      //       child: Container(
      //         margin: const EdgeInsets.only(right: 10),
      //         child: const Icon(
      //           Icons.notifications_rounded,
      //           color: Colors.white,
      //         ),
      //       ),
      //     ),
      //     GestureDetector(
      //       child: Container(
      //         margin: const EdgeInsets.only(right: 10),
      //         child: ClipOval(
      //           child: Image.network(
      //             "https://raw.githubusercontent.com/AminullahTajMuhammad/doctor_appointment_ui/master/assets/profile_img.png",
      //           ),
      //         ),
      //       ),
      //     )
      //   ],
      // ),
      body: Container(
        decoration: BoxDecoration(
          color: Colors.grey[100],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(38),
            topRight: Radius.circular(38),
          ),
        ),
        child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: const Text(
                  "Hey, Pranil",
                  style: TextStyle(
                    color: Color.fromARGB(255, 74, 74, 74),
                    fontSize: 22,
                    fontFamily: 'EuclidCircular',
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              // Container(
              //   margin: const EdgeInsets.only(top: 5, left: 20),
              //   child: const Text(
              //     "Welcome Back",
              //     style: TextStyle(
              //       color: Color(0xff363636),
              //       fontSize: 30,
              //       fontWeight: FontWeight.bold,
              //       fontFamily: 'Roboto',
              //     ),
              //   ),
              // ),
              Container(
                margin: const EdgeInsets.only(top: 25, left: 20, right: 20),
                //width: size.width,
                //height: 60,
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(5),
                  boxShadow: const [
                    BoxShadow(
                      color: Color(0x14000000),
                      offset: Offset(0, 10),
                      blurRadius: 15,
                      spreadRadius: 0,
                    ),
                  ],
                ),
                height: 60,
                child: Row(
                  children: [
                    Expanded(
                      flex: 5,
                      child: Container(
                        margin: const EdgeInsets.only(left: 10.0, right: 10.0),
                        child: const TextField(
                          maxLines: 1,
                          autofocus: false,
                          style: TextStyle(
                            color: Color(0xff107163),
                            fontFamily: 'EuclidCircular',
                            fontSize: 20,
                          ),
                          decoration: InputDecoration(
                            border: InputBorder.none,
                            hintText: "Search",
                          ),
                        ),
                      ),
                    ),
                    Expanded(
                      flex: 1,
                      child: Container(
                        decoration: BoxDecoration(
                          color: Color(0xff107163),
                          borderRadius: BorderRadius.circular(5),
                        ),
                        child: const Center(
                          child: Icon(
                            Icons.search,
                            color: Colors.white,
                            size: 25,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Container(
                margin: const EdgeInsets.only(top: 20, left: 20),
                child: Stack(
                  fit: StackFit.loose,
                  children: [
                    Container(
                      child: const Text(
                        'Top Rated',
                        style: TextStyle(
                          color: Color(0xff363636),
                          fontSize: 20,
                          fontFamily: 'EuclidCircular',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ),
                    Container(
                      margin: const EdgeInsets.only(right: 20, top: 1),
                      child: const Align(
                        alignment: Alignment.centerRight,
                        child: Text(
                          'See all',
                          style: TextStyle(
                            color: Color(0xff5e5d5d),
                            fontSize: 19,
                            fontFamily: 'EuclidCircular',
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              Expanded(
                child: Container(
                  margin: const EdgeInsets.only(left: 20, right: 20),
                  child: ListView(
                    children: [
                      demoTopRatedDr("assets/pic1.png", "Dr. Kristina Nguyen",
                          "Psychologist ", "-4.3", '1.4km away'),
                      demoTopRatedDr('assets/pic4.png', 'Dr. Ashton Wheiler',
                          'Health Coach', '-4.4', '2.3km away'),
                      demoTopRatedDr("assets/pic3.png", "Dr. Zac Wolff",
                          "Psychiatrist   ", "-4.5", '500m away'),
                      demoTopRatedDr('assets/pic2.png', 'Dr. Zack Stokes',
                          'Health Coach', '-4.2', '5km away'),
                    ],
                  ),
                ),
              )
            ]),
      ),
    );
  }

  Widget demoTopRatedDr(String image, String name, String speciality,
      String rating, String area) {
    Size size = MediaQuery.of(context).size;

    return GestureDetector(
      onTap: () {
        Navigator.push(
            context, MaterialPageRoute(builder: (context) => Therapists()));
      },
      child: Container(
        height: 98,
        margin: EdgeInsets.only(top: 10),
        decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(5),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              margin: EdgeInsets.only(left: 20),
              height: 98,
              width: 50,
              child: Image.asset(image),
            ),
            Container(
              margin: EdgeInsets.only(left: 20, top: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    margin: EdgeInsets.only(top: 10),
                    child: Text(
                      name,
                      style: const TextStyle(
                        color: Color(0xff363636),
                        fontSize: 17,
                        fontFamily: 'EuclidCircular',
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.only(top: 10),
                    child: Row(
                      children: [
                        Container(
                          child: Text(
                            speciality,
                            style: const TextStyle(
                              color: Color(0xffababab),
                              fontFamily: 'EuclidCircular',
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ),
                        Container(
                          margin:
                              EdgeInsets.only(top: 3, left: size.width * 0.25),
                          child: Row(
                            children: [
                              Container(
                                child: const Text(
                                  "Rating",
                                  style: TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'EuclidCircular',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                              Container(
                                child: Text(
                                  rating,
                                  style: const TextStyle(
                                    color: Colors.black,
                                    fontSize: 12,
                                    fontFamily: 'EuclidCircular',
                                    fontWeight: FontWeight.w500,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                  const Gap(3),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on_outlined,
                        size: 15,
                        color: Colors.black,
                      ),
                      Text(
                        area,
                        style: Styles.headLineStyle4.copyWith(fontSize: 12),
                      ),
                    ],
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
