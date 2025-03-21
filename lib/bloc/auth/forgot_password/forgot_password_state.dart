part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState({
    required final CommonScreenState status,
    final String? email,
  }) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() =>
      ForgotPasswordState(status: CommonScreenState.initial, email: null);
}
