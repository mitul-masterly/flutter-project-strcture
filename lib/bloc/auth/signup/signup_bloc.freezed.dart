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
  const OnTapSubmit();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnTapSubmit);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpEvent.onTapSubmit()';
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

class OnChangeFirstName implements SignUpEvent {
  const OnChangeFirstName({required this.fName});

  final String fName;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeFirstNameCopyWith<OnChangeFirstName> get copyWith =>
      _$OnChangeFirstNameCopyWithImpl<OnChangeFirstName>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeFirstName &&
            (identical(other.fName, fName) || other.fName == fName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, fName);

  @override
  String toString() {
    return 'SignUpEvent.onChangeFirstName(fName: $fName)';
  }
}

/// @nodoc
abstract mixin class $OnChangeFirstNameCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnChangeFirstNameCopyWith(
          OnChangeFirstName value, $Res Function(OnChangeFirstName) _then) =
      _$OnChangeFirstNameCopyWithImpl;
  @useResult
  $Res call({String fName});
}

/// @nodoc
class _$OnChangeFirstNameCopyWithImpl<$Res>
    implements $OnChangeFirstNameCopyWith<$Res> {
  _$OnChangeFirstNameCopyWithImpl(this._self, this._then);

  final OnChangeFirstName _self;
  final $Res Function(OnChangeFirstName) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? fName = null,
  }) {
    return _then(OnChangeFirstName(
      fName: null == fName
          ? _self.fName
          : fName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnChangeLastName implements SignUpEvent {
  const OnChangeLastName({required this.lName});

  final String lName;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeLastNameCopyWith<OnChangeLastName> get copyWith =>
      _$OnChangeLastNameCopyWithImpl<OnChangeLastName>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeLastName &&
            (identical(other.lName, lName) || other.lName == lName));
  }

  @override
  int get hashCode => Object.hash(runtimeType, lName);

  @override
  String toString() {
    return 'SignUpEvent.onChangeLastName(lName: $lName)';
  }
}

/// @nodoc
abstract mixin class $OnChangeLastNameCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnChangeLastNameCopyWith(
          OnChangeLastName value, $Res Function(OnChangeLastName) _then) =
      _$OnChangeLastNameCopyWithImpl;
  @useResult
  $Res call({String lName});
}

/// @nodoc
class _$OnChangeLastNameCopyWithImpl<$Res>
    implements $OnChangeLastNameCopyWith<$Res> {
  _$OnChangeLastNameCopyWithImpl(this._self, this._then);

  final OnChangeLastName _self;
  final $Res Function(OnChangeLastName) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? lName = null,
  }) {
    return _then(OnChangeLastName(
      lName: null == lName
          ? _self.lName
          : lName // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnChangeEmail implements SignUpEvent {
  const OnChangeEmail({required this.email});

  final String email;

  /// Create a copy of SignUpEvent
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
    return 'SignUpEvent.onChangeEmail(email: $email)';
  }
}

/// @nodoc
abstract mixin class $OnChangeEmailCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
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

  /// Create a copy of SignUpEvent
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

class OnChangePassword implements SignUpEvent {
  const OnChangePassword({required this.password});

  final String password;

  /// Create a copy of SignUpEvent
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
    return 'SignUpEvent.onChangePassword(password: $password)';
  }
}

/// @nodoc
abstract mixin class $OnChangePasswordCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
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

  /// Create a copy of SignUpEvent
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

class OnChangeConfirmPassword implements SignUpEvent {
  const OnChangeConfirmPassword({required this.confirmPassword});

  final String confirmPassword;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeConfirmPasswordCopyWith<OnChangeConfirmPassword> get copyWith =>
      _$OnChangeConfirmPasswordCopyWithImpl<OnChangeConfirmPassword>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeConfirmPassword &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword));
  }

  @override
  int get hashCode => Object.hash(runtimeType, confirmPassword);

  @override
  String toString() {
    return 'SignUpEvent.onChangeConfirmPassword(confirmPassword: $confirmPassword)';
  }
}

/// @nodoc
abstract mixin class $OnChangeConfirmPasswordCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnChangeConfirmPasswordCopyWith(OnChangeConfirmPassword value,
          $Res Function(OnChangeConfirmPassword) _then) =
      _$OnChangeConfirmPasswordCopyWithImpl;
  @useResult
  $Res call({String confirmPassword});
}

/// @nodoc
class _$OnChangeConfirmPasswordCopyWithImpl<$Res>
    implements $OnChangeConfirmPasswordCopyWith<$Res> {
  _$OnChangeConfirmPasswordCopyWithImpl(this._self, this._then);

  final OnChangeConfirmPassword _self;
  final $Res Function(OnChangeConfirmPassword) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? confirmPassword = null,
  }) {
    return _then(OnChangeConfirmPassword(
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnChangeMobileNumber implements SignUpEvent {
  const OnChangeMobileNumber({required this.mobileNumber});

  final String mobileNumber;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeMobileNumberCopyWith<OnChangeMobileNumber> get copyWith =>
      _$OnChangeMobileNumberCopyWithImpl<OnChangeMobileNumber>(
          this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeMobileNumber &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber));
  }

  @override
  int get hashCode => Object.hash(runtimeType, mobileNumber);

  @override
  String toString() {
    return 'SignUpEvent.onChangeMobileNumber(mobileNumber: $mobileNumber)';
  }
}

/// @nodoc
abstract mixin class $OnChangeMobileNumberCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnChangeMobileNumberCopyWith(OnChangeMobileNumber value,
          $Res Function(OnChangeMobileNumber) _then) =
      _$OnChangeMobileNumberCopyWithImpl;
  @useResult
  $Res call({String mobileNumber});
}

/// @nodoc
class _$OnChangeMobileNumberCopyWithImpl<$Res>
    implements $OnChangeMobileNumberCopyWith<$Res> {
  _$OnChangeMobileNumberCopyWithImpl(this._self, this._then);

  final OnChangeMobileNumber _self;
  final $Res Function(OnChangeMobileNumber) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? mobileNumber = null,
  }) {
    return _then(OnChangeMobileNumber(
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
mixin _$SignUpState {
  String get firstName;
  String get lastName;
  String get email;
  String get password;
  String get confirmPassword;
  String get countryISOCode;
  String get countryCode;
  String get mobileNumber;
  CommonScreenState get status;

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
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.countryISOCode, countryISOCode) ||
                other.countryISOCode == countryISOCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
      countryISOCode,
      countryCode,
      mobileNumber,
      status);

  @override
  String toString() {
    return 'SignUpState(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, countryISOCode: $countryISOCode, countryCode: $countryCode, mobileNumber: $mobileNumber, status: $status)';
  }
}

/// @nodoc
abstract mixin class $SignUpStateCopyWith<$Res> {
  factory $SignUpStateCopyWith(
          SignUpState value, $Res Function(SignUpState) _then) =
      _$SignUpStateCopyWithImpl;
  @useResult
  $Res call(
      {String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String countryISOCode,
      String countryCode,
      String mobileNumber,
      CommonScreenState status});
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
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? countryISOCode = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? status = null,
  }) {
    return _then(_self.copyWith(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      countryISOCode: null == countryISOCode
          ? _self.countryISOCode
          : countryISOCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
    ));
  }
}

/// @nodoc

class _SignUpState implements SignUpState {
  _SignUpState(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.password,
      required this.confirmPassword,
      required this.countryISOCode,
      required this.countryCode,
      required this.mobileNumber,
      required this.status});

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final String countryISOCode;
  @override
  final String countryCode;
  @override
  final String mobileNumber;
  @override
  final CommonScreenState status;

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
            (identical(other.firstName, firstName) ||
                other.firstName == firstName) &&
            (identical(other.lastName, lastName) ||
                other.lastName == lastName) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.countryISOCode, countryISOCode) ||
                other.countryISOCode == countryISOCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.status, status) || other.status == status));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      password,
      confirmPassword,
      countryISOCode,
      countryCode,
      mobileNumber,
      status);

  @override
  String toString() {
    return 'SignUpState(firstName: $firstName, lastName: $lastName, email: $email, password: $password, confirmPassword: $confirmPassword, countryISOCode: $countryISOCode, countryCode: $countryCode, mobileNumber: $mobileNumber, status: $status)';
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
      {String firstName,
      String lastName,
      String email,
      String password,
      String confirmPassword,
      String countryISOCode,
      String countryCode,
      String mobileNumber,
      CommonScreenState status});
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
    Object? firstName = null,
    Object? lastName = null,
    Object? email = null,
    Object? password = null,
    Object? confirmPassword = null,
    Object? countryISOCode = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? status = null,
  }) {
    return _then(_SignUpState(
      firstName: null == firstName
          ? _self.firstName
          : firstName // ignore: cast_nullable_to_non_nullable
              as String,
      lastName: null == lastName
          ? _self.lastName
          : lastName // ignore: cast_nullable_to_non_nullable
              as String,
      email: null == email
          ? _self.email
          : email // ignore: cast_nullable_to_non_nullable
              as String,
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      countryISOCode: null == countryISOCode
          ? _self.countryISOCode
          : countryISOCode // ignore: cast_nullable_to_non_nullable
              as String,
      countryCode: null == countryCode
          ? _self.countryCode
          : countryCode // ignore: cast_nullable_to_non_nullable
              as String,
      mobileNumber: null == mobileNumber
          ? _self.mobileNumber
          : mobileNumber // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
    ));
  }
}

// dart format on
