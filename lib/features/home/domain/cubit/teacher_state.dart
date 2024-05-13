part of 'teacher_cubit.dart';

@immutable
sealed class TeacherState {}

final class TeacherInitial extends TeacherState {}

final class TeacherListLoadingState extends TeacherState{}
final class TeacherListLoadedState extends TeacherState{}
final class TeacherListErrortate extends TeacherState{}

