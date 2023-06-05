import 'package:flutter/material.dart';

class ShowLoadingBeforeWidget extends StatelessWidget {
  const ShowLoadingBeforeWidget(
      {super.key, required this.showLoading, required this.child});

  final bool showLoading;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return showLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : child;
  }
}
