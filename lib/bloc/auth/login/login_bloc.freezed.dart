// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is LoginEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent()';
  }
}

/// @nodoc
class $LoginEventCopyWith<$Res> {
  $LoginEventCopyWith(LoginEvent _, $Res Function(LoginEvent) __);
}

/// @nodoc

class OnChangeRememberMe implements LoginEvent {
  const OnChangeRememberMe({required this.isRememberMe});

  final bool isRememberMe;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeRememberMeCopyWith<OnChangeRememberMe> get copyWith =>
      _$OnChangeRememberMeCopyWithImpl<OnChangeRememberMe>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeRememberMe &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isRememberMe);

  @override
  String toString() {
    return 'LoginEvent.onChangeRememberMe(isRememberMe: $isRememberMe)';
  }
}

/// @nodoc
abstract mixin class $OnChangeRememberMeCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $OnChangeRememberMeCopyWith(
          OnChangeRememberMe value, $Res Function(OnChangeRememberMe) _then) =
      _$OnChangeRememberMeCopyWithImpl;
  @useResult
  $Res call({bool isRememberMe});
}

/// @nodoc
class _$OnChangeRememberMeCopyWithImpl<$Res>
    implements $OnChangeRememberMeCopyWith<$Res> {
  _$OnChangeRememberMeCopyWithImpl(this._self, this._then);

  final OnChangeRememberMe _self;
  final $Res Function(OnChangeRememberMe) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? isRememberMe = null,
  }) {
    return _then(OnChangeRememberMe(
      isRememberMe: null == isRememberMe
          ? _self.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
    ));
  }
}

/// @nodoc

class OnChangeEmail implements LoginEvent {
  const OnChangeEmail({required this.email});

  final String email;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeEmailCopyWith<OnChangeEmail> get copyWith =>
      _$OnChangeEmailCopyWithImpl<OnChangeEmail>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeEmail &&
            (identical(other.email, email) || other.email == email));
  }

  @override
  int get hashCode => Object.hash(runtimeType, email);

  @override
  String toString() {
    return 'LoginEvent.onChangeEmail(email: $email)';
  }
}

/// @nodoc
abstract mixin class $OnChangeEmailCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $OnChangeEmailCopyWith(
          OnChangeEmail value, $Res Function(OnChangeEmail) _then) =
      _$OnChangeEmailCopyWithImpl;
  @useResult
  $Res call({String email});
}

/// @nodoc
class _$OnChangeEmailCopyWithImpl<$Res>
    implements $OnChangeEmailCopyWith<$Res> {
  _$OnChangeEmailCopyWithImpl(this._self, this._then);

  final OnChangeEmail _self;
  final $Res Function(OnChangeEmail) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? email = null,
  }) {
    return _then(OnChangeEmail(
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnChangePassword implements LoginEvent {
  const OnChangePassword({required this.password});

  final String password;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangePasswordCopyWith<OnChangePassword> get copyWith =>
      _$OnChangePasswordCopyWithImpl<OnChangePassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangePassword &&
            (identical(other.password, password) ||
                other.password == password));
  }

  @override
  int get hashCode => Object.hash(runtimeType, password);

  @override
  String toString() {
    return 'LoginEvent.onChangePassword(password: $password)';
  }
}

/// @nodoc
abstract mixin class $OnChangePasswordCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $OnChangePasswordCopyWith(
          OnChangePassword value, $Res Function(OnChangePassword) _then) =
      _$OnChangePasswordCopyWithImpl;
  @useResult
  $Res call({String password});
}

/// @nodoc
class _$OnChangePasswordCopyWithImpl<$Res>
    implements $OnChangePasswordCopyWith<$Res> {
  _$OnChangePasswordCopyWithImpl(this._self, this._then);

  final OnChangePassword _self;
  final $Res Function(OnChangePassword) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
  }) {
    return _then(OnChangePassword(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnSubmit implements LoginEvent {
  const OnSubmit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnSubmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.onSubmit()';
  }
}

/// @nodoc

class OnTapForgotPassword implements LoginEvent {
  const OnTapForgotPassword({required this.context});

  final BuildContext context;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnTapForgotPasswordCopyWith<OnTapForgotPassword> get copyWith =>
      _$OnTapForgotPasswordCopyWithImpl<OnTapForgotPassword>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnTapForgotPassword &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'LoginEvent.onTapForgotPassword(context: $context)';
  }
}

/// @nodoc
abstract mixin class $OnTapForgotPasswordCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $OnTapForgotPasswordCopyWith(
          OnTapForgotPassword value, $Res Function(OnTapForgotPassword) _then) =
      _$OnTapForgotPasswordCopyWithImpl;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$OnTapForgotPasswordCopyWithImpl<$Res>
    implements $OnTapForgotPasswordCopyWith<$Res> {
  _$OnTapForgotPasswordCopyWithImpl(this._self, this._then);

  final OnTapForgotPassword _self;
  final $Res Function(OnTapForgotPassword) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
  }) {
    return _then(OnTapForgotPassword(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc

class OnTapLoginWithOtpStateEvent implements LoginEvent {
  const OnTapLoginWithOtpStateEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnTapLoginWithOtpStateEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'LoginEvent.onTapLoginWithOtpStateEvent()';
  }
}

/// @nodoc

class LoginWithBiometric implements LoginEvent {
  const LoginWithBiometric({required this.context});

  final BuildContext context;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginWithBiometricCopyWith<LoginWithBiometric> get copyWith =>
      _$LoginWithBiometricCopyWithImpl<LoginWithBiometric>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginWithBiometric &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'LoginEvent.loginWithBiometric(context: $context)';
  }
}

/// @nodoc
abstract mixin class $LoginWithBiometricCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $LoginWithBiometricCopyWith(
          LoginWithBiometric value, $Res Function(LoginWithBiometric) _then) =
      _$LoginWithBiometricCopyWithImpl;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$LoginWithBiometricCopyWithImpl<$Res>
    implements $LoginWithBiometricCopyWith<$Res> {
  _$LoginWithBiometricCopyWithImpl(this._self, this._then);

  final LoginWithBiometric _self;
  final $Res Function(LoginWithBiometric) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
  }) {
    return _then(LoginWithBiometric(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
mixin _$LoginState {
  CommonScreenState get status;
  String get email;
  String get password;
  bool get isRememberMe;
  bool get isLoginWithOtp;
  String get emailOrPhone;
  UserDataModel? get user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $LoginStateCopyWith<LoginState> get copyWith =>
      _$LoginStateCopyWithImpl<LoginState>(this as LoginState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is LoginState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe) &&
            (identical(other.isLoginWithOtp, isLoginWithOtp) ||
                other.isLoginWithOtp == isLoginWithOtp) &&
            (identical(other.emailOrPhone, emailOrPhone) ||
                other.emailOrPhone == emailOrPhone) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password,
      isRememberMe, isLoginWithOtp, emailOrPhone, user);

  @override
  String toString() {
    return 'LoginState(status: $status, email: $email, password: $password, isRememberMe: $isRememberMe, isLoginWithOtp: $isLoginWithOtp, emailOrPhone: $emailOrPhone, user: $user)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {CommonScreenState status,
      String email,
      String password,
      bool isRememberMe,
      bool isLoginWithOtp,
      String emailOrPhone,
      UserDataModel? user});
}

/// @nodoc
class _$LoginStateCopyWithImpl<$Res> implements $LoginStateCopyWith<$Res> {
  _$LoginStateCopyWithImpl(this._self, this._then);

  final LoginState _self;
  final $Res Function(LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? isRememberMe = null,
    Object? isLoginWithOtp = null,
    Object? emailOrPhone = null,
    Object? user = freezed,
  }) {
    return _then(_self.copyWith(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isRememberMe: null == isRememberMe
          ? _self.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginWithOtp: null == isLoginWithOtp
          ? _self.isLoginWithOtp
          : isLoginWithOtp // ignore: cast_nullable_to_non_nullable
              as bool,
      emailOrPhone: null == emailOrPhone
          ? _self.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
    ));
  }
}

/// @nodoc

class _LoginState implements LoginState {
  _LoginState(
      {required this.status,
      required this.email,
      required this.password,
      required this.isRememberMe,
      required this.isLoginWithOtp,
      required this.emailOrPhone,
      required this.user});

  @override
  final CommonScreenState status;
  @override
  final String email;
  @override
  final String password;
  @override
  final bool isRememberMe;
  @override
  final bool isLoginWithOtp;
  @override
  final String emailOrPhone;
  @override
  final UserDataModel? user;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$LoginStateCopyWith<_LoginState> get copyWith =>
      __$LoginStateCopyWithImpl<_LoginState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _LoginState &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe) &&
            (identical(other.isLoginWithOtp, isLoginWithOtp) ||
                other.isLoginWithOtp == isLoginWithOtp) &&
            (identical(other.emailOrPhone, emailOrPhone) ||
                other.emailOrPhone == emailOrPhone) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, status, email, password,
      isRememberMe, isLoginWithOtp, emailOrPhone, user);

  @override
  String toString() {
    return 'LoginState(status: $status, email: $email, password: $password, isRememberMe: $isRememberMe, isLoginWithOtp: $isLoginWithOtp, emailOrPhone: $emailOrPhone, user: $user)';
  }
}

/// @nodoc
abstract mixin class _$LoginStateCopyWith<$Res>
    implements $LoginStateCopyWith<$Res> {
  factory _$LoginStateCopyWith(
          _LoginState value, $Res Function(_LoginState) _then) =
      __$LoginStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {CommonScreenState status,
      String email,
      String password,
      bool isRememberMe,
      bool isLoginWithOtp,
      String emailOrPhone,
      UserDataModel? user});
}

/// @nodoc
class __$LoginStateCopyWithImpl<$Res> implements _$LoginStateCopyWith<$Res> {
  __$LoginStateCopyWithImpl(this._self, this._then);

  final _LoginState _self;
  final $Res Function(_LoginState) _then;

  /// Create a copy of LoginState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? status = null,
    Object? email = null,
    Object? password = null,
    Object? isRememberMe = null,
    Object? isLoginWithOtp = null,
    Object? emailOrPhone = null,
    Object? user = freezed,
  }) {
    return _then(_LoginState(
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      isRememberMe: null == isRememberMe
          ? _self.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      isLoginWithOtp: null == isLoginWithOtp
          ? _self.isLoginWithOtp
          : isLoginWithOtp // ignore: cast_nullable_to_non_nullable
              as bool,
      emailOrPhone: null == emailOrPhone
          ? _self.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
    ));
  }
}

// dart format on
