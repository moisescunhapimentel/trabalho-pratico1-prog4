import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabalho1/models/partida.dart';
import 'package:trabalho1/models/rodada.dart';
import 'package:trabalho1/ui/widgets/area_of_action.dart';
import 'package:trabalho1/ui/widgets/board_widget.dart';
import 'package:trabalho1/ui/widgets/current_scoring_area_widget.dart';
import 'package:trabalho1/ui/widgets/dialog_vitoria.dart';
import 'package:trabalho1/ui/widgets/time_name_widget.dart';

class PartidaScreen extends StatefulWidget {
  final Partida partida;

  const PartidaScreen({super.key, required this.partida});

  @override
  State<PartidaScreen> createState() => _PartidaScreenState();
}

class _PartidaScreenState extends State<PartidaScreen> {
  late final Partida partida;

  @override
  void initState() {
    super.initState();
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);

    partida = widget.partida;
  }

  @override
  void dispose() {
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            body: Stack(
      children: [
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10)
              .add(const EdgeInsets.only(top: 10)),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              IconButton(
                icon: const Icon(Icons.arrow_back),
                color: Colors.white,
                onPressed: () => Navigator.pop(context),
              ),
              const Icon(
                Icons.settings,
                color: Colors.white,
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 10),
          child: Row(
            children: [
              Expanded(
                  flex: 25,
                  child: AreaOfAction(
                      time: partida.times.first,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      addPoint: _addPoint)),
              Expanded(
                flex: 50,
                child: Column(
                  children: [
                    Row(
                      mainAxisSize: MainAxisSize.min,
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        TimeNameWidget(time: partida.times.first, letter: 'A'),
                        TimeNameWidget(time: partida.times.last, letter: 'B'),
                      ]
                          .map(
                            (e) => Expanded(flex: 50, child: e),
                          )
                          .toList(),
                    ),
                    Expanded(
                      child: BoardWidget(
                        leftBoard: CurrentScoringAreaWidget(
                          isBallVisible: true,
                          score:
                              partida.getPontuacaoByTime(partida.times.first),
                        ),
                        rightBoard: CurrentScoringAreaWidget(
                          isBallVisible: false,
                          score: partida.getPontuacaoByTime(partida.times.last),
                        ),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 5),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(bottom: 5),
                            child: RichText(
                              text: TextSpan(
                                children: [
                                  TextSpan(
                                      text: 'Tempo de jogo: 1:14\'',
                                      style: Theme.of(context)
                                          .textTheme
                                          .bodyLarge!
                                          .copyWith(color: Colors.white)),
                                  TextSpan(
                                    text: '00\'\'',
                                    style: Theme.of(context)
                                        .textTheme
                                        .bodyMedium!
                                        .copyWith(color: Colors.white),
                                  ),
                                ],
                              ),
                            ),
                          ),
                          ElevatedButton(
                            onPressed: _placarGeral,
                            style: ElevatedButton.styleFrom(
                                backgroundColor: const Color(0xff2B4A8E),
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 20, vertical: 10),
                                side: const BorderSide(
                                    color: Colors.white, width: 3),
                                shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15))),
                            child: Text(
                              'Placar Geral',
                              style: Theme.of(context)
                                  .textTheme
                                  .headlineMedium!
                                  .copyWith(color: Colors.white),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                  flex: 25,
                  child: AreaOfAction(
                    time: partida.times.last,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    addPoint: _addPoint,
                  )),
            ],
          ),
        ),
      ],
    )));
  }

  _showPlacarGeral() {
    if (!partida.hasWinner()) {
      return;
    }

    showDialog(
      context: context,
      barrierColor: Colors.transparent,
      builder: (BuildContext context) {
        return DialogVitoria(
            onPressed: _placarGeral, winner: partida.getWinner()!);
      },
    );
  }

  void _placarGeral() {
    Navigator.pushNamed(context, '/placar-geral');
  }

  void _addPoint(Rodada rodada) {
    setState(() {
      partida.addRodada(rodada);
    });

    if (partida.hasWinner()) {
      _showPlacarGeral();
    }
  }
}
