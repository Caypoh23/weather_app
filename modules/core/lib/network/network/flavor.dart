///Флаги для запуска
enum Flavor {
  dev,
  prod;

  factory Flavor.fromEnv() {
    //! const is REQUIRED - https://github.com/flutter/flutter/issues/55870
    const env = String.fromEnvironment('FLUTTER_APP_FLAVOR');
    return env == 'dev' ? Flavor.dev : Flavor.prod;
  }
}

///Установка переменных
class AppConfig {
  static Flavor appFlavor = Flavor.dev;
  static bool get isDebug => appFlavor == Flavor.dev;
}
