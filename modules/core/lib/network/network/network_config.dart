class NetworkConfig {
  NetworkConfig._();

  static final devUrl = Uri(scheme: 'https', host: 'dev.weather.com');

  static final prodUrl = Uri(scheme: 'https', host: 'weather.com');

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
