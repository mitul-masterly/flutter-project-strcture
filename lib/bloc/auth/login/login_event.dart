part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onChangeRememberMe(
      {required final bool isRememberMe}) = OnChangeRememberMe;

  const factory LoginEvent.onChangeEmail({required final String email}) =
      OnChangeEmail;

  const factory LoginEvent.onChangePassword({required final String password}) =
      OnChangePassword;

  const factory LoginEvent.onSubmit() = OnSubmit;

  const factory LoginEvent.onTapForgotPassword(
      {required final BuildContext context}) = OnTapForgotPassword;
  const factory LoginEvent.onTapLoginWithOtpStateEvent() =
      OnTapLoginWithOtpStateEvent;

  const factory LoginEvent.loginWithBiometric({required final BuildContext context}) =
  LoginWithBiometric;
}
