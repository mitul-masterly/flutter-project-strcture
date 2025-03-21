import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_project_structure/Bloc/splash/splash_bloc.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  group('Test Splash Bloc', () {
    test('Initial state should be SplashState.initial()', () {
      final SplashBloc bloc = SplashBloc();
      expect(
          bloc.state.copyWith(
            isNavigate: false,
          ),
          SplashState.initial());
    });

    blocTest<SplashBloc, SplashState>(
      'Emits SplashState with isNavigate true] when InitialEvent is added',
      build: () => SplashBloc(),
      act: (final SplashBloc bloc) => bloc.add(InitialEvent()),
      wait: const Duration(seconds: 1), // Account for the delayed Future
      expect: () => <SplashState>[
        SplashState.initial().copyWith(isNavigate: true),
      ],
    );
  });
}
