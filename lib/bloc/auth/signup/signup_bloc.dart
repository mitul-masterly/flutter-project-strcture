import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl_phone_field/countries.dart';

part 'signup_bloc.freezed.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;
  final FocusNode fNameFocus = FocusNode();
  final FocusNode lNameFocus = FocusNode();
  final FocusNode emailFocus = FocusNode();
  final FocusNode mobileFocus = FocusNode();
  final FocusNode addressFocus = FocusNode();

  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  SignUpBloc({required this.authRepo}) : super(SignUpState.initial()) {
    on<OnChangeCountry>(
        (final OnChangeCountry event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(countryCode: event.selectedCountry.dialCode));
      emit(state.copyWith(countryISOCode: event.selectedCountry.code));
    });

    on<OnChangeFirstName>(
        (final OnChangeFirstName event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(firstName: event.fName));
    });
    on<OnChangeLastName>(
        (final OnChangeLastName event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(lastName: event.lName));
    });
    on<OnChangeEmail>(
        (final OnChangeEmail event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(email: event.email));
    });

    on<OnChangeMobileNumber>(
        (final OnChangeMobileNumber event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(mobileNumber: event.mobileNumber));
    });
    on<OnChangeAddress>(
        (final OnChangeAddress event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(address: event.address));
    });
    on<OnSelectBirthDate>(
        (final OnSelectBirthDate event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(
        birthDate: event.birthDate,
      ));
    });
    on<OnSelectGender>(
        (final OnSelectGender event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(genderId: event.genderId));
    });
    on<OnSelectCountry>(
        (final OnSelectCountry event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(countryId: event.countryId));
    });
  }
}
