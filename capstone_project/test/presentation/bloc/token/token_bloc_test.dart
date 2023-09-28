import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/presentation/bloc/token/token_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late TokenBloc tokenBloc;
  late MockGetUserToken mockGetUserToken;

  setUp(() {
    mockGetUserToken = MockGetUserToken();
    tokenBloc = TokenBloc(mockGetUserToken);
  });

  group('Token Bloc Test', () {
    test('initial state should return TokenState.initial()', () {
      expect(
        TokenBloc(mockGetUserToken).state,
        TokenState.initial(),
      );
    });

    test('GetTokenEvent props should return correct values', () {
      final event = GetTokenEvent();
      expect(event.props, []);
    });

    blocTest<TokenBloc, TokenState>(
      'emits state when GetTokenEvent is added and success get data',
      build: () {
        when(mockGetUserToken.execute()).thenAnswer(
          (_) async => const Right('token'),
        );
        return tokenBloc;
      },
      act: (bloc) => bloc.add(GetTokenEvent()),
      expect: () => <TokenState>[
        const TokenState(token: 'token'),
      ],
    );

    blocTest<TokenBloc, TokenState>(
      'emits state when GetTokenEvent is added but failure get data',
      build: () {
        when(mockGetUserToken.execute()).thenAnswer(
          (_) async => const Left(DatabaseFailure('failed to get user token')),
        );
        return tokenBloc;
      },
      act: (bloc) => bloc.add(GetTokenEvent()),
      expect: () => <TokenState>[
        const TokenState(token: 'failed to get user token'),
      ],
    );
  });
}
