import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/presentation/bloc/login/login_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late LoginBloc loginBloc;
  late MockPostLogin mockPostLogin;
  late MockGetUserLocal mockGetUserLocal;
  late MockPostLogout mockPostLogout;

  setUp(() {
    mockPostLogin = MockPostLogin();
    mockGetUserLocal = MockGetUserLocal();
    mockPostLogout = MockPostLogout();
    loginBloc = LoginBloc(
      mockPostLogin,
      mockGetUserLocal,
      mockPostLogout,
    );
  });

  group('Login Bloc Test', () {
    const userLogin = UserLogin(
      username: 'username',
      password: 'password',
    );
    test('initial state should return LoginInitial', () {
      expect(
        LoginBloc(
          mockPostLogin,
          mockGetUserLocal,
          mockPostLogout,
        ).state,
        LoginInitial(),
      );
    });

    test('AutoLoginEvent props should return correct values', () {
      final event = AutoLoginEvent();
      expect(event.props, []);
    });

    test('PostLoginEvent props should return correct values', () {
      const event = PostLoginEvent(userLogin: userLogin);
      expect(event.props, [userLogin]);
    });

    test('LogoutEvent props should return correct values', () {
      final event = LogoutEvent();
      expect(event.props, []);
    });

    blocTest<LoginBloc, LoginState>(
      'emits [LoginLoaded] when PostLoginEvent is added and success',
      build: () {
        when(mockPostLogin.execute(userLogin: userLogin))
            .thenAnswer((_) async => const Right('success'));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const PostLoginEvent(userLogin: userLogin)),
      expect: () => <LoginState>[
        LoginLoading(),
        LoginLoaded(),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginConnectionErrorState] when PostLoginEvent is added but connection is not established',
      build: () {
        when(mockPostLogin.execute(userLogin: userLogin))
            .thenAnswer((_) async => const Left(ConnectionFailure(
                  'You seem to be offline. Please check your internet connection and try again.',
                )));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const PostLoginEvent(userLogin: userLogin)),
      expect: () => <LoginState>[
        LoginLoading(),
        LoginConnectionErrorState(
          message:
              'You seem to be offline. Please check your internet connection and try again.',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginError] when PostLoginEvent is added but failure',
      build: () {
        when(mockPostLogin.execute(userLogin: userLogin))
            .thenAnswer((_) async => const Left(ServerFailure(
                  'Wrong Password',
                )));
        return loginBloc;
      },
      act: (bloc) => bloc.add(const PostLoginEvent(userLogin: userLogin)),
      expect: () => <LoginState>[
        LoginLoading(),
        LoginError(
          message: 'Wrong Password',
        ),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [AutoLogin] when AutoLoginEvent is added and success',
      build: () {
        when(mockGetUserLocal.execute())
            .thenAnswer((_) async => const Right(userLogin));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AutoLoginEvent()),
      expect: () => <LoginState>[
        LoginLoading(),
        AutoLogin(userLogin: userLogin),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LoginError] when AutoLoginEvent is added but failure',
      build: () {
        when(mockGetUserLocal.execute()).thenAnswer((_) async => const Left(
              DatabaseFailure('failed to get user'),
            ));
        return loginBloc;
      },
      act: (bloc) => bloc.add(AutoLoginEvent()),
      expect: () => <LoginState>[
        LoginLoading(),
        LoginError(message: 'failed to get user'),
      ],
    );

    blocTest<LoginBloc, LoginState>(
      'emits [LogoutState] when LogoutEvent is added',
      build: () {
        when(mockPostLogout.execute()).thenAnswer((_) async => true);
        return loginBloc;
      },
      act: (bloc) => bloc.add(LogoutEvent()),
      expect: () => <LoginState>[
        LoginLoading(),
        LogoutState(),
      ],
    );
  });
}
