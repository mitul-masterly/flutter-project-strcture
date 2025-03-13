part of 'login_bloc.dart';

@freezed
abstract class LoginState with _$LoginState {
  factory LoginState(
      {required final bool isLoading,
      required final TextEditingController emailController,
      required final TextEditingController passwordController,
      required final String? errorMessage,
      required final bool isSuccess,
      required final UserDataModel? user}) = _LoginState;

  factory LoginState.initial() {
    return LoginState(
      isLoading: false,
      emailController: TextEditingController(),
      passwordController: TextEditingController(),
      errorMessage: null,
      isSuccess: false,
      user: null,
    );
  }
}
