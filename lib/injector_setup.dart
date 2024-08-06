import 'package:chrome_ext/core/data/local/shared_pref.dart';
import 'package:chrome_ext/core/data/network/api_service.dart';
import 'package:chrome_ext/core/data/network/dio/dio_provider.dart';
import 'package:get_it/get_it.dart';
import 'package:shared_preferences/shared_preferences.dart';

final injector = GetIt.instance;

Future<void> initializeDependencies() async {
  injector
    ..registerFactories()
    ..registerLazySingletons()
    ..registerSingletons();
}

extension InjectorExtensions on GetIt {
  void registerFactories() {}

  void registerLazySingletons() {}

  void registerSingletons() {
    registerSingleton<DioProvider>(DioProvider());
    registerSingletonAsync<SharedPref>(() async {
      final pref = await SharedPreferences.getInstance();
      return SharedPref(pref);
    });
    registerSingleton<ApiService>(ApiService(get<DioProvider>().getInstance()));
  }
}
