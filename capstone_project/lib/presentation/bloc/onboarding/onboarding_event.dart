part of 'onboarding_bloc.dart';

abstract class OnboardingEvent extends Equatable {
  const OnboardingEvent();
}

class FetchOnboardingStatusEvent extends OnboardingEvent {
  @override
  List<Object?> get props => [];
}

class InsertOnboardingStatusEvent extends OnboardingEvent {
  final bool onboardingStatus;

  const InsertOnboardingStatusEvent({
    required this.onboardingStatus,
  });

  @override
  List<Object?> get props => [onboardingStatus];
}
