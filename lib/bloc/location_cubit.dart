import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';

import '../models/location.dart';
import '../repositories/locationRepo.dart';

part 'location_state.dart';

class LocationCubit extends Cubit<LocationState> {
  final LocationRepo locationRepo;

  LocationCubit(this.locationRepo) : super(LocationInitial());

  Future<void> getDeviceLocationByIP(String publicIp) async {
    emit(LocationLoading());
    try {
      final location = await locationRepo.getDeviceLocationByIP(publicIp);
      emit(LocationLoaded(location: location));
    } catch (e) {
      emit(LocationLoadFailed(errorMessage: e.toString()));
    }
  }

  void getLocationDetails(String key, String localizedName, String country) {
    emit(LocationLoaded(
        location: Location(
            country: country, key: key, localizedName: localizedName)));
  }
}
