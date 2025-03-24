// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'forgot_password_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ForgotPasswordEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ForgotPasswordEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ForgotPasswordEvent()';
  }
}

/// @nodoc
class $ForgotPasswordEventCopyWith<$Res> {
  $ForgotPasswordEventCopyWith(
      ForgotPasswordEvent _, $Res Function(ForgotPasswordEvent) __);
}

/// @nodoc
mixin _$ForgotPasswordState {
  bool? get isLoading;
  TextEditingController get txtEmail;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ForgotPasswordStateCopyWith<ForgotPasswordState> get copyWith =>
      _$ForgotPasswordStateCopyWithImpl<ForgotPasswordState>(
          this as ForgotPasswordState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ForgotPasswordState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.txtEmail, txtEmail) ||
                other.txtEmail == txtEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, txtEmail);

  @override
  String toString() {
    return 'ForgotPasswordState(isLoading: $isLoading, txtEmail: $txtEmail)';
  }
}

/// @nodoc
abstract mixin class $ForgotPasswordStateCopyWith<$Res> {
  factory $ForgotPasswordStateCopyWith(
          ForgotPasswordState value, $Res Function(ForgotPasswordState) _then) =
      _$ForgotPasswordStateCopyWithImpl;
  @useResult
  $Res call({bool? isLoading, TextEditingController txtEmail});
}

/// @nodoc
class _$ForgotPasswordStateCopyWithImpl<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  _$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final ForgotPasswordState _self;
  final $Res Function(ForgotPasswordState) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? isLoading = freezed,
    Object? txtEmail = null,
  }) {
    return _then(_self.copyWith(
      isLoading: freezed == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      txtEmail: null == txtEmail
          ? _self.txtEmail
          : txtEmail // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

/// @nodoc

class _ForgotPasswordState implements ForgotPasswordState {
  const _ForgotPasswordState({this.isLoading, required this.txtEmail});

  @override
  final bool? isLoading;
  @override
  final TextEditingController txtEmail;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ForgotPasswordStateCopyWith<_ForgotPasswordState> get copyWith =>
      __$ForgotPasswordStateCopyWithImpl<_ForgotPasswordState>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ForgotPasswordState &&
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.txtEmail, txtEmail) ||
                other.txtEmail == txtEmail));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, txtEmail);

  @override
  String toString() {
    return 'ForgotPasswordState(isLoading: $isLoading, txtEmail: $txtEmail)';
  }
}

/// @nodoc
abstract mixin class _$ForgotPasswordStateCopyWith<$Res>
    implements $ForgotPasswordStateCopyWith<$Res> {
  factory _$ForgotPasswordStateCopyWith(_ForgotPasswordState value,
          $Res Function(_ForgotPasswordState) _then) =
      __$ForgotPasswordStateCopyWithImpl;
  @override
  @useResult
  $Res call({bool? isLoading, TextEditingController txtEmail});
}

/// @nodoc
class __$ForgotPasswordStateCopyWithImpl<$Res>
    implements _$ForgotPasswordStateCopyWith<$Res> {
  __$ForgotPasswordStateCopyWithImpl(this._self, this._then);

  final _ForgotPasswordState _self;
  final $Res Function(_ForgotPasswordState) _then;

  /// Create a copy of ForgotPasswordState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isLoading = freezed,
    Object? txtEmail = null,
  }) {
    return _then(_ForgotPasswordState(
      isLoading: freezed == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool?,
      txtEmail: null == txtEmail
          ? _self.txtEmail
          : txtEmail // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
    ));
  }
}

// dart format on
