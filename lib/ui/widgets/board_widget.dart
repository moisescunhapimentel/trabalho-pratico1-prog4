import 'package:flutter/material.dart';
import 'package:trabalho1/ui/widgets/part_of_board.dart';

class BoardWidget extends StatelessWidget {
  const BoardWidget(
      {super.key,
      required this.leftBoard,
      required this.rightBoard,
      CrossAxisAlignment? crossAxisAlignment})
      : crossAxisAlignment = crossAxisAlignment ?? CrossAxisAlignment.center;

  final CrossAxisAlignment crossAxisAlignment;
  final Widget leftBoard;
  final Widget rightBoard;

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: crossAxisAlignment,
      children: [
        PartOfBoard(
          child: leftBoard,
        ),
        PartOfBoard(
          child: rightBoard,
        ),
      ]
          .map(
            (e) => Expanded(child: e),
          )
          .toList(),
    );
  }
}
