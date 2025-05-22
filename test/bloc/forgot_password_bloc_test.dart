import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_project_structure/Utils/app_strings.dart';
import 'package:flutter_project_structure/bloc/auth/forgot_password/forgot_password_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../repository/auth_repo_test.dart';

void main() {
  late MockAuthRepo authRepo = MockAuthRepo();

  setUp(() {
    authRepo = MockAuthRepo();
  });

  group('Forgot Password BLoc', () {
    test('Initial state should be ForgotPasswordState.initial()', () {
      final ForgotPasswordBloc bloc = ForgotPasswordBloc(authRepo: authRepo);
      expect(bloc.state.copyWith(status: CommonScreenState.initial),
          ForgotPasswordState.initial());
    });
    blocTest('Submit Without filling email with error state',
        build: () => ForgotPasswordBloc(authRepo: authRepo),
        act: (final ForgotPasswordBloc bloc) {
          bloc.add(OnTapSubmit());
        },
        expect: () {
          final ForgotPasswordBloc bloc =
              ForgotPasswordBloc(authRepo: authRepo);
          return <ForgotPasswordState>[
            bloc.state.copyWith(status: CommonScreenState.error, email: null),
          ];
        });
    blocTest('InValid email with error state',
        build: () => ForgotPasswordBloc(authRepo: authRepo),
        act: (final ForgotPasswordBloc bloc) {
          bloc.add(OnChangeEmail(email: 'bh'));
          bloc.add(OnTapSubmit());
        },
        expect: () {
          final ForgotPasswordBloc bloc =
              ForgotPasswordBloc(authRepo: authRepo);
          return <ForgotPasswordState>[
            bloc.state.copyWith(email: 'bh'),
            bloc.state.copyWith(status: CommonScreenState.error, email: 'bh'),
          ];
        });

    blocTest('Call API with success state',
        setUp: () {
          when(() => authRepo.apiForgotPassword(email: any(named: 'email')))
              .thenAnswer((final _) async => Right(200));
        },
        build: () => ForgotPasswordBloc(authRepo: authRepo),
        act: (final ForgotPasswordBloc bloc) {
          bloc.add(OnChangeEmail(email: 'bhoomi@gmail.com'));
          bloc.add(OnTapSubmit());
        },
        wait: Duration(seconds: 1),
        expect: () {
          final ForgotPasswordBloc bloc =
              ForgotPasswordBloc(authRepo: authRepo);
          return <ForgotPasswordState>[
            bloc.state.copyWith(email: 'bhoomi@gmail.com'),
            bloc.state.copyWith(
                status: CommonScreenState.loading, email: 'bhoomi@gmail.com'),
            bloc.state.copyWith(
                status: CommonScreenState.success, email: 'bhoomi@gmail.com'),
          ];
        });

    blocTest('Call API with failure state',
        setUp: () {
          when(() => authRepo.apiForgotPassword(email: any(named: 'email')))
              .thenAnswer(
            (final _) async => Left(ApiFailure(
                message: AppStrings.globalErrorMessage, statusCode: 400)),
          );
        },
        build: () => ForgotPasswordBloc(authRepo: authRepo),
        act: (final ForgotPasswordBloc bloc) {
          bloc.add(OnChangeEmail(email: 'bhoomi@gmail.com'));
          bloc.add(OnTapSubmit());
        },
        wait: Duration(seconds: 1),
        skip: 1,
        expect: () {
          final ForgotPasswordBloc bloc =
              ForgotPasswordBloc(authRepo: authRepo);
          return <ForgotPasswordState>[
            bloc.state.copyWith(
                status: CommonScreenState.loading, email: 'bhoomi@gmail.com'),
            bloc.state.copyWith(
                status: CommonScreenState.error, email: 'bhoomi@gmail.com'),
          ];
        });
  });
}
