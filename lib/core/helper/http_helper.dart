// import 'dart:convert';
// import 'dart:io';
// import 'dart:typed_data';

// import 'package:buddy/app.dart';
// import 'package:buddy/core/cashing_maneger/cashing.dart';
// import 'package:buddy/core/cubit/app_cubit.dart';
// import 'package:buddy/core/error/exceptions/server_exception.dart';
// import 'package:buddy/core/service/service_locator.dart';
// import 'package:buddy/core/utils/api_constant.dart';
// import 'package:buddy/core/utils/app_const.dart';
// import 'package:flutter/cupertino.dart';
import 'dart:convert';

import 'package:http/http.dart' as http;

import '../errors/server_exception.dart';
import '../statics/api_constant.dart';
import '../statics/app_cashing.dart';
// import 'package:nb_utils/nb_utils.dart';

// import '../../config/routes/app_routes.dart';

// final httpHelper = sl<HTTPHelper>();

class HTTPHelper {
  Future get({
    required String path,
    String? token,
    Map<String, dynamic>? queryParameters,
    Map<String, dynamic>? body,
    Map<String, String>? headers,
  }) async {
    try {
        print(ApiConstant.baseUrl + path);
      final response = await http.get(Uri.parse(ApiConstant.baseUrl + path),
          headers: {
            "token": AppCashingService.token,
            "Content-Type": "application/json"
          });
        print(" test api from  ${response}");
      print(response);
      return _returnResponse(response);
    }  catch (e) {
        print(" test api from  ${e.toString()}");

      throw ServerException();
    }
  }

  Future post({
    required String path,
    Map<String, dynamic>? queryParameters,
    body,
    Map<String, String>? headers,
  }) async {
    try {
      final response = await http.post(
        Uri.parse(ApiConstant.baseUrl + path),
        headers: headers ??
            {"token": AppCashingService.token, "Content-Type": "application/json"},
        body: body == null ? body : json.encode(body),
      );
            print(response);

      return _returnResponse(response);
    }  catch (e) {
    throw ServerException();  
    }
  } 

  
}


String exceptionMasseges (Failure exception){
    switch (exception.runtimeType) {
    case ServerFailure:
      return "Server Error case";
    case UnauthorizedFailure:
      return "You need a Premmsions";
    case NoNetworkConnectionFailure:
      return "No Internet Connection";
    case BadRequestFailure:
      return "Bad Request";
    case WalletNoBalanceFailure:
      return "Wallet doesn't have enough Balance";
    case AppNeedToUpdateFailure:
      return "Need to be updated";
    case TooManyRequestsFailure:
      return "Too many Requests";
    default:
      return "Server Error deafult";
  }
  }


  Future multiPartRequest({
    required String path,
    required String filePath,
  }) async {
    var request = http.MultipartRequest('POST', Uri.parse(path))
      ..fields['files']
      ..files.add(
        await http.MultipartFile.fromPath(
          'package',
          filePath,
        ),
      );
    var response = await request.send();
    if (response.statusCode == 200) print('Uploaded!');
  }



  dynamic _returnResponse(http.Response response) {
    print("db dsjch ch zjch zxcihd ");
    print("////////////////////////////// ${response.body}");
    var responseJson = json.decode(response.body.toString());

  
      print(response.statusCode);
      switch (response.statusCode) {
        case 200:
       //   log("value log =${responseJson}");
          return responseJson;
        case 201:
          return responseJson;
        case 400:
          throw BadRequestException(message: responseJson['msg'].toString());
        case 401:
          throw UnauthorizedException();
        case 403:
          throw UnauthorizedException();
        case 404:
          throw BadRequestException(message: responseJson['msg'].toString());
        case 500:
          throw ServerException();
        case 409:
          throw ConflictException();

        default:
          throw ServerException();
      }
    
  }



