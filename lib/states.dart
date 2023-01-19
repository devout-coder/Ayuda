import 'package:csi_hackathon/navigationpages/screens/statistics.dart';

class States {
  List<String> sentimentDetails = [
    "positive",
    "negative",
    "neutral",
    "positive",
    "neutral",
    "negative",
    "negative",
    "neutral",
    "negative",
    "negative",
    "positive",
    "positive",
    "positive",
    "positive",
    "positive",
    "positive",
    "positive",
    "positive",
    "positive",
    "positive",
    "negative",
  ];
  Map<DateTime, Map<String, int>> activities = {
    DateTime(2023, 1, 16): {"Muscle Relaxation": 500},
    DateTime(2023, 1, 17): {"Mindfulness": 300, "5-4-3-2-1": 500},
    DateTime(2023, 1, 18): {"Mindfulness": 600, "Breathing": 100},
    DateTime(2023, 1, 19): {"Mindfulness": 600, "5-5-5": 100},
  };
  int points = 200;
}
