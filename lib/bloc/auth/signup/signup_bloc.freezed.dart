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

class OnSelectBirthDate implements SignUpEvent {
  const OnSelectBirthDate({required this.birthDate});

  final String birthDate;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnSelectBirthDateCopyWith<OnSelectBirthDate> get copyWith =>
      _$OnSelectBirthDateCopyWithImpl<OnSelectBirthDate>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnSelectBirthDate &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate));
  }

  @override
  int get hashCode => Object.hash(runtimeType, birthDate);

  @override
  String toString() {
    return 'SignUpEvent.onSelectBirthDate(birthDate: $birthDate)';
  }
}

/// @nodoc
abstract mixin class $OnSelectBirthDateCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnSelectBirthDateCopyWith(
          OnSelectBirthDate value, $Res Function(OnSelectBirthDate) _then) =
      _$OnSelectBirthDateCopyWithImpl;
  @useResult
  $Res call({String birthDate});
}

/// @nodoc
class _$OnSelectBirthDateCopyWithImpl<$Res>
    implements $OnSelectBirthDateCopyWith<$Res> {
  _$OnSelectBirthDateCopyWithImpl(this._self, this._then);

  final OnSelectBirthDate _self;
  final $Res Function(OnSelectBirthDate) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? birthDate = null,
  }) {
    return _then(OnSelectBirthDate(
      birthDate: null == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnSelectGender implements SignUpEvent {
  const OnSelectGender({required this.genderId});

  final int genderId;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnSelectGenderCopyWith<OnSelectGender> get copyWith =>
      _$OnSelectGenderCopyWithImpl<OnSelectGender>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnSelectGender &&
            (identical(other.genderId, genderId) ||
                other.genderId == genderId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, genderId);

  @override
  String toString() {
    return 'SignUpEvent.onSelectGender(genderId: $genderId)';
  }
}

/// @nodoc
abstract mixin class $OnSelectGenderCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnSelectGenderCopyWith(
          OnSelectGender value, $Res Function(OnSelectGender) _then) =
      _$OnSelectGenderCopyWithImpl;
  @useResult
  $Res call({int genderId});
}

/// @nodoc
class _$OnSelectGenderCopyWithImpl<$Res>
    implements $OnSelectGenderCopyWith<$Res> {
  _$OnSelectGenderCopyWithImpl(this._self, this._then);

  final OnSelectGender _self;
  final $Res Function(OnSelectGender) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? genderId = null,
  }) {
    return _then(OnSelectGender(
      genderId: null == genderId
          ? _self.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class OnChangeAddress implements SignUpEvent {
  const OnChangeAddress({required this.address});

  final String address;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeAddressCopyWith<OnChangeAddress> get copyWith =>
      _$OnChangeAddressCopyWithImpl<OnChangeAddress>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeAddress &&
            (identical(other.address, address) || other.address == address));
  }

  @override
  int get hashCode => Object.hash(runtimeType, address);

  @override
  String toString() {
    return 'SignUpEvent.onChangeAddress(address: $address)';
  }
}

/// @nodoc
abstract mixin class $OnChangeAddressCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnChangeAddressCopyWith(
          OnChangeAddress value, $Res Function(OnChangeAddress) _then) =
      _$OnChangeAddressCopyWithImpl;
  @useResult
  $Res call({String address});
}

/// @nodoc
class _$OnChangeAddressCopyWithImpl<$Res>
    implements $OnChangeAddressCopyWith<$Res> {
  _$OnChangeAddressCopyWithImpl(this._self, this._then);

  final OnChangeAddress _self;
  final $Res Function(OnChangeAddress) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? address = null,
  }) {
    return _then(OnChangeAddress(
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnSelectCountry implements SignUpEvent {
  const OnSelectCountry({required this.countryId});

  final int countryId;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnSelectCountryCopyWith<OnSelectCountry> get copyWith =>
      _$OnSelectCountryCopyWithImpl<OnSelectCountry>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnSelectCountry &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, countryId);

  @override
  String toString() {
    return 'SignUpEvent.onSelectCountry(countryId: $countryId)';
  }
}

/// @nodoc
abstract mixin class $OnSelectCountryCopyWith<$Res>
    implements $SignUpEventCopyWith<$Res> {
  factory $OnSelectCountryCopyWith(
          OnSelectCountry value, $Res Function(OnSelectCountry) _then) =
      _$OnSelectCountryCopyWithImpl;
  @useResult
  $Res call({int countryId});
}

/// @nodoc
class _$OnSelectCountryCopyWithImpl<$Res>
    implements $OnSelectCountryCopyWith<$Res> {
  _$OnSelectCountryCopyWithImpl(this._self, this._then);

  final OnSelectCountry _self;
  final $Res Function(OnSelectCountry) _then;

  /// Create a copy of SignUpEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? countryId = null,
  }) {
    return _then(OnSelectCountry(
      countryId: null == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
mixin _$SignUpState {
  String get firstName;
  String get lastName;
  String get email;
  String get countryISOCode;
  String get countryCode;
  String get mobileNumber;
  String? get birthDate;
  int? get genderId;
  int? get countryId;
  String get address;
  CommonScreenState get status;
  List<dynamic> get genderList;
  List<dynamic> get countryList;

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
            (identical(other.countryISOCode, countryISOCode) ||
                other.countryISOCode == countryISOCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.genderId, genderId) ||
                other.genderId == genderId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.genderList, genderList) &&
            const DeepCollectionEquality()
                .equals(other.countryList, countryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      countryISOCode,
      countryCode,
      mobileNumber,
      birthDate,
      genderId,
      countryId,
      address,
      status,
      const DeepCollectionEquality().hash(genderList),
      const DeepCollectionEquality().hash(countryList));

  @override
  String toString() {
    return 'SignUpState(firstName: $firstName, lastName: $lastName, email: $email, countryISOCode: $countryISOCode, countryCode: $countryCode, mobileNumber: $mobileNumber, birthDate: $birthDate, genderId: $genderId, countryId: $countryId, address: $address, status: $status, genderList: $genderList, countryList: $countryList)';
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
      String countryISOCode,
      String countryCode,
      String mobileNumber,
      String? birthDate,
      int? genderId,
      int? countryId,
      String address,
      CommonScreenState status,
      List<dynamic> genderList,
      List<dynamic> countryList});
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
    Object? countryISOCode = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? birthDate = freezed,
    Object? genderId = freezed,
    Object? countryId = freezed,
    Object? address = null,
    Object? status = null,
    Object? genderList = null,
    Object? countryList = null,
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
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genderId: freezed == genderId
          ? _self.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      genderList: null == genderList
          ? _self.genderList
          : genderList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      countryList: null == countryList
          ? _self.countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _SignUpState implements SignUpState {
  _SignUpState(
      {required this.firstName,
      required this.lastName,
      required this.email,
      required this.countryISOCode,
      required this.countryCode,
      required this.mobileNumber,
      required this.birthDate,
      required this.genderId,
      required this.countryId,
      required this.address,
      required this.status,
      required final List<dynamic> genderList,
      required final List<dynamic> countryList})
      : _genderList = genderList,
        _countryList = countryList;

  @override
  final String firstName;
  @override
  final String lastName;
  @override
  final String email;
  @override
  final String countryISOCode;
  @override
  final String countryCode;
  @override
  final String mobileNumber;
  @override
  final String? birthDate;
  @override
  final int? genderId;
  @override
  final int? countryId;
  @override
  final String address;
  @override
  final CommonScreenState status;
  final List<dynamic> _genderList;
  @override
  List<dynamic> get genderList {
    if (_genderList is EqualUnmodifiableListView) return _genderList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_genderList);
  }

  final List<dynamic> _countryList;
  @override
  List<dynamic> get countryList {
    if (_countryList is EqualUnmodifiableListView) return _countryList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_countryList);
  }

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
            (identical(other.countryISOCode, countryISOCode) ||
                other.countryISOCode == countryISOCode) &&
            (identical(other.countryCode, countryCode) ||
                other.countryCode == countryCode) &&
            (identical(other.mobileNumber, mobileNumber) ||
                other.mobileNumber == mobileNumber) &&
            (identical(other.birthDate, birthDate) ||
                other.birthDate == birthDate) &&
            (identical(other.genderId, genderId) ||
                other.genderId == genderId) &&
            (identical(other.countryId, countryId) ||
                other.countryId == countryId) &&
            (identical(other.address, address) || other.address == address) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._genderList, _genderList) &&
            const DeepCollectionEquality()
                .equals(other._countryList, _countryList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      firstName,
      lastName,
      email,
      countryISOCode,
      countryCode,
      mobileNumber,
      birthDate,
      genderId,
      countryId,
      address,
      status,
      const DeepCollectionEquality().hash(_genderList),
      const DeepCollectionEquality().hash(_countryList));

  @override
  String toString() {
    return 'SignUpState(firstName: $firstName, lastName: $lastName, email: $email, countryISOCode: $countryISOCode, countryCode: $countryCode, mobileNumber: $mobileNumber, birthDate: $birthDate, genderId: $genderId, countryId: $countryId, address: $address, status: $status, genderList: $genderList, countryList: $countryList)';
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
      String countryISOCode,
      String countryCode,
      String mobileNumber,
      String? birthDate,
      int? genderId,
      int? countryId,
      String address,
      CommonScreenState status,
      List<dynamic> genderList,
      List<dynamic> countryList});
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
    Object? countryISOCode = null,
    Object? countryCode = null,
    Object? mobileNumber = null,
    Object? birthDate = freezed,
    Object? genderId = freezed,
    Object? countryId = freezed,
    Object? address = null,
    Object? status = null,
    Object? genderList = null,
    Object? countryList = null,
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
      birthDate: freezed == birthDate
          ? _self.birthDate
          : birthDate // ignore: cast_nullable_to_non_nullable
              as String?,
      genderId: freezed == genderId
          ? _self.genderId
          : genderId // ignore: cast_nullable_to_non_nullable
              as int?,
      countryId: freezed == countryId
          ? _self.countryId
          : countryId // ignore: cast_nullable_to_non_nullable
              as int?,
      address: null == address
          ? _self.address
          : address // ignore: cast_nullable_to_non_nullable
              as String,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      genderList: null == genderList
          ? _self._genderList
          : genderList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
      countryList: null == countryList
          ? _self._countryList
          : countryList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

// dart format on
