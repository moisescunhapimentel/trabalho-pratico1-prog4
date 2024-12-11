import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';

abstract class DeviceOrientationState<T extends StatefulWidget> extends State<T>
    with RouteAware {
  List<DeviceOrientation> get orientations;

  late List<DeviceOrientation> oldOrientations;
  RouteObserver? _routeObserver;

  RouteObserver get routeObserver {
    _routeObserver ??= Provider.of<RouteObserver>(context, listen: false);

    return _routeObserver!;
  }

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();

    final route = ModalRoute.of(context);

    if (route is PageRoute) {
      routeObserver.subscribe(this, ModalRoute.of(context) as PageRoute);
    }
  }

  @override
  void didPopNext() {
    _setScreenOrientation();
  }

  Future<void> _setScreenOrientation() async {
    await SystemChrome.setPreferredOrientations(orientations);
  }

  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) async {
      await _setScreenOrientation();
    });
  }

  @override
  void dispose() {
    _routeObserver?.unsubscribe(this);
    super.dispose();
  }
}
