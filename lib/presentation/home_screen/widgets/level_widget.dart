import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/home_screen/widgets/badge_text.dart';

class LevelWidget extends StatelessWidget {
  const LevelWidget({
    super.key, required this.levelTitle, required this.onTap,
  });
  final String levelTitle;
  final Function onTap;
  @override
  Widget build(BuildContext context) {
    return  Material(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        splashColor: Colors.deepPurple,
        highlightColor: surfaceColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        onTap: ()=>onTap(),
        child: Container(
          padding:const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: BadgeText(text: levelTitle),
        ),
      ),
    );

  }
}
