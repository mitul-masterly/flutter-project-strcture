import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_project_structure/bloc/user/profile_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/models/others/profile_options_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/data/repository/user_repo.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../repository/auth_repo_test.dart';
import 'login_bloc_test.dart';

class MockUserRepo extends Mock implements UserRepo {}

void main() {
  late MockUserRepo userRepo;
  late MockAuthRepo authRepo;

  setUpAll(() async {
    userRepo = MockUserRepo();
    authRepo = MockAuthRepo();
    setUpSharedPrefMock();
    await SharedPreferenceHelper().init();
  });

  group('Test Profile Bloc', () {
    test('Initial state should be ProfileState.loading()', () {
      final ProfileBloc bloc = ProfileBloc(authRepo, userRepo: userRepo);
      expect(bloc.state.copyWith(status: CommonScreenState.loading),
          ProfileState.initial());
    });

    blocTest(
      'User data should load when bloc created',
      setUp: () {
        when(() => userRepo.getUserProfileApi())
            .thenAnswer((final _) async => Right(UserDataModel()));
      },
      build: () => ProfileBloc(authRepo, userRepo: userRepo),
      act: (final ProfileBloc bloc) {
        bloc.add(OnGetUserProfile());
      },
      expect: () {
        final ProfileBloc bloc = ProfileBloc(authRepo, userRepo: userRepo);
        return <ProfileState>[
          bloc.state
              .copyWith(status: CommonScreenState.loading, userData: null),
          bloc.state.copyWith(
              status: CommonScreenState.success, userData: UserDataModel()),
        ];
      },
    );

    test('Profile options should not be empty', () {
      final List<ProfileOptionsModel> arr =
          ProfileBloc(authRepo, userRepo: userRepo).arrProfileOptions;
      expect(arr, isNotEmpty);
    });

    blocTest(
      'Show Bottom sheet state should be true when OnShowBottomSheet event is added',
      build: () => ProfileBloc(authRepo, userRepo: userRepo),
      act: (final ProfileBloc bloc) {
        bloc.add(OnTapLogout());
      },
      expect: () {
        final ProfileBloc bloc = ProfileBloc(authRepo, userRepo: userRepo);
        return <ProfileState>[
          bloc.state.copyWith(showLogoutSheet: true),
        ];
      },
    );

    blocTest(
      'Logout state should be true when OnLogout event is added',
      setUp: () {
        when(() =>
                authRepo.apiLogout(requestParams: any(named: 'requestParams')))
            .thenAnswer((final _) async => Right(200));
      },
      build: () => ProfileBloc(authRepo, userRepo: userRepo),
      act: (final ProfileBloc bloc) {
        bloc.add(CallLogoutApi());
      },
      skip: 1,
      expect: () {
        final ProfileBloc bloc = ProfileBloc(authRepo, userRepo: userRepo);
        return <ProfileState>[
          bloc.state.copyWith(
              status: CommonScreenState.success, navigateToLogin: true),
        ];
      },
    );
  });
}
