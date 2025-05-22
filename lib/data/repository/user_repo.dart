import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/data/api/dio_client.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/api/end_points.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/typedef/typedef.dart';

abstract class UserRepo {
  ResultFuture<UserDataModel> getUserProfileApi();
}

class UserRepoImp implements UserRepo {
  final DioClient _dioClient = DioClient();

  @override
  ResultFuture<UserDataModel> getUserProfileApi() async {
    try {
      final int? id = SharedPreferenceHelper().user?.userRegistrationId;
      final Response<dynamic> response = await _dioClient.get(
        AppEndPoints.getUserProfile + '/$id',
      );
      final UserDataModel responseModel =
          UserDataModel.fromJson(response.data['result']);
      return Right(responseModel);
    } on DioException catch (e) {
      debugPrint(e.message);
      return Left(ApiFailure(
          message: e.message, statusCode: e.response?.statusCode ?? -1));
    } catch (e) {
      debugPrint(e.toString());
      return Left(ApiFailure(message: e.toString()));
    }
  }
}
