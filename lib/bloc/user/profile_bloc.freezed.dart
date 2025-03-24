// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'profile_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ProfileEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is ProfileEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent()';
  }
}

/// @nodoc
class $ProfileEventCopyWith<$Res> {
  $ProfileEventCopyWith(ProfileEvent _, $Res Function(ProfileEvent) __);
}

/// @nodoc

class OnGetUserProfile implements ProfileEvent {
  const OnGetUserProfile();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnGetUserProfile);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.getUserProfile()';
  }
}

/// @nodoc

class OnTapLogout implements ProfileEvent {
  const OnTapLogout();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnTapLogout);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.onTapLogout()';
  }
}

/// @nodoc

class CallLogoutApi implements ProfileEvent {
  const CallLogoutApi();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is CallLogoutApi);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'ProfileEvent.callLogoutApi()';
  }
}

/// @nodoc
mixin _$ProfileState {
  CommonScreenState get status;
  bool get showLogoutSheet;
  UserDataModel? get userData;
  bool? get navigateToLogin;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $ProfileStateCopyWith<ProfileState> get copyWith =>
      _$ProfileStateCopyWithImpl<ProfileState>(
          this as ProfileState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is ProfileState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.showLogoutSheet, showLogoutSheet) ||
                other.showLogoutSheet == showLogoutSheet) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.navigateToLogin, navigateToLogin) ||
                other.navigateToLogin == navigateToLogin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, showLogoutSheet, userData, navigateToLogin);

  @override
  String toString() {
    return 'ProfileState(status: $status, showLogoutSheet: $showLogoutSheet, userData: $userData, navigateToLogin: $navigateToLogin)';
  }
}

/// @nodoc
abstract mixin class $ProfileStateCopyWith<$Res> {
  factory $ProfileStateCopyWith(
          ProfileState value, $Res Function(ProfileState) _then) =
      _$ProfileStateCopyWithImpl;
  @useResult
  $Res call(
      {CommonScreenState status,
      bool showLogoutSheet,
      UserDataModel? userData,
      bool? navigateToLogin});
}

/// @nodoc
class _$ProfileStateCopyWithImpl<$Res> implements $ProfileStateCopyWith<$Res> {
  _$ProfileStateCopyWithImpl(this._self, this._then);

  final ProfileState _self;
  final $Res Function(ProfileState) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? showLogoutSheet = null,
    Object? userData = freezed,
    Object? navigateToLogin = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      showLogoutSheet: null == showLogoutSheet
          ? _self.showLogoutSheet
          : showLogoutSheet // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _self.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
      navigateToLogin: freezed == navigateToLogin
          ? _self.navigateToLogin
          : navigateToLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc

class _ProfileState implements ProfileState {
  _ProfileState(
      {required this.status,
      required this.showLogoutSheet,
      this.userData,
      this.navigateToLogin});

  @override
  final CommonScreenState status;
  @override
  final bool showLogoutSheet;
  @override
  final UserDataModel? userData;
  @override
  final bool? navigateToLogin;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$ProfileStateCopyWith<_ProfileState> get copyWith =>
      __$ProfileStateCopyWithImpl<_ProfileState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _ProfileState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.showLogoutSheet, showLogoutSheet) ||
                other.showLogoutSheet == showLogoutSheet) &&
            (identical(other.userData, userData) ||
                other.userData == userData) &&
            (identical(other.navigateToLogin, navigateToLogin) ||
                other.navigateToLogin == navigateToLogin));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, status, showLogoutSheet, userData, navigateToLogin);

  @override
  String toString() {
    return 'ProfileState(status: $status, showLogoutSheet: $showLogoutSheet, userData: $userData, navigateToLogin: $navigateToLogin)';
  }
}

/// @nodoc
abstract mixin class _$ProfileStateCopyWith<$Res>
    implements $ProfileStateCopyWith<$Res> {
  factory _$ProfileStateCopyWith(
          _ProfileState value, $Res Function(_ProfileState) _then) =
      __$ProfileStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CommonScreenState status,
      bool showLogoutSheet,
      UserDataModel? userData,
      bool? navigateToLogin});
}

/// @nodoc
class __$ProfileStateCopyWithImpl<$Res>
    implements _$ProfileStateCopyWith<$Res> {
  __$ProfileStateCopyWithImpl(this._self, this._then);

  final _ProfileState _self;
  final $Res Function(_ProfileState) _then;

  /// Create a copy of ProfileState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? showLogoutSheet = null,
    Object? userData = freezed,
    Object? navigateToLogin = freezed,
  }) {
    return _then(_ProfileState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      showLogoutSheet: null == showLogoutSheet
          ? _self.showLogoutSheet
          : showLogoutSheet // ignore: cast_nullable_to_non_nullable
              as bool,
      userData: freezed == userData
          ? _self.userData
          : userData // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
      navigateToLogin: freezed == navigateToLogin
          ? _self.navigateToLogin
          : navigateToLogin // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

// dart format on
