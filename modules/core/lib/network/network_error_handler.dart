abstract interface class NetworkErrorHandler {
  Future<T> tryCall<T>(Future<T> Function() call);
}
