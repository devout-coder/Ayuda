import 'package:csi_hackathon/colors.dart';
import 'package:csi_hackathon/navigationpages/screens/54321.dart';
import 'package:csi_hackathon/navigationpages/screens/555.dart';
import 'package:csi_hackathon/navigationpages/screens/Breathing.dart';
import 'package:csi_hackathon/navigationpages/screens/Mindfulness.dart';
import 'package:csi_hackathon/navigationpages/screens/MuscleRelaxation.dart';
import 'package:delayed_display/delayed_display.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:google_fonts/google_fonts.dart';

class Cont extends StatefulWidget {
  String label;
  Widget widget;
  String url;

  Cont(
      {super.key,
      required this.label,
      required this.widget,
      required this.url});

  @override
  State<Cont> createState() => _ContState();
}

class _ContState extends State<Cont> {
  @override
  Widget build(BuildContext context) {
    return DelayedDisplay(
      delay: Duration(seconds: 1),
      slidingBeginOffset: Offset(0, 0.2),
      child: GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
              builder: (context) => Scaffold(
                body: Container(
                  decoration: const BoxDecoration(
                    gradient: LinearGradient(
                      begin: Alignment.topLeft,
                      end: Alignment.bottomRight,
                      colors: [
                        // Color.fromARGB(255, 216, 216, 216),
                        // Color.fromARGB(255, 215, 215, 255),
                        // Color.fromARGB(255, 196, 196, 255),
                        Color(0xffA88BEB),
                        Color(0xffF8CEEC)
                      ],
                    ),
                  ),
                  child: widget.widget,
                ),
              ),
            ),
          );
        },
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 10),
          child: Container(
            width: 370,
            height: 100,
            decoration: BoxDecoration(
                gradient: LinearGradient(
                  begin: Alignment.topLeft,
                  end: Alignment.bottomRight,
                  colors: [darkPurple, Color.fromARGB(255, 255, 132, 220)],
                ),
                color: darkPurple,
                borderRadius: BorderRadius.circular(10),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 3,
                    blurRadius: 10,
                    offset: const Offset(0, 3),
                  )
                ]),
            child: Row(children: [
              InkWell(
                onTap: () {},
                child: Container(
                  alignment: Alignment.center,
                  child: LottieBuilder.network(
                    widget.url,
                    height: 90,
                    width: 120,
                  ),
                ),
              ),
              Text(
                widget.label,
                style: TextStyle(
                  fontSize: 22,
                  color: Color.fromARGB(255, 220, 220, 220),
                  fontFamily: 'EuclidCircular',
                  fontWeight: FontWeight.w600,
                ),
              ),
            ]),
          ),
        ),
      ),
    );
  }
}

class ActivitivesPage extends StatefulWidget {
  const ActivitivesPage({super.key});

  @override
  State<ActivitivesPage> createState() => _ActivitivesPageState();
}

class _ActivitivesPageState extends State<ActivitivesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      body: Container(
        // decoration: const BoxDecoration(
        //   gradient: LinearGradient(
        //     begin: Alignment.topLeft,
        //     end: Alignment.bottomRight,
        //     colors: [Color(0xffA88BEB), Color(0xffF8CEEC)],
        //   ),
        // ),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Cont(
                  label: "Breathing",
                  widget: Breathing(),
                  url:
                      "https://assets6.lottiefiles.com/private_files/lf30_i2pyppik.json"),
              Cont(
                label: "Mindfulness",
                widget: const Mindfulness(),
                url:
                    "https://assets2.lottiefiles.com/private_files/lf30_htijkvxe.json",
              ),
              Cont(
                label: "Muscle Relaxation",
                widget: const MuscleRelaxation(),
                url:
                    "https://assets6.lottiefiles.com/packages/lf20_uk2qyv3i.json",
              ),
              Cont(
                label: "5-4-3-2-1",
                widget: const Fivefour(),
                url:
                    "https://assets5.lottiefiles.com/private_files/lf30_emulvclw.json",
              ),
              Cont(
                label: "5-5-5",
                widget: FiveFive(),
                url:
                    "https://assets4.lottiefiles.com/packages/lf20_8Gr1sc.json",
              ),
            ],
          ),
        ),
      ),
    );
  }
}

// import 'package:flutter_tts/flutter_tts.dart';

// class ExerciseWidget extends StatefulWidget {
//   const ExerciseWidget({super.key});

//   @override
//   State<ExerciseWidget> createState() => _ExerciseWidgetState();
// }

// class _ExerciseWidgetState extends State<ExerciseWidget> {
//   bool showAnim = false;
//   bool showten = false;
//   bool showeg = false;
//   bool showele = false;
//   bool showtwe = false;
//   bool showthr = false;
//   bool showfou = false;
//   bool showfiv = false;
//   bool showsix = false;
//   bool showsev = false;
//   bool shownin = false;
//   bool showtone = false;
//   bool showtwo = false;
//   @override
//   void initState() {
//     Future.delayed(const Duration(milliseconds: 115000), () {
//       setState(() {
//         showtwo = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 95000), () {
//       setState(() {
//         showtone = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 75000), () {
//       setState(() {
//         shownin = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 75000), () {
//       setState(() {
//         shownin = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 60000), () {
//       setState(() {
//         showsev = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 55000), () {
//       setState(() {
//         showsix = true;
//       });
//     });

//     Future.delayed(const Duration(milliseconds: 5000), () {
//       setState(() {
//         showAnim = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 25000), () {
//       setState(() {
//         showeg = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 38000), () {
//       setState(() {
//         showthr = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 45000), () {
//       setState(() {
//         showfou = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 50000), () {
//       setState(() {
//         showfiv = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 20000), () {
//       setState(() {
//         showtwe = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 30000), () {
//       setState(() {
//         showele = true;
//       });
//     });
//     Future.delayed(const Duration(milliseconds: 15000), () {
//       setState(() {
//         showten = true;
//       });
//     });
//     super.initState();
//   }

//   // final FlutterTts flutterTts = FlutterTts();

//   @override
//   Widget build(BuildContext context) {
//     // Future _speak0() async {
//     //   await flutterTts.awaitSpeakCompletion(true);
//     //   await flutterTts.speak(
//     //       "breathe in for 5 seconds, hold your breath for 5 seconds, and then breathe out for 5 seconds ");
//     // }

//     // Future _speak() async {
//     //   await flutterTts.speak("breathe in for 5 seconds, ");
//     // }

//     // Future _speak1() async {
//     //   await flutterTts.speak("hold your breath for 5 seconds, ");
//     // }

//     // Future _speak2() async {
//     //   await flutterTts.speak(
//     //     "breathe out for 5 seconds",
//     //   );
//     // }

//     // Future _talk() async {
//     //   await flutterTts.speak(
//     //       "5 look around and focus on5 things you see: Focus on a small object, such as a pencil or coffee mug, and identify every color and shape.Look at the sky for clouds, birds, sunrises, or anything else you can spot around. Look at every little detail on a family photo on the wall.");
//     // }

//     // Future _talk2() async {
//     //   await flutterTts.speak(
//     //       "4 things you feel: Focus on how your clothing feels on your body or how your hair feels on your head, Touch the furniture in your living area and focus on its texture.");
//     // }

//     // Future _talk3() async {
//     //   await flutterTts.speak(
//     //     "3 things you hear: music, conversation, barking dog, clock ticking",
//     //   );
//     // }

//     // Future _talk4() async {
//     //   await flutterTts.speak(
//     //     "4 things you smell: food being cooked, soap or shampoo,",
//     //   );
//     // }

//     // Future _talk5() async {
//     //   await flutterTts.speak(
//     //     "1 thing you taste: a mint, coffee, sugar ",
//     //   );
//     // }

//     // Future _talk0() async {
//     //   await flutterTts.speak(
//     //     "5-4-3-2-1 technique look around and focus on: fivth : Focus on a small object, such as a pencil or coffee mug, and identify every color and shape.Look at the sky for clouds, birds, sunrises, or anything else you can spot around. Look at every little detail on a family photo on the wall.fourth things you feel: Focus on how your clothing feels on your body or how your hair feels on your head, Touch the furniture in your living area and focus on its texture.third things you hear: music, conversation, barking dog, clock ticking second things you smell: food being cooked, soap or shampoo,one thing you taste: a mint, coffee, sugar",
//     //   );
//     // }

//     // Future _mussle() async {
//     //   await flutterTts.speak(
//     //     "Use your hand to make a tight fist. Squeeze your fist tightlyHold your squeezed fist for a few seconds. Notice all the tension you feel in your hand.Slowly open your fingers and be aware of how you feel. You may notice a feeling of tension leaving your hand. Eventually, your hand will feel lighter and more relaxed",
//     //   );
//     // }

//     // Future _mindfullness() async {
//     //   await flutterTts.speak(
//     //     "Find a quiet and comfortable place to sit and close your eyes.Notice how your breathing and body feel.Now shift your awareness to the sensations you observe in your surroundings. Ask yourself What’s happening outside of my body?Notice what you hear, smell, and feel in your environment.Change your awareness several times from your body to your environment and back again.",
//     //   );
//     // }

//     // Future _meditation() async {
//     //   await flutterTts.speak(
//     //     "Sit in a quiet and comfortable place. Put one of your hands on your chest and the other on your stomach. Your stomach should move more than your chest when you breathe in deeply Take a slow and regular breath in through your nose. Watch and sense your hands as you breathe in. The hand on your chest should remain still while the hand on your stomach will move slightly Breathe out through your mouth slowly Repeat this process at least 10 times or until you begin to feel your anxiety lessen",
//     //   );
//     // }

//     return SingleChildScrollView(
//       scrollDirection: Axis.vertical,
//       child: Padding(
//         padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//         child: Column(children: [
//           Padding(
//             padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 5),
//             child: Column(children: [
//               Padding(
//                 padding: const EdgeInsets.symmetric(vertical: 10),
//                 child: Container(
//                   width: 370,
//                   height: 150,
//                   decoration: BoxDecoration(
//                       color: Colors.white,
//                       borderRadius: BorderRadius.circular(10),
//                       boxShadow: [
//                         BoxShadow(
//                           color: Colors.grey.withOpacity(0.5),
//                           spreadRadius: 3,
//                           blurRadius: 10,
//                           offset: const Offset(0, 3),
//                         )
//                       ]),
//                   child: Row(
//                     children: [
//                       InkWell(
//                         onTap: () {},
//                         child: Container(
//                           alignment: Alignment.center,
//                           child: LottieBuilder.network(
//                             "https://assets6.lottiefiles.com/private_files/lf30_i2pyppik.json",
//                             height: 120,
//                             width: 150,
//                           ),
//                         ),
//                       ),
//                       Container(
//                         width: 190,
//                         child: Column(
//                           crossAxisAlignment: CrossAxisAlignment.start,
//                           mainAxisAlignment: MainAxisAlignment.spaceAround,
//                           children: [
//                             Row(
//                               children: [
//                                 Container(
//                                   child: AnimatedTextKit(
//                                     // onFinished: () => _speak(),
//                                     totalRepeatCount: 1,
//                                     repeatForever: false,
//                                     stopPauseOnTap: false,
//                                     animatedTexts: [
//                                       TyperAnimatedText("5",
//                                           speed:
//                                               const Duration(milliseconds: 100),
//                                           textStyle:
//                                               GoogleFonts.averiaGruesaLibre(
//                                             fontSize: 22,
//                                           )),
//                                     ],
//                                   ),
//                                 ),
//                                 showAnim
//                                     ? Container(
//                                         child: AnimatedTextKit(
//                                           // onFinished: () => _speak1(),
//                                           totalRepeatCount: 1,
//                                           repeatForever: false,
//                                           animatedTexts: [
//                                             TyperAnimatedText("-5",
//                                                 speed: const Duration(
//                                                     milliseconds: 100),
//                                                 textStyle: GoogleFonts
//                                                     .averiaGruesaLibre(
//                                                   fontSize: 22,
//                                                 )),
//                                           ],
//                                         ),
//                                       )
//                                     : Container(),
//                                 showten
//                                     ? Container(
//                                         child: AnimatedTextKit(
//                                           // onFinished: () => _speak2(),
//                                           totalRepeatCount: 1,
//                                           repeatForever: false,
//                                           animatedTexts: [
//                                             TyperAnimatedText("-5",
//                                                 speed: const Duration(
//                                                     milliseconds: 100),
//                                                 textStyle: GoogleFonts
//                                                     .averiaGruesaLibre(
//                                                   fontSize: 22,
//                                                 )),
//                                           ],
//                                         ),
//                                       )
//                                     : Container(),
//                               ],
//                             ),
//                             Container(
//                               child: AnimatedTextKit(
//                                 totalRepeatCount: 1,
//                                 repeatForever: false,
//                                 animatedTexts: [
//                                   TyperAnimatedText(
//                                       "breathe in for 5 seconds, hold your breath for 5 seconds, and then breathe out for 5 seconds",
//                                       speed: const Duration(milliseconds: 100),
//                                       textStyle: GoogleFonts.averiaGruesaLibre(
//                                         fontSize: 12,
//                                       )),
//                                 ],
//                               ),
//                             ),
//                             InkWell(
//                               // onTap: () => _speak0(),
//                               child: Container(
//                                 alignment: Alignment.bottomLeft,
//                                 child: const Icon(Icons.volume_up),
//                               ),
//                             ),
//                           ],
//                         ),
//                       )
//                     ],
//                   ),
//                 ),
//               ),
//             ]),
//           ),
//           //first
//           showeg
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Container(
//                     width: 370,
//                     height: 320,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset: const Offset(0, 3),
//                           )
//                         ]),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: LottieBuilder.network(
//                               "https://assets4.lottiefiles.com/packages/lf20_8Gr1sc.json",
//                               height: 120,
//                               width: 150,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 190,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Row(
//                                 children: [
//                                   showele
//                                       ? Container(
//                                           child: AnimatedTextKit(
//                                             // onFinished: () => _talk(),
//                                             totalRepeatCount: 1,
//                                             repeatForever: false,
//                                             stopPauseOnTap: false,
//                                             animatedTexts: [
//                                               TyperAnimatedText("5",
//                                                   speed: const Duration(
//                                                       milliseconds: 100),
//                                                   textStyle: GoogleFonts
//                                                       .averiaGruesaLibre(
//                                                     fontSize: 22,
//                                                   )),
//                                             ],
//                                           ),
//                                         )
//                                       : Container(),
//                                   showfou // 45000
//                                       ? Container(
//                                           child: AnimatedTextKit(
//                                             // onFinished: () => _talk2(),
//                                             totalRepeatCount: 1,
//                                             repeatForever: false,
//                                             stopPauseOnTap: false,
//                                             animatedTexts: [
//                                               TyperAnimatedText("-4",
//                                                   speed: const Duration(
//                                                       milliseconds: 100),
//                                                   textStyle: GoogleFonts
//                                                       .averiaGruesaLibre(
//                                                     fontSize: 22,
//                                                   )),
//                                             ],
//                                           ),
//                                         )
//                                       : Container(),
//                                   showfiv //50000
//                                       ? Container(
//                                           child: AnimatedTextKit(
//                                             // onFinished: () => _talk3(),
//                                             totalRepeatCount: 1,
//                                             repeatForever: false,
//                                             stopPauseOnTap: false,
//                                             animatedTexts: [
//                                               TyperAnimatedText("-3",
//                                                   speed: const Duration(
//                                                       milliseconds: 100),
//                                                   textStyle: GoogleFonts
//                                                       .averiaGruesaLibre(
//                                                     fontSize: 22,
//                                                   )),
//                                             ],
//                                           ),
//                                         )
//                                       : Container(),
//                                   showsix //55000
//                                       ? Container(
//                                           child: AnimatedTextKit(
//                                             // onFinished: () => _talk4(),
//                                             totalRepeatCount: 1,
//                                             repeatForever: false,
//                                             stopPauseOnTap: false,
//                                             animatedTexts: [
//                                               TyperAnimatedText("-2",
//                                                   speed: const Duration(
//                                                       milliseconds: 100),
//                                                   textStyle: GoogleFonts
//                                                       .averiaGruesaLibre(
//                                                     fontSize: 22,
//                                                   )),
//                                             ],
//                                           ),
//                                         )
//                                       : Container(),
//                                   showsev //60000
//                                       ? Container(
//                                           child: AnimatedTextKit(
//                                             // onFinished: () => _talk5(),
//                                             totalRepeatCount: 1,
//                                             repeatForever: false,
//                                             stopPauseOnTap: false,
//                                             animatedTexts: [
//                                               TyperAnimatedText("-1",
//                                                   speed: const Duration(
//                                                       milliseconds: 100),
//                                                   textStyle: GoogleFonts
//                                                       .averiaGruesaLibre(
//                                                     fontSize: 22,
//                                                   )),
//                                             ],
//                                           ),
//                                         )
//                                       : Container(),
//                                 ],
//                               ),
//                               Container(
//                                 child: AnimatedTextKit(
//                                   totalRepeatCount: 1,
//                                   repeatForever: false,
//                                   animatedTexts: [
//                                     TyperAnimatedText(
//                                         "5-4-3-2-1 technique look around and focus on: 5 things you see: Focus on a small object, such as a pencil or coffee mug, and identify every color and shape.Look at the sky for clouds, birds, sunrises, or anything else you can spot around. Look at every little detail on a family photo on the wall.4 things you feel: Focus on how your clothing feels on your body or how your hair feels on your head, Touch the furniture in your living area and focus on its texture.3 things you hear: music, conversation, barking dog, clock ticking2 things you smell: food being cooked, soap or shampoo,1 thing you taste: a mint, coffee, sugar",
//                                         speed:
//                                             const Duration(milliseconds: 100),
//                                         textStyle:
//                                             GoogleFonts.averiaGruesaLibre(
//                                           fontSize: 12,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 // onTap: () => _talk0(),
//                                 child: Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: const Icon(Icons.volume_up),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Container(),

//           ///second
//           shownin
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Container(
//                     width: 370,
//                     height: 240,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset: const Offset(0, 3),
//                           )
//                         ]),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: LottieBuilder.network(
//                               "https://assets6.lottiefiles.com/packages/lf20_uk2qyv3i.json",
//                               height: 120,
//                               width: 150,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 190,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     child: AnimatedTextKit(
//                                       // onFinished: () => _mussle(),
//                                       totalRepeatCount: 1,
//                                       repeatForever: false,
//                                       stopPauseOnTap: false,
//                                       animatedTexts: [
//                                         TyperAnimatedText("Musle Relaxation",
//                                             speed: const Duration(
//                                                 milliseconds: 100),
//                                             textStyle:
//                                                 GoogleFonts.averiaGruesaLibre(
//                                               fontSize: 22,
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 child: AnimatedTextKit(
//                                   totalRepeatCount: 1,
//                                   repeatForever: false,
//                                   animatedTexts: [
//                                     TyperAnimatedText(
//                                         "Use your hand to make a tight fist. Squeeze your fist tightlyHold your squeezed fist for a few seconds. Notice all the tension you feel in your hand.Slowly open your fingers and be aware of how you feel. You may notice a feeling of tension leaving your hand. Eventually, your hand will feel lighter and more relaxed",
//                                         speed:
//                                             const Duration(milliseconds: 100),
//                                         textStyle:
//                                             GoogleFonts.averiaGruesaLibre(
//                                           fontSize: 12,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 // onTap: () => _mussle(),
//                                 child: Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: const Icon(Icons.volume_up),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Container(),

//           ///third
//           showtone
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Container(
//                     width: 370,
//                     height: 240,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset: const Offset(0, 3),
//                           )
//                         ]),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: LottieBuilder.network(
//                               "https://assets5.lottiefiles.com/private_files/lf30_emulvclw.json",
//                               height: 120,
//                               width: 150,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 190,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     child: AnimatedTextKit(
//                                       // onFinished: () => _mindfullness(),
//                                       totalRepeatCount: 1,
//                                       repeatForever: false,
//                                       stopPauseOnTap: false,
//                                       animatedTexts: [
//                                         TyperAnimatedText("Mindfulness",
//                                             speed: const Duration(
//                                                 milliseconds: 100),
//                                             textStyle:
//                                                 GoogleFonts.averiaGruesaLibre(
//                                               fontSize: 22,
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 child: AnimatedTextKit(
//                                   totalRepeatCount: 1,
//                                   repeatForever: false,
//                                   animatedTexts: [
//                                     TyperAnimatedText(
//                                         "Find a quiet and comfortable place to sit and close your eyes.Notice how your breathing and body feel.Now shift your awareness to the sensations you observe in your surroundings. Ask yourself What’s happening outside of my body?Notice what you hear, smell, and feel in your environment.Change your awareness several times from your body to your environment and back again.",
//                                         speed:
//                                             const Duration(milliseconds: 100),
//                                         textStyle:
//                                             GoogleFonts.averiaGruesaLibre(
//                                           fontSize: 12,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 // onTap: () => _mindfullness(),
//                                 child: Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: const Icon(Icons.volume_up),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Container(),
//           // forth exercise
//           showtwo

//               /// 115000
//               ? Padding(
//                   padding: const EdgeInsets.symmetric(vertical: 10),
//                   child: Container(
//                     width: 370,
//                     height: 240,
//                     decoration: BoxDecoration(
//                         color: Colors.white,
//                         borderRadius: BorderRadius.circular(10),
//                         boxShadow: [
//                           BoxShadow(
//                             color: Colors.grey.withOpacity(0.5),
//                             spreadRadius: 3,
//                             blurRadius: 10,
//                             offset: const Offset(0, 3),
//                           )
//                         ]),
//                     child: Row(
//                       children: [
//                         InkWell(
//                           onTap: () {},
//                           child: Container(
//                             alignment: Alignment.center,
//                             child: LottieBuilder.network(
//                               "https://assets2.lottiefiles.com/private_files/lf30_htijkvxe.json",
//                               height: 120,
//                               width: 150,
//                             ),
//                           ),
//                         ),
//                         Container(
//                           width: 190,
//                           child: Column(
//                             crossAxisAlignment: CrossAxisAlignment.start,
//                             mainAxisAlignment: MainAxisAlignment.spaceAround,
//                             children: [
//                               Row(
//                                 children: [
//                                   Container(
//                                     child: AnimatedTextKit(
//                                       // onFinished: () => _meditation(),
//                                       totalRepeatCount: 1,
//                                       repeatForever: false,
//                                       stopPauseOnTap: false,
//                                       animatedTexts: [
//                                         TyperAnimatedText("Meditation",
//                                             speed: const Duration(
//                                                 milliseconds: 100),
//                                             textStyle:
//                                                 GoogleFonts.averiaGruesaLibre(
//                                               fontSize: 22,
//                                             )),
//                                       ],
//                                     ),
//                                   ),
//                                 ],
//                               ),
//                               Container(
//                                 child: AnimatedTextKit(
//                                   totalRepeatCount: 1,
//                                   repeatForever: false,
//                                   animatedTexts: [
//                                     TyperAnimatedText(
//                                         "Sit in a quiet and comfortable place. Put one of your hands on your chest and the other on your stomach. Your stomach should move more than your chest when you breathe in deeply Take a slow and regular breath in through your nose. Watch and sense your hands as you breathe in. The hand on your chest should remain still while the hand on your stomach will move slightly Breathe out through your mouth slowly Repeat this process at least 10 times or until you begin to feel your anxiety lessen",
//                                         speed:
//                                             const Duration(milliseconds: 100),
//                                         textStyle:
//                                             GoogleFonts.averiaGruesaLibre(
//                                           fontSize: 11,
//                                         )),
//                                   ],
//                                 ),
//                               ),
//                               InkWell(
//                                 // onTap: () => _meditation(),
//                                 child: Container(
//                                   alignment: Alignment.bottomLeft,
//                                   child: const Icon(Icons.volume_up),
//                                 ),
//                               ),
//                             ],
//                           ),
//                         )
//                       ],
//                     ),
//                   ),
//                 )
//               : Container(),
//           // fifth exercise
//         ]),
//       ),
//     );
//   }
// }
