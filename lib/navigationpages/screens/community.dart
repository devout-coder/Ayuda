import 'package:csi_hackathon/models/components/body.dart';
import 'package:flutter/material.dart';

class CommunityScreen extends StatelessWidget {
  const CommunityScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: buildAppBar(),
      body: const Body(),
      backgroundColor: Color.fromRGBO(186, 229, 244, 1),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Color.fromRGBO(8, 8, 8, 1),
        onPressed: () {},
        child: const Icon(
          Icons.person_add_alt_1,
          color: Color.fromRGBO(226, 210, 254, 1),
        ),
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      backgroundColor: Color.fromRGBO(186, 229, 244, 1),
      automaticallyImplyLeading: false,
      elevation: 0.0,
      title: const Text(
        "Community",
        style: TextStyle(
            fontSize: 22,
            color: Color.fromRGBO(
              8,
              8,
              8,
              1,
            ),
            fontWeight: FontWeight.bold),
      ),
      actions: [
        IconButton(
          color: Color.fromRGBO(
            8,
            8,
            8,
            1,
          ),
          onPressed: () {},
          icon: const Icon(Icons.search),
        ),
      ],
    );
  }
}
