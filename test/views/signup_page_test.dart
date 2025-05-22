import 'package:bloc_test/bloc_test.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/bloc/my_app/localisation_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/views/auth/signup/sign_up_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../repository/auth_repo_test.dart';

class MockSignUpBloc extends MockBloc<SignUpEvent, SignUpState>
    implements SignUpBloc {}

class FakeSignUpEvent extends Fake implements SignUpEvent {}

void main() {
  late MockSignUpBloc signupBloc;
  late MockAuthRepo authRepo;
  Firebase.initializeApp();

  setUpAll(() {
    registerFallbackValue(FakeSignUpEvent());
  });

  setUp(() async {
    TestWidgetsFlutterBinding.ensureInitialized();
    authRepo = MockAuthRepo();
    signupBloc = MockSignUpBloc();
    when(() => signupBloc.signUpFormKey).thenReturn(GlobalKey<FormState>());
  });

  tearDown(() {
    signupBloc.close();
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
          BlocProvider<SignUpBloc>(
            create: (final BuildContext context) => MockSignUpBloc(),
          ),
        ],
        child: SignUpScreen(),
      ),
    );
  }

  group('SignUp Screen Tests', () {
    testWidgets('Renders SignUp Screen correctly',
        (final WidgetTester tester) async {
      when(() => signupBloc.state).thenReturn(SignUpState.initial());
      await tester.pumpWidget(createTestableWidget());
      expect(find.byType(SignUpScreen), findsOneWidget);
    });

    testWidgets('Verify fields on screen', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final Finder firstName = find.byKey(Key('signup_first_name_field'));
      expect(firstName, findsOneWidget);
      await tester.ensureVisible(firstName);

      final AppTextField firstNameFieldWidget =
          tester.widget<AppTextField>(firstName);

      debugPrint('Header Title: ${firstNameFieldWidget.strHeaderTitle}');

      expect(find.text('First Name*'), findsOneWidget);
    });
  });
}
