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

class OnValidateForm implements LoginEvent {
  const OnValidateForm({required this.formKEy});

  final GlobalKey<FormState> formKEy;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnValidateFormCopyWith<OnValidateForm> get copyWith =>
      _$OnValidateFormCopyWithImpl<OnValidateForm>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnValidateForm &&
            (identical(other.formKEy, formKEy) || other.formKEy == formKEy));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formKEy);

  @override
  String toString() {
    return 'LoginEvent.onValidateForm(formKEy: $formKEy)';
  }
}

/// @nodoc
abstract mixin class $OnValidateFormCopyWith<$Res>
    implements $LoginEventCopyWith<$Res> {
  factory $OnValidateFormCopyWith(
          OnValidateForm value, $Res Function(OnValidateForm) _then) =
      _$OnValidateFormCopyWithImpl;
  @useResult
  $Res call({GlobalKey<FormState> formKEy});
}

/// @nodoc
class _$OnValidateFormCopyWithImpl<$Res>
    implements $OnValidateFormCopyWith<$Res> {
  _$OnValidateFormCopyWithImpl(this._self, this._then);

  final OnValidateForm _self;
  final $Res Function(OnValidateForm) _then;

  /// Create a copy of LoginEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formKEy = null,
  }) {
    return _then(OnValidateForm(
      formKEy: null == formKEy
          ? _self.formKEy
          : formKEy // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
    ));
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
mixin _$LoginState {
  bool get isLoading;
  TextEditingController get emailController;
  TextEditingController get passwordController;
  String? get errorMessage;
  bool get isSuccess;
  bool get isRememberMe;
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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, emailController,
      passwordController, errorMessage, isSuccess, isRememberMe, user);

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, emailController: $emailController, passwordController: $passwordController, errorMessage: $errorMessage, isSuccess: $isSuccess, isRememberMe: $isRememberMe, user: $user)';
  }
}

/// @nodoc
abstract mixin class $LoginStateCopyWith<$Res> {
  factory $LoginStateCopyWith(
          LoginState value, $Res Function(LoginState) _then) =
      _$LoginStateCopyWithImpl;
  @useResult
  $Res call(
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passwordController,
      String? errorMessage,
      bool isSuccess,
      bool isRememberMe,
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
    Object? isLoading = null,
    Object? emailController = null,
    Object? passwordController = null,
    Object? errorMessage = freezed,
    Object? isSuccess = null,
    Object? isRememberMe = null,
    Object? user = freezed,
  }) {
    return _then(_self.copyWith(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      emailController: null == emailController
          ? _self.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: null == passwordController
          ? _self.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isRememberMe: null == isRememberMe
          ? _self.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
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
      {required this.isLoading,
      required this.emailController,
      required this.passwordController,
      required this.errorMessage,
      required this.isSuccess,
      required this.isRememberMe,
      required this.user});

  @override
  final bool isLoading;
  @override
  final TextEditingController emailController;
  @override
  final TextEditingController passwordController;
  @override
  final String? errorMessage;
  @override
  final bool isSuccess;
  @override
  final bool isRememberMe;
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
            (identical(other.isLoading, isLoading) ||
                other.isLoading == isLoading) &&
            (identical(other.emailController, emailController) ||
                other.emailController == emailController) &&
            (identical(other.passwordController, passwordController) ||
                other.passwordController == passwordController) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.isRememberMe, isRememberMe) ||
                other.isRememberMe == isRememberMe) &&
            (identical(other.user, user) || other.user == user));
  }

  @override
  int get hashCode => Object.hash(runtimeType, isLoading, emailController,
      passwordController, errorMessage, isSuccess, isRememberMe, user);

  @override
  String toString() {
    return 'LoginState(isLoading: $isLoading, emailController: $emailController, passwordController: $passwordController, errorMessage: $errorMessage, isSuccess: $isSuccess, isRememberMe: $isRememberMe, user: $user)';
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
      {bool isLoading,
      TextEditingController emailController,
      TextEditingController passwordController,
      String? errorMessage,
      bool isSuccess,
      bool isRememberMe,
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
    Object? isLoading = null,
    Object? emailController = null,
    Object? passwordController = null,
    Object? errorMessage = freezed,
    Object? isSuccess = null,
    Object? isRememberMe = null,
    Object? user = freezed,
  }) {
    return _then(_LoginState(
      isLoading: null == isLoading
          ? _self.isLoading
          : isLoading // ignore: cast_nullable_to_non_nullable
              as bool,
      emailController: null == emailController
          ? _self.emailController
          : emailController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      passwordController: null == passwordController
          ? _self.passwordController
          : passwordController // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: null == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool,
      isRememberMe: null == isRememberMe
          ? _self.isRememberMe
          : isRememberMe // ignore: cast_nullable_to_non_nullable
              as bool,
      user: freezed == user
          ? _self.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserDataModel?,
    ));
  }
}

// dart format on
