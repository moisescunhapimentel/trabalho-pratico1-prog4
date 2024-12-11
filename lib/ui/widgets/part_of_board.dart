import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';

class PartOfBoard extends StatelessWidget {
  final Widget child;
  const PartOfBoard({super.key, required this.child});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: kBoard,
        border: Border.all(color: Colors.white, width: 3),
      ),
      child: child,
    );
  }
}
