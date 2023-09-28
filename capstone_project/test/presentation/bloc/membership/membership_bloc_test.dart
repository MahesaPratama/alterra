import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';
import 'package:mobile_flutter/presentation/bloc/membership/membership_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late MembershipBloc membershipBloc;
  late MockPostMembership mockPostMembership;

  setUp(() {
    mockPostMembership = MockPostMembership();
    membershipBloc = MembershipBloc(mockPostMembership);
  });

  group('Membership Bloc Test', () {
    const membership = Membership(
      name: 'Test',
      email: 'test@example.com',
      phone: 12123,
      birthDay: '2001-12-27',
    );
    const token = 'token';
    test('initial state should return MembershipInitial', () {
      expect(
        MembershipBloc(mockPostMembership).state,
        MembershipInitial(),
      );
    });

    test('PostMembershipEvent props should return correct values', () {
      const event = PostMembershipEvent(token: 'token', membership: membership);
      expect(event.props, ['token', membership]);
    });

    blocTest<MembershipBloc, MembershipState>(
      'emits [MembershipCreated] when PostMembershipEvent is added and success',
      build: () {
        when(mockPostMembership.execute(token: token, membership: membership))
            .thenAnswer((_) async => const Right('QGLQ-5773'));
        return membershipBloc;
      },
      act: (bloc) => bloc
          .add(const PostMembershipEvent(token: token, membership: membership)),
      expect: () => <MembershipState>[
        MembershipLoading(),
        MembershipCreated(memberCode: 'QGLQ-5773'),
      ],
    );

    blocTest<MembershipBloc, MembershipState>(
      'emits [MembershipConnectionError] when PostMembershipEvent is added but connection is not established',
      build: () {
        when(mockPostMembership.execute(token: token, membership: membership))
            .thenAnswer((_) async => const Left(ConnectionFailure(
                  'You seem to be offline. Please check your internet connection and try again.',
                )));
        return membershipBloc;
      },
      act: (bloc) => bloc
          .add(const PostMembershipEvent(token: token, membership: membership)),
      expect: () => <MembershipState>[
        MembershipLoading(),
        MembershipConnectionError(
          message:
              'You seem to be offline. Please check your internet connection and try again.',
        ),
      ],
    );

    blocTest<MembershipBloc, MembershipState>(
      'emits [MembershipTokenError] when PostMembershipEvent is added but token is expired',
      build: () {
        when(mockPostMembership.execute(token: token, membership: membership))
            .thenAnswer((_) async => const Left(TokenFailure(
                  'Token is Expired',
                )));
        return membershipBloc;
      },
      act: (bloc) => bloc
          .add(const PostMembershipEvent(token: token, membership: membership)),
      expect: () => <MembershipState>[
        MembershipLoading(),
        MembershipTokenError(
          message: 'Token is Expired',
        ),
      ],
    );

    blocTest<MembershipBloc, MembershipState>(
      'emits [MembershipError] when PostMembershipEvent is added but failure',
      build: () {
        when(mockPostMembership.execute(token: token, membership: membership))
            .thenAnswer((_) async => const Left(ServerFailure(
                  'Response Failure',
                )));
        return membershipBloc;
      },
      act: (bloc) => bloc
          .add(const PostMembershipEvent(token: token, membership: membership)),
      expect: () => <MembershipState>[
        MembershipLoading(),
        MembershipError(
          message: 'Response Failure',
        ),
      ],
    );
  });
}
