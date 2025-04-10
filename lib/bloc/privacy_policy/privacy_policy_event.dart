part of 'privacy_policy_bloc.dart';

@freezed
class PrivacyPolicyEvent with _$PrivacyPolicyEvent {
  const factory PrivacyPolicyEvent.started() = _Started;

  const factory PrivacyPolicyEvent.initial({required final String url}) =
      Initial;
}
