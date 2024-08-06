import 'dart:io';

import 'package:chrome_ext/app.dart';
import 'package:chrome_ext/injector_setup.dart';
import 'package:flutter/widgets.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  HttpOverrides.global = MyHttpOverrides();
  // Init dependencies
  await initializeDependencies();

  runApp(const App());
}

class MyHttpOverrides extends HttpOverrides {
  @override
  HttpClient createHttpClient(SecurityContext? context) {
    return super.createHttpClient(context)
      ..findProxy = (uri) {
        return 'PROXY localhost:3000';
      };
  }
}
