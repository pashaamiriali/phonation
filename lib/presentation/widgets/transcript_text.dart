import 'package:flutter/material.dart';

class TranscriptText extends StatelessWidget {
  const TranscriptText({
    super.key, required this.transcript,
  });
final String transcript;
  @override
  Widget build(BuildContext context) {
    return Text(
        transcript,
        style: const TextStyle(
          fontSize: 14,
        ));
  }
}
