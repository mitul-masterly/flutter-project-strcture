import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
import 'package:local_auth/error_codes.dart' as local_auth_error;

part 'biometric_event.dart';

part 'biometric_state.dart';

part 'biometric_bloc.freezed.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final LocalAuthentication localAuth = LocalAuthentication();
  final LocalAuthentication _localAuth = LocalAuthentication();


  BiometricBloc() : super(BiometricState.initial()) {
    on<LoginWithBiometric>((final LoginWithBiometric event,
        final Emitter<BiometricState> emit) async {
      bool? isAuthenticated = false;
      final bool canCheckBiometrics = await localAuth.canCheckBiometrics;
      final bool isDeviceSupported = await localAuth.isDeviceSupported();
      if (canCheckBiometrics && isDeviceSupported) {
        final List<BiometricType> availableBiometrics =
            await localAuth.getAvailableBiometrics();
        if (availableBiometrics.isNotEmpty) {
          if (availableBiometrics.contains(BiometricType.strong) ||
              availableBiometrics.contains(BiometricType.face)) {
           debugPrint('test_______${BiometricType.face.name}');
           debugPrint('availableBiometrics_______${availableBiometrics}');
          }
          isAuthenticated = await authenticateWithBiometrics();
        } else {
          showErrorSnackBar(
              'No biometrics enrolled. Please enroll a fingerprint or face recognition.');
        }
      } else {
        showErrorSnackBar(
            'Biometric authentication is not available on this device.');
      }
      if (isAuthenticated) {
        Navigator.pushNamed(event.context, RouteName.tabNavigationView);
        showSuccessSnackBar('Login Successfully');
      } else {
        showErrorSnackBar('Authentication failed');
      }
    });

    on<LoginWithFaceID>((final LoginWithFaceID event,
        final Emitter<BiometricState> emit) async {
      bool isAuthorized = false;
      final _localAuthentication = LocalAuthentication();
      bool _isUserAuthorized = false;
      try {
        final List<BiometricType> biometricTypes =
        await _localAuthentication.getAvailableBiometrics();
        debugPrint('biometricTypes______${biometricTypes}');
        isAuthorized = await _localAuthentication.authenticate(
          localizedReason: "Please authenticate to see account balance",
          options: const AuthenticationOptions(
            useErrorDialogs: true,
            stickyAuth: true,
            biometricOnly: true,
          ),
        );
      } on PlatformException catch (exception) {
        if (exception.code == local_auth_error.notAvailable ||
            exception.code == local_auth_error.passcodeNotSet ||
            exception.code == local_auth_error.notEnrolled) {
          // Handle this exception here.
        }
      }
        _isUserAuthorized = isAuthorized;

    });
  }


  Future<bool> authenticateWithBiometrics() async {
    bool isAuthenticated = false;
    try {
      isAuthenticated = await localAuth.authenticate(
        localizedReason: 'Please authenticate to access this feature',
        options: const AuthenticationOptions(
          useErrorDialogs: true,
          stickyAuth: true,
          biometricOnly: true,
        ),
      );


    } on PlatformException catch (exception) {
      if (exception.code == local_auth_error.notAvailable ||
          exception.code == local_auth_error.passcodeNotSet ||
          exception.code == local_auth_error.notEnrolled); }{
    }

    return isAuthenticated;
  }
}
