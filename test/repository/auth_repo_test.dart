import 'package:flutter_project_structure/data/api/either.dart';
import 'package:flutter_project_structure/data/errors/failure.dart';
import 'package:flutter_project_structure/data/models/request_model/login_request_model.dart';
import 'package:flutter_project_structure/data/models/request_model/signup_request_model.dart';
import 'package:flutter_project_structure/data/models/response_model/auth/user_data_model.dart';
import 'package:flutter_project_structure/data/repository/auth_repo.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

class MockAuthRepo extends Mock implements AuthRepo {}

class FakeLoginRequestModel extends Fake implements LoginRequestModel {}

class FakeSignUpRequestModel extends Fake implements SignupRequest {}

// Generate Mocks
void main() {
  late AuthRepo repository;
  final LoginRequestModel params = LoginRequestModel.empty();

  setUpAll(() async {
    repository = MockAuthRepo();
    registerFallbackValue(
      FakeLoginRequestModel(),
    );
  });
  group('test login api', () {
    test('apiLogin Success', () async {
      when(
        () => repository.apiLogin(
          requestParams: any(named: 'requestParams'),
        ),
      ).thenAnswer(
        (final Invocation invocation) async => Right(UserDataModel.fromJson(
            <String, dynamic>{'emailId': params.emailId})),
      );
      final Either<Failure, UserDataModel> result =
          await repository.apiLogin(requestParams: params);
      expect(result, isA<Right<Failure, UserDataModel>>());
      result.fold(
        (final Failure failure) => fail('Expected Right, got Left: $failure'),
        (final UserDataModel user) {
          expect(user.emailId, params.emailId);
        },
      );
      // expect(params.emailId, result.emailId);

      verify(() => repository.apiLogin(requestParams: params)).called(1);
      verifyNoMoreInteractions(repository);
    });
    //
    test('apiLogin Failure', () async {
      // Mock Exception
      when(
        () => repository.apiLogin(
          requestParams: any(named: 'requestParams'),
        ),
      ).thenThrow(Exception('Login failed'));

      // Check exception handling
      expect(() => repository.apiLogin(requestParams: params),
          throwsA(isA<Exception>()));

      // Verify method call
      verify(() => repository.apiLogin(requestParams: params)).called(1);
      verifyNoMoreInteractions(repository);
    });
  });
}
