import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/Utils/connection.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/data/api/dio_exception.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';

class DioInterceptor extends InterceptorsWrapper {
  DioInterceptor({
    super.onRequest,
    super.onResponse,
    super.onError,
  });

  @override
  void onRequest(final RequestOptions options,
      final RequestInterceptorHandler handler) async {
    if (!await ConnectionUtils.isNetworkConnected()) {
      // showCustomSnackBar(message: MessageConstant.networkError.tr);
      // handler.reject(DioException(
      //     error: null,
      //     requestOptions: options,
      //     message: MessageConstant.networkError.tr,
      //     type: DioExceptionType.connectionError));
      return;
    }

    final Map<String, dynamic> header = <String, dynamic>{
      'Content-Type': 'application/json',
    };
    if ((SharedPreferenceHelper().user?.authToken ?? '').isNotEmpty) {
      header['Authorization'] =
          'Bearer ${SharedPreferenceHelper().user?.authToken}';
    }
    // For translation on API side
    // if (SharedPreferenceHelper().getLanguageCode.isNotEmpty) {
    //   header['Accept-Language'] = SharedPreferenceHelper().getLanguageCode;
    // }
    debugPrint('header ${header}');
    options.headers = header;
    super.onRequest(options, handler);
  }

  @override
  void onResponse(final Response<dynamic> response,
      final ResponseInterceptorHandler handler) {
    super.onResponse(response, handler);
  }

  @override
  void onError(final DioException err, final ErrorInterceptorHandler handler) {
    String message = '';
    if (err.response?.data is Map) {
      final errors = err.response?.data['errors'];
      if (errors != null) {
        if (errors is Map) {
          final values = errors.entries.first.value;
          if (values is List) {
            message = values.first;
          }
        }
      }
      if (err.response?.data['message'] != null) {
        message = err.response?.data['message'];
      }
    }
    if (message.isNotEmpty) {
      showErrorSnackBar(
        message,
      );
    } else {
      final String msg = DioExceptions.fromDioError(err).message;
      showErrorSnackBar(
        msg,
      );
    }

    super.onError(err, handler);
  }
}
