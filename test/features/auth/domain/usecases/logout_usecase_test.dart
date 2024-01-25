import 'package:flutter_firebase_auth_template/core/usecases/usecase.dart';
import 'package:flutter_firebase_auth_template/features/auth/domain/usecases/logout_usecase.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/mockito.dart';

import 'login_usecase_test.mocks.dart';

void main() {
  late LogoutUseCase usecase;
  late MockAuthRepository repository;
  setUp(() {
    repository = MockAuthRepository();
    usecase = LogoutUseCase(repository);
  });
  test('sould call authrepository', () async {
    await usecase(NoParams());
    verify(repository.logout());
    verifyNoMoreInteractions(repository);
  });
}
