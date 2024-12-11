import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';

class ButtonBorderWidget extends StatelessWidget {
  const ButtonBorderWidget(
      {super.key, required this.onPressed, required this.text, this.textColor});

  final VoidCallback onPressed;
  final String text;
  final Color? textColor;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
          backgroundColor: const WidgetStatePropertyAll(kPrimaryColor),
          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
              side: const BorderSide(color: Colors.white, width: 3)))),
      onPressed: onPressed,
      child: Text(
        text,
        style: Theme.of(context)
            .textTheme
            .displaySmall!
            .copyWith(color: textColor ?? Colors.white),
        textAlign: TextAlign.center,
        strutStyle: const StrutStyle(leading: 1),
      ),
    );
  }
}
