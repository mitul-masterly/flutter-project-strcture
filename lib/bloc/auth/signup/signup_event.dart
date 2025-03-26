part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {

  const factory SignUpEvent.onChangeCountry(
      {required final Country selectedCountry}) = OnChangeCountry;

  const factory SignUpEvent.onChangeFirstName({required final String fName}) =
      OnChangeFirstName;

  const factory SignUpEvent.onChangeLastName({required final String lName}) =
      OnChangeLastName;

  const factory SignUpEvent.onChangeEmail({required final String email}) =
      OnChangeEmail;



  const factory SignUpEvent.onChangeMobileNumber(
      {required final String mobileNumber}) = OnChangeMobileNumber;

  const factory SignUpEvent.onSelectBirthDate(
      {required final String birthDate}) = OnSelectBirthDate;

  const factory SignUpEvent.onSelectGender({required final int genderId}) =
      OnSelectGender;

  const factory SignUpEvent.onChangeAddress({required final String address}) =
      OnChangeAddress;

  const factory SignUpEvent.onSelectCountry({required final int countryId}) =
      OnSelectCountry;
}
