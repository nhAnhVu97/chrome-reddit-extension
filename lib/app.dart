// ignore_for_file: avoid_redundant_argument_values

import 'package:chrome_ext/modules/dashboard.dart';
import 'package:flutter/material.dart';

class App extends StatelessWidget {
  const App({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData.dark(useMaterial3: true),
      home: Builder(
        builder: (context) {
          return Overlay(
            initialEntries: [
              OverlayEntry(
                builder: (context) => Builder(
                  builder: (context) {
                    return const Dashboard();
                  },
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}
