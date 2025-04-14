part of 'privacy_policy_bloc.dart';

@freezed
abstract class PrivacyPolicyState with _$PrivacyPolicyState {
  factory PrivacyPolicyState(
      {required final CommonScreenState status,
      required final WebViewController controller}) = _PrivacyPolicyState;

  factory PrivacyPolicyState.initial() {
    return PrivacyPolicyState(
        status: CommonScreenState.loading, controller: WebViewController());
  }
}
