// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:kg_sa/core/statics/app_colors.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/statics/api_constant.dart';
import '../../../../core/widgets/flutter_toast.dart';
import '../../../profile/data/models/user_profile_model.dart';

part 'enroll_state.dart';

class EnrollCubit extends Cubit<EnrollState> {
  EnrollCubit() : super(EnrollInitial());
  String  msg = "your Request completed successfully";
Future<Either<Failure, String>> enrollCourse(
    BuildContext context,
    Color color,
    String token,
    EnrollCourseParameters parameters,

  ) async {
    emit(EnrollLoading());
    try {
      final response = await http.post(

        Uri.parse(ApiConstant.baseUrl +ApiConstant.enrollCourse),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
        body: json.encode(parameters.toJson())
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final Map<String, dynamic> responseBody = json.decode(response.body);
      final String message = responseBody['message'] ?? 'Unknown message';
      showToast(context, message, AppColors.amberColor);
      emit(EnrollSuccess());
      return Right(message);
      }else {
        emit(EnrollError());
        print("heeeeeeevd");
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(EnrollError());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      print("heeeeeeegggggggggggggvd");
      
      emit(EnrollError());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }


}

class EnrollCourseParameters {
  int courseId;

  EnrollCourseParameters({
    required this.courseId,
  });

  Map<String, dynamic> toJson() {
    return {
      'courseId': courseId,
    };
  }
}
