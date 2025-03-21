import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/helper/pref_helper/pref_keys.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:package_info_plus/package_info_plus.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../repository/auth_repo_test.dart';
import '../views/login_page_test.dart';

class MockPackageInfo extends Mock implements PackageInfo {}

void setUpPackageInfoMock() {
  PackageInfo.setMockInitialValues(
    appName: 'Test App',
    packageName: 'com.example.test',
    version: '1.0.0',
    buildNumber: '1',
    buildSignature: '',
  );
}

void setUpSharedPrefMock() {
  SharedPreferences.setMockInitialValues(<String, Object>{
    PrefKeys.isLoggedIn: false,
    PrefKeys.rememberEmail: '',
    PrefKeys.rememberPassword: '',
    PrefKeys.isRememberMe: false
  });
}

void main() {
  final MockAuthRepo authRepo = MockAuthRepo();
  late MockNavigatorObserver mockObserver;

  setUpAll(() {
    mockObserver = MockNavigatorObserver();
    registerFallbackValue(FakeRoute());
  });
  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    setUpSharedPrefMock();
    setUpPackageInfoMock(); // Mock package info

    registerFallbackValue(FakeLoginRequestModel());
    await SharedPreferenceHelper().init();
  });

  tearDown(() {
    // loginBloc.close();
    reset(mockObserver);
  });

  group('test login bloc', () {
    test('Initial state should be LoginState.initial()', () {
      final bloc = LoginBloc(authRepo: authRepo);
      expect(
          bloc.state.copyWith(
              email: '',
              password: '',
              status: CommonScreenState.initial,
              isRememberMe: false,
              user: null),
          LoginState.initial());
    });

    blocTest<LoginBloc, LoginState>(
      'emits state with isRememberMe updated on OnChangeRememberMe',
      build: () => LoginBloc(authRepo: authRepo),
      act: (final LoginBloc bloc) =>
          bloc.add(OnChangeRememberMe(isRememberMe: true)),
      expect: () {
        final bloc = LoginBloc(authRepo: authRepo);
        return <LoginState>[
          bloc.state.copyWith(isRememberMe: true),
        ];
      },
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with status success updated on after api call',
      setUp: () {
        when(() =>
                authRepo.apiLogin(requestParams: any(named: 'requestParams')))
            .thenAnswer((final _) async => Right(UserDataModel()));
      },
      build: () => LoginBloc(authRepo: authRepo),
      act: (final LoginBloc bloc) => bloc.add(OnSubmit()),
      // skip: 1,
      expect: () => <LoginState>[
        LoginState.initial().copyWith(
          status: CommonScreenState.loading,
        ),
        LoginState.initial().copyWith(
          status: CommonScreenState.success,
          user: UserDataModel(),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state is Remember Me true with API call',
      setUp: () {
        when(() =>
                authRepo.apiLogin(requestParams: any(named: 'requestParams')))
            .thenAnswer((final _) async => Right(UserDataModel()));
      },
      build: () => LoginBloc(authRepo: authRepo),
      act: (final LoginBloc bloc) {
        bloc.add(LoginEvent.onChangeRememberMe(isRememberMe: true));
        bloc.add(OnSubmit());
      },
      // skip: 1,
      expect: () => <LoginState>[
        LoginState.initial().copyWith(
          isRememberMe: true,
        ),
        LoginState.initial().copyWith(
          status: CommonScreenState.loading,
        ),
        LoginState.initial().copyWith(
          status: CommonScreenState.success,
          user: UserDataModel(),
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits state with status error updated on after api call',
      setUp: () {
        when(() =>
                authRepo.apiLogin(requestParams: any(named: 'requestParams')))
            .thenAnswer((final _) async {
          return Left(
              ApiFailure(message: 'Something Went Wrong', statusCode: 1001));
        });
      },
      build: () => LoginBloc(authRepo: authRepo),
      act: (final LoginBloc bloc) => bloc.add(OnSubmit()),
      skip: 1,
      // to skip first status loading
      expect: () => <LoginState>[
        // loading state skipped
        // LoginState.initial().copyWith(
        //   status: CommonScreenState.loading,
        // ),
        LoginState.initial().copyWith(
          status: CommonScreenState.error,
        ),
      ],
    );
  });
}
