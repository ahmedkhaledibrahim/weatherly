part of 'location_cubit.dart';

@immutable
abstract class LocationState {}

class LocationInitial extends LocationState {}

class LocationLoading extends LocationState {}

class LocationLoaded extends LocationState {
  final Location location;

  LocationLoaded({required this.location});
}

class LocationLoadFailed extends LocationState {
  final String errorMessage;

  LocationLoadFailed({required this.errorMessage});
}
