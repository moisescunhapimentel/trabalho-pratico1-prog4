import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/utils/theme_helper.dart';

class LetterWidget extends StatelessWidget {
  const LetterWidget({super.key, required this.letter});

  final String letter;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(10),
      decoration: const BoxDecoration(
        shape: BoxShape.circle,
        color: kAccentColor,
      ),
      child: Text(
        letter,
        style: ThemeHelper.textTheme(context)
            .titleLarge!
            .copyWith(color: kPrimaryColor),
        strutStyle: const StrutStyle(leading: 1),
      ),
    );
  }
}
