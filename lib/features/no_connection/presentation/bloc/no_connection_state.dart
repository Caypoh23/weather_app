part of 'no_connection_bloc.dart';

@freezed
abstract class NoConnectionState with _$NoConnectionState {
  const factory NoConnectionState({
    @Default(false) bool isLoading,
    @Default(false) bool isActionLoading,
    NoConnectionError? error,
  }) = _NoConnectionState;

  const NoConnectionState._();
}

enum NoConnectionError { noConnection, serverError }
