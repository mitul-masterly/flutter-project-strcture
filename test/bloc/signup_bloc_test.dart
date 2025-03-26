import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:intl_phone_field/countries.dart';
import 'package:mocktail/mocktail.dart';

import '../repository/auth_repo_test.dart';

void main() {
  final MockAuthRepo authRepo = MockAuthRepo();
  setUp(() async {
    registerFallbackValue(FakeSignUpRequestModel());
  });

  group('test signup bloc', () {
    test('Initial state should be Signup.initial()', () {
      final SignUpBloc bloc = SignUpBloc(authRepo: authRepo);

      expect(
          bloc.state.copyWith(
              firstName: '',
              lastName: '',
              email: '',
             // password: '',
              countryISOCode: 'US',
              countryCode: '+1',
              //confirmPassword: '',
              status: CommonScreenState.initial),
          SignUpState.initial());
    });

    blocTest<SignUpBloc, SignUpState>(
      'emits state first name',
      build: () => SignUpBloc(authRepo: authRepo),
      act: (final SignUpBloc bloc) =>
          bloc.add(OnChangeFirstName(fName: 'Bhoomi')),
      // skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          firstName: 'Bhoomi',
        ),
      ],
    );
    blocTest<SignUpBloc, SignUpState>(
      'emits state last name',
      build: () => SignUpBloc(authRepo: authRepo),
      act: (final SignUpBloc bloc) =>
          bloc.add(OnChangeLastName(lName: 'Patel')),
      // skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          lastName: 'Patel',
        ),
      ],
    );
    blocTest<SignUpBloc, SignUpState>(
      'emits state email address',
      build: () => SignUpBloc(authRepo: authRepo),
      act: (final SignUpBloc bloc) =>
          bloc.add(OnChangeEmail(email: 'bhoomi.n@gmail.com')),
      // skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          email: 'bhoomi.n@gmail.com',
        ),
      ],
    );

    // blocTest<SignUpBloc, SignUpState>(
    //   'emits state password',
    //   build: () => SignUpBloc(authRepo: authRepo),
    //   act: (final SignUpBloc bloc) =>
    //       bloc.add(OnChangePassword(password: '123456')),
    //   // skip: 1,
    //   expect: () => <SignUpState>[
    //     SignUpState.initial().copyWith(
    //       password: '123456',
    //     ),
    //   ],
    // );
/*
    blocTest<SignUpBloc, SignUpState>(
      'emits state confirm password',
      build: () => SignUpBloc(authRepo: authRepo),
      act: (final SignUpBloc bloc) =>
          bloc.add(OnChangeConfirmPassword(confirmPassword: '123456')),
      // skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          confirmPassword: '123456',
        ),
      ],
    );*/

    blocTest<SignUpBloc, SignUpState>(
      'emits state mobile number',
      build: () => SignUpBloc(authRepo: authRepo),
      act: (final SignUpBloc bloc) =>
          bloc.add(OnChangeMobileNumber(mobileNumber: '9925602848')),
      // skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          mobileNumber: '9925602848',
        ),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits state Country',
      build: () => SignUpBloc(authRepo: authRepo),
      act: (final SignUpBloc bloc) => bloc.add(
        OnChangeCountry(
          selectedCountry: Country(
              name: 'India',
              flag: '',
              code: 'IN',
              dialCode: '+91',
              nameTranslations: {},
              minLength: 10,
              maxLength: 10),
        ),
      ),
      skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          countryISOCode: 'IN',
          countryCode: '+91',
        ),
      ],
    );

    blocTest<SignUpBloc, SignUpState>(
      'emits state with status success updated on after api call',
      setUp: () {
        when(() =>
                authRepo.apiSignUp(requestParams: any(named: 'requestParams')))
            .thenAnswer((final _) async => Right(200));
      },
      build: () => SignUpBloc(authRepo: authRepo),
     // act: (final SignUpBloc bloc) => bloc.add(OnTapSubmit()),
      // skip: 1,
      expect: () => <SignUpState>[
        SignUpState.initial().copyWith(
          status: CommonScreenState.loading,
        ),
        SignUpState.initial().copyWith(
          status: CommonScreenState.success,
        ),
      ],
    );
  });
}
