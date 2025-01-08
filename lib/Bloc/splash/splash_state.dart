part of 'splash_bloc.dart';

@freezed
class SplashState with _$SplashState {
  factory SplashState({
    required bool isNavigate,
  }) = _SplashState;
  factory SplashState.initial() {
    return SplashState(
      isNavigate: false,
    );
  }
}
