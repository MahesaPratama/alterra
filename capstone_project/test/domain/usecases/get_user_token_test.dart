import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/usecases/get_user_token.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetUserToken getUserToken;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getUserToken = GetUserToken(mockRepository);
  });

  group('Get User Token Usecase Test', () {
    test('should get user token from repository', () async {
      when(mockRepository.getUserToken())
          .thenAnswer((_) async => const Right('token'));
      final result = await getUserToken.execute();
      expect(result, const Right('token'));
    });
  });
}
