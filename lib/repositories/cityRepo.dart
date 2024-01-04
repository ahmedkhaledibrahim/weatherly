
import 'package:weatherly/constants.dart';
import 'package:weatherly/models/city.dart';

import '../domain/locationApi_services.dart';

class CityRepo{
  final LocationApiServices locationApiServices;

  CityRepo({required this.locationApiServices});

  Future<List<City>> getCityAutoComplete(String city) async{
    final List<City> listOfCities = await locationApiServices.getCitiesAutoComplete(getApiKey(), city);
    return listOfCities;
  }
}