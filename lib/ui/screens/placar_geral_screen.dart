import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/models/resultado_set.dart';
import 'package:trabalho1/models/tempo.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/utils/orientation_manager.dart';
import 'package:trabalho1/utils/theme_helper.dart';
import 'package:trabalho1/ui/widgets/board_widget.dart';
import 'package:trabalho1/ui/widgets/device_orientation_state.dart';
import 'package:trabalho1/ui/widgets/part_of_board_placar_geral_widget.dart';

class PlacarGeralScreen extends StatefulWidget {
  const PlacarGeralScreen({super.key});

  @override
  State<PlacarGeralScreen> createState() => _PlacarGeralScreenState();
}

class _PlacarGeralScreenState
    extends DeviceOrientationState<PlacarGeralScreen> {
  @override
  Widget build(BuildContext context) {
    final tempos = [
      Tempo(minuto: 24, segundo: 90),
      Tempo(minuto: 14, segundo: 23),
      Tempo(minuto: 35, segundo: 04),
      Tempo(minuto: 11, segundo: 29),
    ];

    final ziraldosTime = Time(nome: 'Ziraldos', totalJogadores: 4);
    final sparringsTime = Time(nome: 'Sparrings', totalJogadores: 4);
    final sicranosTime = Time(nome: 'Sicranos', totalJogadores: 4);
    final autoconvidadosTime = Time(nome: 'Autoconvidados', totalJogadores: 4);

    final resultadosSet = [
      ResultadoSet(
          pontuacaoA: PontuacaoTime(time: ziraldosTime, pontos: 25),
          pontuacaoB: PontuacaoTime(time: sparringsTime, pontos: 10)),
      ResultadoSet(
          pontuacaoA: PontuacaoTime(time: ziraldosTime, pontos: 25),
          pontuacaoB: PontuacaoTime(time: sicranosTime, pontos: 10)),
      ResultadoSet(
          pontuacaoA: PontuacaoTime(time: ziraldosTime, pontos: 10),
          pontuacaoB: PontuacaoTime(time: autoconvidadosTime, pontos: 25)),
      ResultadoSet(
          pontuacaoA: PontuacaoTime(time: sparringsTime, pontos: 25),
          pontuacaoB: PontuacaoTime(time: autoconvidadosTime, pontos: 10)),
    ];

    final pontuacoesFinais = [
      PontuacaoTime(time: ziraldosTime, pontos: 3),
      PontuacaoTime(time: sicranosTime, pontos: 1),
      PontuacaoTime(time: autoconvidadosTime, pontos: 8),
      PontuacaoTime(time: sparringsTime, pontos: 10),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            icon: const Icon(Icons.arrow_back),
            color: Colors.white,
            onPressed: () {
              Navigator.pop(context);
            },
          ),
          centerTitle: true,
          elevation: 0,
          backgroundColor: Colors.transparent,
          actions: [
            IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bar_chart,
                  color: Colors.white,
                ))
          ],
          title: Text(
            'PLACAR GERAL',
            style: const TextStyle().copyWith(color: kPrimaryColor),
          ),
        ),
        body: Column(
          children: [
            Expanded(
                flex: 75,
                child: Row(
                  children: [
                    Expanded(
                        flex: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: List.generate(
                            4,
                            (index) => const Icon(
                              Icons.bar_chart,
                              color: Colors.white,
                              size: 30,
                            ),
                          )
                              .map(
                                (e) => Flexible(child: e),
                              )
                              .toList(),
                        )),
                    Expanded(
                      flex: 50,
                      child: BoardWidget(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        leftBoard: PartOfBoardPlacarGeralWidget(
                          letter: 'A',
                          isLeft: true,
                          resultados: resultadosSet,
                        ),
                        rightBoard: PartOfBoardPlacarGeralWidget(
                          letter: 'B',
                          isLeft: false,
                          resultados: resultadosSet,
                        ),
                      ),
                    ),
                    Expanded(
                        flex: 25,
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: tempos
                              .map(
                                (e) => Flexible(
                                  child: RichText(
                                      text: TextSpan(
                                          text:
                                              '0:${_formatNumber(e.minuto)}\'',
                                          style: ThemeHelper.textTheme(context)
                                              .titleLarge!
                                              .copyWith(color: Colors.white),
                                          children: [
                                        TextSpan(
                                            text:
                                                '${_formatNumber(e.segundo)}\'\'',
                                            style:
                                                ThemeHelper.textTheme(context)
                                                    .titleSmall!
                                                    .copyWith(
                                                        color: Colors.white))
                                      ])),
                                ),
                              )
                              .toList(),
                        )),
                  ],
                )),
            const Spacer(
              flex: 5,
            ),
            Expanded(
              flex: 20,
              child: Container(
                  width: double.infinity,
                  margin: const EdgeInsets.only(bottom: 10),
                  padding: const EdgeInsets.symmetric(horizontal: 40),
                  decoration: const BoxDecoration(
                    color: Colors.white30,
                    border: Border.symmetric(
                        horizontal: BorderSide(
                            color: Colors.white70,
                            width: 3,
                            style: BorderStyle.solid)),
                  ),
                  child: ListView.builder(
                    itemCount: pontuacoesFinais.length,
                    scrollDirection: Axis.horizontal,
                    itemBuilder: (context, index) {
                      return DefaultTextStyle(
                          style: ThemeHelper.textTheme(context)
                              .displaySmall!
                              .copyWith(color: Colors.white),
                          child: Row(
                            mainAxisSize: MainAxisSize.min,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding:
                                    EdgeInsets.only(left: index == 0 ? 0 : 50),
                                child: Text(
                                    '${pontuacoesFinais[index].time.nome}: '),
                              ),
                              Padding(
                                padding: const EdgeInsets.only(left: 10),
                                child: Text(
                                  '${pontuacoesFinais[index].pontos}',
                                  style: const TextStyle(color: kPrimaryColor),
                                ),
                              ),
                            ],
                          ));
                    },
                  )),
            ),
          ],
        ),
      ),
    );
  }

  String _formatNumber(int number) {
    return number.toString().padLeft(2, '0');
  }

  @override
  List<DeviceOrientation> get orientations =>
      DeviceOrientationManager.landscapeMode;
}
