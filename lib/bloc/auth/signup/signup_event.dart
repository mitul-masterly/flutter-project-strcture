part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.onTapSubmit() = OnTapSubmit;

  const factory SignUpEvent.onChangeCountry(
      {required final Country selectedCountry}) = OnChangeCountry;

  const factory SignUpEvent.onChangeFirstName({required final String fName}) =
      OnChangeFirstName;

  const factory SignUpEvent.onChangeLastName({required final String lName}) =
      OnChangeLastName;

  const factory SignUpEvent.onChangeEmail({required final String email}) =
      OnChangeEmail;

  const factory SignUpEvent.onChangePassword({required final String password}) =
      OnChangePassword;

  const factory SignUpEvent.onChangeConfirmPassword(
      {required final String confirmPassword}) = OnChangeConfirmPassword;

  const factory SignUpEvent.onChangeMobileNumber(
      {required final String mobileNumber}) = OnChangeMobileNumber;
}
