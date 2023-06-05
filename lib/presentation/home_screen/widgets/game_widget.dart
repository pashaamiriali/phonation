import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';
import 'package:phonation/presentation/widgets/large_title.dart';

class GameWidget extends StatelessWidget {
  const GameWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
        color: surfaceColor,
      ),
      child: const Center(child: LargeTitle(text: "Play A Game")),
    );
  }
}
