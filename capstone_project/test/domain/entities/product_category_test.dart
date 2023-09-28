import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';

void main() {
  group('Product Category Entity Test', () {
    const productCategory = ProductCategory(
      id: 1,
      name: 'irham',
    );
    test('should have correct parameters', () {
      expect(productCategory.id, isA<int>());
      expect(productCategory.name, isA<String>());
    });

    test("should extends equatable", () {
      expect(productCategory.props, productCategory.props);
    });
  });
}
