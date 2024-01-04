import 'package:retrofit/retrofit.dart';
import 'package:dio/dio.dart';
import 'package:weatherly/models/city.dart';

import '../models/location.dart';

part 'locationApi_services.g.dart';

@RestApi(baseUrl: "http://dataservice.accuweather.com/locations/v1/")
abstract class LocationApiServices {
  factory LocationApiServices(Dio dio, {String baseUrl}) = _LocationApiServices;

  @GET("cities/ipaddress")
  Future<Location> getDeviceLocationByIP(@Query('apikey') String apikey, @Query('q') String publicApi);
  
  @GET("cities/autocomplete")
  Future<List<City>> getCitiesAutoComplete(@Query('apikey') String apikey, @Query('q') String city);

}
