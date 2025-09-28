// Package imports:
import 'package:connectivity_plus/connectivity_plus.dart';

export 'package:connectivity_plus/connectivity_plus.dart';

abstract class ConnectivityService {
  Future<bool> get isConnected;
}

class ConnectivityServiceImpl implements ConnectivityService {
  const ConnectivityServiceImpl({
    required Connectivity connectivity,
  }) : _connectivity = connectivity;

  final Connectivity _connectivity;

  @override
  Future<bool> get isConnected async {
    ConnectivityResult result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }
}
