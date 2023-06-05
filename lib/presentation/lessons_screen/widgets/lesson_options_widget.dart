import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/home_screen/widgets/badge_text.dart';

class LessonOptionsWidget extends StatelessWidget {
  const LessonOptionsWidget({
    super.key,
    required this.optionNameTitle,
    required this.onTap,
    required this.optionIcon,
  });

  final String optionNameTitle;
  final IconData optionIcon;
  final Function onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      color: surfaceColor,
      borderRadius: BorderRadius.circular(15),
      child: InkWell(
        splashColor: Colors.deepPurple,
        highlightColor: surfaceColor.withOpacity(0.8),
        borderRadius: BorderRadius.circular(15),
        onTap: () => onTap(),
        child: Container(
          padding: const EdgeInsets.symmetric(vertical: 8, horizontal: 12),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Icon(
                optionIcon,
                color: mainColor,
              ),
              const SizedBox(
                width: 8,
              ),
              BadgeText(text: optionNameTitle),
            ],
          ),
        ),
      ),
    );
  }
}
