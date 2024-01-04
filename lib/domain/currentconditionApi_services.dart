
import 'package:dio/dio.dart';
import 'package:retrofit/http.dart';

import '../models/currCondition.dart';
part 'currentconditionApi_services.g.dart';

@RestApi(baseUrl: 'http://dataservice.accuweather.com/currentconditions/v1/')
abstract class CurrentConditionApiServices{
  factory CurrentConditionApiServices(Dio dio, {String baseUrl}) = _CurrentConditionApiServices;
  
  @GET("{locationKey}")
  Future<List<CurrCondition>> getCurrCondition(@Query('apikey') String apikey, @Path('locationKey') String locationKey);
}