import 'package:flutter/material.dart';

// enum Direction { leftRight, rightLeft }

class VerticalWidget extends StatelessWidget {
  final Widget child;

  const VerticalWidget({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return RotatedBox(
      quarterTurns: -1,
      child: child,
    );
  }
}
