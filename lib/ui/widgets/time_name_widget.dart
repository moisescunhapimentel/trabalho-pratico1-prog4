import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/utils/theme_helper.dart';
import 'package:trabalho1/ui/widgets/letter_widget.dart';

class TimeNameWidget extends StatelessWidget {
  final Time time;
  final String letter;

  const TimeNameWidget({
    super.key,
    required this.time,
    required this.letter,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        LetterWidget(
          letter: letter,
        ),
        Text(
          time.nome,
          style: ThemeHelper.textTheme(context)
              .titleLarge!
              .copyWith(color: kPrimaryColor),
        ),
      ],
    );
  }
}
