import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';

class CustomTouchable extends StatelessWidget {
   const CustomTouchable({
    super.key,
     this.radius=0,
     this.padding=8,
     this.surface=surfaceColor,
    required this.onTap, required this.child,
  });

  final double radius;
  final double padding;
  final Function onTap;
  final Widget child;
  final Color surface;
  @override
  Widget build(BuildContext context) {
    return   Material(
      color: surface,
      borderRadius: BorderRadius.circular(radius),
      child: InkWell(
        onTap: () => onTap(),
        splashColor: Colors.deepPurple,
        highlightColor: surface.withOpacity(0.8),
        borderRadius: BorderRadius.circular(radius),
        child: Padding(
          padding: EdgeInsets.all(padding),
          child: child,
        ),
      ),
    );
  }
}
