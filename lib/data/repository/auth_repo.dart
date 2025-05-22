import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/data/api/dio_client.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/api/end_points.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/request_model/login_request_model.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/typedef/typedef.dart';

abstract class AuthRepo {
  ResultFuture<UserDataModel> apiLogin(
      {required final LoginRequestModel requestParams});

  ResultFuture<int?> apiSignUp({required final SignupRequest requestParams});

  ResultFuture<int?> apiLogout(
      {required final Map<String, dynamic> requestParams});

  ResultFuture<int?> apiForgotPassword({required final String email});
}

class AuthRepoImp implements AuthRepo {
  final DioClient _dioClient = DioClient();

  @override
  ResultFuture<UserDataModel> apiLogin(
      {required final LoginRequestModel requestParams}) async {
    try {
      final Response<dynamic> response = await _dioClient
          .post(AppEndPoints.login, data: requestParams.toJson());
      final UserDataModel responseModel =
          UserDataModel.fromJson(response.data['result']);
      return Right(responseModel);
    } on DioException catch (e) {
      debugPrint(e.message);

      return Left(
          ApiFailure(message: e.message, statusCode: e.response?.statusCode));
    } catch (e) {
      debugPrint(e.toString());
      return Left(ApiFailure(message: e.toString()));
    }
  }

  @override
  ResultFuture<int?> apiSignUp(
      {required final SignupRequest requestParams}) async {
    try {
      final Response<dynamic> response = await _dioClient
          .post(AppEndPoints.registration, data: requestParams.toJson());
      return Right(response.statusCode);
    } on DioException catch (e) {
      debugPrint(e.message);
      return Left(ApiFailure(
          message: e.message ?? '', statusCode: e.response?.statusCode ?? -1));
    } catch (e) {
      return Left(ApiFailure(message: e.toString() , statusCode: -1));
    }
  }

  @override
  ResultFuture<int?> apiLogout(
      {required final Map<String, dynamic> requestParams}) async {
    try {
      final Response<dynamic> response =
          await _dioClient.post(AppEndPoints.logout, data: requestParams);
      return Right(response.statusCode);
    } on DioException catch (e) {
      debugPrint(e.message);
      return Left(
        ApiFailure(
            message: e.message ?? AppMessages.somethingWentWrong.message,
            statusCode: e.response?.statusCode ?? -1),
      );
    } catch (e) {
      debugPrint(e.toString());
      return Left(ApiFailure(message: e.toString(), statusCode: -1));
    }
  }

  @override
  ResultFuture<int?> apiForgotPassword({required final String email}) async {
    await Future.delayed(const Duration(seconds: 2));
    return Right(200);
  }
}
