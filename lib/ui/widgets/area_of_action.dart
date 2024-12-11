import 'package:flutter/material.dart';
import 'package:trabalho1/enums/tipo_ponto.dart';
import 'package:trabalho1/models/rodada.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/ui/widgets/action_button_widget.dart';

class AreaOfAction extends StatelessWidget {
  final CrossAxisAlignment crossAxisAlignment;
  final Time time;

  const AreaOfAction({
    super.key,
    required this.crossAxisAlignment,
    required this.addPoint,
    required this.time,
  });

  final void Function(Rodada rodada) addPoint;

  @override
  Widget build(BuildContext context) {
    final textDirection = _getTextDirectionByCrossAxisAlignment();
    final pointTypes = TipoPonto.values.asNameMap();

    final pointTypeKeys = pointTypes.keys.toList()..sort();

    return Column(
      crossAxisAlignment: crossAxisAlignment,
      mainAxisAlignment: MainAxisAlignment.end,
      children: pointTypeKeys
          .map(
            (e) => Flexible(
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: ActionButton(
                  text: pointTypes[e]!.name.toUpperCase(),
                  textDirection: textDirection,
                  voidCallback: () => addPoint(
                      Rodada(timePontuador: time, tipoPonto: pointTypes[e]!)),
                ),
              ),
            ),
          )
          .toList(),
    );
  }

  TextDirection _getTextDirectionByCrossAxisAlignment() {
    if (crossAxisAlignment == CrossAxisAlignment.start) {
      return TextDirection.ltr;
    } else {
      return TextDirection.rtl;
    }
  }
}
