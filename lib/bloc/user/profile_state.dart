part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    required final CommonScreenState status,
    required final bool showLogoutSheet,
    final UserDataModel? userData,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      status: CommonScreenState.loading,
      showLogoutSheet: false,
      userData: null,
    );
  }
}
