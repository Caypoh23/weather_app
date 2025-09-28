// Project imports:
import 'package:core/exports/network.dart';
import 'package:core/network/network/flavor.dart';
import 'package:core/network/network/network_config.dart';
import 'package:core/storage/flavor_storage/flavor_storage.dart';

class FlavorInterceptor extends QueuedInterceptor {
  FlavorInterceptor({
    required Flavor flavor,
    required FlavorStorage localStorage,
  }) : _flavor = flavor,
       _localStorage = localStorage;

  final Flavor _flavor;
  final FlavorStorage _localStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final isProd = _flavor == Flavor.prod;
    final isDemo = await _localStorage.getIsDemo();
    if (isProd && isDemo) {
      options.baseUrl = NetworkConfig.devUrl.toString();
    }

    super.onRequest(options, handler);
  }
}
