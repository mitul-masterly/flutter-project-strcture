part of 'otp_bloc.dart';

@freezed
class OtpEvent with _$OtpEvent {
  const factory OtpEvent.startTimerEvent() = StartTimerEvent;
  const factory OtpEvent.onChangeOtp({required final String otp}) = OnChangeOtp;

  const factory OtpEvent.onChangeEmailOrPhone(
      {required final String emailOrPhone}) = OnChangeEmailOrPhone;

  const factory OtpEvent.sendOtpEvent({required final BuildContext context}) =
  SendOtpEvent;

}

