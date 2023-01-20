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
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.teal,
      ),
      home: const MyHomePage(title: 'Kicking everyone\'s ass'),
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
    return MaterialApp(
      home: FutureBuilder(
        future: registerDB(),
        builder: ((context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done) {
            return SafeArea(child: BpNavigation());
          } else {
            return const Center(child: CircularProgressIndicator());
          }
        }),
      ),
      debugShowCheckedModeBanner: false,
    );
  }
}
