import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:kg_sa/features/profile/data/models/courses_model.dart';
import 'package:kg_sa/features/profile/data/models/user_profile_model.dart';
import 'package:http/http.dart' as http;
import '../../../../core/errors/server_exception.dart';
import '../../../../core/statics/api_constant.dart';
import '../../../../core/widgets/flutter_toast.dart';
import '../../data/models/grades_model.dart';

part 'profile_state.dart';

class ProfileCubit extends Cubit<ProfileState> {
  ProfileCubit() : super(ProfileInitial());
  UserProfileModel ? userData;
  CoursesModel? enrolledCourses;
  GradesModel? grades;
   Future<Either<Failure, UserProfileModel>> gerUserProfileData(
    BuildContext context,
    Color color,
    String token,
  ) async {
    emit(ProfileLoading());
    try {
      final response = await http.get(

        Uri.parse(ApiConstant.baseUrl + ApiConstant.userProfileData),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
       final decodedData = json.decode(response.body);
        userData = UserProfileModel.fromJson(decodedData);
        emit(ProfileLoaded());
        return Right(userData!);
       
      }else {
        emit(ProfileError());
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(ProfileError());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      emit(ProfileError());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }

     Future<Either<Failure, CoursesModel>> getAllCourses(
    BuildContext context,
    Color color,
    String token,
  ) async {
    emit(EnrolledCoursesLoading());
    try {
      final response = await http.get(

        Uri.parse(ApiConstant.baseUrl + ApiConstant.coursesEnrolled),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
       final decodedData = json.decode(response.body);
        enrolledCourses = CoursesModel.fromJson(decodedData);
        emit(EnrolledCoursesLoaded());
        return Right(enrolledCourses!);
       
      }else {
        emit(EnrolledCoursesError());
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(EnrolledCoursesError());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      emit(EnrolledCoursesError());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }



     Future<Either<Failure, GradesModel>> getUserGrades(
    BuildContext context,
    Color color,
    String token,
  ) async {
    emit(GradesLoadingState());
    try {
      final response = await http.get(

        Uri.parse(ApiConstant.baseUrl + ApiConstant.grades),
      
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );
      print("${ApiConstant.baseUrl + ApiConstant.grades}");
      print('------------------>Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
       final decodedData = json.decode(response.body);
        grades = GradesModel.fromJson(decodedData);
        emit(GradesLoadedState());
        return Right(grades!);
       
      }else {
        emit(GradesErrorState());
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(GradesErrorState());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      emit(GradesErrorState());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }
}


