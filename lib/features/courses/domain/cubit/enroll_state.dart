part of 'enroll_cubit.dart';

@immutable
sealed class EnrollState {}

final class EnrollInitial extends EnrollState {}

final class EnrollLoading extends EnrollState {}

final class EnrollSuccess extends EnrollState {}

final class EnrollError extends EnrollState {}
