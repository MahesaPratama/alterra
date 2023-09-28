import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/domain/usecases/get_product_by_category.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProductByCategory getProductByCategory;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getProductByCategory = GetProductByCategory(mockRepository);
  });

  group('Get Product By Category Usecase Test', () {
    const token = 'test';
    const query = 'category';
    test('should get product by category from repository', () async {
      when(mockRepository.getProductByCategory(
        token: token,
        categoryName: query,
      )).thenAnswer((_) async => const Right(<Product>[]));
      final result = await getProductByCategory.execute(
        token: token,
        query: query,
      );
      expect(result, const Right(<Product>[]));
    });
  });
}
