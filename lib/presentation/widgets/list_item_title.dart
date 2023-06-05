import 'package:flutter/material.dart';

class ListItemTitle extends StatelessWidget {
  final String text;
  const ListItemTitle({super.key, required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(text, style: const TextStyle(fontSize: 18, fontFamily: 'Merriweather'),);
  }
}
