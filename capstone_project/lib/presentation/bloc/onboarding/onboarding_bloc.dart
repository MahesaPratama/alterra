import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/usecases/get_status_onboarding.dart';
import 'package:mobile_flutter/domain/usecases/set_status_onboarding.dart';

part 'onboarding_event.dart';
part 'onboarding_state.dart';

class OnboardingBloc extends Bloc<OnboardingEvent, OnboardingState> {
  final GetStatusOnboarding getStatusOnboarding;
  final SetStatusOnboarding setStatusOnboarding;

  OnboardingBloc(
    this.getStatusOnboarding,
    this.setStatusOnboarding,
  ) : super(OnboardingInitial()) {
    on<FetchOnboardingStatusEvent>((event, emit) async {
      emit(OnboardingLoading());
      final result = await getStatusOnboarding.execute();
      if (result) {
        emit(OnboardingLoaded());
      } else {
        emit(OnboardingInitial());
      }
    });

    on<InsertOnboardingStatusEvent>((event, emit) async {
      emit(OnboardingLoading());
      final result = await setStatusOnboarding.execute(event.onboardingStatus);
      if (result) {
        emit(OnboardingLoaded());
      } else {
        emit(OnboardingInitial());
      }
    });
  }
}
