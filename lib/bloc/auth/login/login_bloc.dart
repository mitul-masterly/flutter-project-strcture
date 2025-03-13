import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/data/models/request_model/login_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/data/models/response_model/device_info_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/pref_helper/pref_keys.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/constants.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:flutter_project_structure/views/tab_navigation_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'login_bloc.freezed.dart';
part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;

  LoginBloc({required this.authRepo}) : super(LoginState.initial()) {
    on<OnButtonClickEvent>(
        (final OnButtonClickEvent event, final Emitter<LoginState> emit) async {
      emit(state.copyWith(
          isLoading: true, errorMessage: null, isSuccess: false, user: null));

      try {
        final PackageInfo packageInfo = await PackageInfo.fromPlatform();
        final String? fcmToken = await SharedPreferenceHelper().fcmToken;
        final DeviceInfoModel deviceData = await Utils.getDeviceInfo();

        final LoginRequestModel request = LoginRequestModel(
            emailId: state.emailController.text,
            userPassword: state.passwordController.text,
            appVersion: packageInfo.version,
            deviceToken: fcmToken,
            deviceType: deviceData.deviceType,
            deviceId: deviceData.deviceId,
            deviceName: deviceData.userDeviceName);

        final UserDataModel user =
            await authRepo.apiLogin(requestParams: request);
        SharedPreferenceHelper().saveIsLoggedIn(true);
        await SharedPreferenceHelper().saveUser(user);
        if (state.isRememberMe) {
          sharedPreferenceHelper.setRememberEmail(request.emailId ?? '');
          sharedPreferenceHelper.setUserPassword(request.userPassword ?? '');
        } else {
          sharedPreferenceHelper.removeString(PrefKeys.rememberEmail);
          sharedPreferenceHelper.removeString(PrefKeys.rememberPassword);
        }
        emit(state.copyWith(
            isLoading: false, errorMessage: null, user: user, isSuccess: true));
      } catch (e) {
        debugPrint('error message $e');

        final DioException error = e as DioException;
        emit(state.copyWith(
            isLoading: false,
            errorMessage: error.message,
            user: null,
            isSuccess: false));
      }
    });

    on<OnChangeRememberMe>(
        (final OnChangeRememberMe event, final Emitter<LoginState> emit) {
      sharedPreferenceHelper.saveIsRememberMe(event.isRememberMe);
      emit(state.copyWith(isRememberMe: event.isRememberMe));
    });
  }

  void navigateToDashboard(final BuildContext context) {
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (final BuildContext context) => const TabNavigationView()),
      (final Route<dynamic> route) => false, // Remove all previous routes
    );
  }
}
