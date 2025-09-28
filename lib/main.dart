// Package imports:
import 'package:core/network/network/flavor.dart';

// Project imports:
import 'package:weather_app/bootstrap.dart';

void main() {
  final flavor = Flavor.fromEnv();
  initializeApp(flavor: flavor);
}
