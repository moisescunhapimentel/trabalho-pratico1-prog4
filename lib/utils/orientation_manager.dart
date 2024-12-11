import 'package:flutter/services.dart';

class DeviceOrientationManager {
  static Future<void> setPortraitMode() async {
    await SystemChrome.setPreferredOrientations(portraitMode);
  }

  static Future<void> setLandscapeMode() async {
    await SystemChrome.setPreferredOrientations(landscapeMode);
  }

  static Future<void> resetOrientation() async {
    await SystemChrome.setPreferredOrientations([]);
  }

  static List<DeviceOrientation> get portraitMode => [
        DeviceOrientation.portraitUp,
        DeviceOrientation.portraitDown,
      ];

  static List<DeviceOrientation> get landscapeMode => [
        DeviceOrientation.landscapeLeft,
        DeviceOrientation.landscapeRight,
      ];
}
