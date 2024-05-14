import 'dart:convert';
import 'dart:io';

import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../../../core/errors/server_exception.dart';
import '../../../../core/statics/api_constant.dart';
import '../../../../core/widgets/flutter_toast.dart';
import '../../../profile/data/models/grades_model.dart';
import 'package:http/http.dart' as http;

import '../../data/models/current_activity_mcodel.dart';
part 'live_tracking_state.dart';

class LiveTrackingCubit extends Cubit<LiveTrackingState> {
  LiveTrackingCubit() : super(LiveTrackingInitial());

  CurrentActivityModel? getActivity;

    Future<Either<Failure, CurrentActivityModel>> getUserActivity(
    BuildContext context,
    Color color,
    String token,
  ) async {
    emit(LiveTrackingLoading());
    try {
      final response = await http.get(

        Uri.parse(ApiConstant.baseUrl + ApiConstant.activity),
        headers: {
          "Content-Type": "application/json",
          "Authorization": "Bearer $token"
        },
      );

      print('------------------>Response status code: ${response.statusCode}');
      print('Response body: ${response.body}');

      if (response.statusCode == 200) {
       final decodedData = json.decode(response.body);
        getActivity = CurrentActivityModel.fromJson(decodedData);
        emit(LiveTrackingLoaded());
        return Right(getActivity!);
       
      }else {
        emit(LiveTrackingError());
        showToast(context, 'An error occurred', color);
        return Left(ServerFailure());
      }
    } on SocketException catch (_) {
      emit(LiveTrackingError());
      showToast(context, 'No Internet Connection', color);
      return Left(NoNetworkConnectionFailure());
    } catch (e) {
      emit(LiveTrackingError());
      showToast(context, 'An error occurred', color);
      return Left(ServerFailure());
    }
  }
}
