enum Environment {
  development,
  staging,
  production,
}

class AppConfig {
  static Environment get flavor => Environment.values.firstWhere((e) => e.name == const String.fromEnvironment('FLAVOR'));

  static String get baseUrl => const String.fromEnvironment('BASE_URL');

  @override
  String toString() {
    return '''

      flavor: $flavor
      baseUrl: $baseUrl
    ''';
  }
}
