part of 'login_bloc.dart';

@freezed
class LoginState with _$LoginState {
  factory LoginState({
    required bool isLoading,
    required TextEditingController emailController,
    required TextEditingController passwordController,
  }) = _LoginState;
  factory LoginState.initial() {
    return LoginState(
        isLoading: false,
        emailController: TextEditingController(),
        passwordController: TextEditingController());
  }
}
