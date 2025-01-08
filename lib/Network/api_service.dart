import 'package:dio/dio.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/Utils/end_points.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ApiService {
  final Dio _dio = Dio(
    BaseOptions(
      baseUrl: AppEndPoints.baseUrl,
      connectTimeout: const Duration(seconds: 20),
      receiveTimeout: const Duration(seconds: 20),
    ),
  );

  Future<Response> getRequest(String endpoint) async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      try {
        // Utils.printDebugLog(endpoint);
        dynamic header = {
          'content-Type': 'application/json',
          "api-key": "Masterly-Web-2024",
        };

        // if (Constants.shared.userLoginData != null) {
        //   var token = Constants.shared.userLoginData?.authToken;
        //   Utils.printDebugLog(token);
        //   header["Authorization"] = "Bearer $token";
        // }
        // Utils.printDebugLog(header);
        Response response =
            await _dio.get(endpoint, options: Options(headers: header));
        // Utils.printDebugLog(response);
        return response;
      } on DioException catch (e) {
        // Utils.printDebugLog(e);
        return _handleError(e);
      }
    } else {
      // Utils.printDebugLog(AppStrings.noInternetMsg);
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500, // Set appropriate error code
        statusMessage: AppStrings.noInternetMsg,
      );
    }
  }

  Future<Response> postRequest(String endpoint, dynamic data) async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      try {
        dynamic header = {
          'content-Type': 'application/json',
        };
        // if (Constants.shared.userLoginData != null) {
        //   var token = Constants.shared.userLoginData?.authToken;
        //   header["Authorization"] = "Bearer $token";
        // }
        // Utils.printDebugLog(endpoint);
        // Utils.printDebugLog(data);
        // Utils.printDebugLog(header);

        Response response = await _dio.post(endpoint,
            data: data, options: Options(headers: header));
        //  Utils.printDebugLog(response);
        return response;
      } on DioException catch (e) {
        //Utils.printDebugLog(e);
        return _handleError(e);
      }
    } else {
      // Utils.printDebugLog(AppStrings.noInternetMsg);
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500, // Set appropriate error code
        statusMessage: AppStrings.noInternetMsg,
      );
    }
  }

  Future<Response> putRequest(
      String endpoint, Map<String, dynamic> data) async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      try {
        dynamic header = {
          'content-Type': 'application/json',
        };
        // if (Constants.shared.userLoginData != null) {
        //   var token = Constants.shared.userLoginData?.authToken;
        //   header["Authorization"] = "Bearer $token";
        // }
        // Utils.printDebugLog(endpoint);
        // Utils.printDebugLog(data);
        // Utils.printDebugLog(header);

        Response response = await _dio.put(endpoint,
            data: data, options: Options(headers: header));
        // Utils.printDebugLog(response);
        return response;
      } on DioException catch (e) {
        // Utils.printDebugLog(e);
        return _handleError(e);
      }
    } else {
      // Utils.printDebugLog(AppStrings.noInternetMsg);
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500, // Set appropriate error code
        statusMessage: AppStrings.noInternetMsg,
      );
    }
  }

  Future<Response> deleteRequest(String endpoint) async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      try {
        dynamic header = {
          'content-Type': 'application/json',
        };
        // if (Constants.shared.userLoginData != null) {
        //   var token = Constants.shared.userLoginData?.authToken;
        //   header["Authorization"] = "Bearer $token";
        // }
        // Utils.printDebugLog(endpoint);
        // Utils.printDebugLog(header);

        Response response =
            await _dio.delete(endpoint, options: Options(headers: header));
        // Utils.printDebugLog(response);
        return response;
      } on DioException catch (e) {
        // Utils.printDebugLog(e);
        return _handleError(e);
      }
    } else {
      // Utils.printDebugLog(AppStrings.noInternetMsg);
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500, // Set appropriate error code
        statusMessage: AppStrings.noInternetMsg,
      );
    }
  }

  Future<Response> multiPartPostRequest(String endpoint, formData) async {
    bool isConnected = await checkInternetConnection();
    if (isConnected) {
      try {
        dynamic header = {'content-Type': 'application/json'};
        // if (Constants.shared.userData != null) {
        //   var token = Constants.shared.userData?.value.authToken;
        //   header["Authorization"] = "Bearer $token";
        // }
        //Utils.printDebugLog(header);
        Response response = await _dio.post(endpoint,
            data: formData, options: Options(headers: header));
        //Utils.printDebugLog('multipart$response');
        return response;
      } on DioException catch (e) {
        // Utils.printDebugLog(e);
        return _handleError(e);
      }
    } else {
      // Utils.printDebugLog(AppStrings.noInternetMsg);
      return Response(
        requestOptions: RequestOptions(path: endpoint),
        statusCode: 500, // Set appropriate error code
        statusMessage: AppStrings.noInternetMsg,
      );
    }
  }

  Response _handleError(DioException error) {
    //Utils.printDebugLog(error);
    String errorMessage = "";
    switch (error.type) {
      case DioExceptionType.connectionTimeout:
        errorMessage = AppStrings.connectionTimeoutMsg;
        break;
      case DioExceptionType.sendTimeout:
        break;
      case DioExceptionType.receiveTimeout:
        errorMessage = AppStrings.receiveTimeoutMsg;
        break;
      case DioExceptionType.badResponse:
        if (error.response?.statusCode == 409 ||
            error.response?.statusCode == 400) {
          errorMessage = error.response?.data["errorMessage"] ??
              error.response?.data["message"] ??
              AppStrings.somethingWantWrong;
          // errorMessage = error.response?.data["errorMessage"];
        } else if (error.response?.statusCode == 401) {
          errorMessage = "Authentication failed.";
          //CommonApi().logoutAPI(navigatorKey.currentState?.context);
        } else {
          errorMessage = AppStrings.invalidStatusCodeMsg +
              error.response!.statusCode.toString();
        }
        break;
      case DioExceptionType.cancel:
        errorMessage = AppStrings.requestCancelled;
        break;
      case DioExceptionType.unknown:
        errorMessage = AppStrings.connectionIssueMsg;
        break;
      case DioExceptionType.badCertificate:
        errorMessage = AppStrings.somethingWantWrong;
        break;
      default:
        errorMessage = AppStrings.somethingWantWrong;
        break;
    }

    return Response(
      requestOptions: error.requestOptions,
      statusCode: error.response?.statusCode ?? 500,
      statusMessage: errorMessage,
    );
  }

  Future<bool> checkInternetConnection() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult[0] == ConnectivityResult.mobile ||
        connectivityResult[0] == ConnectivityResult.wifi) {
      return true;
    }
    return false;
  }
}
