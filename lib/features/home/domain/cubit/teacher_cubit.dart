import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kg_sa/features/home/data/models/teacher_model.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/statics/api_constant.dart';
import '../../../../core/widgets/flutter_toast.dart';
import 'package:http/http.dart' as http;
part 'teacher_state.dart';

class TeacherCubit extends Cubit<TeacherState> {
  TeacherCubit() : super(TeacherInitial());
  TeachersModel ? teachersList;
   Future<Either<Failure, TeachersModel>> getTeachersList(
    BuildContext context,
    Color color,
    String token,
  ) async {
    emit(TeacherListLoadingState());
    try {
      final response = await http.get(

        Uri.parse(ApiConstant.baseUrl + ApiConstant.teachers),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
       final decodedData = json.decode(response.body);
        teachersList = TeachersModel.fromJson(decodedData);
        emit(TeacherListLoadedState());
        return Right(teachersList!);
       
      }else {
        emit(TeacherListErrortate());
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(TeacherListErrortate());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      emit(TeacherListErrortate());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }
}

