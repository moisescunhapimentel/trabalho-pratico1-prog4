import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:trabalho1/contants/colors.dart';
import 'package:trabalho1/models/time.dart';
import 'package:trabalho1/utils/orientation_manager.dart';
import 'package:trabalho1/utils/theme_helper.dart';
import 'package:trabalho1/ui/widgets/device_orientation_state.dart';
import 'package:trabalho1/ui/widgets/time_info_widget.dart';
import 'package:trabalho1/ui/widgets/vertical_widget.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends DeviceOrientationState<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final times = _times();

    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            const Spacer(
              flex: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Image.asset(
                  'images/volleyball.png',
                ),
                Column(
                  mainAxisSize: MainAxisSize.min,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'Volley',
                      style: ThemeHelper.textTheme(context)
                          .displayMedium!
                          .copyWith(color: Colors.white, height: 0.8),
                    ),
                    Padding(
                      padding: const EdgeInsets.only(left: 10),
                      child: Text(
                        'do fim de semana',
                        style: TextStyle(
                          color: Colors.white,
                          // height: 0.1,
                          fontSize: (ThemeHelper.textTheme(context)
                                      .displayMedium
                                      ?.fontSize ??
                                  50) *
                              0.2,
                        ),
                      ),
                    ),
                  ]
                      .map(
                        (e) => Flexible(child: e),
                      )
                      .toList(),
                )
              ]
                  .map(
                    (e) => Flexible(child: e),
                  )
                  .toList(),
            ),
            const Spacer(
              flex: 5,
            ),
            Flexible(
              flex: 45,
              child: ConstrainedBox(
                constraints: const BoxConstraints(maxWidth: 1080),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    VerticalWidget(
                      child: Container(
                        width: double.infinity,
                        margin: const EdgeInsets.only(top: 5),
                        padding: const EdgeInsets.symmetric(horizontal: 40),
                        decoration: BoxDecoration(
                          color: Colors.white30,
                          border: Border.all(
                              color: Colors.white70,
                              width: 3,
                              style: BorderStyle.solid),
                        ),
                        child: Text(
                          'TIMES',
                          textAlign: TextAlign.center,
                          style: ThemeHelper.textTheme(context)
                              .displayMedium!
                              .copyWith(color: Colors.white, height: 1),
                          strutStyle: const StrutStyle(leading: 1),
                        ),
                      ),
                    ),
                    Flexible(
                      child: ListView.builder(
                        itemCount: times.length,
                        itemBuilder: (context, index) {
                          return TimeInfoWidget(time: times[index]);
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Flexible(
              flex: 45,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      'Jogo Casado',
                      style: ThemeHelper.textTheme(context)
                          .displayMedium!
                          .copyWith(color: Colors.white),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: ElevatedButton(
                      style: ButtonStyle(
                          shape: WidgetStatePropertyAll(RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10),
                              side: const BorderSide(
                                  color: Colors.white, width: 3))),
                          backgroundColor:
                              const WidgetStatePropertyAll(kPrimaryColor)),
                      onPressed: () => Navigator.pushNamed(context, '/partida'),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 5, horizontal: 20),
                        child: Text(
                          'Iniciar',
                          style: ThemeHelper.textTheme(context)
                              .displayMedium!
                              .copyWith(color: Colors.white, height: 1),
                          strutStyle: const StrutStyle(
                            leading: 1,
                          ),
                        ),
                      ),
                    ),
                  )
                ]
                    .map(
                      (e) => Flexible(child: e),
                    )
                    .toList(),
              ),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: kPrimaryColor,
          shape: const CircleBorder(),
          onPressed: () {},
          child: const Icon(
            Icons.add,
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  @override
  List<DeviceOrientation> get orientations =>
      DeviceOrientationManager.portraitMode;

  List<Time> _times() {
    return [
      Time(nome: 'Sicranos', totalJogadores: 3),
      Time(nome: 'Autoconvidados', totalJogadores: 3),
      Time(nome: 'Ziraldos', totalJogadores: 4),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
      Time(nome: 'Sparrings', totalJogadores: 5),
    ];
  }
}
