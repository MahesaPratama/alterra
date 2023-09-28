import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/usecases/get_status_onboarding.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetStatusOnboarding getStatusOnboarding;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getStatusOnboarding = GetStatusOnboarding(mockRepository);
  });

  group('Get Status Onboarding Usecase Test', () {
    test('should get status onboarindg from repository', () async {
      when(mockRepository.getStatusOnboarding()).thenAnswer((_) async => true);
      final result = await getStatusOnboarding.execute();
      expect(result, true);
    });
  });
}
