part of 'forgot_password_bloc.dart';

@freezed
class ForgotPasswordEvent with _$ForgotPasswordEvent {
  const factory ForgotPasswordEvent.onTapSubmit() = OnTapSubmit;

  const factory ForgotPasswordEvent.onChangeEmail(
      {required final String email}) = OnChangeEmail;
}
