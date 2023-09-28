import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/usecases/post_logout.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late PostLogout postLogout;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    postLogout = PostLogout(mockRepository);
  });

  group('Post Logout Usecase Test', () {
    test('should post logout from repository', () async {
      when(mockRepository.postLogout()).thenAnswer((_) async => true);
      final result = await postLogout.execute();
      expect(result, true);
    });
  });
}
