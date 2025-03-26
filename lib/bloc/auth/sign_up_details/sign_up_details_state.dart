part of 'sign_up_details_bloc.dart';

@freezed
abstract class SignUpDetailsState with _$SignUpDetailsState {
  factory SignUpDetailsState({
    required final String password,
    required final String confirmPassword,
    required final int? securityQuestionId,
    required final String securityAnswer,
    required final bool checkPrivacyPolicy,
    required final bool checkTermsAndCondition,
    required final CommonScreenState status,
    required final List<dynamic>questionList,
  }) = _SignUpDetailsState;

  factory SignUpDetailsState.initial() => SignUpDetailsState(
      password: '',
      confirmPassword: '',
      status: CommonScreenState.initial,
      checkPrivacyPolicy: false,
      checkTermsAndCondition: false,
      securityAnswer: '',
      securityQuestionId: null,
    questionList: <dynamic>[
      <String, dynamic>{
        'id': 0,
        'value': 'What was your school name ?'
      },
      <String, dynamic>{
        'id': 1,
        'value': 'What was your college name ?'
      },
      <String, dynamic>{
        'id': 2,
        'value': 'What is your favorite color ?'
      },
      <String, dynamic>{
        'id': 3,
        'value': 'What was your first pet’s name?'
      },
    ]
  );
}
