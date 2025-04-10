part of 'sign_up_details_bloc.dart';

@freezed
class SignUpDetailsEvent with _$SignUpDetailsEvent {
  const factory SignUpDetailsEvent.initialEvent({required final SignupRequest signupRequest}) = InitialEvent;
  const factory SignUpDetailsEvent.onChangePassword({required final String password}) =
  OnChangePassword;

  const factory SignUpDetailsEvent.onChangeConfirmPassword(
      {required final String confirmPassword}) = OnChangeConfirmPassword;
  const factory SignUpDetailsEvent.onSelectQuestion({
    required final int questionId
}) = OnSelectQuestion;
  const factory SignUpDetailsEvent.onChangeAnswer({
    required final String answer
  }) = OnChangeAnswer;
  const factory SignUpDetailsEvent.onCheckPrivacyPolicy() = OnCheckPrivacyPolicy;
  const factory SignUpDetailsEvent.onCheckTermsAndCondition() = OnCheckTermsAndCondition;
  const factory SignUpDetailsEvent.onTapSubmit() = OnTapSubmit;
}
