// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'biometric_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$BiometricEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is BiometricEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricEvent()';
  }
}

/// @nodoc
class $BiometricEventCopyWith<$Res> {
  $BiometricEventCopyWith(BiometricEvent _, $Res Function(BiometricEvent) __);
}

/// @nodoc

class _Started implements BiometricEvent {
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
    return 'BiometricEvent.started()';
  }
}

/// @nodoc

class LoginWithBiometric implements BiometricEvent {
  const LoginWithBiometric();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginWithBiometric);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'BiometricEvent.loginWithBiometric()';
  }
}

/// @nodoc
mixin _$BiometricState {
  CommonScreenState get status;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $BiometricStateCopyWith<BiometricState> get copyWith =>
      _$BiometricStateCopyWithImpl<BiometricState>(
          this as BiometricState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is BiometricState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'BiometricState(status: $status)';
  }
}

/// @nodoc
abstract mixin class $BiometricStateCopyWith<$Res> {
  factory $BiometricStateCopyWith(
          BiometricState value, $Res Function(BiometricState) _then) =
      _$BiometricStateCopyWithImpl;
  @useResult
  $Res call({CommonScreenState status});
}

/// @nodoc
class _$BiometricStateCopyWithImpl<$Res>
    implements $BiometricStateCopyWith<$Res> {
  _$BiometricStateCopyWithImpl(this._self, this._then);

  final BiometricState _self;
  final $Res Function(BiometricState) _then;

  /// Create a copy of BiometricState
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

class _BiometricState implements BiometricState {
  _BiometricState({required this.status});

  @override
  final CommonScreenState status;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$BiometricStateCopyWith<_BiometricState> get copyWith =>
      __$BiometricStateCopyWithImpl<_BiometricState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _BiometricState &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status);

  @override
  String toString() {
    return 'BiometricState(status: $status)';
  }
}

/// @nodoc
abstract mixin class _$BiometricStateCopyWith<$Res>
    implements $BiometricStateCopyWith<$Res> {
  factory _$BiometricStateCopyWith(
          _BiometricState value, $Res Function(_BiometricState) _then) =
      __$BiometricStateCopyWithImpl;
  @override
  @useResult
  $Res call({CommonScreenState status});
}

/// @nodoc
class __$BiometricStateCopyWithImpl<$Res>
    implements _$BiometricStateCopyWith<$Res> {
  __$BiometricStateCopyWithImpl(this._self, this._then);

  final _BiometricState _self;
  final $Res Function(_BiometricState) _then;

  /// Create a copy of BiometricState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
  }) {
    return _then(_BiometricState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
    ));
  }
}

// dart format on
