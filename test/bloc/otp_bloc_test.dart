import 'dart:async';

import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/otp/otp_bloc.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../views/login_page_test.dart';

class MockEmitter extends Mock implements Emitter<OtpState> {}

void main() {
  late MockNavigatorObserver mockObserver;
  setUpAll(() {
    mockObserver = MockNavigatorObserver();
    registerFallbackValue(FakeRoute());
  });

  tearDown(() {
    reset(mockObserver);
  });

  blocTest<OtpBloc, OtpState>('emits state emailOrPhone',
      build: () => OtpBloc(),
      act: (final OtpBloc bloc) {
        bloc.add(OnChangeEmailOrPhone(emailOrPhone: '1234567890'));
      },
      expect: () {
        final OtpBloc bloc = OtpBloc();
        return <OtpState>[
          bloc.state.copyWith(emailOrPhone: '1234567890'),
        ];
      });

  blocTest<OtpBloc, OtpState>('emit state otp',
      build: () => OtpBloc(),
      act: (final OtpBloc bloc) {
        bloc.add(OtpEvent.onChangeOtp(otp: '1234'));
      },
      expect: () {
        final OtpBloc bloc = OtpBloc();
        return <OtpState>[
          bloc.state.copyWith(otp: '1234'),
        ];
      });

  test('timer update state', () async {
    final OtpBloc otpBloc = OtpBloc();

    final StartTimerEvent startTimerEvent = StartTimerEvent();

    otpBloc.add(startTimerEvent);

    int remainingSeconds = 30;
    Timer? timer;
    timer =
        Timer.periodic(const Duration(seconds: 1), (final Timer timer) async {
      remainingSeconds -= 1;
      if (remainingSeconds >= 0) {
      } else {
        timer.cancel();
      }
    });

    await Future.delayed(const Duration(seconds: 5));
    expect(remainingSeconds, 25);
  });
}
