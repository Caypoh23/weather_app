// Flutter imports:
import 'package:flutter/material.dart';

// Package imports:
import 'package:core/exports/router.dart';

abstract interface class NoConnectionRouter {
  void onOpenAuthorizedFlow(BuildContext context);
}

class NoConnectionRouterImpl implements NoConnectionRouter {
  const NoConnectionRouterImpl();

  @override
  void onOpenAuthorizedFlow(BuildContext context) {
    context.go('/');
  }
}
