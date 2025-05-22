import 'package:firebase_crashlytics/firebase_crashlytics.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/request_model/login_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/data/models/response_model/device_info_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/helper/pref_helper/pref_keys.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/constants.dart';
import 'package:flutter_project_structure/views/tab_navigation/tab_navigation_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:package_info_plus/package_info_plus.dart';

part 'login_bloc.freezed.dart';

part 'login_event.dart';

part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final AuthRepo authRepo;
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();

  LoginBloc({required this.authRepo}) : super(LoginState.initial()) {
    on<OnChangeEmail>(
        (final OnChangeEmail event, final Emitter<LoginState> emit) {
      emit(state.copyWith(email: event.email));
    });

    on<OnChangePassword>(
        (final OnChangePassword event, final Emitter<LoginState> emit) {
      emit(state.copyWith(password: event.password));
    });

    on<OnSubmit>((final OnSubmit event, final Emitter<LoginState> emit) async {
      debugPrint('OnSubmit called');
      emit(state.copyWith(status: CommonScreenState.loading, user: null));

      final PackageInfo packageInfo = await PackageInfo.fromPlatform();
      final String? fcmToken = await SharedPreferenceHelper().fcmToken;
      final DeviceInfoModel deviceData = await Utils.getDeviceInfo();

      final LoginRequestModel request = LoginRequestModel(
          emailId: state.email,
          userPassword: state.password,
          appVersion: packageInfo.version,
          deviceToken: fcmToken,
          deviceType: deviceData.deviceType,
          deviceId: deviceData.deviceId,
          deviceName: deviceData.userDeviceName);

      final Either<Failure, UserDataModel> result =
          await authRepo.apiLogin(requestParams: request);

      result.fold((final Failure error) {
        emit(state.copyWith(status: CommonScreenState.error, user: null));
      }, (final UserDataModel user) async {
        emit(state.copyWith(status: CommonScreenState.success, user: user));
        FirebaseCrashlytics.instance.setUserIdentifier(user.emailId ?? '');
        FirebaseCrashlytics.instance.setCustomKey('user_name', user.fullName);
        FirebaseCrashlytics.instance.setCustomKey('registration_id', user.userRegistrationId ?? 'Not Found');
        SharedPreferenceHelper().saveIsLoggedIn(true);
        await SharedPreferenceHelper().saveUser(user);

        if (state.isRememberMe) {
          sharedPreferenceHelper.setRememberEmail(request.emailId ?? '');
          sharedPreferenceHelper.setUserPassword(request.userPassword ?? '');
        } else {
          sharedPreferenceHelper.removeString(PrefKeys.rememberEmail);
          sharedPreferenceHelper.removeString(PrefKeys.rememberPassword);
        }
      });
    });

    on<OnChangeRememberMe>(
        (final OnChangeRememberMe event, final Emitter<LoginState> emit) {
      sharedPreferenceHelper.saveIsRememberMe(event.isRememberMe);
      emit(state.copyWith(isRememberMe: event.isRememberMe));
    });

    on<OnTapForgotPassword>((final OnTapForgotPassword event, final Emitter<LoginState> emit) {
      navigateToForgotPassword(event.context);
    });

    on<OnTapLoginWithOtpStateEvent>((final OnTapLoginWithOtpStateEvent event,
        final Emitter<LoginState> emit) async {
      emit(state.copyWith(isLoginWithOtp: !state.isLoginWithOtp));
    });



  }

  void navigateToDashboard(final BuildContext context) {
    debugPrint('navigateToDashboard');
    Navigator.pushAndRemoveUntil(
      context,
      MaterialPageRoute(
          builder: (final BuildContext context) =>  TabNavigationView()),
      (final Route<dynamic> route) => false, // Remove all previous routes
    );
  }

  void navigateToForgotPassword(final BuildContext context) {}



}


