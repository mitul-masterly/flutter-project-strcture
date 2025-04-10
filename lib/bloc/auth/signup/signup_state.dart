part of 'signup_bloc.dart';

@freezed
abstract class SignUpState with _$SignUpState {
  factory SignUpState({
    required final String firstName,
    required final String lastName,
    required final String email,
    required final String countryISOCode,
    required final String countryCode,
    required final String mobileNumber,
    required final String? birthDate,
    required final int? genderId,
    required final int? countryId,
    required final String address,
    required final CommonScreenState status,
    required final List<dynamic>genderList,
    required final List<dynamic>countryList,
  }) = _SignUpState;

  factory SignUpState.initial() => SignUpState(
      firstName: '',
      lastName: '',
      email: '',
      countryISOCode: 'US',
      countryCode: '+1',
      mobileNumber: '',
      status: CommonScreenState.initial,
      address: '',
      birthDate: null,
      countryId: null,
      genderId: null,
    genderList: <dynamic>[
      <String, dynamic>{'id': 0, 'value': 'Male'},
      <String, dynamic>{'id': 1, 'value': 'Female'},
    ],
    countryList: <dynamic>[
      <String, dynamic>{'id': 0, 'value': 'India'},
      <String, dynamic>{'id': 1, 'value': 'USA'},
      <String, dynamic>{'id': 2, 'value': 'New Zealand'},
      <String, dynamic>{'id': 3, 'value': 'Democratic Republic of the Congo'},
      <String, dynamic>{'id': 4, 'value': 'Australia'},
    ]
  );
}
