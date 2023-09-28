import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';
import 'package:mobile_flutter/presentation/bloc/product_category/product_category_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ProductCategoryBloc productCategoryBloc;
  late MockGetProductCategory mockGetProductCategory;

  setUp(() {
    mockGetProductCategory = MockGetProductCategory();
    productCategoryBloc = ProductCategoryBloc(mockGetProductCategory);
  });

  group('Product Category Bloc Test', () {
    const token = 'token';
    const categories = [
      ProductCategory(id: 1, name: 'test'),
      ProductCategory(id: 2, name: 'test'),
      ProductCategory(id: 3, name: 'test'),
    ];
    test('initial state should return ProductCategoryInitial', () {
      expect(
        ProductCategoryBloc(mockGetProductCategory).state,
        ProductCategoryInitial(),
      );
    });

    test('CreateCheckoutEvent props should return correct values', () {
      const event = GetProductCategoryEvent(token: token);
      expect(event.props, [token]);
    });

    blocTest<ProductCategoryBloc, ProductCategoryState>(
      'emits [ProductCategoryLoaded] when GetProductCategoryEvent is added and data not empty',
      build: () {
        when(mockGetProductCategory.execute(
          token: token,
        )).thenAnswer((_) async => const Right(categories));
        return productCategoryBloc;
      },
      act: (bloc) => bloc.add(const GetProductCategoryEvent(
        token: token,
      )),
      expect: () => <ProductCategoryState>[
        ProductCategoryLoading(),
        ProductCategoryLoaded(categories: categories)
      ],
    );

    blocTest<ProductCategoryBloc, ProductCategoryState>(
      'emits [ProductCategoryEmpty] when GetProductCategoryEvent is added but data is empty',
      build: () {
        when(mockGetProductCategory.execute(
          token: token,
        )).thenAnswer((_) async => const Right(<ProductCategory>[]));
        return productCategoryBloc;
      },
      act: (bloc) => bloc.add(const GetProductCategoryEvent(
        token: token,
      )),
      expect: () => <ProductCategoryState>[
        ProductCategoryLoading(),
        ProductCategoryEmpty()
      ],
    );

    blocTest<ProductCategoryBloc, ProductCategoryState>(
      'emits [ProductCategoryConnectionError] when GetProductCategoryEvent is added but connection is not established',
      build: () {
        when(mockGetProductCategory.execute(
          token: token,
        )).thenAnswer((_) async => const Left(ConnectionFailure(
              'You seem to be offline. Please check your internet connection and try again.',
            )));
        return productCategoryBloc;
      },
      act: (bloc) => bloc.add(const GetProductCategoryEvent(
        token: token,
      )),
      expect: () => <ProductCategoryState>[
        ProductCategoryLoading(),
        ProductCategoryConnectionError(
          message:
              'You seem to be offline. Please check your internet connection and try again.',
        ),
      ],
    );

    blocTest<ProductCategoryBloc, ProductCategoryState>(
      'emits [ProductCategoryTokenError] when GetProductCategoryEvent is added but token is expired',
      build: () {
        when(mockGetProductCategory.execute(
          token: token,
        )).thenAnswer((_) async => const Left(TokenFailure(
              'Token is Expired',
            )));
        return productCategoryBloc;
      },
      act: (bloc) => bloc.add(const GetProductCategoryEvent(
        token: token,
      )),
      expect: () => <ProductCategoryState>[
        ProductCategoryLoading(),
        ProductCategoryTokenError(
          message: 'Token is Expired',
        ),
      ],
    );

    blocTest<ProductCategoryBloc, ProductCategoryState>(
      'emits [ProductCategoryError] when GetProductCategoryEvent is added but failure',
      build: () {
        when(mockGetProductCategory.execute(
          token: token,
        )).thenAnswer((_) async => const Left(ServerFailure(
              'Response Failure',
            )));
        return productCategoryBloc;
      },
      act: (bloc) => bloc.add(const GetProductCategoryEvent(
        token: token,
      )),
      expect: () => <ProductCategoryState>[
        ProductCategoryLoading(),
        ProductCategoryError(
          message: 'Response Failure',
        ),
      ],
    );
  });
}
