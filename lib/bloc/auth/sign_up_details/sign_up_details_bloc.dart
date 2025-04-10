import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project_structure/Utils/utils.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/device_info_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'sign_up_details_event.dart';

part 'sign_up_details_state.dart';

part 'sign_up_details_bloc.freezed.dart';

class SignUpDetailsBloc extends Bloc<SignUpDetailsEvent, SignUpDetailsState> {
  final FocusNode passwordFocus = FocusNode();
  final FocusNode cPasswordFocus = FocusNode();
  final FocusNode answerFocus = FocusNode();
  final GlobalKey<FormState> signUpFormKey = GlobalKey<FormState>();
  final AuthRepo authRepo;
  SignupRequest signupRequest = SignupRequest();
  SignUpDetailsBloc({required this.authRepo})
      : super(SignUpDetailsState.initial()) {

    on<InitialEvent>(
    (final InitialEvent event, final Emitter<SignUpDetailsState> emit) {
      signupRequest = event.signupRequest;
    });
    on<OnChangePassword>(
        (final OnChangePassword event, final Emitter<SignUpDetailsState> emit) {
      emit(state.copyWith(password: event.password));
    });
    on<OnChangeConfirmPassword>((final OnChangeConfirmPassword event,
        final Emitter<SignUpDetailsState> emit) {
      emit(state.copyWith(confirmPassword: event.confirmPassword));
    });

    on<OnSelectQuestion>((final OnSelectQuestion event,
        final Emitter<SignUpDetailsState> emit) async {
      emit(state.copyWith(securityQuestionId: event.questionId));
    });
    on<OnChangeAnswer>((final OnChangeAnswer event,
        final Emitter<SignUpDetailsState> emit) async {
      emit(state.copyWith(securityAnswer: event.answer));
    });
    on<OnCheckPrivacyPolicy>((final OnCheckPrivacyPolicy event,
        final Emitter<SignUpDetailsState> emit) async {
      emit(state.copyWith(checkPrivacyPolicy: !state.checkPrivacyPolicy));
    });
    on<OnCheckTermsAndCondition>((final OnCheckTermsAndCondition event,
        final Emitter<SignUpDetailsState> emit) async {
      emit(state.copyWith(
          checkTermsAndCondition: !state.checkTermsAndCondition));
    });
    on<OnTapSubmit>((final OnTapSubmit event,
        final Emitter<SignUpDetailsState> emit) async {
      await callSignUpApi(emit);
    });
  }

  Future<void> callSignUpApi(final Emitter<SignUpDetailsState> emit) async {
    emit(state.copyWith(status: CommonScreenState.loading));
    final DeviceInfoModel deviceData = await Utils.getDeviceInfo();
    signupRequest.userPassword = state.password;
    signupRequest.securityQuestion = state.questionList[state.securityQuestionId ?? 0]['value'];
    signupRequest.securityAnswer = state.securityAnswer;
    signupRequest.privacyPolicy = state.checkPrivacyPolicy;
    signupRequest.termsAndConditions = state.checkTermsAndCondition;
    signupRequest.createdByDeviceName =  deviceData.userDeviceName;
    signupRequest.createdByDeviceTypeId = deviceData.deviceTypeID;

    final SignupRequest request = signupRequest;
    debugPrint('signupRequest_____${signupRequest}');

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
