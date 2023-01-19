import 'package:flutter/material.dart';

class ChatInputField extends StatelessWidget {
  const ChatInputField({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      decoration: BoxDecoration(
        color: Colors.blue,
        boxShadow: [
          BoxShadow(
              offset: Offset(0, 4),
              blurRadius: 32,
              color: Colors.grey.withOpacity(0.08)),
        ],
      ),
      child: SafeArea(
        child: Row(
          children: [
            const Icon(
              Icons.mic,
              color: Colors.green,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: Container(
                height: 50,
                decoration: BoxDecoration(
                  color: Colors.grey.withOpacity(0.05),
                  borderRadius: BorderRadius.circular(40),
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.sentiment_satisfied_alt_outlined,
                      color: Colors.yellow,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Expanded(
                      child: TextField(
                        decoration: InputDecoration(
                          hintText: "Type Message",
                          border: InputBorder.none,
                        ),
                      ),
                    ),
                    Icon(
                      Icons.attach_file,
                      color: Colors.green,
                    ),
                    SizedBox(
                      width: 4,
                    ),
                    Icon(
                      Icons.camera_alt_outlined,
                      color: Colors.green,
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
