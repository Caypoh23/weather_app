// Project imports:
import 'package:core/network/rest_client_service.dart';

class NonAuthRestClient extends RestClientService {
  NonAuthRestClient(
    super.client, {
    required super.connectivityService,
    required super.errorHandler,
    super.interceptors = const [],
  });
}
