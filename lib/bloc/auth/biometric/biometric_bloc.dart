import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_project_structure/app/my_app.dart';
import 'package:flutter_project_structure/components/common_snack_bar.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/views/auth/login/login_page.dart';
import 'package:flutter_project_structure/views/tab_navigation/tab_navigation_view.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:local_auth/local_auth.dart';
part 'biometric_event.dart';

part 'biometric_state.dart';

part 'biometric_bloc.freezed.dart';

class BiometricBloc extends Bloc<BiometricEvent, BiometricState> {
  final LocalAuthentication localAuth = LocalAuthentication();

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
        navigatorKey.currentState?.push(
         MaterialPageRoute(builder: (final _) => const TabNavigationView()),
        );

        showSuccessSnackBar('Login Successfully');
      } else {
        navigatorKey.currentState?.push(
          MaterialPageRoute(builder: (final _) => LoginScreen()),
        );
        showErrorSnackBar('Authentication failed');
      }

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
    }
    catch(e){

    }
    {}

    return isAuthenticated;
  }
}
