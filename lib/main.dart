import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:trabalho1/enums/tipo_ponto.dart';
import 'package:trabalho1/models/partida.dart';
import 'package:trabalho1/models/rodada.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/ui/screens/home_screen.dart';
import 'package:trabalho1/ui/screens/partida_screen.dart';
import 'package:trabalho1/ui/screens/placar_geral_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  final _routeObserver = RouteObserver<PageRoute>();

  MyApp({super.key});

  @override 
  Widget build(BuildContext context) {
    final ziraldosTime = Time(nome: 'Ziraldos', totalJogadores: 4);
    final autoconvidadosTime = Time(nome: 'Autoconvidados', totalJogadores: 4);

    return Provider<RouteObserver>(
      create: (_) => _routeObserver,
      child: MaterialApp(
        title: 'Flutter Demo',
        theme: ThemeData(
            fontFamily: 'ConcertOne',
            colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
            useMaterial3: true,
            scaffoldBackgroundColor: const Color(0xff00ADC3)),
        navigatorObservers: [
          _routeObserver,
        ],
        initialRoute: '/home',
        routes: {
          '/home': (_) => const HomeScreen(),
          '/partida': (_) => PartidaScreen(
                partida: Partida(times: [
                  ziraldosTime,
                  autoconvidadosTime,
                ], rodadas: [
                  ...List.generate(
                    12,
                    (index) => Rodada(
                        timePontuador: ziraldosTime,
                        tipoPonto: TipoPonto.ataque),
                  ),
                  ...List.generate(
                    24,
                    (index) => Rodada(
                        timePontuador: autoconvidadosTime,
                        tipoPonto: TipoPonto.ataque),
                  )
                ]),
              ),
          '/placar-geral': (_) => const PlacarGeralScreen(),
        },
      ),
    );
  }
}
