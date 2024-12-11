import 'dart:math';

import 'package:flutter/material.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/models/resultado_set.dart';
import 'package:trabalho1/utils/theme_helper.dart';
import 'package:trabalho1/ui/widgets/letter_widget.dart';

class PartOfBoardPlacarGeralWidget extends StatelessWidget {
  const PartOfBoardPlacarGeralWidget(
      {super.key,
      required this.letter,
      required this.isLeft,
      required this.resultados});

  final List<ResultadoSet> resultados;

  final bool isLeft;
  final String letter;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        LetterWidget(letter: letter),
        ...resultados.map((e) {
          final PontuacaoTime pontuacao;

          if (isLeft) {
            pontuacao = e.pontuacaoA;
          } else {
            pontuacao = e.pontuacaoB;
          }

          final isVencedor =
              max(e.pontuacaoA.pontos, e.pontuacaoB.pontos) == pontuacao.pontos;

          final children = [
            Expanded(
              child: Text(
                pontuacao.time.nome,
                textAlign: TextAlign.center,
              ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 10),
              child: Text(
                '${pontuacao.pontos}',
                style: ThemeHelper.textTheme(context).titleLarge!.copyWith(
                    color: isVencedor ? kPrimaryColor : Colors.yellow),
              ),
            )
          ];

          return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 5),
            child: DefaultTextStyle(
              style: ThemeHelper.textTheme(context)
                  .titleLarge!
                  .copyWith(color: Colors.white),
              child: Row(
                mainAxisAlignment:
                    isLeft ? MainAxisAlignment.end : MainAxisAlignment.start,
                children: isLeft ? children : children.reversed.toList(),
              ),
            ),
          );
        })
      ],
    );
  }
}
