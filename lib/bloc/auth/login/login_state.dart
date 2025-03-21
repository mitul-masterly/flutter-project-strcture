part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState(
      {required final CommonScreenState status,
      required final String email,
      required final String password,
      required final bool isRememberMe,
      required final UserDataModel? user}) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      status: CommonScreenState.initial,
      email: sharedPreferenceHelper.getRememberEmail,
      password: sharedPreferenceHelper.getSavedPassword,
      user: null,
      isRememberMe: sharedPreferenceHelper.isRememberMe ?? false,
    );
  }
}
