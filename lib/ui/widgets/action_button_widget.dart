import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/utils/theme_helper.dart';

class ActionButton extends StatelessWidget {
  final String text;
  final TextDirection textDirection;
  final VoidCallback voidCallback;

  const ActionButton({
    super.key,
    required this.text,
    required this.textDirection,
    required this.voidCallback,
  });

  @override
  Widget build(BuildContext context) {
    return Wrap(
        alignment: WrapAlignment.center,
        crossAxisAlignment: WrapCrossAlignment.center,
        textDirection: textDirection,
        children: [
          Padding(
            padding: EdgeInsets.only(
              left: textDirection == TextDirection.ltr ? 0 : 10,
              right: textDirection == TextDirection.rtl ? 0 : 10,
            ),
            child: IconButton(
              style: const ButtonStyle(
                  backgroundColor: WidgetStatePropertyAll(kPrimaryColor)),
              icon: const Icon(
                Icons.add,
                color: Colors.white,
              ),
              onPressed: voidCallback,
            ),
          ),
          Text(
            text,
            style: ThemeHelper.textTheme(context)
                .displaySmall!
                .copyWith(color: Colors.white),
          )
        ]);
  }
}
