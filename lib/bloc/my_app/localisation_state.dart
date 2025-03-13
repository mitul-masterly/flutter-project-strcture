part of 'localisation_bloc.dart';

@freezed
abstract class LocalisationState with _$LocalisationState {
  const factory LocalisationState({
    required final Locale language,
  }) = _LocalisationState;

  factory LocalisationState.initial() => LocalisationState(
      language: Locale(SupportedLangCode.english.langCode,
          SupportedLangCode.english.countryCode));
}
