import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product_checkout.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';

void main() {
  group('UserCheckout Entity Test', () {
    const userCheckout = UserCheckout(
      name: 'irham',
      orderOption: 'Dine In',
      numberTable: 1,
      payment: 'Cash',
      items: [
        UserProductCheckout(
          productId: 1,
          quantity: 1,
          note: 'Pedas',
        ),
      ],
    );
    test('should have correct parameters', () {
      expect(userCheckout.name, isA<String>());
      expect(userCheckout.orderOption, isA<String>());
      expect(userCheckout.numberTable, isA<int>());
      expect(userCheckout.payment, isA<String>());
      expect(userCheckout.items, isA<List<UserProductCheckout>>());
    });

    test("should extends equatable", () {
      expect(userCheckout.props, userCheckout.props);
    });
  });

  group('UserProductCheckout Entity Test', () {
    const productCheckout = ProductCheckout(
      productId: 1,
      name: 'Sushi',
      image: 'Salmon',
      price: 15000,
      quantity: 200,
      totalPrice: 50000,
      notes: 'Pedas',
    );
    final userProductCheckout =
        UserProductCheckout.fromProductCheckout(productCheckout);

    test("should have function fromProductCheckout", () {
      expect(userProductCheckout.productId, productCheckout.productId);
      expect(userProductCheckout.quantity, productCheckout.quantity);
      expect(userProductCheckout.note, productCheckout.notes);
    });

    test("should extends equatable", () {
      expect(userProductCheckout.props, userProductCheckout.props);
    });
  });
}
