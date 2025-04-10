// dart format width=80
// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'sign_up_details_bloc.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SignUpDetailsEvent {
  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is SignUpDetailsEvent);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpDetailsEvent()';
  }
}

/// @nodoc
class $SignUpDetailsEventCopyWith<$Res> {
  $SignUpDetailsEventCopyWith(
      SignUpDetailsEvent _, $Res Function(SignUpDetailsEvent) __);
}

/// @nodoc

class InitialEvent implements SignUpDetailsEvent {
  const InitialEvent({required this.signupRequest});

  final SignupRequest signupRequest;

  /// Create a copy of SignUpDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $InitialEventCopyWith<InitialEvent> get copyWith =>
      _$InitialEventCopyWithImpl<InitialEvent>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is InitialEvent &&
            (identical(other.signupRequest, signupRequest) ||
                other.signupRequest == signupRequest));
  }

  @override
  int get hashCode => Object.hash(runtimeType, signupRequest);

  @override
  String toString() {
    return 'SignUpDetailsEvent.initialEvent(signupRequest: $signupRequest)';
  }
}

/// @nodoc
abstract mixin class $InitialEventCopyWith<$Res>
    implements $SignUpDetailsEventCopyWith<$Res> {
  factory $InitialEventCopyWith(
          InitialEvent value, $Res Function(InitialEvent) _then) =
      _$InitialEventCopyWithImpl;
  @useResult
  $Res call({SignupRequest signupRequest});
}

/// @nodoc
class _$InitialEventCopyWithImpl<$Res> implements $InitialEventCopyWith<$Res> {
  _$InitialEventCopyWithImpl(this._self, this._then);

  final InitialEvent _self;
  final $Res Function(InitialEvent) _then;

  /// Create a copy of SignUpDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? signupRequest = null,
  }) {
    return _then(InitialEvent(
      signupRequest: null == signupRequest
          ? _self.signupRequest
          : signupRequest // ignore: cast_nullable_to_non_nullable
              as SignupRequest,
    ));
  }
}

/// @nodoc

class OnChangePassword implements SignUpDetailsEvent {
  const OnChangePassword({required this.password});

  final String password;

  /// Create a copy of SignUpDetailsEvent
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
    return 'SignUpDetailsEvent.onChangePassword(password: $password)';
  }
}

/// @nodoc
abstract mixin class $OnChangePasswordCopyWith<$Res>
    implements $SignUpDetailsEventCopyWith<$Res> {
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

  /// Create a copy of SignUpDetailsEvent
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

class OnChangeConfirmPassword implements SignUpDetailsEvent {
  const OnChangeConfirmPassword({required this.confirmPassword});

  final String confirmPassword;

  /// Create a copy of SignUpDetailsEvent
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
    return 'SignUpDetailsEvent.onChangeConfirmPassword(confirmPassword: $confirmPassword)';
  }
}

/// @nodoc
abstract mixin class $OnChangeConfirmPasswordCopyWith<$Res>
    implements $SignUpDetailsEventCopyWith<$Res> {
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

  /// Create a copy of SignUpDetailsEvent
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

class OnSelectQuestion implements SignUpDetailsEvent {
  const OnSelectQuestion({required this.questionId});

  final int questionId;

  /// Create a copy of SignUpDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnSelectQuestionCopyWith<OnSelectQuestion> get copyWith =>
      _$OnSelectQuestionCopyWithImpl<OnSelectQuestion>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnSelectQuestion &&
            (identical(other.questionId, questionId) ||
                other.questionId == questionId));
  }

  @override
  int get hashCode => Object.hash(runtimeType, questionId);

  @override
  String toString() {
    return 'SignUpDetailsEvent.onSelectQuestion(questionId: $questionId)';
  }
}

/// @nodoc
abstract mixin class $OnSelectQuestionCopyWith<$Res>
    implements $SignUpDetailsEventCopyWith<$Res> {
  factory $OnSelectQuestionCopyWith(
          OnSelectQuestion value, $Res Function(OnSelectQuestion) _then) =
      _$OnSelectQuestionCopyWithImpl;
  @useResult
  $Res call({int questionId});
}

/// @nodoc
class _$OnSelectQuestionCopyWithImpl<$Res>
    implements $OnSelectQuestionCopyWith<$Res> {
  _$OnSelectQuestionCopyWithImpl(this._self, this._then);

  final OnSelectQuestion _self;
  final $Res Function(OnSelectQuestion) _then;

  /// Create a copy of SignUpDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? questionId = null,
  }) {
    return _then(OnSelectQuestion(
      questionId: null == questionId
          ? _self.questionId
          : questionId // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc

class OnChangeAnswer implements SignUpDetailsEvent {
  const OnChangeAnswer({required this.answer});

  final String answer;

  /// Create a copy of SignUpDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $OnChangeAnswerCopyWith<OnChangeAnswer> get copyWith =>
      _$OnChangeAnswerCopyWithImpl<OnChangeAnswer>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is OnChangeAnswer &&
            (identical(other.answer, answer) || other.answer == answer));
  }

  @override
  int get hashCode => Object.hash(runtimeType, answer);

  @override
  String toString() {
    return 'SignUpDetailsEvent.onChangeAnswer(answer: $answer)';
  }
}

/// @nodoc
abstract mixin class $OnChangeAnswerCopyWith<$Res>
    implements $SignUpDetailsEventCopyWith<$Res> {
  factory $OnChangeAnswerCopyWith(
          OnChangeAnswer value, $Res Function(OnChangeAnswer) _then) =
      _$OnChangeAnswerCopyWithImpl;
  @useResult
  $Res call({String answer});
}

/// @nodoc
class _$OnChangeAnswerCopyWithImpl<$Res>
    implements $OnChangeAnswerCopyWith<$Res> {
  _$OnChangeAnswerCopyWithImpl(this._self, this._then);

  final OnChangeAnswer _self;
  final $Res Function(OnChangeAnswer) _then;

  /// Create a copy of SignUpDetailsEvent
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  $Res call({
    Object? answer = null,
  }) {
    return _then(OnChangeAnswer(
      answer: null == answer
          ? _self.answer
          : answer // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc

class OnCheckPrivacyPolicy implements SignUpDetailsEvent {
  const OnCheckPrivacyPolicy();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnCheckPrivacyPolicy);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpDetailsEvent.onCheckPrivacyPolicy()';
  }
}

/// @nodoc

class OnCheckTermsAndCondition implements SignUpDetailsEvent {
  const OnCheckTermsAndCondition();

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is OnCheckTermsAndCondition);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  String toString() {
    return 'SignUpDetailsEvent.onCheckTermsAndCondition()';
  }
}

/// @nodoc

class OnTapSubmit implements SignUpDetailsEvent {
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
    return 'SignUpDetailsEvent.onTapSubmit()';
  }
}

/// @nodoc
mixin _$SignUpDetailsState {
  String get password;
  String get confirmPassword;
  int? get securityQuestionId;
  String get securityAnswer;
  bool get checkPrivacyPolicy;
  bool get checkTermsAndCondition;
  CommonScreenState get status;
  List<dynamic> get questionList;

  /// Create a copy of SignUpDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  $SignUpDetailsStateCopyWith<SignUpDetailsState> get copyWith =>
      _$SignUpDetailsStateCopyWithImpl<SignUpDetailsState>(
          this as SignUpDetailsState, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is SignUpDetailsState &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.securityQuestionId, securityQuestionId) ||
                other.securityQuestionId == securityQuestionId) &&
            (identical(other.securityAnswer, securityAnswer) ||
                other.securityAnswer == securityAnswer) &&
            (identical(other.checkPrivacyPolicy, checkPrivacyPolicy) ||
                other.checkPrivacyPolicy == checkPrivacyPolicy) &&
            (identical(other.checkTermsAndCondition, checkTermsAndCondition) ||
                other.checkTermsAndCondition == checkTermsAndCondition) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other.questionList, questionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      password,
      confirmPassword,
      securityQuestionId,
      securityAnswer,
      checkPrivacyPolicy,
      checkTermsAndCondition,
      status,
      const DeepCollectionEquality().hash(questionList));

  @override
  String toString() {
    return 'SignUpDetailsState(password: $password, confirmPassword: $confirmPassword, securityQuestionId: $securityQuestionId, securityAnswer: $securityAnswer, checkPrivacyPolicy: $checkPrivacyPolicy, checkTermsAndCondition: $checkTermsAndCondition, status: $status, questionList: $questionList)';
  }
}

/// @nodoc
abstract mixin class $SignUpDetailsStateCopyWith<$Res> {
  factory $SignUpDetailsStateCopyWith(
          SignUpDetailsState value, $Res Function(SignUpDetailsState) _then) =
      _$SignUpDetailsStateCopyWithImpl;
  @useResult
  $Res call(
      {String password,
      String confirmPassword,
      int? securityQuestionId,
      String securityAnswer,
      bool checkPrivacyPolicy,
      bool checkTermsAndCondition,
      CommonScreenState status,
      List<dynamic> questionList});
}

/// @nodoc
class _$SignUpDetailsStateCopyWithImpl<$Res>
    implements $SignUpDetailsStateCopyWith<$Res> {
  _$SignUpDetailsStateCopyWithImpl(this._self, this._then);

  final SignUpDetailsState _self;
  final $Res Function(SignUpDetailsState) _then;

  /// Create a copy of SignUpDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
    Object? securityQuestionId = freezed,
    Object? securityAnswer = null,
    Object? checkPrivacyPolicy = null,
    Object? checkTermsAndCondition = null,
    Object? status = null,
    Object? questionList = null,
  }) {
    return _then(_self.copyWith(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      securityQuestionId: freezed == securityQuestionId
          ? _self.securityQuestionId
          : securityQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      securityAnswer: null == securityAnswer
          ? _self.securityAnswer
          : securityAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      checkPrivacyPolicy: null == checkPrivacyPolicy
          ? _self.checkPrivacyPolicy
          : checkPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTermsAndCondition: null == checkTermsAndCondition
          ? _self.checkTermsAndCondition
          : checkTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      questionList: null == questionList
          ? _self.questionList
          : questionList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _SignUpDetailsState implements SignUpDetailsState {
  _SignUpDetailsState(
      {required this.password,
      required this.confirmPassword,
      required this.securityQuestionId,
      required this.securityAnswer,
      required this.checkPrivacyPolicy,
      required this.checkTermsAndCondition,
      required this.status,
      required final List<dynamic> questionList})
      : _questionList = questionList;

  @override
  final String password;
  @override
  final String confirmPassword;
  @override
  final int? securityQuestionId;
  @override
  final String securityAnswer;
  @override
  final bool checkPrivacyPolicy;
  @override
  final bool checkTermsAndCondition;
  @override
  final CommonScreenState status;
  final List<dynamic> _questionList;
  @override
  List<dynamic> get questionList {
    if (_questionList is EqualUnmodifiableListView) return _questionList;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_questionList);
  }

  /// Create a copy of SignUpDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @JsonKey(includeFromJson: false, includeToJson: false)
  @pragma('vm:prefer-inline')
  _$SignUpDetailsStateCopyWith<_SignUpDetailsState> get copyWith =>
      __$SignUpDetailsStateCopyWithImpl<_SignUpDetailsState>(this, _$identity);

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _SignUpDetailsState &&
            (identical(other.password, password) ||
                other.password == password) &&
            (identical(other.confirmPassword, confirmPassword) ||
                other.confirmPassword == confirmPassword) &&
            (identical(other.securityQuestionId, securityQuestionId) ||
                other.securityQuestionId == securityQuestionId) &&
            (identical(other.securityAnswer, securityAnswer) ||
                other.securityAnswer == securityAnswer) &&
            (identical(other.checkPrivacyPolicy, checkPrivacyPolicy) ||
                other.checkPrivacyPolicy == checkPrivacyPolicy) &&
            (identical(other.checkTermsAndCondition, checkTermsAndCondition) ||
                other.checkTermsAndCondition == checkTermsAndCondition) &&
            (identical(other.status, status) || other.status == status) &&
            const DeepCollectionEquality()
                .equals(other._questionList, _questionList));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType,
      password,
      confirmPassword,
      securityQuestionId,
      securityAnswer,
      checkPrivacyPolicy,
      checkTermsAndCondition,
      status,
      const DeepCollectionEquality().hash(_questionList));

  @override
  String toString() {
    return 'SignUpDetailsState(password: $password, confirmPassword: $confirmPassword, securityQuestionId: $securityQuestionId, securityAnswer: $securityAnswer, checkPrivacyPolicy: $checkPrivacyPolicy, checkTermsAndCondition: $checkTermsAndCondition, status: $status, questionList: $questionList)';
  }
}

/// @nodoc
abstract mixin class _$SignUpDetailsStateCopyWith<$Res>
    implements $SignUpDetailsStateCopyWith<$Res> {
  factory _$SignUpDetailsStateCopyWith(
          _SignUpDetailsState value, $Res Function(_SignUpDetailsState) _then) =
      __$SignUpDetailsStateCopyWithImpl;
  @override
  @useResult
  $Res call(
      {String password,
      String confirmPassword,
      int? securityQuestionId,
      String securityAnswer,
      bool checkPrivacyPolicy,
      bool checkTermsAndCondition,
      CommonScreenState status,
      List<dynamic> questionList});
}

/// @nodoc
class __$SignUpDetailsStateCopyWithImpl<$Res>
    implements _$SignUpDetailsStateCopyWith<$Res> {
  __$SignUpDetailsStateCopyWithImpl(this._self, this._then);

  final _SignUpDetailsState _self;
  final $Res Function(_SignUpDetailsState) _then;

  /// Create a copy of SignUpDetailsState
  /// with the given fields replaced by the non-null parameter values.
  @override
  @pragma('vm:prefer-inline')
  $Res call({
    Object? password = null,
    Object? confirmPassword = null,
    Object? securityQuestionId = freezed,
    Object? securityAnswer = null,
    Object? checkPrivacyPolicy = null,
    Object? checkTermsAndCondition = null,
    Object? status = null,
    Object? questionList = null,
  }) {
    return _then(_SignUpDetailsState(
      password: null == password
          ? _self.password
          : password // ignore: cast_nullable_to_non_nullable
              as String,
      confirmPassword: null == confirmPassword
          ? _self.confirmPassword
          : confirmPassword // ignore: cast_nullable_to_non_nullable
              as String,
      securityQuestionId: freezed == securityQuestionId
          ? _self.securityQuestionId
          : securityQuestionId // ignore: cast_nullable_to_non_nullable
              as int?,
      securityAnswer: null == securityAnswer
          ? _self.securityAnswer
          : securityAnswer // ignore: cast_nullable_to_non_nullable
              as String,
      checkPrivacyPolicy: null == checkPrivacyPolicy
          ? _self.checkPrivacyPolicy
          : checkPrivacyPolicy // ignore: cast_nullable_to_non_nullable
              as bool,
      checkTermsAndCondition: null == checkTermsAndCondition
          ? _self.checkTermsAndCondition
          : checkTermsAndCondition // ignore: cast_nullable_to_non_nullable
              as bool,
      status: null == status
          ? _self.status
          : status // ignore: cast_nullable_to_non_nullable
              as CommonScreenState,
      questionList: null == questionList
          ? _self._questionList
          : questionList // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

// dart format on
