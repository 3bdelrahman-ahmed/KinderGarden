import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kg_sa/core/errors/server_exception.dart';
import 'package:kg_sa/core/helper/http_helper.dart';
import 'package:kg_sa/core/statics/api_constant.dart';
import 'package:kg_sa/core/statics/app_cashing.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart ' as http;

import '../../../../core/widgets/flutter_toast.dart';
import 'dart:convert';

part 'login_state.dart';

class LoginCubit extends Cubit<LoginState> {
  LoginCubit() : super(LoginInitial());
  
  Future<Either<Failure, String>> login(
    LoginParameters parameters,
    BuildContext context,
    Color color,
  ) async {
    emit(LoginLoadingState());
    try {
      final response = await http.post(
        Uri.parse(ApiConstant.baseUrl + ApiConstant.loginUrl),
        headers: {
          "Content-Type": "application/json",
        },
        body: json.encode(parameters.toJson()),
      );

      print('Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
        final token = _extractTokenFromResponse(response.body);
        AppCashingService.token=token;
        emit(LoginLoadedState());
        return Right(token);
      } else if (response.statusCode == 404) {
        emit(LoginErrorState());
        showToast(context, 'Invalid Parent Phone or password', color);
        return Left(BadRequestFailure());
      } else {
        emit(LoginErrorState());
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(LoginErrorState());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      emit(LoginErrorState());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }
}

String _extractTokenFromResponse(String jsonResponse) {
  final Map<String, dynamic> response = json.decode(jsonResponse);
  final String? token = response['data'];

  if (token != null) {
    return token;
  } else {
    throw Exception('Token not found in response');
  }
}

class LoginParameters {
  final String email;
  final String password;

  LoginParameters({required this.email, required this.password});

  Map<String, dynamic> toJson() {
    return {
      'parentPhone': email,
      'password': password,
    };
  }
}
