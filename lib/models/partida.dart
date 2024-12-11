import 'package:trabalho1/models/rodada.dart';
import 'package:trabalho1/models/time.dart';

class Partida {
  List<Time> times;
  List<Rodada> rodadas;

  Partida({
    required this.times,
    required this.rodadas,
  }) : assert(times.length == 2);

  void addRodada(Rodada rodada) {
    if (checkTimeValido(rodada.timePontuador)) {
      throw Exception('O time não faz parte dessa partida');
    } else {
      rodadas.add(rodada);
    }
  }

  bool checkTimeValido(Time time) {
    return !times.any(
      (timeValido) => time == timeValido,
    );
  }

  getPontuacaoByTime(Time time) {
    if (checkTimeValido(time)) {
      throw Exception('O time não faz parte dessa partida');
    }

    final pontuacao = rodadas
        .where(
          (element) => element.timePontuador == time,
        )
        .length;

    return pontuacao;
  }

  bool hasWinner() {
    if (rodadas.length < 25) {
      return false;
    }

    final firstScore = getPontuacaoByTime(times.first);
    final lastScore = getPontuacaoByTime(times.last);

    if (firstScore >= 25 && firstScore - lastScore >= 2 ||
        lastScore >= 25 && lastScore - firstScore >= 2) {
      return true;
    }

    return false;
  }

  Time? getWinner() {
    if (!hasWinner()) {
      return null;
    }

    final firstScore = getPontuacaoByTime(times.first);
    final lastScore = getPontuacaoByTime(times.last);

    if (firstScore > lastScore) {
      return times.first;
    } else {
      return times.last;
    }
  }
}
