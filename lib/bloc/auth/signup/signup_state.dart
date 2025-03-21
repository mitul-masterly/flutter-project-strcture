part of 'signup_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  factory SignUpState({
    required final String firstName,
    required final String lastName,
    required final String email,
    required final String password,
    required final String confirmPassword,
    required final String countryISOCode,
    required final String countryCode,
    required final String mobileNumber,
    required final CommonScreenState status,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
        firstName: '',
        lastName: '',
        email: '',
        password: '',
        confirmPassword: '',
        countryISOCode: 'US',
        countryCode: '+1',
        mobileNumber: '',
        status: CommonScreenState.initial,
      );
}
