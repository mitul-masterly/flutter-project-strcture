import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/sign_up_details/sign_up_details_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/utils/app_enums.dart';
import 'package:flutter_project_structure/views/auth/signup/sign_up_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../repository/auth_repo_test.dart';
import 'login_page_test.dart';

class MockSignUpDetailsBloc
    extends MockBloc<SignUpDetailsEvent, SignUpDetailsState>
    implements SignUpDetailsBloc {}

class FakeSignUpEvent extends Fake implements SignUpEvent {}

void main() {
  TestWidgetsFlutterBinding.ensureInitialized();
  late MockSignUpDetailsBloc signUpDetailsBloc;
  late MockAuthRepo authRepo;

  setUpAll(() {
    registerFallbackValue(FakeSignUpEvent());
  });

  setUp(() async {
    authRepo = MockAuthRepo();
    final SignupRequest mockSignupRequest = SignupRequest();
    final MockNavigatorObserver mockObserver = MockNavigatorObserver();

    signUpDetailsBloc = MockSignUpDetailsBloc();
    when(() => signUpDetailsBloc.signUpFormKey)
        .thenReturn(GlobalKey<FormState>());
  });

  tearDown(() {
    signUpDetailsBloc.close();
  });
  Widget createTestableWidget() {
    return MaterialApp(
      home: MultiBlocProvider(
        providers: <SingleChildWidget>[
          RepositoryProvider<AuthRepo>(
            create: (final BuildContext context) => AuthRepoImp(),
          ),
          BlocProvider<LocalisationBloc>(
            create: (final BuildContext context) => LocalisationBloc(),
          ),
          BlocProvider<SignUpDetailsBloc>(
            create: (final BuildContext context) => MockSignUpDetailsBloc(),
          ),
        ],
        child: SignUpDetailScreen(),
      ),
    );
  }

  group('SignUp Screen Tests', () {
    testWidgets('Renders SignUp Screen correctly',
        (final WidgetTester tester) async {
      when(() => signUpDetailsBloc.state)
          .thenReturn(SignUpDetailsState.initial());
      await tester.pumpWidget(createTestableWidget());
      expect(find.byType(SignUpDetailScreen), findsOneWidget);
    });

    testWidgets('Verify password on screen', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final Finder password = find.byKey(Key('signup_password_field'));
      expect(password, findsOneWidget);
      await tester.ensureVisible(password);

      final AppTextField passwordFieldWidget =
          tester.widget<AppTextField>(password);

      debugPrint('Header Title: ${passwordFieldWidget.strHeaderTitle}');
    });

    testWidgets('Verify confirm password on screen',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final Finder cPassword = find.byKey(Key('signup_confirm_password_field'));
      expect(cPassword, findsOneWidget);
      await tester.ensureVisible(cPassword);

      final AppTextField firstNameFieldWidget =
          tester.widget<AppTextField>(cPassword);

      debugPrint('Header Title: ${firstNameFieldWidget.strHeaderTitle}');
    });

    testWidgets('Verify security question screen',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final Finder dropdown =
          find.byKey(const ValueKey('security_question_field'));

      await tester.tap(dropdown);
      await tester.pumpAndSettle();

      final dropdownItem = find.text('What was your school name ?').first;

      await tester.tap(dropdownItem);
      await tester.pumpAndSettle();
    });

    testWidgets('Verify privacy policy on screen',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final checkboxFinder = find.byKey(const Key('privacy_policy_field'));

      var checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
      expect(checkbox.value, false);

      await tester.tap(checkboxFinder, warnIfMissed: false);
      await tester.pump();

      checkbox = tester.firstWidget<Checkbox>(checkboxFinder);
      expect(checkbox.value, true);
    });

    testWidgets('Sign Up Form should be validated',
        (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder passwordField =
          find.byKey(const Key('signup_password_field'));
      final Finder cPasswordField =
          find.byKey(const Key('signup_confirm_password_field'));

      final Finder securityQuestion =
          find.byKey(const Key('security_question_field'));
      final Finder securityAnswer =
          find.byKey(const Key('security_answer_field'));

      final Finder submitButton = find.byKey(const Key('submit'));

      await tester.enterText(passwordField, '123456');
      await tester.enterText(cPasswordField, '123456');
      //await tester.enterText(securityQuestion, '1');
      await tester.enterText(securityAnswer, 'test');

      final Finder formFinder = find.byType(Form);
      expect(formFinder, findsOneWidget,
          reason: 'Form not found in widget tree');
      final FormState formState = tester.state<FormState>(formFinder);
      expect(formState, isNotNull, reason: 'FormState should be initialized');
      expect(formState.validate(), isTrue);

      expect(find.text(AppMessages.passwordRequired.message), findsNothing);
      expect(
          find.text(AppMessages.confirmPasswordRequired.message), findsNothing);
      expect(find.text(AppMessages.securityQuestionRequired.message),
          findsNothing);
      expect(
          find.text(AppMessages.securityAnswerRequired.message), findsNothing);

      expect(submitButton, findsOneWidget, reason: 'Submit button not found');

      await tester.ensureVisible(submitButton);
      await tester.tap(submitButton);
      signUpDetailsBloc.add(OnTapSubmit());
      await tester.pump();

      verify(() {
        return signUpDetailsBloc.add(OnTapSubmit());
      }).called(1);
      // verifyNoMoreInteractions(OnTapSubmit);
      // expect(find.byType(BlocProvider<LoginBloc>), findsOneWidget);
    });

    testWidgets('onTap verify', (final WidgetTester tester) async {
      /*   when(() => authRepo.apiLogin(requestParams: any(named: 'requestParams')))
          .thenAnswer((final _) async => Right(UserDataModel()));*/
      await tester.pumpWidget(createTestableWidget());
      await tester.pumpAndSettle();

      final Finder passwordField =
          find.byKey(const Key('signup_password_field'));
      final Finder cPasswordField =
          find.byKey(const Key('signup_confirm_password_field'));
      final Finder loginButton = find.byKey(const Key('submit'));

      await tester.enterText(passwordField, '123456');
      await tester.enterText(cPasswordField, '123456');
      await tester.ensureVisible(loginButton);
      await tester.tap(loginButton);
      await tester.pump();
    });
  });
}
