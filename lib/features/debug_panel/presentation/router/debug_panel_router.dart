// Package imports:
import 'package:core/exports/alice.dart';

abstract interface class DebugPanelRouter {
  Alice get alice;

  void onOpenAliceInspector();
}

class DebugPanelRouterImpl implements DebugPanelRouter {
  const DebugPanelRouterImpl({required Alice alice}) : _alice = alice;

  final Alice _alice;

  @override
  Alice get alice => _alice;

  @override
  void onOpenAliceInspector() {
    alice.showInspector();
  }
}
