import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/device_info_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/utils/utils.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:intl_phone_field/countries.dart';

part 'signup_bloc.freezed.dart';

part 'signup_event.dart';

part 'signup_state.dart';

class SignUpBloc extends Bloc<SignUpEvent, SignUpState> {
  final AuthRepo authRepo;

  SignUpBloc({required this.authRepo}) : super(SignUpState.initial()) {
    on<OnTapSubmit>(
        (final OnTapSubmit event, final Emitter<SignUpState> emit) async {
      emit(state.copyWith(isSubmitting: true));
      final DeviceInfoModel deviceData = await Utils.getDeviceInfo();

      try {
        final SignupRequest request = SignupRequest(
            firstName: state.txtFirstName.text,
            lastName: state.txtLastName.text,
            emailId: state.txtEmail.text,
            contactNo: state.txtMobileNumber.text,
            isdCode: state.countryCode,
            userPassword: state.txtPassword.text,
            countryCodeISO2: state.countryCodeISO2,
            CreatedByDeviceName: deviceData.userDeviceName,
            CreatedByDeviceTypeId: deviceData.deviceTypeID);

        final int? statusCode =
            await authRepo.apiSignUp(requestParams: request);
        if (statusCode == 200) {
          emit(state.copyWith(isSubmitting: false, isSuccess: true));
        } else {
          emit(state.copyWith(isSubmitting: false, isSuccess: false));
        }
      } catch (e) {
        final DioException error = e as DioException;
        emit(state.copyWith(
            isSubmitting: false,
            errorMessage: error.message,
            isSuccess: false));
      }
    });

    on<OnChangeCountry>(
        (final OnChangeCountry event, final Emitter<SignUpState> emit) {
      emit(state.copyWith(
          countryCode: event.selectedCountry.dialCode,
          countryCodeISO2: event.selectedCountry.code));
    });
  }
}
