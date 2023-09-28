part of 'membership_bloc.dart';

abstract class MembershipState extends Equatable {}

class MembershipInitial extends MembershipState {
  @override
  List<Object?> get props => [];
}

class MembershipLoading extends MembershipState {
  @override
  List<Object?> get props => [];
}

class MembershipCreated extends MembershipState {
  final String memberCode;

  MembershipCreated({required this.memberCode});

  @override
  List<Object> get props => [memberCode];
}

class MembershipConnectionError extends MembershipState {
  final String message;

  MembershipConnectionError({required this.message});

  @override
  List<Object> get props => [message];
}

class MembershipTokenError extends MembershipState {
  final String message;

  MembershipTokenError({required this.message});

  @override
  List<Object> get props => [message];
}

class MembershipError extends MembershipState {
  final String message;

  MembershipError({required this.message});

  @override
  List<Object> get props => [message];
}
