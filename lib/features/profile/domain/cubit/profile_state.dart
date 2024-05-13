part of 'profile_cubit.dart';

@immutable
sealed class ProfileState {}

final class ProfileInitial extends ProfileState {}


 final class ProfileLoading extends ProfileState {}
 final class ProfileLoaded extends ProfileState {}
 final class ProfileError extends ProfileState {}


 final class EnrolledCoursesLoading extends ProfileState {}
 final class EnrolledCoursesLoaded extends ProfileState {}
 final class EnrolledCoursesError extends ProfileState {}