import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product.dart';

void main() {
  group('Product Entity Test', () {
    const product = Product(
      id: 1,
      name: 'Sushi',
      image: 'Salmon',
      description: 'Pedas',
      price: 15000,
      status: true,
    );
    test('should have correct parameters', () {
      expect(product.id, isA<int>());
      expect(product.name, isA<String>());
      expect(product.image, isA<String>());
      expect(product.description, isA<String>());
      expect(product.price, isA<num>());
      expect(product.status, isA<bool>());
    });

    test("should extends equatable", () {
      expect(product.props, product.props);
    });
  });
}
