import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/domain/usecases/post_login.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late PostLogin postLogin;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    postLogin = PostLogin(mockRepository);
  });

  group('Post Login Usecase Test', () {
    const userLogin = UserLogin(
      username: 'username',
      password: 'password',
    );
    test('should post login from repository', () async {
      when(mockRepository.postLogin(userLogin: userLogin))
          .thenAnswer((_) async => const Right('success'));
      final result = await postLogin.execute(userLogin: userLogin);
      expect(result, const Right('success'));
    });
  });
}
