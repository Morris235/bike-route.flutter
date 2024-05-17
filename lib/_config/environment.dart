import 'package:flutter/foundation.dart';

abstract class BaseConfig {
  String get apiHost;
  String get apiKey;
  String get env;
}

class DevConfig implements BaseConfig {
  @override
  String get env {
    return kDebugMode ? 'DEV' : 'PRD';
  }

  @override
  String get apiHost => env == 'PRD' ? '' : 'http://localhost:8081/graphql';

  @override
  String get apiKey => '';
}

class Environment {
  static final Environment _singleton = Environment._internal();

  late BaseConfig config;

  factory Environment() {
    return _singleton;
  }

  Environment._internal();

  initConfig() {
    config = DevConfig();
  }
}
