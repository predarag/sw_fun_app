import 'package:sw_fun_app/core/enums/enviorment.dart';

class BuildConfig {
  factory BuildConfig() {
    _instance ??= const BuildConfig._internal();
    return _instance!;
  }

  const BuildConfig._internal();
  static late Map<String, String> _config;

  void setEnvironment(Environment env) {
    switch (env) {
      case Environment.dev:
        _config = _Config.devConstants;
        break;
    }
  }

  String? get baseUrl {
    return _config[_Config.baseUrl];
  }

  static BuildConfig? _instance;
}

class _Config {
  static const String baseUrl = 'BASE_URL';
  // add other fields

  static const Map<String, String> devConstants = <String, String>{
    baseUrl: 'https://swapi.dev/api',
  };
}
