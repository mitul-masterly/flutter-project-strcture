// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'privacy_policy_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PrivacyPolicyEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is PrivacyPolicyEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'PrivacyPolicyEvent()';
  }
}

/// @nodoc
class $PrivacyPolicyEventCopyWith<$Res> {
  $PrivacyPolicyEventCopyWith(
      PrivacyPolicyEvent _, $Res Function(PrivacyPolicyEvent) __);
}

/// @nodoc

class _Started implements PrivacyPolicyEvent {
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
    return 'PrivacyPolicyEvent.started()';
  }
}

/// @nodoc

class Initial implements PrivacyPolicyEvent {
  const Initial({required this.url});

  final String url;

  /// Create a copy of PrivacyPolicyEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialCopyWith<Initial> get copyWith =>
      _$InitialCopyWithImpl<Initial>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is Initial &&
            (identical(other.url, url) || other.url == url));
  }

  @override
  int get hashCode => Object.hash(runtimeType, url);

  @override
  String toString() {
    return 'PrivacyPolicyEvent.initial(url: $url)';
  }
}

/// @nodoc
abstract mixin class $InitialCopyWith<$Res>
    implements $PrivacyPolicyEventCopyWith<$Res> {
  factory $InitialCopyWith(Initial value, $Res Function(Initial) _then) =
      _$InitialCopyWithImpl;
  @useResult
  $Res call({String url});
}

/// @nodoc
class _$InitialCopyWithImpl<$Res> implements $InitialCopyWith<$Res> {
  _$InitialCopyWithImpl(this._self, this._then);

  final Initial _self;
  final $Res Function(Initial) _then;

  /// Create a copy of PrivacyPolicyEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? url = null,
  }) {
    return _then(Initial(
      url: null == url
          ? _self.url
          : url // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$PrivacyPolicyState {
  CommonScreenState get status;
  WebViewController get controller;

  /// Create a copy of PrivacyPolicyState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $PrivacyPolicyStateCopyWith<PrivacyPolicyState> get copyWith =>
      _$PrivacyPolicyStateCopyWithImpl<PrivacyPolicyState>(
          this as PrivacyPolicyState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is PrivacyPolicyState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, controller);

  @override
  String toString() {
    return 'PrivacyPolicyState(status: $status, controller: $controller)';
  }
}

/// @nodoc
abstract mixin class $PrivacyPolicyStateCopyWith<$Res> {
  factory $PrivacyPolicyStateCopyWith(
          PrivacyPolicyState value, $Res Function(PrivacyPolicyState) _then) =
      _$PrivacyPolicyStateCopyWithImpl;
  @useResult
  $Res call({CommonScreenState status, WebViewController controller});
}

/// @nodoc
class _$PrivacyPolicyStateCopyWithImpl<$Res>
    implements $PrivacyPolicyStateCopyWith<$Res> {
  _$PrivacyPolicyStateCopyWithImpl(this._self, this._then);

  final PrivacyPolicyState _self;
  final $Res Function(PrivacyPolicyState) _then;

  /// Create a copy of PrivacyPolicyState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? controller = null,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      controller: null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as WebViewController,
    ));
  }
}

/// @nodoc

class _PrivacyPolicyState implements PrivacyPolicyState {
  _PrivacyPolicyState({required this.status, required this.controller});

  @override
  final CommonScreenState status;
  @override
  final WebViewController controller;

  /// Create a copy of PrivacyPolicyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$PrivacyPolicyStateCopyWith<_PrivacyPolicyState> get copyWith =>
      __$PrivacyPolicyStateCopyWithImpl<_PrivacyPolicyState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _PrivacyPolicyState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.controller, controller) ||
                other.controller == controller));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, controller);

  @override
  String toString() {
    return 'PrivacyPolicyState(status: $status, controller: $controller)';
  }
}

/// @nodoc
abstract mixin class _$PrivacyPolicyStateCopyWith<$Res>
    implements $PrivacyPolicyStateCopyWith<$Res> {
  factory _$PrivacyPolicyStateCopyWith(
          _PrivacyPolicyState value, $Res Function(_PrivacyPolicyState) _then) =
      __$PrivacyPolicyStateCopyWithImpl;
  @override
  @useResult
  $Res call({CommonScreenState status, WebViewController controller});
}

/// @nodoc
class __$PrivacyPolicyStateCopyWithImpl<$Res>
    implements _$PrivacyPolicyStateCopyWith<$Res> {
  __$PrivacyPolicyStateCopyWithImpl(this._self, this._then);

  final _PrivacyPolicyState _self;
  final $Res Function(_PrivacyPolicyState) _then;

  /// Create a copy of PrivacyPolicyState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? controller = null,
  }) {
    return _then(_PrivacyPolicyState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      controller: null == controller
          ? _self.controller
          : controller // ignore: cast_nullable_to_non_nullable
              as WebViewController,
    ));
  }
}

// dart format on
