part of 'social_media_bloc.dart';

@freezed
abstract class SocialMediaState with _$SocialMediaState {
  factory SocialMediaState({
    required final CommonScreenState status,
  }) = _SocialMediaState;

  factory SocialMediaState.initial() => SocialMediaState(
      status: CommonScreenState.initial,
  );
}
