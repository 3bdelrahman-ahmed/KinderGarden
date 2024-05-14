part of 'live_tracking_cubit.dart';

@immutable
sealed class LiveTrackingState {}

final class LiveTrackingInitial extends LiveTrackingState {}

final class LiveTrackingLoading extends LiveTrackingState {}

final class LiveTrackingLoaded extends LiveTrackingState {}

final class LiveTrackingError extends LiveTrackingState {}
