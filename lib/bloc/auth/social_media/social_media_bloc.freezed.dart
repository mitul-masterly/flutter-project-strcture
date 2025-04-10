// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'social_media_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SocialMediaEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SocialMediaEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SocialMediaEvent()';
  }
}

/// @nodoc
class $SocialMediaEventCopyWith<$Res> {
  $SocialMediaEventCopyWith(
      SocialMediaEvent _, $Res Function(SocialMediaEvent) __);
}

/// @nodoc

class _Started implements SocialMediaEvent {
  const _Started();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _Started);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SocialMediaEvent.started()';
  }
}

/// @nodoc

class SignUpWithGoogleEvent implements SocialMediaEvent {
  const SignUpWithGoogleEvent({required this.context});

  final BuildContext context;

  /// Create a copy of SocialMediaEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpWithGoogleEventCopyWith<SignUpWithGoogleEvent> get copyWith =>
      _$SignUpWithGoogleEventCopyWithImpl<SignUpWithGoogleEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpWithGoogleEvent &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'SocialMediaEvent.signUpWithGoogleEvent(context: $context)';
  }
}

/// @nodoc
abstract mixin class $SignUpWithGoogleEventCopyWith<$Res>
    implements $SocialMediaEventCopyWith<$Res> {
  factory $SignUpWithGoogleEventCopyWith(SignUpWithGoogleEvent value,
          $Res Function(SignUpWithGoogleEvent) _then) =
      _$SignUpWithGoogleEventCopyWithImpl;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$SignUpWithGoogleEventCopyWithImpl<$Res>
    implements $SignUpWithGoogleEventCopyWith<$Res> {
  _$SignUpWithGoogleEventCopyWithImpl(this._self, this._then);

  final SignUpWithGoogleEvent _self;
  final $Res Function(SignUpWithGoogleEvent) _then;

  /// Create a copy of SocialMediaEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
  }) {
    return _then(SignUpWithGoogleEvent(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class SignUpWithAppleEvent implements SocialMediaEvent {
  const SignUpWithAppleEvent({required this.context});

  final BuildContext context;

  /// Create a copy of SocialMediaEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpWithAppleEventCopyWith<SignUpWithAppleEvent> get copyWith =>
      _$SignUpWithAppleEventCopyWithImpl<SignUpWithAppleEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpWithAppleEvent &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'SocialMediaEvent.signUpWithAppleEvent(context: $context)';
  }
}

/// @nodoc
abstract mixin class $SignUpWithAppleEventCopyWith<$Res>
    implements $SocialMediaEventCopyWith<$Res> {
  factory $SignUpWithAppleEventCopyWith(SignUpWithAppleEvent value,
          $Res Function(SignUpWithAppleEvent) _then) =
      _$SignUpWithAppleEventCopyWithImpl;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$SignUpWithAppleEventCopyWithImpl<$Res>
    implements $SignUpWithAppleEventCopyWith<$Res> {
  _$SignUpWithAppleEventCopyWithImpl(this._self, this._then);

  final SignUpWithAppleEvent _self;
  final $Res Function(SignUpWithAppleEvent) _then;

  /// Create a copy of SocialMediaEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
  }) {
    return _then(SignUpWithAppleEvent(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class SignUpWithFacebookEvent implements SocialMediaEvent {
  const SignUpWithFacebookEvent({required this.context});

  final BuildContext context;

  /// Create a copy of SocialMediaEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpWithFacebookEventCopyWith<SignUpWithFacebookEvent> get copyWith =>
      _$SignUpWithFacebookEventCopyWithImpl<SignUpWithFacebookEvent>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpWithFacebookEvent &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'SocialMediaEvent.signUpWithFacebookEvent(context: $context)';
  }
}

/// @nodoc
abstract mixin class $SignUpWithFacebookEventCopyWith<$Res>
    implements $SocialMediaEventCopyWith<$Res> {
  factory $SignUpWithFacebookEventCopyWith(SignUpWithFacebookEvent value,
          $Res Function(SignUpWithFacebookEvent) _then) =
      _$SignUpWithFacebookEventCopyWithImpl;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$SignUpWithFacebookEventCopyWithImpl<$Res>
    implements $SignUpWithFacebookEventCopyWith<$Res> {
  _$SignUpWithFacebookEventCopyWithImpl(this._self, this._then);

  final SignUpWithFacebookEvent _self;
  final $Res Function(SignUpWithFacebookEvent) _then;

  /// Create a copy of SocialMediaEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
  }) {
    return _then(SignUpWithFacebookEvent(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
mixin _$SocialMediaState {
  CommonScreenState get status;

  /// Create a copy of SocialMediaState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SocialMediaStateCopyWith<SocialMediaState> get copyWith =>
      _$SocialMediaStateCopyWithImpl<SocialMediaState>(
          this as SocialMediaState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SocialMediaState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'SocialMediaState(status: $status)';
  }
}

/// @nodoc
abstract mixin class $SocialMediaStateCopyWith<$Res> {
  factory $SocialMediaStateCopyWith(
          SocialMediaState value, $Res Function(SocialMediaState) _then) =
      _$SocialMediaStateCopyWithImpl;
  @useResult
  $Res call({CommonScreenState status});
}

/// @nodoc
class _$SocialMediaStateCopyWithImpl<$Res>
    implements $SocialMediaStateCopyWith<$Res> {
  _$SocialMediaStateCopyWithImpl(this._self, this._then);

  final SocialMediaState _self;
  final $Res Function(SocialMediaState) _then;

  /// Create a copy of SocialMediaState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
    ));
  }
}

/// @nodoc

class _SocialMediaState implements SocialMediaState {
  _SocialMediaState({required this.status});

  @override
  final CommonScreenState status;

  /// Create a copy of SocialMediaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SocialMediaStateCopyWith<_SocialMediaState> get copyWith =>
      __$SocialMediaStateCopyWithImpl<_SocialMediaState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SocialMediaState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'SocialMediaState(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$SocialMediaStateCopyWith<$Res>
    implements $SocialMediaStateCopyWith<$Res> {
  factory _$SocialMediaStateCopyWith(
          _SocialMediaState value, $Res Function(_SocialMediaState) _then) =
      __$SocialMediaStateCopyWithImpl;
  @override
  @useResult
  $Res call({CommonScreenState status});
}

/// @nodoc
class __$SocialMediaStateCopyWithImpl<$Res>
    implements _$SocialMediaStateCopyWith<$Res> {
  __$SocialMediaStateCopyWithImpl(this._self, this._then);

  final _SocialMediaState _self;
  final $Res Function(_SocialMediaState) _then;

  /// Create a copy of SocialMediaState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_SocialMediaState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
    ));
  }
}

// dart format on
