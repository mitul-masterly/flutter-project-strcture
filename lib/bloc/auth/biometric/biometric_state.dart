part of 'biometric_bloc.dart';

@freezed
abstract class BiometricState with _$BiometricState {
  factory BiometricState({
    required final CommonScreenState status,
  }) = _BiometricState;

  factory BiometricState.initial() => BiometricState(
    status: CommonScreenState.initial,
  );
}
