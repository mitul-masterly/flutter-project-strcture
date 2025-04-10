// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'otp_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$OtpEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OtpEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OtpEvent()';
  }
}

/// @nodoc
class $OtpEventCopyWith<$Res> {
  $OtpEventCopyWith(OtpEvent _, $Res Function(OtpEvent) __);
}

/// @nodoc

class StartTimerEvent implements OtpEvent {
  const StartTimerEvent();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is StartTimerEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'OtpEvent.startTimerEvent()';
  }
}

/// @nodoc

class OnChangeOtp implements OtpEvent {
  const OnChangeOtp({required this.otp});

  final String otp;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeOtpCopyWith<OnChangeOtp> get copyWith =>
      _$OnChangeOtpCopyWithImpl<OnChangeOtp>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeOtp &&
            (identical(other.otp, otp) || other.otp == otp));
  }

  @override
  int get hashCode => Object.hash(runtimeType, otp);

  @override
  String toString() {
    return 'OtpEvent.onChangeOtp(otp: $otp)';
  }
}

/// @nodoc
abstract mixin class $OnChangeOtpCopyWith<$Res>
    implements $OtpEventCopyWith<$Res> {
  factory $OnChangeOtpCopyWith(
          OnChangeOtp value, $Res Function(OnChangeOtp) _then) =
      _$OnChangeOtpCopyWithImpl;
  @useResult
  $Res call({String otp});
}

/// @nodoc
class _$OnChangeOtpCopyWithImpl<$Res> implements $OnChangeOtpCopyWith<$Res> {
  _$OnChangeOtpCopyWithImpl(this._self, this._then);

  final OnChangeOtp _self;
  final $Res Function(OnChangeOtp) _then;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? otp = null,
  }) {
    return _then(OnChangeOtp(
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnChangeEmailOrPhone implements OtpEvent {
  const OnChangeEmailOrPhone({required this.emailOrPhone});

  final String emailOrPhone;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeEmailOrPhoneCopyWith<OnChangeEmailOrPhone> get copyWith =>
      _$OnChangeEmailOrPhoneCopyWithImpl<OnChangeEmailOrPhone>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeEmailOrPhone &&
            (identical(other.emailOrPhone, emailOrPhone) ||
                other.emailOrPhone == emailOrPhone));
  }

  @override
  int get hashCode => Object.hash(runtimeType, emailOrPhone);

  @override
  String toString() {
    return 'OtpEvent.onChangeEmailOrPhone(emailOrPhone: $emailOrPhone)';
  }
}

/// @nodoc
abstract mixin class $OnChangeEmailOrPhoneCopyWith<$Res>
    implements $OtpEventCopyWith<$Res> {
  factory $OnChangeEmailOrPhoneCopyWith(OnChangeEmailOrPhone value,
          $Res Function(OnChangeEmailOrPhone) _then) =
      _$OnChangeEmailOrPhoneCopyWithImpl;
  @useResult
  $Res call({String emailOrPhone});
}

/// @nodoc
class _$OnChangeEmailOrPhoneCopyWithImpl<$Res>
    implements $OnChangeEmailOrPhoneCopyWith<$Res> {
  _$OnChangeEmailOrPhoneCopyWithImpl(this._self, this._then);

  final OnChangeEmailOrPhone _self;
  final $Res Function(OnChangeEmailOrPhone) _then;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? emailOrPhone = null,
  }) {
    return _then(OnChangeEmailOrPhone(
      emailOrPhone: null == emailOrPhone
          ? _self.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class SendOtpEvent implements OtpEvent {
  const SendOtpEvent({required this.context});

  final BuildContext context;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SendOtpEventCopyWith<SendOtpEvent> get copyWith =>
      _$SendOtpEventCopyWithImpl<SendOtpEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SendOtpEvent &&
            (identical(other.context, context) || other.context == context));
  }

  @override
  int get hashCode => Object.hash(runtimeType, context);

  @override
  String toString() {
    return 'OtpEvent.sendOtpEvent(context: $context)';
  }
}

/// @nodoc
abstract mixin class $SendOtpEventCopyWith<$Res>
    implements $OtpEventCopyWith<$Res> {
  factory $SendOtpEventCopyWith(
          SendOtpEvent value, $Res Function(SendOtpEvent) _then) =
      _$SendOtpEventCopyWithImpl;
  @useResult
  $Res call({BuildContext context});
}

/// @nodoc
class _$SendOtpEventCopyWithImpl<$Res> implements $SendOtpEventCopyWith<$Res> {
  _$SendOtpEventCopyWithImpl(this._self, this._then);

  final SendOtpEvent _self;
  final $Res Function(SendOtpEvent) _then;

  /// Create a copy of OtpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? context = null,
  }) {
    return _then(SendOtpEvent(
      context: null == context
          ? _self.context
          : context // ignore: cast_nullable_to_non_nullable
              as BuildContext,
    ));
  }
}

/// @nodoc
mixin _$OtpState {
  String get otp;
  int get timer;
  bool get isEnableResend;
  CommonScreenState get status;
  String get emailOrPhone;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OtpStateCopyWith<OtpState> get copyWith =>
      _$OtpStateCopyWithImpl<OtpState>(this as OtpState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OtpState &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.isEnableResend, isEnableResend) ||
                other.isEnableResend == isEnableResend) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailOrPhone, emailOrPhone) ||
                other.emailOrPhone == emailOrPhone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, otp, timer, isEnableResend, status, emailOrPhone);

  @override
  String toString() {
    return 'OtpState(otp: $otp, timer: $timer, isEnableResend: $isEnableResend, status: $status, emailOrPhone: $emailOrPhone)';
  }
}

/// @nodoc
abstract mixin class $OtpStateCopyWith<$Res> {
  factory $OtpStateCopyWith(OtpState value, $Res Function(OtpState) _then) =
      _$OtpStateCopyWithImpl;
  @useResult
  $Res call(
      {String otp,
      int timer,
      bool isEnableResend,
      CommonScreenState status,
      String emailOrPhone});
}

/// @nodoc
class _$OtpStateCopyWithImpl<$Res> implements $OtpStateCopyWith<$Res> {
  _$OtpStateCopyWithImpl(this._self, this._then);

  final OtpState _self;
  final $Res Function(OtpState) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? otp = null,
    Object? timer = null,
    Object? isEnableResend = null,
    Object? status = null,
    Object? emailOrPhone = null,
  }) {
    return _then(_self.copyWith(
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      timer: null == timer
          ? _self.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int,
      isEnableResend: null == isEnableResend
          ? _self.isEnableResend
          : isEnableResend // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      emailOrPhone: null == emailOrPhone
          ? _self.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class _OtpState implements OtpState {
  _OtpState(
      {required this.otp,
      required this.timer,
      required this.isEnableResend,
      required this.status,
      required this.emailOrPhone});

  @override
  final String otp;
  @override
  final int timer;
  @override
  final bool isEnableResend;
  @override
  final CommonScreenState status;
  @override
  final String emailOrPhone;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$OtpStateCopyWith<_OtpState> get copyWith =>
      __$OtpStateCopyWithImpl<_OtpState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _OtpState &&
            (identical(other.otp, otp) || other.otp == otp) &&
            (identical(other.timer, timer) || other.timer == timer) &&
            (identical(other.isEnableResend, isEnableResend) ||
                other.isEnableResend == isEnableResend) &&
            (identical(other.status, status) || other.status == status) &&
            (identical(other.emailOrPhone, emailOrPhone) ||
                other.emailOrPhone == emailOrPhone));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, otp, timer, isEnableResend, status, emailOrPhone);

  @override
  String toString() {
    return 'OtpState(otp: $otp, timer: $timer, isEnableResend: $isEnableResend, status: $status, emailOrPhone: $emailOrPhone)';
  }
}

/// @nodoc
abstract mixin class _$OtpStateCopyWith<$Res>
    implements $OtpStateCopyWith<$Res> {
  factory _$OtpStateCopyWith(_OtpState value, $Res Function(_OtpState) _then) =
      __$OtpStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String otp,
      int timer,
      bool isEnableResend,
      CommonScreenState status,
      String emailOrPhone});
}

/// @nodoc
class __$OtpStateCopyWithImpl<$Res> implements _$OtpStateCopyWith<$Res> {
  __$OtpStateCopyWithImpl(this._self, this._then);

  final _OtpState _self;
  final $Res Function(_OtpState) _then;

  /// Create a copy of OtpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? otp = null,
    Object? timer = null,
    Object? isEnableResend = null,
    Object? status = null,
    Object? emailOrPhone = null,
  }) {
    return _then(_OtpState(
      otp: null == otp
          ? _self.otp
          : otp // ignore: cast_nullable_to_non_nullable
              as String,
      timer: null == timer
          ? _self.timer
          : timer // ignore: cast_nullable_to_non_nullable
              as int,
      isEnableResend: null == isEnableResend
          ? _self.isEnableResend
          : isEnableResend // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      emailOrPhone: null == emailOrPhone
          ? _self.emailOrPhone
          : emailOrPhone // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

// dart format on
