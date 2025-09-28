// Flutter imports:
import 'package:flutter/cupertino.dart';

// Package imports:
import 'package:core/exports/bloc.dart';
import 'package:core/exports/router.dart';
import 'package:core/network/app_failure.dart';
import 'package:core/network/network/models/server_error.dart';
import 'package:weather_localization/strings.g.dart';
import 'package:weather_uikit/uikit.dart' as uikit;

// Project imports:
import 'package:weather_app/core/error_handler/error_handler_cubit.dart';
import 'package:weather_app/router/app_router.dart';

class ErrorHandlerWidget extends StatelessWidget {
  const ErrorHandlerWidget({
    required this.bloc,
    required this.router,
    required this.child,
    super.key,
  });

  final ErrorHandlerCubit bloc;
  final AppRouter router;
  final Widget child;

  @override
  Widget build(BuildContext context) {
    return BlocProvider<ErrorHandlerCubit>(
      create: (_) => bloc,
      child: BlocListener<ErrorHandlerCubit, Object?>(
        bloc: bloc,
        listenWhen: (_, failure) => failure != null,
        listener: (context, failure) {
          debugPrint("custom builder $failure");

          if (failure is NoConnectionFailure) {
            uikit.showTopSnack(
              context,
              uikit.Snack.error(title: context.tr.errors.noConnection),
            );
          } else if (failure is InvalidTokenFailure) {
            uikit.showTopSnack(
              context,
              uikit.Snack.error(title: context.tr.errors.tokenExpiredOrInvalid),
            );
            context.go('');
          } else if (failure is ServerFailure<ServerError>) {
            uikit.showTopSnack(
              context,
              uikit.Snack.error(title: failure.model.msg),
            );
          } else if (failure != null) {
            uikit.showTopSnack(
              context,
              uikit.Snack.error(title: context.tr.errors.somethingWentWrong),
            );
          }

          bloc.clear();
        },
        child: child,
      ),
    );
  }
}
