import 'dart:convert';
import 'dart:math';

import 'package:csi_hackathon/navigationpages/screens/statistics.dart';
import 'package:csi_hackathon/states.dart';
import 'package:flutter/material.dart';
import 'package:dart_sentiment/dart_sentiment.dart';
import 'package:get_it/get_it.dart';
import 'package:http/http.dart' as http;

class ChatScreen extends StatefulWidget {
  const ChatScreen({super.key});

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class ChatMessage {
  String messageContent;
  String messageType;
  ChatMessage({required this.messageContent, required this.messageType});
}

List<ChatMessage> messages = [
  ChatMessage(
    messageContent: "Hey, how have you been?",
    messageType: "receiver",
  ),
];

List<String> positiveResponses = [
  "Thats great!",
  "That's awesome!",
  "Wow!",
  "That's amazing!",
  "That's so cool!",
  "That's so nice!",
  "Wonderful",
  "I hope I keep hearing this from you",
  "Thats superb",
  "I'm happy for you",
];

List<String> neutralResponses = [
  "Oh",
  "Ok",
  "Hmmm",
  "I hear you",
  "I see",
  "Yeah",
];

List<String> negativeResponses = [
  "Oh damn, have you considered taking a walk, that will make you feel better",
  "That's sad. There are things you can do to feel better. Try having your favourite food for example",
  "I'm sorry to hear that. How about giving yourself a nice break from your work?",
  "I hope you feel better. I'm here for you",
  "Oh thats bad. Try reading your favourite book and sipping some cappuccino.",
  "I hope things improve. Why don't you try watching your favourite movie?",
  "Things are definitely gonna get better. For now how about reconnecting with your loved ones?",
];

Future<String> anaylzeSentence(String sentence) async {
  debugPrint("i hope this works");
  http.Response res = await http.post(
    Uri.parse('https://api.apilayer.com/sentiment/analysis'),
    headers: {"apikey": "lJpahHrSBowSPANV26mQ1jyyoRf9VTz0"},
    body: sentence,
  );
  var decodedResponse = jsonDecode(utf8.decode(res.bodyBytes)) as Map;
  debugPrint(decodedResponse.toString());
  return decodedResponse["sentiment"];
}

class _ChatScreenState extends State<ChatScreen> {
  late TextEditingController _controller;
  ScrollController _mainController = ScrollController();
  States states = GetIt.I.get();
  @override
  void initState() {
    _controller = TextEditingController();
    super.initState();
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        children: <Widget>[
          Container(
            height: MediaQuery.of(context).size.height * 0.8,
            child: SingleChildScrollView(
              controller: _mainController,
              child: ListView.builder(
                itemCount: messages.length,
                shrinkWrap: true,
                padding: EdgeInsets.only(top: 10, bottom: 10),
                physics: NeverScrollableScrollPhysics(),
                itemBuilder: (context, index) {
                  return Container(
                    padding: EdgeInsets.only(
                        left: 14, right: 14, top: 10, bottom: 10),
                    child: Align(
                      alignment: (messages[index].messageType == "receiver"
                          ? Alignment.topLeft
                          : Alignment.topRight),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          color: (messages[index].messageType == "receiver"
                              ? Colors.grey.shade200
                              : Colors.blue[200]),
                        ),
                        padding: EdgeInsets.all(16),
                        child: Text(
                          messages[index].messageContent,
                          style: TextStyle(fontSize: 15),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          Align(
            alignment: Alignment.bottomLeft,
            child: Container(
              padding: EdgeInsets.only(left: 10, bottom: 10, top: 10),
              height: 60,
              width: double.infinity,
              color: Colors.white,
              child: Row(
                children: <Widget>[
                  SizedBox(
                    width: 15,
                  ),
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      decoration: InputDecoration(
                          hintText: "Write message...",
                          hintStyle: TextStyle(color: Colors.black54),
                          border: InputBorder.none),
                    ),
                  ),
                  SizedBox(
                    width: 15,
                  ),
                  FloatingActionButton(
                    onPressed: () async {
                      String query = _controller.text;
                      _controller.text = "";
                      ChatMessage newMessage = ChatMessage(
                          messageContent: query, messageType: "sender");
                      List<ChatMessage> newMessages = [...messages, newMessage];
                      setState(() {
                        messages = newMessages;
                      });

                      // _scrollController.animateTo(
                      //     _scrollController.position.maxScrollExtent,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.ease);

                      // _mainController.animateTo(
                      //     _mainController.position.maxScrollExtent,
                      //     duration: Duration(milliseconds: 500),
                      //     curve: Curves.ease);
                      String sentiment = await anaylzeSentence(query);

                      final random = new Random();
                      if (sentiment == "positive") {
                        var i = random.nextInt(positiveResponses.length);
                        ChatMessage newMessage = ChatMessage(
                            messageContent: positiveResponses[i],
                            messageType: "receiver");
                        List<ChatMessage> newMessages = [
                          ...messages,
                          newMessage
                        ];
                        SentimentDetails sentimentDetails =
                            SentimentDetails("positive");
                        states.sentimentDetails = [
                          ...states.sentimentDetails,
                          sentimentDetails
                        ];
                        setState(() {
                          messages = newMessages;
                        });
                      } else if (sentiment == "negative") {
                        var i = random.nextInt(negativeResponses.length);
                        ChatMessage newMessage = ChatMessage(
                            messageContent: negativeResponses[i],
                            messageType: "receiver");
                        List<ChatMessage> newMessages = [
                          ...messages,
                          newMessage
                        ];
                        SentimentDetails sentimentDetails =
                            SentimentDetails("negative");
                        states.sentimentDetails = [
                          ...states.sentimentDetails,
                          sentimentDetails
                        ];
                        setState(() {
                          messages = newMessages;
                        });
                      } else if (sentiment == "neutral") {
                        var i = random.nextInt(neutralResponses.length);
                        ChatMessage newMessage = ChatMessage(
                            messageContent: neutralResponses[i],
                            messageType: "receiver");
                        List<ChatMessage> newMessages = [
                          ...messages,
                          newMessage
                        ];
                        SentimentDetails sentimentDetails =
                            SentimentDetails("neutral");
                        states.sentimentDetails = [
                          ...states.sentimentDetails,
                          sentimentDetails
                        ];
                        setState(() {
                          messages = newMessages;
                        });
                      }
                      _mainController.animateTo(
                          _mainController.position.maxScrollExtent,
                          duration: Duration(milliseconds: 500),
                          curve: Curves.ease);
                      FocusManager.instance.primaryFocus?.unfocus();
                    },
                    child: Icon(
                      Icons.send,
                      color: Colors.white,
                      size: 18,
                    ),
                    backgroundColor: Colors.blue,
                    elevation: 0,
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
