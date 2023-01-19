import 'package:csi_hackathon/models/commmunitymessage.dart';

import 'package:flutter/material.dart';

import 'chat_input_f.dart';
import 'messsage.dart';

class Boody extends StatelessWidget {
  const Boody({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
            child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 16),
          child: ListView.builder(
            itemCount: demeChatMessages.length,
            itemBuilder: (context, index) => Message(
              message: demeChatMessages[index],
            ),
          ),
        )),
        const ChatInputField()
      ],
    );
  }
}
