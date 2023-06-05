import 'package:flutter/material.dart';

class LargeTitle extends StatelessWidget {
  const LargeTitle({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(
          fontWeight: FontWeight.bold, fontSize: 26, color: Colors.black87),
    );
  }
}
