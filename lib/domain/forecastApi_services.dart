import 'package:retrofit/http.dart';
import 'package:dio/dio.dart';

import '../models/forecast.dart';
import '../models/hourlyForecast.dart';

part 'forecastApi_services.g.dart';

@RestApi(baseUrl: "http://dataservice.accuweather.com/forecasts/v1/")
abstract class ForecastApiServices {
  factory ForecastApiServices(Dio dio, {String baseUrl}) = _ForecastApiServices;

  @GET("daily/1day/{locationKey}")
  Future<Forecast> getDailyForecast(@Query('apikey') String apikey, @Path("locationKey") String locationKey);

  @GET("hourly/12hour/{locationKey}")
  Future<List<HourlyForecast>> getHourlyForecast(@Query('apikey') String apikey, @Path("locationKey") String locationKey);

}
