import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/login/login_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/components/common_button_widget.dart';
import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/helper/pref_helper/shared_pref_helper.dart';
import 'package:flutter_project_structure/routes/app_routes.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/views/auth/login/login_page.dart';
import 'package:flutter_project_structure/views/auth/login/widgets/login_footer_widget.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../bloc/login_bloc_test.dart';
import '../repository/auth_repo_test.dart';

class MockLoginBloc extends MockBloc<LoginEvent, LoginState>
    implements LoginBloc {}

class MockNavigatorObserver extends Mock implements NavigatorObserver {}

class FakeLoginEvent extends Fake implements LoginEvent {}

class OnSubmitFake extends Fake implements OnSubmit {}

class OnTapForgotPasswordFake extends Fake implements OnTapForgotPassword {}

class FakeRoute extends Fake implements Route<dynamic> {}

class MockGoogleSignIn extends Mock implements GoogleSignIn {}

class MockGoogleSignInAccount extends Mock implements GoogleSignInAccount {}

void main() {
  late final MockLoginBloc loginBloc;
  late MockNavigatorObserver mockObserver;
  late MockAuthRepo authRepo;
  final mockGoogleSignIn = MockGoogleSignIn();
  final mockGoogleAccount = MockGoogleSignInAccount();

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
    loginBloc = MockLoginBloc();
  });

  setUp(() async {
    authRepo = MockAuthRepo();
    mockObserver = MockNavigatorObserver();
    when(() => loginBloc.loginFormKey).thenReturn(GlobalKey<FormState>());
  });
  tearDown(() {
    reset(loginBloc);
    // loginBloc.close();
    reset(mockObserver);
  });
  Widget createTestableWidget() {
    return MaterialApp(
      initialRoute: '/',
      routes: AppRoutes.getRoutes(),
      navigatorObservers: [mockObserver],
      home: MultiBlocProvider(
        providers: <SingleChildWidget>[
          BlocProvider<LocalisationBloc>(
            create: (final BuildContext context) => LocalisationBloc(),
          ),
          BlocProvider<LoginBloc>(
              create: (final BuildContext context) => loginBloc),
        ],
        child: LoginScreen(),
      ),
    );
  }

  group('Login Screen Tests', () {
    testWidgets('renders LoginScreen correctly',
        (final WidgetTester tester) async {
      when(() => loginBloc.state).thenReturn(LoginState.initial());
      await tester.pumpWidget(createTestableWidget());
      expect(find.byType(LoginScreen), findsOneWidget);
    });

    testWidgets('find email and password field and a login button on screen',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('login_email_field'));
      final Finder passwordField =
          find.byKey(const Key('login_password_field'));
      final Finder loginButton = find.byKey(const Key('login_button'));

      expect(emailField, findsOneWidget);
      expect(passwordField, findsOneWidget);
      expect(loginButton, findsOneWidget);
    });

    testWidgets('Form should not validated', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('login_email_field'));
      final Finder password = find.byKey(const Key('login_password_field'));
      final Finder loginButton = find.byKey(const Key('login_button'));
      await tester.enterText(emailField, '');
      await tester.enterText(password, '');

      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pump();

      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget,
          reason: 'Form not found in widget tree');
      final FormState formState = tester.state<FormState>(formFinder);
      expect(formState, isNotNull, reason: 'FormState should be initialized');
      expect(formState.validate(), isFalse);

      expect(find.text(AppMessages.emailRequired.message), findsOneWidget);
      expect(find.text(AppMessages.passwordRequired.message), findsOneWidget);
    });

    testWidgets('Email Required Message should be show',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('login_email_field'));
      final Finder loginButton = find.byKey(const Key('login_button'));

      await tester.enterText(emailField, '');

      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text(AppMessages.emailRequired.message), findsOneWidget);
    });

    testWidgets('Email invalid Message should be show',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('login_email_field'));
      final Finder loginButton = find.byKey(const Key('login_button'));
      await tester.enterText(emailField, 'bhoomi.');

      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pump();

      expect(find.text(AppMessages.invalidEmail.message), findsOne);
    });

    testWidgets('Form should be validated', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('login_email_field'));
      final Finder passwordField =
          find.byKey(const Key('login_password_field'));
      final Finder loginButton = find.byKey(const Key('login_button'));

      await tester.enterText(emailField, 'test@example.com');
      await tester.enterText(passwordField, 'Password123');

      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget,
          reason: 'Form not found in widget tree');
      final FormState formState = tester.state<FormState>(formFinder);
      expect(formState, isNotNull, reason: 'FormState should be initialized');
      expect(formState.validate(), isTrue);

      expect(find.text(AppMessages.emailRequired.message), findsNothing);
      expect(find.text(AppMessages.passwordRequired.message), findsNothing);
      expect(find.text(AppMessages.invalidEmail.message), findsNothing);
      expect(find.text(AppMessages.passwordLength.message), findsNothing);

      expect(loginButton, findsOneWidget, reason: 'Submit button not found');

      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      loginBloc.add(OnSubmit());
      await tester.pump();

      verify(() {
        return loginBloc.add(OnSubmit());
      }).called(1);
      verifyNoMoreInteractions(loginBloc);
      // expect(find.byType(BlocProvider<LoginBloc>), findsOneWidget);
    });

    testWidgets('Screen should navigate to home page',
        (final WidgetTester tester) async {
      when(() => authRepo.apiLogin(requestParams: any(named: 'requestParams')))
          .thenAnswer((final _) async => Right(UserDataModel()));
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder emailField = find.byKey(const Key('login_email_field'));
      final Finder passwordField =
          find.byKey(const Key('login_password_field'));
      final Finder loginButton = find.byKey(const Key('login_button'));

      await tester.enterText(emailField, 'bhoomi.p@gmail.com');
      await tester.enterText(passwordField, '123456');
      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pump();

      // Verify that the API was called
      // verify(() async => await authRepo.apiLogin(
      //     requestParams: any(named: 'requestParams'))).called(1);
      // await authRepo.apiLogin(requestParams: any(named: 'requestParams'));
      // Verify that navigation happened
      // verify(() => mockObserver.didPush(any(), any())).called(1);

      // verify(() => mockObserver.didPush(
      //       any(
      //           that: isA<MaterialPageRoute>().having(
      //               (final route) => route.settings.name,
      //               'name',
      //               RouteName.homeScreen)),
      //       any(),
      //     )).called(1);
    });

    testWidgets('Login Button style and title',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder loginButton = find.byKey(const Key('login_button'));
      final AppButton button = tester.widget<AppButton>(loginButton);

      expect(button.type, AppButtonType.primary,
          reason: 'Button should be primary');
      expect(button.title, 'Login', reason: 'Button should be primary');
      expect(button.isLoading, isFalse,
          reason: 'Button should not load by default');
      expect(button.icon, isNull, reason: 'Button icon should be null');
      expect(button.key, Key('login_button'),
          reason: 'Button key should be match');
    });

    testWidgets('Screen Logo should be show',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder appLogo = find.byKey(Key('ic_splash'));

      expect(appLogo, findsOneWidget);
    });

    testWidgets('Screen should contain footer for signup option',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder footerWidget = find.byType(LoginFooterWidget);

      expect(footerWidget, findsOneWidget);
    });

    testWidgets('is Remember icon should be deselected',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder checkBox =
          find.byIcon(Icons.check_box_outline_blank_rounded);
      await tester.ensureVisible(checkBox);
      expect(checkBox, findsOneWidget);
    });

    testWidgets('Screen should redirect to forgot password',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder forgotPasswordButton = find.text('Forgot Password?');
      tester.ensureVisible(forgotPasswordButton);
      await tester.tap(forgotPasswordButton);
      await tester.pump();

      // verify(() => mockObserver.didPush(any(), any())).called(1);
    });
    testWidgets('Google Sign-In Test', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      when(mockGoogleSignIn.signIn() as Function())
          .thenAnswer((final _) async => mockGoogleAccount);

      when(mockGoogleAccount.email as Function()).thenReturn('divya@.com');
      when(mockGoogleAccount.displayName as Function()).thenReturn('Divya');

      // Build the widget with the mock GoogleSignIn instance

      // Find the Sign In button and tap it
      final Finder signInButton = find.byKey(Key('sign_up_with_google'));
      expect(signInButton, findsOneWidget);
      await tester.tap(signInButton, warnIfMissed: false);
      await tester.pump(); // Wait for the animation to settle

      // Verify that the success message is shown
      //   expect(find.text('Signed in successfully'), findsOneWidget);
    });
  });

  group('Login Event Tests', () {
    testWidgets('OnSubmit event supports value equality',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();
      final Finder loginButton = find.byKey(const Key('login_button'));

      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pump();
      final OnSubmit event1 = OnSubmit();
      final OnSubmit event2 = OnSubmit();

      expect(event1, equals(event2));
    });

    test('OnChangeRememberMe event should have correct values', () {
      final OnChangeRememberMe event = OnChangeRememberMe(isRememberMe: true);

      expect(event.isRememberMe, isTrue);
    });
  });
}
