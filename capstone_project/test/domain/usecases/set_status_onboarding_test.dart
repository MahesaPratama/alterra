import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/usecases/set_status_onboarding.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late SetStatusOnboarding setStatusOnboarding;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    setStatusOnboarding = SetStatusOnboarding(mockRepository);
  });

  group('Set Status Onboarding Usecase Test', () {
    test('should set status onboarding from repository', () async {
      when(mockRepository.setStatusOnboarding(true))
          .thenAnswer((_) async => true);
      final result = await setStatusOnboarding.execute(true);
      expect(result, true);
    });
  });
}
