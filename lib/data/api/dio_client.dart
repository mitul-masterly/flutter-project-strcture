import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_project_structure/data/api/dio_interceptor.dart';
import 'package:flutter_project_structure/data/api/end_points.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';

class DioClient {
  final Dio _dio;

  DioClient()
      : _dio = Dio(BaseOptions(
          baseUrl: AppEndPoints.baseUrl,
          connectTimeout: const Duration(minutes: 2),
          receiveTimeout: const Duration(minutes: 2),
          responseType: ResponseType.json,
          contentType: Headers.jsonContentType,
        )) {
    _dio.interceptors.add(DioInterceptor());

    if (kDebugMode) {
      _dio.interceptors.add(
        PrettyDioLogger(
          requestHeader: true,
          requestBody: true,
          responseBody: true,
          responseHeader: false,
          error: true,
          compact: true,
          logPrint: (final Object object) => debugPrint(object.toString()),
        ),
      );
    }
  }

  // GET Request
  Future<Response<dynamic>> get(
    final String uri, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onReceiveProgress,
  }) async {
    return await _handleRequest(
      () => _dio.get(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  // POST Request
  Future<Response<dynamic>> post(
    final String uri, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    return await _handleRequest(
      () => _dio.post(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  // PATCH Request
  Future<Response<dynamic>> patch(
    final String uri, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    return await _handleRequest(
      () => _dio.patch(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  // PUT Request
  Future<Response<dynamic>> put(
    final String uri, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
    final ProgressCallback? onSendProgress,
    final ProgressCallback? onReceiveProgress,
  }) async {
    return await _handleRequest(
      () => _dio.put(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      ),
    );
  }

  // DELETE Request
  Future<Response<dynamic>> delete(
    final String uri, {
    final dynamic data,
    final Map<String, dynamic>? queryParameters,
    final Options? options,
    final CancelToken? cancelToken,
  }) async {
    return await _handleRequest(
      () => _dio.delete(
        uri,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      ),
    );
  }

  // Private method to handle requests with error handling
  Future<Response<dynamic>> _handleRequest(
      final Future<Response<dynamic>> Function() request) async {
    try {
      return await request();
    } catch (e) {
      debugPrint('Dio Error: $e');
      rethrow;
    }
  }
}
