import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';

class HighlightableText extends StatelessWidget {
  const HighlightableText({
    super.key,
    required this.text,
    required this.highlight,
  });

  final String text;
  final String highlight;

  @override
  Widget build(BuildContext context) {
    List<String> splitted = text.split(highlight);
    String beforeHighlight = "";
    String afterHighlight = "";
    if (highlight.length == 1) {
      afterHighlight = splitted[0];
    } else {
      beforeHighlight = splitted[0];
      splitted.removeAt(0);
      afterHighlight = splitted.join(' ');
    }
    if(highlight.isEmpty){
      beforeHighlight=text;
      afterHighlight='';
    }
    return Text.rich(TextSpan(
        style: const TextStyle(
          color: Colors.black,
          fontSize: 16,
          fontWeight: FontWeight.w500,
        ),
        children: [
          TextSpan(text: beforeHighlight),
          TextSpan(
              text: highlight,
              style: const TextStyle(
                backgroundColor: activeColor,
              )),
          TextSpan(text: afterHighlight),
        ]));
  }
}
