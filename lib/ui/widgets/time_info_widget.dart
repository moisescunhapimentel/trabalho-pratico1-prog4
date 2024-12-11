import 'package:flutter/material.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/ui/widgets/vertical_widget.dart';

class TimeInfoWidget extends StatelessWidget {
  final Time time;

  const TimeInfoWidget({super.key, required this.time});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: [
        Expanded(
          child: Text(
            time.nome,
            textAlign: TextAlign.end,
            overflow: TextOverflow.fade,
            style: Theme.of(context).textTheme.headlineLarge!.copyWith(
                  color: Colors.yellow,
                ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text('${time.totalJogadores}',
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(color: Colors.blue[900])),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 10),
          child: VerticalWidget(
            child: Text(
              'jogadores',
              style: TextStyle(fontSize: 10, color: Colors.blue[900]),
            ),
          ),
        ),
      ],
    );
  }
}
