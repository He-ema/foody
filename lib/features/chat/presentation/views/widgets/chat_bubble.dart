import 'package:flutter/material.dart';
import 'package:foody/constants.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble({super.key, this.isSender = true, required this.text});
  final String text;
  final bool isSender;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 20, horizontal: 10),
      margin: const EdgeInsets.symmetric(vertical: 5),
      decoration: BoxDecoration(
        // color: isSender ? Colors.blue : kPrimaryColor,
        gradient: isSender
            ? LinearGradient(
                colors: [kPrimaryColor, Colors.blue.shade300],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight)
            : LinearGradient(
                colors: [Colors.grey, Colors.grey.shade700],
                begin: Alignment.centerLeft,
                end: Alignment.centerRight),

        borderRadius: BorderRadius.only(
          topLeft: const Radius.circular(15),
          topRight: const Radius.circular(15),
          bottomRight:
              isSender ? const Radius.circular(15) : const Radius.circular(0),
          bottomLeft:
              isSender ? const Radius.circular(0) : const Radius.circular(15),
        ),
      ),
      child: Text(
        text,
        style: TextStyle(color: Colors.white, fontSize: 15),
      ),
    );
  }
}
