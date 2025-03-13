part of 'signup_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  factory SignUpState(
      {required final TextEditingController txtFirstName,
      required final TextEditingController txtLastName,
      required final TextEditingController txtEmail,
      required final TextEditingController txtPassword,
      required final TextEditingController txtConfirmPassword,
      required final TextEditingController txtMobileNumber,
      required final bool isSubmitting,
      final String? errorMessage,
      final bool? isSuccess,
      final String? countryCode,
      final String? countryCodeISO2}) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
      txtFirstName: TextEditingController(),
      txtEmail: TextEditingController(),
      txtPassword: TextEditingController(),
      txtConfirmPassword: TextEditingController(),
      txtLastName: TextEditingController(),
      txtMobileNumber: TextEditingController(),
      isSubmitting: false,
      isSuccess: false,
      errorMessage: null,
      countryCode: '+1',
      countryCodeISO2: 'US');
}
