// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/foundation.dart';

// Project imports:
import 'package:core/exports/network.dart';

abstract class RestClientService {
  RestClientService(
    this._client, {
    required ConnectivityService connectivityService,
    required NetworkErrorHandler errorHandler,
    List<Interceptor> interceptors = const [],
  }) : _connectivityService = connectivityService,
       _errorHandler = errorHandler {
    /// Добавление интерсепторов
    _client.interceptors.insertAll(0, interceptors);
  }

  final Dio _client;
  final ConnectivityService _connectivityService;
  final NetworkErrorHandler _errorHandler;

  ///Обёртки запросов дио
  Future<T> get<T>(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    Options? options,
    DataParser<T>? parser,
  }) => request(
    () => _client.get(
      url,
      data: body,
      queryParameters: params,
      cancelToken: cancelToken,
      options: options,
    ),
    parser: parser,
  );

  Future<T> post<T>(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Options? options,
    DataParser<T>? parser,
  }) => request(
    () => _client.post(
      url,
      data: body,
      queryParameters: params,
      options: options,
    ),
    parser: parser,
  );

  Future<T> postObject<T>(
    String url, {
    Object? body,
    Map<String, dynamic>? params,
    Options? options,
    DataParser<T>? parser,
  }) => request(
    () => _client.post(
      url,
      data: body,
      queryParameters: params,
      options: options,
    ),
    parser: parser,
  );

  Future<T> put<T>(
    String url, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    Options? options,
    DataParser<T>? parser,
  }) => request(
    () =>
        _client.put(url, data: body, options: options, queryParameters: params),
    parser: parser,
  );

  Future<T> putObject<T>(
    String url, {
    Object? body,
    Map<String, dynamic>? params,
    Options? options,
    DataParser<T>? parser,
  }) => request(
    () =>
        _client.put(url, data: body, queryParameters: params, options: options),
    parser: parser,
  );

  Future<T> delete<T>(
    String url, {
    Options? options,
    Map<String, dynamic>? params,
    DataParser<T>? parser,
  }) => request(
    () => _client.delete(url, options: options, queryParameters: params),
    parser: parser,
  );

  Future<T> deleteObject<T>(
    String url, {
    Options? options,
    Map<String, dynamic>? params,
    DataParser<T>? parser,
    Object? body,
  }) => request(
    () => _client.delete(
      url,
      options: options,
      queryParameters: params,
      data: body,
    ),
    parser: parser,
  );

  Future<T> patch<T>(
    String url, {
    Map<String, dynamic>? body,
    Options? options,
    DataParser<T>? parser,
    Function(int, int)? onSendProgress,
  }) => request(
    () => _client.patch(
      url,
      data: body,
      options: options,
      onSendProgress: onSendProgress,
    ),
    parser: parser,
  );

  Future<T> download<T>(
    String url,
    String filePath, {
    Map<String, dynamic>? body,
    Map<String, dynamic>? params,
    CancelToken? cancelToken,
    Options? options,
    DataParser<T>? parser,
  }) async {
    return request(
      () => _client.download(
        url,
        filePath,
        data: body,
        queryParameters: params,
        cancelToken: cancelToken,
        options: options,
      ),
      parser: parser,
    );
  }

  @protected
  @mustCallSuper
  Future<T> request<T>(
    Future<Response> Function() call, {
    required DataParser<T>? parser,
  }) {
    return _errorHandler.tryCall<T>(() async {
      if (await _connectivityService.isConnected) {
        final response = await call();
        final data = response.data;
        if (parser != null) return parser.parse(data);
        return data;
      } else {
        throw const NoConnectionError();
      }
    });
  }
}
