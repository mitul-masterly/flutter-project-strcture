part of 'login_bloc.dart';

@freezed
class LoginEvent with _$LoginEvent {
  const factory LoginEvent.onButtonClickEvent() = OnButtonClickEvent;

  const factory LoginEvent.onChangeRememberMe(
      {required final bool isRememberMe}) = OnChangeRememberMe;
}
