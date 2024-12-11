import 'package:flutter/material.dart';
import 'package:trabalho1/utils/theme_helper.dart';

class CurrentScoringAreaWidget extends StatelessWidget {
  const CurrentScoringAreaWidget(
      {super.key, required this.isBallVisible, required this.score});
  final bool isBallVisible;
  final int score;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Visibility(
          visible: isBallVisible,
          maintainSize: true,
          maintainAnimation: true,
          maintainState: true,
          child: Image.asset('images/volleyball.png'),
        ),
        Text(
          '$score',
          style: ThemeHelper.textTheme(context)
              .displayLarge!
              .copyWith(color: Colors.white),
        )
      ]
          .map(
            (e) => Flexible(child: e),
          )
          .toList(),
    );
  }
}
