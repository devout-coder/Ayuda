import 'package:flutter/material.dart';

import 'components/boody.dart';

class MessagesScreen extends StatelessWidget {
  const MessagesScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: const Boody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: const Color.fromRGBO(186, 229, 244, 1),
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const SizedBox(
            width: 4,
          ),
          const CircleAvatar(
            backgroundImage: AssetImage("assets/mindfullGreen.png"),
          ),
          const SizedBox(width: 16 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Text(
                "Mindfull Green",
                style: TextStyle(fontSize: 16),
              ),
              Row(
                children: [
                  const Text(
                    "no.of people active ",
                    style: TextStyle(fontSize: 9),
                  ),
                  Container(
                    height: 14,
                    width: 14,
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Colors.greenAccent),
                    child: const Text(
                      "19",
                      style: TextStyle(fontSize: 10),
                    ),
                  ),
                ],
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
        const SizedBox(width: 8),
      ],
    );
  }
}
