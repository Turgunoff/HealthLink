part of 'location_bloc.dart';

@immutable
sealed class LocationState {}

final class LocationInitial extends LocationState {}

// Location yuklanish holati
class LocationLoading extends LocationState {}

// Location muvaffaqiyatli holati
class LocationSuccess extends LocationState {
  final String? address;
  final String? deviceId;
  final Position position;

  LocationSuccess({this.address, this.deviceId, required this.position});
}

// Location xatolik holati
class LocationFailure extends LocationState {
  final String error;

  LocationFailure({required this.error});
}
