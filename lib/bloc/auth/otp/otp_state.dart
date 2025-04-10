part of 'otp_bloc.dart';


@freezed
abstract class OtpState with _$OtpState {
  factory OtpState({
    required final String otp,
    required final int timer,
    required final bool isEnableResend,
    required final CommonScreenState status,
    required final String emailOrPhone,
  }) = _OtpState;

  factory OtpState.initial() => OtpState(
    otp: '',
    timer: 0,
    status: CommonScreenState.initial,
    isEnableResend: false,
    emailOrPhone: ''
  );
}
