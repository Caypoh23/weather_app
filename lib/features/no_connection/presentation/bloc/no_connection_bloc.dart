// Package imports:
import 'package:core/exports/bloc.dart';

part 'no_connection_event.dart';
part 'no_connection_state.dart';
part 'no_connection_bloc.freezed.dart';

class NoConnectionBloc extends Bloc<NoConnectionEvent, NoConnectionState> {
  NoConnectionBloc() : super(const NoConnectionState()) {
    on<NoConnectionEvent>(
      (event, emit) => switch (event) {
        RetryEvent() => _onRetry(event, emit),
      },
    );
  }

  void _onRetry(RetryEvent event, Emitter<NoConnectionState> emit) {
    // UI command will be handled by the UI layer listening to this bloc
    // For now, we'll emit a state change that indicates retry
  }
}
