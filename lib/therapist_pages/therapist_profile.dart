import 'package:flutter/material.dart';
import 'package:flutter_phone_direct_caller/flutter_phone_direct_caller.dart';
import 'package:gap/gap.dart';
import './app_styles.dart';
import 'package:url_launcher/url_launcher.dart';

class TherapistProfile extends StatelessWidget {
  const TherapistProfile({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'About me',
          style: Styles.headLineStyle1
              .copyWith(color: Color.fromRGBO(8, 8, 38, 1)),
        ),
        elevation: 0.0,
        // backgroundColor: Theme.of(context).primaryColor,
        backgroundColor: Colors.teal[50],
        leading: GestureDetector(
          onTap: () {
            Navigator.pop(context);
          },
          child: const Icon(
            Icons.arrow_back,
            color: Colors.black,
          ),
        ),
        actions: [
          GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.notifications_rounded,
              color: Colors.black,
            ),
          ),
          SizedBox(
            width: 10,
          )
        ],
      ),
      backgroundColor: Colors.teal[50],
      body: ListView(
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
                      image: AssetImage('assets/pic1.png'),
                    ),
                  ),
                ),
                const Gap(15),
                Text(
                  'Dr. Kristina Nguyen',
                  style: Styles.headLineStyle1,
                ),
                const Gap(5),
                Text(
                  'Cognitive psychologist',
                  style: Styles.headLineStyle3,
                ),
                const Gap(7),
                Text(
                  '\$20/h',
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
                            backgroundColor: Colors.green[400],
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
                            FlutterPhoneDirectCaller.callNumber("+11224553567");
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
                            backgroundColor: Colors.green[400],
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
                    const Gap(20),
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
                          const Gap(7),
                          Text(
                            '12',
                            style: Styles.headLineStyle3
                                .copyWith(color: Colors.black),
                          )
                        ],
                      ),
                    ),
                    Gap(20),
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
                          const Gap(7),
                          Text(
                            '4.3',
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
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      width: 170,
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                      ),
                      child: Text(
                        '25 Mar at 4:00 PM',
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.purple[300]),
                      ),
                    ),
                    Container(
                      height: 40,
                      width: 170,
                      padding: const EdgeInsets.only(top: 10, left: 10),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        color: Colors.purple[100],
                      ),
                      child: Text(
                        '26 Mar at 9:00 AM',
                        style: Styles.headLineStyle3
                            .copyWith(color: Colors.purple[300]),
                      ),
                    ),
                  ],
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
                        'Apathy',
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
                  style: TextStyle(fontWeight: FontWeight.bold, fontSize: 24),
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
                                  'University of Arizona',
                                  style: Styles.headLineStyle2,
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(right: 45),
                                child: Text(
                                  'Doctor of Philosophy (PHD)',
                                  style: Styles.headLineStyle4,
                                ),
                              ),
                              const Gap(7),
                              Container(
                                padding: const EdgeInsets.only(right: 83),
                                child: Text(
                                  'Education Psychology',
                                  style: Styles.headLineStyle4,
                                ),
                              ),
                              const Gap(10),
                              Container(
                                padding: const EdgeInsets.only(right: 85),
                                child: Text(
                                  'May 2012 - Dec 2019',
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
    );
  }
}
