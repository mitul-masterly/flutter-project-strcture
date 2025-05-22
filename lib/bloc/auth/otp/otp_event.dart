part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.onChangeOtp({required final String otp}) = OnChangeOtp;

  const factory OtpEvent.onChangeEmailOrPhone(
      {required final String emailOrPhone}) = OnChangeEmailOrPhone;

  const factory OtpEvent.sendOtpEvent({required final BuildContext context}) =
      SendOtpEvent;

  const factory OtpEvent.startOtpTimer() = StartOtpTimer;

  const factory OtpEvent.onTick({required final int secondsLeft}) = OnTick;
}
