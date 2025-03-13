import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/data/api/dio_client.dart';
import 'package:flutter_project_structure/data/api/end_points.dart';
import 'package:flutter_project_structure/data/models/request_model/login_request_model.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';

abstract class AuthRepo {
  Future<UserDataModel> apiLogin(
      {required final LoginRequestModel requestParams});

  Future<int?> apiSignUp({required final SignupRequest requestParams});
}

class AuthRepoImp implements AuthRepo {
  final DioClient _dioClient = DioClient();

  @override
  Future<UserDataModel> apiLogin(
      {required final LoginRequestModel requestParams}) async {
    try {
      final Response<dynamic> response = await _dioClient
          .post(AppEndPoints.login, data: requestParams.toJson());
      final UserDataModel responseModel =
          UserDataModel.fromJson(response.data['result']);
      return responseModel;
    } on DioException catch (e) {
      debugPrint(e.message);
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }

  @override
  Future<int?> apiSignUp({required final SignupRequest requestParams}) async {
    try {
      final Response<dynamic> response = await _dioClient
          .post(AppEndPoints.registration, data: requestParams.toJson());
      return response.statusCode;
    } on DioException catch (e) {
      debugPrint(e.message);
      rethrow;
    } catch (e) {
      debugPrint(e.toString());
      rethrow;
    }
  }
}
