import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/ui/widgets/button_border_widget.dart';

class DialogVitoria extends StatelessWidget {
  const DialogVitoria(
      {super.key, required this.onPressed, required this.winner});

  final Time winner;
  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return Dialog(
      shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(16),
          side: const BorderSide(color: Colors.white, width: 2)),
      elevation: 10,
      backgroundColor: kAccentColor.withOpacity(0.7),
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              'FIM DE SET',
              style: Theme.of(context)
                  .textTheme
                  .titleLarge!
                  .copyWith(color: kPrimaryColor),
              textAlign: TextAlign.center,
            ),
            Text(
              winner.nome,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(color: kPrimaryColor),
              textAlign: TextAlign.center,
            ),
            Padding(
              padding: const EdgeInsets.only(bottom: 10),
              child: Text(
                'VENCEU',
                style: Theme.of(context)
                    .textTheme
                    .titleMedium!
                    .copyWith(color: kPrimaryColor),
                textAlign: TextAlign.end,
              ),
            ),
            Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Padding(
                  padding: const EdgeInsets.only(right: 20),
                  child: ButtonBorderWidget(
                      onPressed: onPressed, text: 'Terminar'),
                ),
                ButtonBorderWidget(
                  onPressed: onPressed,
                  text: 'Novo Set',
                  textColor: Colors.yellow,
                ),
              ],
            ),
          ]
              .map(
                (e) => Flexible(child: e),
              )
              .toList(),
        ),
      ),
    );
  }
}
