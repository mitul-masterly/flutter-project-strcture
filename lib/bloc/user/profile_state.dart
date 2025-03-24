part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    required final bool isLoading,
    required final bool showLogoutSheet,
    final UserDataModel? userData,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      isLoading: false,
      showLogoutSheet: false,
      userData: null,
    );
  }
}
