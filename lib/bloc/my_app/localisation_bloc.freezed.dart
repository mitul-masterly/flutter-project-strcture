// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'localisation_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LocalisationEvent {
  Locale get language;

  /// Create a copy of LocalisationEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalisationEventCopyWith<LocalisationEvent> get copyWith =>
      _$LocalisationEventCopyWithImpl<LocalisationEvent>(
          this as LocalisationEvent, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalisationEvent &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'LocalisationEvent(language: $language)';
  }
}

/// @nodoc
abstract mixin class $LocalisationEventCopyWith<$Res> {
  factory $LocalisationEventCopyWith(
          LocalisationEvent value, $Res Function(LocalisationEvent) _then) =
      _$LocalisationEventCopyWithImpl;
  @useResult
  $Res call({Locale language});
}

/// @nodoc
class _$LocalisationEventCopyWithImpl<$Res>
    implements $LocalisationEventCopyWith<$Res> {
  _$LocalisationEventCopyWithImpl(this._self, this._then);

  final LocalisationEvent _self;
  final $Res Function(LocalisationEvent) _then;

  /// Create a copy of LocalisationEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_self.copyWith(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class OnChangeLanguage implements LocalisationEvent {
  const OnChangeLanguage(this.language);

  @override
  final Locale language;

  /// Create a copy of LocalisationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeLanguageCopyWith<OnChangeLanguage> get copyWith =>
      _$OnChangeLanguageCopyWithImpl<OnChangeLanguage>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeLanguage &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'LocalisationEvent.onChangeLanguage(language: $language)';
  }
}

/// @nodoc
abstract mixin class $OnChangeLanguageCopyWith<$Res>
    implements $LocalisationEventCopyWith<$Res> {
  factory $OnChangeLanguageCopyWith(
          OnChangeLanguage value, $Res Function(OnChangeLanguage) _then) =
      _$OnChangeLanguageCopyWithImpl;
  @override
  @useResult
  $Res call({Locale language});
}

/// @nodoc
class _$OnChangeLanguageCopyWithImpl<$Res>
    implements $OnChangeLanguageCopyWith<$Res> {
  _$OnChangeLanguageCopyWithImpl(this._self, this._then);

  final OnChangeLanguage _self;
  final $Res Function(OnChangeLanguage) _then;

  /// Create a copy of LocalisationEvent
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(OnChangeLanguage(
      null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc
mixin _$LocalisationState {
  Locale get language;

  /// Create a copy of LocalisationState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LocalisationStateCopyWith<LocalisationState> get copyWith =>
      _$LocalisationStateCopyWithImpl<LocalisationState>(
          this as LocalisationState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LocalisationState &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'LocalisationState(language: $language)';
  }
}

/// @nodoc
abstract mixin class $LocalisationStateCopyWith<$Res> {
  factory $LocalisationStateCopyWith(
          LocalisationState value, $Res Function(LocalisationState) _then) =
      _$LocalisationStateCopyWithImpl;
  @useResult
  $Res call({Locale language});
}

/// @nodoc
class _$LocalisationStateCopyWithImpl<$Res>
    implements $LocalisationStateCopyWith<$Res> {
  _$LocalisationStateCopyWithImpl(this._self, this._then);

  final LocalisationState _self;
  final $Res Function(LocalisationState) _then;

  /// Create a copy of LocalisationState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? language = null,
  }) {
    return _then(_self.copyWith(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

/// @nodoc

class _LocalisationState implements LocalisationState {
  const _LocalisationState({required this.language});

  @override
  final Locale language;

  /// Create a copy of LocalisationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LocalisationStateCopyWith<_LocalisationState> get copyWith =>
      __$LocalisationStateCopyWithImpl<_LocalisationState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LocalisationState &&
            (identical(other.language, language) ||
                other.language == language));
  }

  @override
  int get hashCode => Object.hash(runtimeType, language);

  @override
  String toString() {
    return 'LocalisationState(language: $language)';
  }
}

/// @nodoc
abstract mixin class _$LocalisationStateCopyWith<$Res>
    implements $LocalisationStateCopyWith<$Res> {
  factory _$LocalisationStateCopyWith(
          _LocalisationState value, $Res Function(_LocalisationState) _then) =
      __$LocalisationStateCopyWithImpl;
  @override
  @useResult
  $Res call({Locale language});
}

/// @nodoc
class __$LocalisationStateCopyWithImpl<$Res>
    implements _$LocalisationStateCopyWith<$Res> {
  __$LocalisationStateCopyWithImpl(this._self, this._then);

  final _LocalisationState _self;
  final $Res Function(_LocalisationState) _then;

  /// Create a copy of LocalisationState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? language = null,
  }) {
    return _then(_LocalisationState(
      language: null == language
          ? _self.language
          : language // ignore: cast_nullable_to_non_nullable
              as Locale,
    ));
  }
}

// dart format on
