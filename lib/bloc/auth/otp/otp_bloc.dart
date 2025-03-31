import 'dart:async';

import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter_project_structure/Routes/routes_name.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'otp_bloc.freezed.dart';
part 'otp_event.dart';
part 'otp_state.dart';

class OtpBloc extends Bloc<OtpEvent, OtpState> {
  final GlobalKey<FormState> otpFormKey = GlobalKey<FormState>();
  final ValueNotifier<String> count = ValueNotifier<String>('');
  final GlobalKey<FormState> loginFormKey = GlobalKey<FormState>();
  Timer? timer;

  OtpBloc() : super(OtpState.initial()) {
    on<OnChangeOtp>((final OnChangeOtp event, final Emitter<OtpState> emit) {
      if (event.otp.length == 6) {
        emit(state.copyWith(status: CommonScreenState.success));
      }
      emit(state.copyWith(otp: event.otp));
    });

    on<StartTimerEvent>(
        (final StartTimerEvent event, final Emitter<OtpState> emit) {
      timer?.cancel();
      emit(state.copyWith(isEnableResend: false));
      int remainingSeconds = 30;
      timer =
          Timer.periodic(const Duration(seconds: 1), (final Timer timer) async {
        remainingSeconds -= 1;
        if (remainingSeconds >= 0) {
          count.value = (30 - timer.tick).toString();
        } else {
          timer.cancel();
        }
      });
    });
    on<SendOtpEvent>((final SendOtpEvent event, final Emitter<OtpState> emit) {
      Navigator.pushNamed(event.context, RouteName.otpScreen,
          arguments: <String, String>{'emailOrPhone': state.emailOrPhone});
    });
    on<OnChangeEmailOrPhone>(
        (final OnChangeEmailOrPhone event, final Emitter<OtpState> emit) {
      emit(state.copyWith(emailOrPhone: event.emailOrPhone));
    });
  }
}
