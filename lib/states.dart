import 'package:csi_hackathon/navigationpages/screens/statistics.dart';

class States {
  List<SentimentDetails> sentimentDetails = [
    SentimentDetails("positive"),
    SentimentDetails("negative"),
    SentimentDetails("positive"),
    SentimentDetails("positive"),
    SentimentDetails("positive"),
    SentimentDetails("negative"),
    SentimentDetails("negative"),
    SentimentDetails("positive"),
    SentimentDetails("negative"),
    SentimentDetails("negative"),
    SentimentDetails("positive"),
    SentimentDetails("negative"),
  ];
  Map<DateTime, List<String>> activities = {
    DateTime(2023, 1, 19): ["Mindfulness", "Muscle Relaxation"],
    DateTime(2023, 1, 19): ["Muscle Relaxation"],
    DateTime(2023, 1, 19): ["Mindfulness"],
  };
  int points = 200;
}
