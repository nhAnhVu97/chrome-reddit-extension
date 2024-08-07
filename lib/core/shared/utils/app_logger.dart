import 'package:chrome_ext/core/configs/app_config.dart';
import 'package:flutter/foundation.dart';
import 'package:talker_flutter/talker_flutter.dart';

class AppLogger {
  static final talker = TalkerFlutter.init(
    settings: TalkerSettings(
      maxHistoryItems: 500,
    ),
  );

  static void signal(String message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.logTyped(SignalLog(message));
    }
  }

  static void d(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.debug('[D] $message', null, stackTrace);
    }
  }

  static void w(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.warning('[D] $message', null, stackTrace);
    }
  }

  static void c(dynamic message, {StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.info('[D] $message', null, stackTrace);
    }
  }

  static void e(dynamic message, {Object? error, StackTrace? stackTrace}) {
    if (kDebugMode || AppConfig.flavor != Environment.production) {
      talker.critical('[D] $message', error, stackTrace);
    }
  }
}

class SignalLog extends TalkerLog {
  SignalLog(String super.message);

  /// Your custom log title
  @override
  String get title => '[Signal]';

  /// Your custom log color
  @override
  AnsiPen get pen => AnsiPen()..xterm(121);

  @override
  String generateTextMessage({TimeFormat timeFormat = TimeFormat.timeAndSeconds}) {
    return '$title | $displayMessage$displayException$displayStackTrace';
  }
}
