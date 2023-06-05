import 'package:flutter/material.dart';
import 'package:phonation/presentation/design_constants.dart';

class GeneralAppBar extends StatelessWidget {
  const GeneralAppBar({
    super.key, required this.appBarTitle,
  });
  final String appBarTitle;
  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return SafeArea(
      child: Container(
        height: 70,
        width: screenSize.width,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              const Color(0xffDFD8E5),
              const Color(0xffDFD8E5).withOpacity(0),
            ],
          ),
        ),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Align(
              alignment: Alignment.centerLeft,
              child: IconButton(
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                  icon: const Icon(
                    Icons.arrow_back_ios_rounded,
                    color: mainColor,
                    size: 32,
                  )),
            ),
            Align(
                alignment: Alignment.center,
                child: Text(appBarTitle,
                    style: const TextStyle(
                        color: mainColor,
                        fontWeight: FontWeight.bold,
                        fontSize: 26))),
          ],
        ),
      ),
    );
  }
}
