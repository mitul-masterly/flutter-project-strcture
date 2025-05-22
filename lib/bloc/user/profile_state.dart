part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    required final CommonScreenState status,
    required final bool showLogoutSheet,
    required final bool showProfilePhotoEditSheet,
    final UserDataModel? userData,
    final bool? navigateToLogin,
    final String? selectedImage,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
        status: CommonScreenState.loading,
        showLogoutSheet: false,
        showProfilePhotoEditSheet: false,
        userData: null,
        navigateToLogin: false,
        selectedImage: null);
  }
}
