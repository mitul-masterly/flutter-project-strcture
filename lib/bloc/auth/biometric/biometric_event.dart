part of 'biometric_bloc.dart';

@freezed
class BiometricEvent with _$BiometricEvent {
  const factory BiometricEvent.started() = _Started;
  const factory BiometricEvent.loginWithBiometric() =
  LoginWithBiometric;

}
