import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product_checkout.dart';

void main() {
  group('ProductCheckout Entity Test', () {
    const productCheckout = ProductCheckout(
      productId: 1,
      name: 'Sushi',
      image: 'Salmon',
      price: 15000,
      quantity: 200,
      totalPrice: 50000,
      notes: 'Pedas',
    );

    final updateProduct = productCheckout.copyWith();

    test('should have correct parameters', () {
      expect(productCheckout.productId, isA<int>());
      expect(productCheckout.name, isA<String>());
      expect(productCheckout.image, isA<String>());
      expect(productCheckout.price, isA<num>());
      expect(productCheckout.quantity, isA<int>());
      expect(productCheckout.totalPrice, isA<num>());
      expect(productCheckout.notes, isA<String>());
    });

    test('should have function copyWith', () {
      expect(updateProduct.notes, productCheckout.notes);
      expect(updateProduct.quantity, productCheckout.quantity);
      expect(updateProduct.totalPrice, productCheckout.totalPrice);
    });

    test("should extends equatable", () {
      expect(productCheckout.props, productCheckout.props);
    });
  });
}
