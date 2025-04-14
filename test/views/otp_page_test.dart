import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/Components/common_button_widget.dart';
import 'package:flutter_project_structure/bloc/auth/otp/otp_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/views/auth/otp/otp_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../bloc/login_bloc_test.dart';
import '../repository/auth_repo_test.dart';
import 'login_page_test.dart';

class MockOtpBloc extends MockBloc<OtpEvent, OtpState> implements OtpBloc {}

void main() {
  late final MockOtpBloc otpBloc;
  setUpAll(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    setUpSharedPrefMock();
    await SharedPreferenceHelper().init();
    registerFallbackValue(OnSubmitFake());
    registerFallbackValue(OnTapForgotPasswordFake());
    registerFallbackValue(FakeLoginEvent());
    registerFallbackValue(FakeLoginRequestModel());
    registerFallbackValue(FakeRoute());
    registerFallbackValue(Right(UserDataModel()));
    registerFallbackValue(Left(ApiFailure(message: 'Error')));
    otpBloc = MockOtpBloc();
  });

  Widget createTestableWidget() {
    return MaterialApp(
        home: MultiBlocProvider(
      providers: <SingleChildWidget>[
        BlocProvider<LocalisationBloc>(
          create: (final BuildContext context) => LocalisationBloc(),
        ),
        BlocProvider<OtpBloc>(
            create: (final BuildContext context) =>
                OtpBloc()..add(OtpEvent.startTimerEvent())),
      ],
      child: OtpScreen(),
    ));
  }

  group('Otp Screen Tests', () {
    testWidgets('renders OtpScreen correctly',
        (final WidgetTester tester) async {
      when(() => otpBloc.state).thenReturn(OtpState.initial());
      await tester.pumpWidget(createTestableWidget());
      expect(find.byType(OtpScreen), findsOneWidget);
    });

    testWidgets('verify otp field', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final Finder otp = find.byKey(Key('otp_field_key'));
      expect(otp, findsOneWidget);

      await tester.enterText(otp, '123456');

      final Finder nextButton = find.byKey(Key('otp_next_button'));
      expect(nextButton, findsOneWidget);
      expect(tester.widget<AppButton>(nextButton).isLoading, isFalse);
      await tester.tap(nextButton);
    });
  });
}
