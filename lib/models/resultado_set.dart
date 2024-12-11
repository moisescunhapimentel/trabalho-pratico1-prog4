import 'package:trabalho1/models/time.dart';

class ResultadoSet {
  final PontuacaoTime pontuacaoA;
  final PontuacaoTime pontuacaoB;

  ResultadoSet({required this.pontuacaoA, required this.pontuacaoB});
}

class PontuacaoTime {
  final Time time;
  final int pontos;

  PontuacaoTime({required this.time, required this.pontos});
}
