class NetworkConfig {
  NetworkConfig._();

  static final devUrl = Uri(
    scheme: 'https',
    host: 'dev.weather.com',
    path: '/exec/mobile',
  );

  static final prodUrl = Uri(
    scheme: 'https',
    host: 'weather.com',
    path: '/exec/mobile',
  );

  // Weather API URLs
  static const String openWeatherMapBaseUrl =
      'https://api.openweathermap.org/data/2.5';
  static const String amadeusBaseUrl = 'https://test.api.amadeus.com/v1';

  static final List<ServerItem> appServers = [
    ServerItem(uri: devUrl, name: 'Dev'),
    ServerItem(uri: prodUrl, name: 'Prod'),
  ];
}

class ServerItem {
  ServerItem({required this.uri, required this.name});

  final Uri uri;
  final String name;
}
