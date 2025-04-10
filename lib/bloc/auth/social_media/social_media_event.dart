part of 'social_media_bloc.dart';

@freezed
class SocialMediaEvent with _$SocialMediaEvent {
  const factory SocialMediaEvent.started() = _Started;
  const factory SocialMediaEvent.signUpWithGoogleEvent(
      {required final BuildContext context}) = SignUpWithGoogleEvent;

  const factory SocialMediaEvent.signUpWithAppleEvent(
      {required final BuildContext context}) = SignUpWithAppleEvent;

  const factory SocialMediaEvent.signUpWithFacebookEvent(
      {required final BuildContext context}) = SignUpWithFacebookEvent;

}
