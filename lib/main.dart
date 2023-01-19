import 'package:csi_hackathon/navigationpages/bottom_navigationpage.dart';
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
      debugShowCheckedModeBanner: false,
      title: 'Csi walo ko chutiya banana hai',
      theme: ThemeData(
        primarySwatch: Colors.orange,
      ),
      home: const BpNavigation(),
    );
  }
}
