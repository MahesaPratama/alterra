import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/presentation/bloc/checkout/checkout_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late CheckoutBloc checkoutBloc;
  late MockPostCheckoutProduct mockPostCheckoutProduct;

  setUp(() {
    mockPostCheckoutProduct = MockPostCheckoutProduct();
    checkoutBloc = CheckoutBloc(
      mockPostCheckoutProduct,
    );
  });

  group('Checkout Bloc Test', () {
    const userCheckout = UserCheckout(
      name: 'Amanda',
      orderOption: 'TAKE_AWAY',
      numberTable: 0,
      payment: 'QRIS',
      items: <UserProductCheckout>[],
    );
    const token = 'token';
    test('initial state should return CheckoutInitial', () {
      expect(
        CheckoutBloc(mockPostCheckoutProduct).state,
        CheckoutInitial(),
      );
    });

    test('CreateCheckoutEvent props should return correct values', () {
      const event =
          CreateCheckoutEvent(token: token, userCheckout: userCheckout);
      expect(event.props, [token, userCheckout]);
    });

    blocTest<CheckoutBloc, CheckoutState>(
      'emits [CheckoutSuccess] when CreateCheckoutEvent is added and success',
      build: () {
        when(mockPostCheckoutProduct.execute(
          token: token,
          userCheckout: userCheckout,
        )).thenAnswer((_) async => const Right('success'));
        return checkoutBloc;
      },
      act: (bloc) => bloc.add(const CreateCheckoutEvent(
        token: token,
        userCheckout: userCheckout,
      )),
      expect: () => <CheckoutState>[
        CheckoutLoading(),
        CheckoutSuccess(),
      ],
    );

    blocTest<CheckoutBloc, CheckoutState>(
      'emits [CheckoutConnectionErrorState] when CreateCheckoutEvent is added but connection is not established',
      build: () {
        when(mockPostCheckoutProduct.execute(
          token: token,
          userCheckout: userCheckout,
        )).thenAnswer((_) async => const Left(ConnectionFailure(
              'You seem to be offline. Please check your internet connection and try again.',
            )));
        return checkoutBloc;
      },
      act: (bloc) => bloc.add(const CreateCheckoutEvent(
        token: token,
        userCheckout: userCheckout,
      )),
      expect: () => <CheckoutState>[
        CheckoutLoading(),
        CheckoutConnectionErrorState(
          message:
              'You seem to be offline. Please check your internet connection and try again.',
        ),
      ],
    );

    blocTest<CheckoutBloc, CheckoutState>(
      'emits [CheckoutTokenError] when CreateCheckoutEvent is added but token is expired',
      build: () {
        when(mockPostCheckoutProduct.execute(
          token: token,
          userCheckout: userCheckout,
        )).thenAnswer((_) async => const Left(TokenFailure(
              'Token is Expired',
            )));
        return checkoutBloc;
      },
      act: (bloc) => bloc.add(const CreateCheckoutEvent(
        token: token,
        userCheckout: userCheckout,
      )),
      expect: () => <CheckoutState>[
        CheckoutLoading(),
        CheckoutTokenError(
          message: 'Token is Expired',
        ),
      ],
    );

    blocTest<CheckoutBloc, CheckoutState>(
      'emits [CheckoutError] when CreateCheckoutEvent is added but failure',
      build: () {
        when(mockPostCheckoutProduct.execute(
          token: token,
          userCheckout: userCheckout,
        )).thenAnswer((_) async => const Left(ServerFailure(
              'Response Failure',
            )));
        return checkoutBloc;
      },
      act: (bloc) => bloc.add(const CreateCheckoutEvent(
        token: token,
        userCheckout: userCheckout,
      )),
      expect: () => <CheckoutState>[
        CheckoutLoading(),
        CheckoutError(
          message: 'Response Failure',
        ),
      ],
    );
  });
}
