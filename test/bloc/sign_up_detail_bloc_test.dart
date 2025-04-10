import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_project_structure/bloc/auth/sign_up_details/sign_up_details_bloc.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_test/flutter_test.dart';

import '../repository/auth_repo_test.dart';

void main() {
  late MockAuthRepo authRepo = MockAuthRepo();

  setUp(() {
    authRepo = MockAuthRepo();
  });

  group('signup details bloc', () {
    test('Initial state should be SignUpDetailsState.initial()', () {
      final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
      expect(bloc.state.copyWith(status: CommonScreenState.initial),
          SignUpDetailsState.initial());
    });
    blocTest<SignUpDetailsBloc, SignUpDetailsState>('emits state password',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnChangePassword(password: 'test'));
        },
        expect: () {
          final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            bloc.state.copyWith(password: 'test'),
          ];
        });

    blocTest<SignUpDetailsBloc, SignUpDetailsState>(
        'emits state conform password',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnChangeConfirmPassword(confirmPassword: 'test'));
        },
        expect: () {
          final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            bloc.state.copyWith(confirmPassword: 'test'),
          ];
        });

    blocTest<SignUpDetailsBloc, SignUpDetailsState>(
        'emits state security question',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnSelectQuestion(questionId: 1));
        },
        expect: () {
          final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            bloc.state.copyWith(securityQuestionId: 1),
          ];
        });

    blocTest<SignUpDetailsBloc, SignUpDetailsState>(
        'emits state security answer',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnChangeAnswer(answer: 'test'));
        },
        expect: () {
          final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            bloc.state.copyWith(securityAnswer: 'test'),
          ];
        });

    blocTest<SignUpDetailsBloc, SignUpDetailsState>(
        'emits state privacy policy',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnCheckPrivacyPolicy(checkPrivacyPolicy: true));
        },
        expect: () {
          final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            bloc.state.copyWith(checkPrivacyPolicy: true),
          ];
        });

    blocTest<SignUpDetailsBloc, SignUpDetailsState>(
        'emits state terms and conditions',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnCheckTermsAndCondition());
        },
        expect: () {
          final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            bloc.state.copyWith(checkTermsAndCondition: true),
          ];
        });

    blocTest<SignUpDetailsBloc, SignUpDetailsState>('submit',
        build: () => SignUpDetailsBloc(authRepo: authRepo),
        act: (final SignUpDetailsBloc bloc) {
          bloc.add(OnCheckTermsAndCondition());
        },
        expect: () {
          //   final SignUpDetailsBloc bloc = SignUpDetailsBloc(authRepo: authRepo);
          return <SignUpDetailsState>[
            //    bloc.state.copyWith(checkTermsAndCondition: true),
          ];
        });
  });
}
