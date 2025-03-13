// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'splash_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SplashEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SplashEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashEvent()';
  }
}

/// @nodoc
class $SplashEventCopyWith<$Res> {
  $SplashEventCopyWith(SplashEvent _, $Res Function(SplashEvent) __);
}

/// @nodoc

class InitialEvent implements SplashEvent {
  const InitialEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is InitialEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SplashEvent.initialEvent()';
  }
}

/// @nodoc
mixin _$SplashState {
  bool get isNavigate;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SplashStateCopyWith<SplashState> get copyWith =>
      _$SplashStateCopyWithImpl<SplashState>(this as SplashState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SplashState &&
            (identical(other.isNavigate, isNavigate) ||
                other.isNavigate == isNavigate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNavigate);

  @override
  String toString() {
    return 'SplashState(isNavigate: $isNavigate)';
  }
}

/// @nodoc
abstract mixin class $SplashStateCopyWith<$Res> {
  factory $SplashStateCopyWith(
          SplashState value, $Res Function(SplashState) _then) =
      _$SplashStateCopyWithImpl;
  @useResult
  $Res call({bool isNavigate});
}

/// @nodoc
class _$SplashStateCopyWithImpl<$Res> implements $SplashStateCopyWith<$Res> {
  _$SplashStateCopyWithImpl(this._self, this._then);

  final SplashState _self;
  final $Res Function(SplashState) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isNavigate = null,
  }) {
    return _then(_self.copyWith(
      isNavigate: null == isNavigate
          ? _self.isNavigate
          : isNavigate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class _SplashState implements SplashState {
  _SplashState({required this.isNavigate});

  @override
  final bool isNavigate;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SplashStateCopyWith<_SplashState> get copyWith =>
      __$SplashStateCopyWithImpl<_SplashState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SplashState &&
            (identical(other.isNavigate, isNavigate) ||
                other.isNavigate == isNavigate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isNavigate);

  @override
  String toString() {
    return 'SplashState(isNavigate: $isNavigate)';
  }
}

/// @nodoc
abstract mixin class _$SplashStateCopyWith<$Res>
    implements $SplashStateCopyWith<$Res> {
  factory _$SplashStateCopyWith(
          _SplashState value, $Res Function(_SplashState) _then) =
      __$SplashStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool isNavigate});
}

/// @nodoc
class __$SplashStateCopyWithImpl<$Res> implements _$SplashStateCopyWith<$Res> {
  __$SplashStateCopyWithImpl(this._self, this._then);

  final _SplashState _self;
  final $Res Function(_SplashState) _then;

  /// Create a copy of SplashState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isNavigate = null,
  }) {
    return _then(_SplashState(
      isNavigate: null == isNavigate
          ? _self.isNavigate
          : isNavigate // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

// dart format on
