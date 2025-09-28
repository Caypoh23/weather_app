// Project imports:
import '../../domain/models/city.dart';
import '../models/response/get_cities_response.dart';

extension CityMapper on GetCitiesResponse {
  City toDomainModel() {
    return City(name: name, lat: geoCode?.latitude, long: geoCode?.longitude);
  }
}
