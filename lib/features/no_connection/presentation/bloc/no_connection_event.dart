part of 'no_connection_bloc.dart';

sealed class NoConnectionEvent {
  const NoConnectionEvent();
}

final class RetryEvent extends NoConnectionEvent {
  const RetryEvent();
}

sealed class NoConnectionUiCommand {
  const NoConnectionUiCommand();
}

final class OpenAuthorizedFlowUiCommand extends NoConnectionUiCommand {
  const OpenAuthorizedFlowUiCommand();
}
