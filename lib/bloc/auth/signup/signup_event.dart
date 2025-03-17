part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.onTapSubmit(
      {required final GlobalKey<FormState> formKey}) = OnTapSubmit;

  const factory SignUpEvent.onChangeCountry(
      {required final Country selectedCountry}) = OnChangeCountry;
}
