import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  final String message;
  const ChatBubble({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    Color kgry = Colors.blue;

    return Align(
      alignment: Alignment.centerLeft,
      child: Container(
        // alignment: Alignment.centerLeft,
        margin: const EdgeInsets.only(left: 12, top: 10, bottom: 10, right: 60),
        padding:
            const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
        // height: 70,
        // width: 150,
        decoration: BoxDecoration(
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20),
                bottomRight: Radius.circular(20)),
            color: kgry),
        child: AnimatedTextKit(
          animatedTexts: [
            TyperAnimatedText(message,
                textStyle: const TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                ),
                speed: const Duration(milliseconds: 90)),
          ],
          totalRepeatCount: 1,
        ),
      ),
    );
  }
}

class ChatBubbleFriend extends StatelessWidget {
  final String message;
  const ChatBubbleFriend({
    required this.message,
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.centerRight,
      child: Container(
          // alignment: Alignment.centerLeft,
          margin: const EdgeInsets.symmetric(horizontal: 12, vertical: 10),
          padding:
              const EdgeInsets.only(left: 10, top: 10, bottom: 10, right: 10),
          // height: 70,
          // width: 150,
          decoration: BoxDecoration(
              borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(20),
                  topRight: Radius.circular(20),
                  bottomLeft: Radius.circular(20)),
              color: Colors.grey.shade200),
          child: Text(
            message,
            style: const TextStyle(
              color: Colors.black,
            ),
          )),
    );
  }
}
