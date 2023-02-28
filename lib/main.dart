import 'package:csi_hackathon/navigationpages/bottom_navigationpage.dart';
import 'package:csi_hackathon/states_init.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Ayuda',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Kicking everyone\'s ass'),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

Future registerDB() async {
  await GetItRegister().initializeGlobalStates();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomInset: false,
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
        child: FutureBuilder(
          future: registerDB(),
          builder: ((context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              return BpNavigation();
            } else {
              return const Center(child: CircularProgressIndicator());
            }
          }),
        ),
      ),
    );
  }
}
