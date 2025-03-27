part of 'biometric_bloc.dart';

@freezed
class BiometricEvent with _$BiometricEvent {
  const factory BiometricEvent.started() = _Started;
  const factory BiometricEvent.loginWithBiometric({required final BuildContext context}) =
  LoginWithBiometric;
  const factory BiometricEvent.loginWithFaceID({required final BuildContext context}) =
  LoginWithFaceID;
}
