import 'package:bloc_test/bloc_test.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/sign_up_details/sign_up_details_bloc.dart';
import 'package:flutter_project_structure/bloc/auth/signup/signup_bloc.dart';
import 'package:flutter_project_structure/components/common_text_field_widget.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_project_structure/views/auth/signup/sign_up_detail_page.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';
import 'package:nested/nested.dart';

import '../repository/auth_repo_test.dart';

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

    testWidgets('Verify fields on screen', (final WidgetTester tester) async {
      await tester.pumpWidget(createTestableWidget());

      final Finder password = find.byKey(Key('signup_password_field'));
      expect(password, findsOneWidget);
      await tester.ensureVisible(password);

      final AppTextField passwordFieldWidget =
          tester.widget<AppTextField>(password);

      debugPrint('Header Title: ${passwordFieldWidget.strHeaderTitle}');

      expect(find.text('First Name*'), findsOneWidget);
    });
  });
}
