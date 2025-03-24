part of 'splash_bloc.dart';

@freezed
abstract class SplashState with _$SplashState {
  factory SplashState({
    required final bool isNavigate,
  }) = _SplashState;

  factory SplashState.initial() {
    return SplashState(
      isNavigate: false,
    );
  }
}
