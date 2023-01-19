import 'package:csi_hackathon/models/components/button.dart';
import 'package:csi_hackathon/models/components/chat_card.dart';
import 'package:csi_hackathon/navigationpages/screens/messages/messages.dart';
import 'package:flutter/material.dart';

import '../commmunitychat.dart';

class Body extends StatelessWidget {
  const Body({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
          color: Colors.orange,
          child: Row(
            // ignore: prefer_const_literals_to_create_immutables
            children: [
              FillOutlineButton(
                press: () {},
                text: "Recent Message",
              ),
              const SizedBox(
                width: 15,
              ),
              FillOutlineButton(
                press: () {},
                text: "Active",
              ),
            ],
          ),
        ),
        Expanded(
          child: ListView.builder(
            itemCount: chatsData.length,
            itemBuilder: (context, index) => ChatCard(
              chat: chatsData[index],
              press: () => Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => MessagesScreen(),
                ),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
