part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onChangeRememberMe(
      {required final bool isRememberMe}) = OnChangeRememberMe;

  const factory LoginEvent.onValidateForm(
      {required final GlobalKey<FormState> formKEy}) = OnValidateForm;

  const factory LoginEvent.onTapForgotPassword(
      {required final BuildContext context}) = OnTapForgotPassword;
}
