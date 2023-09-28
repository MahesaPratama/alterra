import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/domain/usecases/post_checkout_product.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late PostCheckoutProduct postCheckoutProduct;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    postCheckoutProduct = PostCheckoutProduct(mockRepository);
  });

  group('Post Checkout Product Usecase Test', () {
    const token = 'token';
    const userCheckout = UserCheckout(
      name: 'Amanda',
      orderOption: 'TAKE_AWAY',
      numberTable: 0,
      payment: 'QRIS',
      items: <UserProductCheckout>[],
    );

    test('should post checkout product from repository', () async {
      when(mockRepository.postCheckout(
        token: token,
        userCheckout: userCheckout,
      )).thenAnswer((_) async => const Right('success'));
      final result = await postCheckoutProduct.execute(
        token: token,
        userCheckout: userCheckout,
      );
      expect(result, const Right('success'));
    });
  });
}
