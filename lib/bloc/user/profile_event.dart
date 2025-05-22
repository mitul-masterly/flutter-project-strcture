part of 'profile_bloc.dart';

@freezed
class ProfileEvent with _$ProfileEvent {
  const factory ProfileEvent.getUserProfile() = OnGetUserProfile;

  const factory ProfileEvent.onTapLogout() = OnTapLogout;

  const factory ProfileEvent.callLogoutApi() = CallLogoutApi;

  const factory ProfileEvent.onTapEditProfilePhoto() = OnTapEditProfilePhoto;

  const factory ProfileEvent.onSelectProfilePhoto(
      {required final String imagePath}) = OnSelectProfilePhoto;
}
