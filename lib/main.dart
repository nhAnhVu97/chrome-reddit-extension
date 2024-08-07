import 'package:chrome_ext/app.dart';
import 'package:chrome_ext/injector_setup.dart';
import 'package:flutter/widgets.dart';
import 'package:signals/signals_flutter.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();

  SignalsObserver.instance = DevToolsSignalsObserver();

  // Init dependencies
  await initializeDependencies();

  runApp(const App());
}
