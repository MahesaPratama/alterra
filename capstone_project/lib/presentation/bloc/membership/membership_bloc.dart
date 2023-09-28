import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';
import 'package:mobile_flutter/domain/usecases/post_membership.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

part 'membership_event.dart';
part 'membership_state.dart';

class MembershipBloc extends Bloc<MembershipEvent, MembershipState> {
  final PostMembership postMembership;
  MembershipBloc(this.postMembership) : super(MembershipInitial()) {
    on<PostMembershipEvent>((event, emit) async {
      emit(MembershipLoading());
      final result = await postMembership.execute(
        token: event.token,
        membership: event.membership,
      );
      result.fold((failure) {
        if (failure is ConnectionFailure) {
          emit(MembershipConnectionError(message: failure.message));
        } else if (failure is TokenFailure) {
          emit(MembershipTokenError(message: failure.message));
        } else {
          emit(MembershipError(message: failure.message));
        }
      }, (memberCode) {
        emit(MembershipCreated(memberCode: memberCode));
      });
    });
  }
}
