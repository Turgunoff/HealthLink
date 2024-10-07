part of 'location_bloc.dart';

@immutable
sealed class LocationEvent {}

// Joylashuvni olish event'i
class GetLocationEvent extends LocationEvent {}
