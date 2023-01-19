import 'package:flutter/material.dart';

import 'components/boody.dart';

class MessagesScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(context),
      body: Boody(),
    );
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      automaticallyImplyLeading: false,
      title: Row(
        children: [
          const BackButton(),
          const CircleAvatar(
            backgroundImage: AssetImage(""),
          ),
          const SizedBox(width: 16 * 0.75),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Kristin Watson",
                style: TextStyle(fontSize: 16),
              ),
              Text(
                "Active 3m ago",
                style: TextStyle(fontSize: 12),
              )
            ],
          )
        ],
      ),
      actions: [
        IconButton(icon: const Icon(Icons.local_phone), onPressed: () {}),
        IconButton(icon: const Icon(Icons.videocam), onPressed: () {}),
        const SizedBox(width: 16 / 2),
      ],
    );
  }
}
