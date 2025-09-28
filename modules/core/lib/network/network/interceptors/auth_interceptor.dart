// Project imports:
import 'package:core/exports/network.dart';
import 'package:core/storage/local_storage/local_storage.dart';
import 'package:core/storage/local_storage/local_storage_key.dart';

class AuthInterceptor extends QueuedInterceptor {
  AuthInterceptor({required LocalStorage localStorage})
    : _localStorage = localStorage;

  final LocalStorage _localStorage;

  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final accessToken = _localStorage.getString(
      LocalStorageKey.accessToken.name,
    );

    if (accessToken != null && accessToken.isNotEmpty) {
      options.headers.addAll({'Authorization': 'Bearer $accessToken'});
    }

    super.onRequest(options, handler);
  }
}
