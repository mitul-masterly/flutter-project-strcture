part of 'signup_bloc.dart';

@freezed
abstract class SignUpEvent with _$SignUpEvent {
  const factory SignUpEvent.onTapSubmit() = OnTapSubmit;

  const factory SignUpEvent.onChangeCountry(
      {required final Country selectedCountry}) = OnChangeCountry;
}
