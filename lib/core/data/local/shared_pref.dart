import 'package:shared_preferences/shared_preferences.dart';
import 'package:signals/signals_flutter.dart';

class SharedPref {
  SharedPref(this.prefs);

  final SharedPreferences prefs;
  final List<EffectCleanup> _cleanup = [];

  Signal<T> _setting<T>(
    String key, {
    required T Function(String) get,
    required void Function(String, T?) set,
    String? debugLabel,
  }) {
    final s = signal<T>(get(key), debugLabel: debugLabel);
    _cleanup.add(s.subscribe((val) => set(key, val)));
    return s;
  }

  late Signal<List<String>> readPost = _setting(
    'p',
    debugLabel: "SharedPref - readPost",
    get: (key) => prefs.getStringList(key) ?? [],
    set: (key, val) {
      if (val == null) {
        prefs.remove(key);
      } else {
        prefs.setStringList(key, val);
      }
    },
  );

  late Signal<List<String>> tags = _setting(
    't',
    debugLabel: "SharedPref - tags",
    get: (key) => prefs.getStringList(key) ?? [],
    set: (key, val) {
      if (val == null) {
        prefs.remove(key);
      } else {
        prefs.setStringList(key, val);
      }
    },
  );

  late Signal<List<String>> favorite = _setting(
    'f',
    debugLabel: "SharedPref - favorite",
    get: (key) => prefs.getStringList(key) ?? [],
    set: (key, val) {
      if (val == null) {
        prefs.remove(key);
      } else {
        prefs.setStringList(key, val);
      }
    },
  );
}
