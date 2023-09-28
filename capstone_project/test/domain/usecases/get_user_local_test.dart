import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/domain/usecases/get_user_local.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetUserLocal getUserLocal;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getUserLocal = GetUserLocal(mockRepository);
  });

  group('Get User Local Usecase Test', () {
    const userLogin = UserLogin(
      username: 'username',
      password: 'password',
    );
    test('should get user local from repository', () async {
      when(mockRepository.getUserLocal())
          .thenAnswer((_) async => const Right(userLogin));
      final result = await getUserLocal.execute();
      expect(result, const Right(userLogin));
    });
  });
}
