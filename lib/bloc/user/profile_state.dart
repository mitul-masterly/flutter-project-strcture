part of 'profile_bloc.dart';

@freezed
abstract class ProfileState with _$ProfileState {
  factory ProfileState({
    required final bool isLoading,
    final UserDataModel? userData,
  }) = _ProfileState;

  factory ProfileState.initial() {
    return ProfileState(
      isLoading: false,
      userData: null,
    );
  }
}
