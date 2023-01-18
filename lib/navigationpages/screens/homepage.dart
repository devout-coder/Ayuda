import 'package:csi_hackathon/navigationpages/screens/Breathing.dart';
import 'package:csi_hackathon/navigationpages/screens/Mindfulness.dart';
import 'package:csi_hackathon/navigationpages/screens/MuscleRelaxation.dart';
import 'package:flutter/material.dart';

class ActivitivesPage extends StatefulWidget {
  const ActivitivesPage({super.key});

  @override
  State<ActivitivesPage> createState() => _ActivitivesPageState();
}

class _ActivitivesPageState extends State<ActivitivesPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Breathing()),
                );
              },
              child: Text("Breathing"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Mindfulness()),
                );
              },
              child: Text("Mindfulness"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => const MuscleRelaxation()),
                );
              },
              child: Text("Muscle Relaxation"),
            ),
            TextButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => const Breathing()),
                );
              },
              child: Text("Breathing"),
            ),
          ],
        ),
      ),
    );
  }
}
