part of 'membership_bloc.dart';

abstract class MembershipEvent extends Equatable {
  const MembershipEvent();
}

class PostMembershipEvent extends MembershipEvent {
  final String token;
  final Membership membership;

  const PostMembershipEvent({
    required this.token,
    required this.membership,
  });
  @override
  List<Object> get props => [token, membership];
}
