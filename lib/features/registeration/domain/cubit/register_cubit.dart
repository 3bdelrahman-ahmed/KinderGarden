import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:kg_sa/core/helper/http_helper.dart';
import 'package:kg_sa/core/statics/api_constant.dart';
import 'package:kg_sa/core/widgets/flutter_toast.dart';
import 'package:meta/meta.dart';
import 'package:http/http.dart' as http;


import '../../../../core/errors/server_exception.dart';

part 'register_state.dart';

class RegisterCubit extends Cubit<RegisterState> {
  RegisterCubit() : super(RegisterInitial());

 Future<Either<Failure, String>> register(
  RegisterParameters parameters, BuildContext context, Color color
) async {
  if (parameters.img == null || !parameters.img.existsSync()) {
    print('Image File Path: ${parameters.img.path}');
print('File Exists: ${parameters.img.existsSync()}');
    emit(RegisterFailure());
    showToast(context, 'Invalid image file', color);
  }

  // Check if the DateTime object is valid
  if (parameters.birthDate == null || parameters.birthDate.isAfter(DateTime.now())) {
    // DateTime object is null or represents a future date
    emit(RegisterFailure());
    showToast(context, 'Invalid birth date', color);
  }
  try {
    
    var request = http.MultipartRequest('POST', Uri.parse(ApiConstant.baseUrl+ApiConstant.registerUrl));

    // Add form fields
    request.fields['name'] = parameters.name;
    request.fields['parentPhone'] = parameters.email;
    request.fields['password'] = parameters.password;
    request.fields['birthDate'] = parameters.birthDate.toIso8601String();

    // Add image file
    var image = await http.MultipartFile.fromPath('image', parameters.img.path);
    request.files.add(image);

    // Send the request
    var streamedResponse = await request.send();
      print("dcdhjc s");
    // Get response
    var response = await http.Response.fromStream(streamedResponse);
    print(response.body);
    // Check if request was successful

    
    if (response.statusCode == 200) {
      emit(RegisterSuccess());
      return Right(response.body);
    } else {
      emit(RegisterFailure());
      showToast(context, 'Failed with status code: ${response.statusCode}', color);
      return Left(ServerFailure());
    }
  } on SocketException catch (_) {
    emit(RegisterFailure());
    showToast(context, 'No Internet Connection', color);
    return Left(NoNetworkConnectionFailure());
  } catch (e) {
    emit(RegisterFailure());
    showToast(context, 'An error occurred', color);
    return Left(ServerFailure());
  }
}

}

class RegisterParameters {
  final String name;
  final String email;
  final String password;
  final File img;
  final DateTime birthDate;

  RegisterParameters(this.name, this.email, this.password, this.img,
      this.birthDate);
}
