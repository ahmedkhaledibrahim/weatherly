import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/hourlyForecast.dart';
import '../repositories/forecastRepo.dart';

part 'hourly_forecast_state.dart';

class HourlyForecastCubit extends Cubit<HourlyForecastState> {
  final ForecastRepo forecastRepo;

  HourlyForecastCubit(this.forecastRepo) : super(HourlyForecastInitial());

  Future<void> getHourlyForecast(String locationKey) async {
    try {
      emit(HourlyForecastLoading());
      List<HourlyForecast> hourlyforecastList =
          await forecastRepo.getHourlyForcast(locationKey);
      emit(HourlyForecastLoaded(hourlyForecastList: hourlyforecastList));
    } catch (e) {
      emit(HourlyForecastFailed(errorMessage: e.toString()));
    }
  }
}
