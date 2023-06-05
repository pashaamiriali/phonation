import 'package:flutter/material.dart';

class BackgroundWidget extends StatelessWidget {
  const BackgroundWidget({
    super.key, required this.foreground,

  });

final Widget foreground;

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    String backgroundAsset = 'assets/img/background.png';
    if ((screenSize.height / screenSize.width) < 1.9) {
      backgroundAsset = 'assets/img/background_small.png';
    }
    return Stack(
      children: [
        Container(
          width: screenSize.width,
          height: screenSize.height,
          decoration: BoxDecoration(
            image: DecorationImage(
              image: AssetImage(backgroundAsset),
              fit: BoxFit.cover,
            ),
          ),
        ),
       foreground,
      ],
    );
  }
}
