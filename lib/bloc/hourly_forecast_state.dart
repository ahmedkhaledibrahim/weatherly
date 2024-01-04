part of 'hourly_forecast_cubit.dart';

@immutable
abstract class HourlyForecastState {}

class HourlyForecastInitial extends HourlyForecastState {}

class HourlyForecastLoading extends HourlyForecastState {}

class HourlyForecastLoaded extends HourlyForecastState {
  final List<HourlyForecast> hourlyForecastList;

  HourlyForecastLoaded({required this.hourlyForecastList});
}

class HourlyForecastFailed extends HourlyForecastState {
  final String errorMessage;

  HourlyForecastFailed({required this.errorMessage});
}