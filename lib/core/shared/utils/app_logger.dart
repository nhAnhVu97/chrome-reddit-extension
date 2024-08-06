// // ignore_for_file: avoid_redundant_argument_values

// import 'package:chrome_ext/core/configs/app_config.dart';
// import 'package:flutter/foundation.dart';
// import 'package:talker_flutter/talker_flutter.dart';

// void log(String message) => AppLogger.d(message);
// void logError(String message, {Object? error, StackTrace? stackTrace}) => AppLogger.e(message, error: error, stackTrace: stackTrace);

// class AppLogger {
//   static final talker = TalkerFlutter.init(
//     settings: TalkerSettings(
//       maxHistoryItems: 500,
//       enabled: true,
//     ),
//     observer: CrashlyticsTalkerObserver(),
//   );

//   static void d(dynamic message, {StackTrace? stackTrace}) {
//     if (kDebugMode || AppConfig.flavor != Environment.production) {
//       talker.debug('[D] $message', null, stackTrace);
//     }
//   }

//   static void w(dynamic message, {StackTrace? stackTrace}) {
//     if (kDebugMode || AppConfig.flavor != Environment.production) {
//       talker.warning('[D] $message', null, stackTrace);
//     }
//   }

//   static void c(dynamic message, {StackTrace? stackTrace}) {
//     if (kDebugMode || AppConfig.flavor != Environment.production) {
//       talker.info('[D] $message', null, stackTrace);
//     }
//   }

//   static void e(dynamic message, {Object? error, StackTrace? stackTrace}) {
//     if (kDebugMode || AppConfig.flavor != Environment.production) {
//       talker.critical('[D] $message', error, stackTrace);
//     }
//   }
// }

// class CrashlyticsTalkerObserver extends TalkerObserver {
//   CrashlyticsTalkerObserver();

//   @override
//   void onError(TalkerError err) {}

//   @override
//   void onException(TalkerException err) {}
// }

// class Benchmark {
//   static final Map<String, int> _starts = <String, int>{};

//   static void start(String id) {
//     if (AppConfig.flavor != Environment.development) return;
//     final String benchId = id;
//     _starts[benchId] = DateTime.now().microsecondsSinceEpoch;
//   }

//   static void end(String id) {
//     if (AppConfig.flavor != Environment.development) return;
//     final String benchId = id;
//     if (!_starts.containsKey(benchId)) {
//       throw Exception('In Benchmark not placed comparing with id=$benchId');
//     }
//     final double diff = (DateTime.now().microsecondsSinceEpoch - _starts[benchId]!) / 1000;
//     final String info = '$benchId need ${diff}ms';
//     AppLogger.c('[Benchmark] $info');
//     _starts.remove(benchId);
//   }
// }
