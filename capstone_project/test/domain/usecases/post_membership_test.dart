import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';
import 'package:mobile_flutter/domain/usecases/post_membership.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late PostMembership postMembership;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    postMembership = PostMembership(mockRepository);
  });

  group('Post Membership Usecase Test', () {
    const membership = Membership(
      name: 'Test',
      email: 'test@example.com',
      phone: 12123,
      birthDay: '2001-12-27',
    );
    test('should post membership from repository', () async {
      when(mockRepository.postMembership(
              token: 'token', membership: membership))
          .thenAnswer((_) async => const Right('QGLQ-5773'));
      final result = await postMembership.execute(
        token: 'token',
        membership: membership,
      );
      expect(result, const Right('QGLQ-5773'));
    });
  });
}
