part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getUserProfile() = OnGetUserProfile;

  const factory ProfileEvent.onTapLogout() = OnTapLogout;

  const factory ProfileEvent.callLogoutApi() = CallLogoutApi;
}
