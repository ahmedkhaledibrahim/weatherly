import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';
import 'package:weatherly/bloc/curr_condition_cubit.dart';
import 'package:weatherly/bloc/forecast_cubit.dart';
import 'package:weatherly/bloc/hourly_forecast_cubit.dart';
import 'package:weatherly/bloc/location_cubit.dart';
import 'package:weatherly/bloc/search_cubit.dart';
import 'package:weatherly/domain/currentconditionApi_services.dart';
import 'package:weatherly/domain/forecastApi_services.dart';
import 'package:weatherly/domain/locationApi_services.dart';
import 'package:weatherly/repositories/cityRepo.dart';
import 'package:weatherly/repositories/currConditionRepo.dart';
import 'package:weatherly/repositories/forecastRepo.dart';
import 'package:weatherly/repositories/locationRepo.dart';

final getIt = GetIt.instance;

Future<void> GetInit() async {
  getIt
    ..registerFactory<LocationCubit>(() => LocationCubit(getIt()))
    ..registerLazySingleton<LocationRepo>(
        () => LocationRepo(locationApiServices: getIt()))
    ..registerLazySingleton<LocationApiServices>(
        () => LocationApiServices(createAndSetupDio()))
    ..registerFactory<ForecastCubit>(() => ForecastCubit(getIt()))
    ..registerLazySingleton<ForecastRepo>(
        () => ForecastRepo(forecastApiServices: getIt()))
    ..registerLazySingleton<ForecastApiServices>(
        () => ForecastApiServices(createAndSetupDio()))
    ..registerFactory<CurrConditionCubit>(() => CurrConditionCubit(getIt()))
    ..registerLazySingleton<CurrConditionRepo>(
        () => CurrConditionRepo(currentConditionApiServices: getIt()))
    ..registerLazySingleton<CurrentConditionApiServices>(
        () => CurrentConditionApiServices(createAndSetupDio()))
    ..registerFactory<HourlyForecastCubit>(() => HourlyForecastCubit(getIt()))
    ..registerFactory<SearchCubit>(() => SearchCubit(getIt()))
    ..registerLazySingleton<CityRepo>(
        () => CityRepo(locationApiServices: getIt()));
}

createAndSetupDio() {
  Dio dio = Dio();
  dio.interceptors.add(LogInterceptor(
    requestBody: true,
    responseBody: true,
    error: true,
    request: true,
  ));
  return dio;
}
