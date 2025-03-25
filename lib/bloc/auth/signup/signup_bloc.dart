import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/device_info_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/utils/utils.dart';
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
  final FocusNode passwordFocus = FocusNode();
  final FocusNode cPasswordFocus = FocusNode();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();

  SignUpBloc({required this.authRepo}) : super(SignUpState.initial()) {
    on<OnTapSubmit>(
        (final OnTapSubmit event, final Emitter<SignUpState> emit) async {
      await callSignUpApi(emit);
    });

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

    on<OnChangePassword>(
        (final OnChangePassword event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(password: event.password));
    });
    on<OnChangeConfirmPassword>(
        (final OnChangeConfirmPassword event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });
    on<OnChangeMobileNumber>(
        (final OnChangeMobileNumber event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(mobileNumber: event.mobileNumber));
    });
  }

  Future<void> callSignUpApi(final Emitter<SignUpState> emit) async {
    emit(state.copyWith(status: CommonScreenState.loading));
    final DeviceInfoModel deviceData = await Utils.getDeviceInfo();

    final SignupRequest request = SignupRequest(
        firstName: state.firstName,
        lastName: state.lastName,
        emailId: state.email,
        contactNo: state.mobileNumber,
        isdCode: state.countryCode,
        userPassword: state.password,
        countryCodeISO2: state.countryISOCode,
        createdByDeviceName: deviceData.userDeviceName,
        createdByDeviceTypeId: deviceData.deviceTypeID);

    final Either<Failure, int?> result =
        await authRepo.apiSignUp(requestParams: request);

    result.fold((final Failure error) {
      emit(state.copyWith(status: CommonScreenState.error));
    }, (final int? statusCode) {
      if (statusCode == 200) {
        emit(state.copyWith(status: CommonScreenState.success));
      }
    });
  }
}
