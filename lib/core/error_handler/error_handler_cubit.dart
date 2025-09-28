// Package imports:
import 'package:core/exports/bloc.dart';

class ErrorHandlerCubit extends Cubit<Object?> {
  ErrorHandlerCubit() : super(null);

  void handle(Object exception) {
    emit(exception);
  }

  void clear() {
    emit(null);
  }
}
