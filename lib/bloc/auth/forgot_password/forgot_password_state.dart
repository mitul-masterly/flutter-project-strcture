part of 'forgot_password_bloc.dart';

@freezed
abstract class ForgotPasswordState with _$ForgotPasswordState {
  const factory ForgotPasswordState(
      {final bool? isLoading,
      required final TextEditingController txtEmail}) = _ForgotPasswordState;

  factory ForgotPasswordState.initial() =>
      ForgotPasswordState(isLoading: null, txtEmail: TextEditingController());
}
