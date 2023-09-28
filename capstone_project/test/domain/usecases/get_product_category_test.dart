import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';
import 'package:mobile_flutter/domain/usecases/get_product_category.dart';
import 'package:mockito/mockito.dart';

import '../../helpers/test_helper.mocks.dart';

void main() {
  late GetProductCategory getProductCategory;
  late MockRepository mockRepository;

  setUp(() {
    mockRepository = MockRepository();
    getProductCategory = GetProductCategory(mockRepository);
  });

  group('Get Product Category Usecase Test', () {
    const token = 'test';

    test('should get product category from repository', () async {
      when(mockRepository.getProductCategory(
        token: token,
      )).thenAnswer((_) async => const Right(<ProductCategory>[]));
      final result = await getProductCategory.execute(
        token: token,
      );
      expect(result, const Right(<ProductCategory>[]));
    });
  });
}
