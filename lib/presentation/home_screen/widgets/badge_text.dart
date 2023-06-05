import 'package:flutter/material.dart';

class BadgeText extends StatelessWidget {
  const BadgeText({
    super.key, required this.text,
  });
final String text;
  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
    );
  }
}
