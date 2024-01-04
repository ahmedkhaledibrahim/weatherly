part of 'forecast_cubit.dart';

@immutable
abstract class ForecastState {}

class ForecastInitial extends ForecastState {}

class ForecastLoading extends ForecastState {}

class ForecastLoaded extends ForecastState {
  final Forecast forecast;

  ForecastLoaded({required this.forecast});
}

class ForecastLoadFailed extends ForecastState {
  final String errorMessage;

  ForecastLoadFailed({required this.errorMessage});
}
