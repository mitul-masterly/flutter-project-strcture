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
  Timer? _timer;

  OtpBloc() : super(OtpState.initial()) {
    on<OnChangeOtp>((final OnChangeOtp event, final Emitter<OtpState> emit) {
      if (event.otp.length == 6) {
        emit(state.copyWith(status: CommonScreenState.success));
      }
      emit(state.copyWith(otp: event.otp));
    });

    on<StartOtpTimer>(
        (final StartOtpTimer event, final Emitter<OtpState> emit) {
      _timer?.cancel();
      emit(state.copyWith(secondsLeft: 30, canResend: false));

      _timer = Timer.periodic(const Duration(seconds: 1), (final Timer timer) {
        final int seconds = 30 - timer.tick;
        if (seconds <= 0) {
          timer.cancel();
          add(const OnTick(secondsLeft: 0));
        } else {
          add(OnTick(secondsLeft: seconds));
        }
      });
    });

    on<OnTick>((final OnTick event, final Emitter<OtpState> emit) {
      emit(state.copyWith(
          secondsLeft: event.secondsLeft, canResend: event.secondsLeft == 0));
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

  void cancelTimer() {
    _timer?.cancel();
  }

  String formatTime(final int secondsLeft) {
    final minutes = (secondsLeft ~/ 60).toString().padLeft(2, '0');
    final seconds = (secondsLeft % 60).toString().padLeft(2, '0');
    return '$minutes:$seconds';
  }

  @override
  Future<void> close() {
    cancelTimer();
    return super.close();
  }
}
