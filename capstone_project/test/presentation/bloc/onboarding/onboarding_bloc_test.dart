import 'package:bloc_test/bloc_test.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/presentation/bloc/onboarding/onboarding_bloc.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late OnboardingBloc onboardingBloc;
  late MockGetStatusOnboarding mockGetStatusOnboarding;
  late MockSetStatusOnboarding mockSetStatusOnboarding;

  setUp(() {
    mockGetStatusOnboarding = MockGetStatusOnboarding();
    mockSetStatusOnboarding = MockSetStatusOnboarding();
    onboardingBloc = OnboardingBloc(
      mockGetStatusOnboarding,
      mockSetStatusOnboarding,
    );
  });

  group('Onboarding Bloc Test', () {
    test('initial state should return OnboardingInitial', () {
      expect(
        OnboardingBloc(mockGetStatusOnboarding, mockSetStatusOnboarding).state,
        OnboardingInitial(),
      );
    });

    test('FetchOnboardingStatusEvent props should return correct values', () {
      final event = FetchOnboardingStatusEvent();
      expect(event.props, []);
    });

    test('InsertOnboardingStatusEvent props should return correct values', () {
      const event = InsertOnboardingStatusEvent(onboardingStatus: true);
      expect(event.props, [true]);
    });

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [OnboardingLoaded] when FetchOnboardingStatusEvent is added and result true',
      build: () {
        when(mockGetStatusOnboarding.execute()).thenAnswer((_) async => true);
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(FetchOnboardingStatusEvent()),
      expect: () => <OnboardingState>[
        OnboardingLoading(),
        OnboardingLoaded(),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [OnboardingInitial] when FetchOnboardingStatusEvent is added and result false',
      build: () {
        when(mockGetStatusOnboarding.execute()).thenAnswer((_) async => false);
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(FetchOnboardingStatusEvent()),
      expect: () => <OnboardingState>[
        OnboardingLoading(),
        OnboardingInitial(),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [OnboardingLoaded] when InsertOnboardingStatusEvent is added and result true',
      build: () {
        when(mockSetStatusOnboarding.execute(true)).thenAnswer(
          (_) async => Future.value(true),
        );
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(
        const InsertOnboardingStatusEvent(onboardingStatus: true),
      ),
      expect: () => <OnboardingState>[
        OnboardingLoading(),
        OnboardingLoaded(),
      ],
    );

    blocTest<OnboardingBloc, OnboardingState>(
      'emits [OnboardingInitial] when InsertOnboardingStatusEvent is added and result false',
      build: () {
        when(mockSetStatusOnboarding.execute(false)).thenAnswer(
          (_) async => Future.value(false),
        );
        return onboardingBloc;
      },
      act: (bloc) => bloc.add(
        const InsertOnboardingStatusEvent(onboardingStatus: false),
      ),
      expect: () => <OnboardingState>[
        OnboardingLoading(),
        OnboardingInitial(),
      ],
    );
  });
}
