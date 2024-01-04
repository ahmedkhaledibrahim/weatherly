import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:weatherly/models/forecast.dart';

import '../repositories/forecastRepo.dart';

part 'forecast_state.dart';

class ForecastCubit extends Cubit<ForecastState> {
  final ForecastRepo forecastRepo;

  ForecastCubit(this.forecastRepo) : super(ForecastInitial());

  Future<void> getForecastByLocationKey(String locationKey) async {
    emit(ForecastLoading());
    try {
      final forecast = await forecastRepo.getForecastByLocationKey(locationKey);
      emit(ForecastLoaded(forecast: forecast));
    } catch (e) {
      emit(ForecastLoadFailed(errorMessage: e.toString()));
    }
  }
}
