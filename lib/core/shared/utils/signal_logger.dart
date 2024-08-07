import 'package:chrome_ext/core/shared/utils/app_logger.dart';
import 'package:signals/signals_flutter.dart';

class SignalLogger implements SignalsObserver {
  @override
  void onComputedCreated(Computed instance) {
    AppLogger.signal('computed created: [${instance.globalId} | ${instance.debugLabel}]');
  }

  @override
  void onComputedUpdated(Computed instance, dynamic value) {
    AppLogger.signal('computed updated: [${instance.globalId} | ${instance.debugLabel}] => $value');
  }

  @override
  void onSignalCreated(Signal instance) {
    AppLogger.signal('signal created: [${instance.globalId} | ${instance.debugLabel}] => ${instance.peek()}');
  }

  @override
  void onSignalUpdated(Signal instance, dynamic value) {
    AppLogger.signal('signal updated: [${instance.globalId} | ${instance.debugLabel}] => $value');
  }

  @override
  void onEffectCreated(Effect instance) {
    if (instance.debugLabel != null) {
      AppLogger.signal('effect created: [${instance.globalId} | ${instance.debugLabel}]');
    }
  }

  @override
  void onEffectCalled(Effect instance) {
    if (instance.debugLabel != null) {
      AppLogger.signal('effect called: [${instance.globalId} | ${instance.debugLabel}]');
    }
  }

  @override
  void onEffectRemoved(Effect instance) {
    if (instance.debugLabel != null) {
      AppLogger.signal('effect removed: [${instance.globalId} | ${instance.debugLabel}]');
    }
  }
}
