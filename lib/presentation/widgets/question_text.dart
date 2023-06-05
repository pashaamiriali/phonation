import 'package:flutter/material.dart';

class QuestionText extends StatelessWidget {
  const QuestionText({super.key, required this.text});

  final String text;

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          color: Colors.black, fontWeight: FontWeight.w500, fontSize: 16),
    );
  }
}
