// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'signup_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpEvent()';
  }
}

/// @nodoc
class $SignUpEventCopyWith<$Res> {
  $SignUpEventCopyWith(SignUpEvent _, $Res Function(SignUpEvent) __);
}

/// @nodoc

class OnTapSubmit implements SignUpEvent {
  const OnTapSubmit({required this.formKey});

  final GlobalKey<FormState> formKey;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnTapSubmitCopyWith<OnTapSubmit> get copyWith =>
      _$OnTapSubmitCopyWithImpl<OnTapSubmit>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnTapSubmit &&
            (identical(other.formKey, formKey) || other.formKey == formKey));
  }

  @override
  int get hashCode => Object.hash(runtimeType, formKey);

  @override
  String toString() {
    return 'SignUpEvent.onTapSubmit(formKey: $formKey)';
  }
}

/// @nodoc
abstract mixin class $OnTapSubmitCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnTapSubmitCopyWith(
          OnTapSubmit value, $Res Function(OnTapSubmit) _then) =
      _$OnTapSubmitCopyWithImpl;
  @useResult
  $Res call({GlobalKey<FormState> formKey});
}

/// @nodoc
class _$OnTapSubmitCopyWithImpl<$Res> implements $OnTapSubmitCopyWith<$Res> {
  _$OnTapSubmitCopyWithImpl(this._self, this._then);

  final OnTapSubmit _self;
  final $Res Function(OnTapSubmit) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? formKey = null,
  }) {
    return _then(OnTapSubmit(
      formKey: null == formKey
          ? _self.formKey
          : formKey // ignore: cast_nullable_to_non_nullable
              as GlobalKey<FormState>,
    ));
  }
}

/// @nodoc

class OnChangeCountry implements SignUpEvent {
  const OnChangeCountry({required this.selectedCountry});

  final Country selectedCountry;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeCountryCopyWith<OnChangeCountry> get copyWith =>
      _$OnChangeCountryCopyWithImpl<OnChangeCountry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeCountry &&
            (identical(other.selectedCountry, selectedCountry) ||
                other.selectedCountry == selectedCountry));
  }

  @override
  int get hashCode => Object.hash(runtimeType, selectedCountry);

  @override
  String toString() {
    return 'SignUpEvent.onChangeCountry(selectedCountry: $selectedCountry)';
  }
}

/// @nodoc
abstract mixin class $OnChangeCountryCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnChangeCountryCopyWith(
          OnChangeCountry value, $Res Function(OnChangeCountry) _then) =
      _$OnChangeCountryCopyWithImpl;
  @useResult
  $Res call({Country selectedCountry});
}

/// @nodoc
class _$OnChangeCountryCopyWithImpl<$Res>
    implements $OnChangeCountryCopyWith<$Res> {
  _$OnChangeCountryCopyWithImpl(this._self, this._then);

  final OnChangeCountry _self;
  final $Res Function(OnChangeCountry) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? selectedCountry = null,
  }) {
    return _then(OnChangeCountry(
      selectedCountry: null == selectedCountry
          ? _self.selectedCountry
          : selectedCountry // ignore: cast_nullable_to_non_nullable
              as Country,
    ));
  }
}

/// @nodoc
mixin _$SignUpState {
  TextEditingController get txtFirstName;
  TextEditingController get txtLastName;
  TextEditingController get txtEmail;
  TextEditingController get txtPassword;
  TextEditingController get txtConfirmPassword;
  TextEditingController get txtMobileNumber;
  bool get isSubmitting;
  String? get errorMessage;
  bool? get isSuccess;
  String? get countryCode;
  String? get countryCodeISO2;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpStateCopyWith<SignUpState> get copyWith =>
      _$SignUpStateCopyWithImpl<SignUpState>(this as SignUpState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpState &&
            (identical(other.txtFirstName, txtFirstName) ||
                other.txtFirstName == txtFirstName) &&
            (identical(other.txtLastName, txtLastName) ||
                other.txtLastName == txtLastName) &&
            (identical(other.txtEmail, txtEmail) ||
                other.txtEmail == txtEmail) &&
            (identical(other.txtPassword, txtPassword) ||
                other.txtPassword == txtPassword) &&
            (identical(other.txtConfirmPassword, txtConfirmPassword) ||
                other.txtConfirmPassword == txtConfirmPassword) &&
            (identical(other.txtMobileNumber, txtMobileNumber) ||
                other.txtMobileNumber == txtMobileNumber) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryCodeISO2, countryCodeISO2) ||
                other.countryCodeISO2 == countryCodeISO2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      txtFirstName,
      txtLastName,
      txtEmail,
      txtPassword,
      txtConfirmPassword,
      txtMobileNumber,
      isSubmitting,
      errorMessage,
      isSuccess,
      countryCode,
      countryCodeISO2);

  @override
  String toString() {
    return 'SignUpState(txtFirstName: $txtFirstName, txtLastName: $txtLastName, txtEmail: $txtEmail, txtPassword: $txtPassword, txtConfirmPassword: $txtConfirmPassword, txtMobileNumber: $txtMobileNumber, isSubmitting: $isSubmitting, errorMessage: $errorMessage, isSuccess: $isSuccess, countryCode: $countryCode, countryCodeISO2: $countryCodeISO2)';
  }
}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) _then) =
      _$SignUpStateCopyWithImpl;
  @useResult
  $Res call(
      {TextEditingController txtFirstName,
      TextEditingController txtLastName,
      TextEditingController txtEmail,
      TextEditingController txtPassword,
      TextEditingController txtConfirmPassword,
      TextEditingController txtMobileNumber,
      bool isSubmitting,
      String? errorMessage,
      bool? isSuccess,
      String? countryCode,
      String? countryCodeISO2});
}

/// @nodoc
class _$SignUpStateCopyWithImpl<$Res> implements $SignUpStateCopyWith<$Res> {
  _$SignUpStateCopyWithImpl(this._self, this._then);

  final SignUpState _self;
  final $Res Function(SignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? txtFirstName = null,
    Object? txtLastName = null,
    Object? txtEmail = null,
    Object? txtPassword = null,
    Object? txtConfirmPassword = null,
    Object? txtMobileNumber = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
    Object? isSuccess = freezed,
    Object? countryCode = freezed,
    Object? countryCodeISO2 = freezed,
  }) {
    return _then(_self.copyWith(
      txtFirstName: null == txtFirstName
          ? _self.txtFirstName
          : txtFirstName // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtLastName: null == txtLastName
          ? _self.txtLastName
          : txtLastName // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtEmail: null == txtEmail
          ? _self.txtEmail
          : txtEmail // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtPassword: null == txtPassword
          ? _self.txtPassword
          : txtPassword // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtConfirmPassword: null == txtConfirmPassword
          ? _self.txtConfirmPassword
          : txtConfirmPassword // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtMobileNumber: null == txtMobileNumber
          ? _self.txtMobileNumber
          : txtMobileNumber // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCodeISO2: freezed == countryCodeISO2
          ? _self.countryCodeISO2
          : countryCodeISO2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc

class _SignUpState implements SignUpState {
  _SignUpState(
      {required this.txtFirstName,
      required this.txtLastName,
      required this.txtEmail,
      required this.txtPassword,
      required this.txtConfirmPassword,
      required this.txtMobileNumber,
      required this.isSubmitting,
      this.errorMessage,
      this.isSuccess,
      this.countryCode,
      this.countryCodeISO2});

  @override
  final TextEditingController txtFirstName;
  @override
  final TextEditingController txtLastName;
  @override
  final TextEditingController txtEmail;
  @override
  final TextEditingController txtPassword;
  @override
  final TextEditingController txtConfirmPassword;
  @override
  final TextEditingController txtMobileNumber;
  @override
  final bool isSubmitting;
  @override
  final String? errorMessage;
  @override
  final bool? isSuccess;
  @override
  final String? countryCode;
  @override
  final String? countryCodeISO2;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpStateCopyWith<_SignUpState> get copyWith =>
      __$SignUpStateCopyWithImpl<_SignUpState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpState &&
            (identical(other.txtFirstName, txtFirstName) ||
                other.txtFirstName == txtFirstName) &&
            (identical(other.txtLastName, txtLastName) ||
                other.txtLastName == txtLastName) &&
            (identical(other.txtEmail, txtEmail) ||
                other.txtEmail == txtEmail) &&
            (identical(other.txtPassword, txtPassword) ||
                other.txtPassword == txtPassword) &&
            (identical(other.txtConfirmPassword, txtConfirmPassword) ||
                other.txtConfirmPassword == txtConfirmPassword) &&
            (identical(other.txtMobileNumber, txtMobileNumber) ||
                other.txtMobileNumber == txtMobileNumber) &&
            (identical(other.isSubmitting, isSubmitting) ||
                other.isSubmitting == isSubmitting) &&
            (identical(other.errorMessage, errorMessage) ||
                other.errorMessage == errorMessage) &&
            (identical(other.isSuccess, isSuccess) ||
                other.isSuccess == isSuccess) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.countryCodeISO2, countryCodeISO2) ||
                other.countryCodeISO2 == countryCodeISO2));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      txtFirstName,
      txtLastName,
      txtEmail,
      txtPassword,
      txtConfirmPassword,
      txtMobileNumber,
      isSubmitting,
      errorMessage,
      isSuccess,
      countryCode,
      countryCodeISO2);

  @override
  String toString() {
    return 'SignUpState(txtFirstName: $txtFirstName, txtLastName: $txtLastName, txtEmail: $txtEmail, txtPassword: $txtPassword, txtConfirmPassword: $txtConfirmPassword, txtMobileNumber: $txtMobileNumber, isSubmitting: $isSubmitting, errorMessage: $errorMessage, isSuccess: $isSuccess, countryCode: $countryCode, countryCodeISO2: $countryCodeISO2)';
  }
}

/// @nodoc
abstract mixin class _$SignUpStateCopyWith<$Res>
    implements $SignUpStateCopyWith<$Res> {
  factory _$SignUpStateCopyWith(
          _SignUpState value, $Res Function(_SignUpState) _then) =
      __$SignUpStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {TextEditingController txtFirstName,
      TextEditingController txtLastName,
      TextEditingController txtEmail,
      TextEditingController txtPassword,
      TextEditingController txtConfirmPassword,
      TextEditingController txtMobileNumber,
      bool isSubmitting,
      String? errorMessage,
      bool? isSuccess,
      String? countryCode,
      String? countryCodeISO2});
}

/// @nodoc
class __$SignUpStateCopyWithImpl<$Res> implements _$SignUpStateCopyWith<$Res> {
  __$SignUpStateCopyWithImpl(this._self, this._then);

  final _SignUpState _self;
  final $Res Function(_SignUpState) _then;

  /// Create a copy of SignUpState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? txtFirstName = null,
    Object? txtLastName = null,
    Object? txtEmail = null,
    Object? txtPassword = null,
    Object? txtConfirmPassword = null,
    Object? txtMobileNumber = null,
    Object? isSubmitting = null,
    Object? errorMessage = freezed,
    Object? isSuccess = freezed,
    Object? countryCode = freezed,
    Object? countryCodeISO2 = freezed,
  }) {
    return _then(_SignUpState(
      txtFirstName: null == txtFirstName
          ? _self.txtFirstName
          : txtFirstName // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtLastName: null == txtLastName
          ? _self.txtLastName
          : txtLastName // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtEmail: null == txtEmail
          ? _self.txtEmail
          : txtEmail // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtPassword: null == txtPassword
          ? _self.txtPassword
          : txtPassword // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtConfirmPassword: null == txtConfirmPassword
          ? _self.txtConfirmPassword
          : txtConfirmPassword // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      txtMobileNumber: null == txtMobileNumber
          ? _self.txtMobileNumber
          : txtMobileNumber // ignore: cast_nullable_to_non_nullable
              as TextEditingController,
      isSubmitting: null == isSubmitting
          ? _self.isSubmitting
          : isSubmitting // ignore: cast_nullable_to_non_nullable
              as bool,
      errorMessage: freezed == errorMessage
          ? _self.errorMessage
          : errorMessage // ignore: cast_nullable_to_non_nullable
              as String?,
      isSuccess: freezed == isSuccess
          ? _self.isSuccess
          : isSuccess // ignore: cast_nullable_to_non_nullable
              as bool?,
      countryCode: freezed == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String?,
      countryCodeISO2: freezed == countryCodeISO2
          ? _self.countryCodeISO2
          : countryCodeISO2 // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

// dart format on
