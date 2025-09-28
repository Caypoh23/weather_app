// Dart imports:
import 'dart:async';

// Project imports:
import '../models/city.dart';

abstract interface class SearchCityRepository {
  FutureOr<List<City>> getCities({required String searchText});
}
