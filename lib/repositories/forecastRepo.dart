import 'package:weatherly/constants.dart';
import 'package:weatherly/domain/forecastApi_services.dart';

import '../models/forecast.dart';
import '../models/hourlyForecast.dart';

class ForecastRepo {
  final ForecastApiServices forecastApiServices;

  ForecastRepo({required this.forecastApiServices});

  Future<Forecast> getForecastByLocationKey(String locationKey) async {
    Forecast forecast = await forecastApiServices.getDailyForecast(getApiKey(),locationKey);
    return forecast;
  }

  Future<List<HourlyForecast>> getHourlyForcast(String locationKey) async{
    List<HourlyForecast> hourlyForecastList = await forecastApiServices.getHourlyForecast(getApiKey(), locationKey);
    return hourlyForecastList;
  }
}
