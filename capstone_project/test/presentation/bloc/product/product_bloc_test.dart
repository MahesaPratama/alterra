import 'package:bloc_test/bloc_test.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/presentation/bloc/product/product_bloc.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mockito/mockito.dart';

import '../../../helpers/test_helper.mocks.dart';

void main() {
  late ProductBloc productBloc;
  late MockGetProductByCategory mockGetProductByCategory;

  setUp(() {
    mockGetProductByCategory = MockGetProductByCategory();
    productBloc = ProductBloc(mockGetProductByCategory);
  });

  group('Product Bloc Test', () {
    const token = 'token';
    const query = 'category';
    List<Product> products = const [
      Product(
        id: 1,
        name: 'Sushi 1',
        image: 'image.jpg',
        description: 'Test Sushi',
        price: 20,
        status: true,
      ),
      Product(
        id: 2,
        name: 'Sushi 2',
        image: 'image2.jpg',
        description: 'Test Sushi 2',
        price: 20,
        status: true,
      ),
    ];
    test('initial state should return ProductInitial', () {
      expect(
        ProductBloc(mockGetProductByCategory).state,
        ProductInitial(),
      );
    });
    test('GetProductEvent props should return correct values', () {
      const event = GetProductEvent(token: token, category: query);
      expect(event.props, [token, query]);
    });

    blocTest<ProductBloc, ProductState>(
      'emits [ProductLoaded] when GetProductEvent is added and data not empty',
      build: () {
        when(mockGetProductByCategory.execute(
          token: token,
          query: query,
        )).thenAnswer((_) async => Right(products));
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent(
        token: token,
        category: query,
      )),
      expect: () => <ProductState>[
        ProductLoading(),
        ProductLoaded(products: products),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductEmpty] when GetProductEvent is added and data is empty',
      build: () {
        when(mockGetProductByCategory.execute(
          token: token,
          query: query,
        )).thenAnswer((_) async => const Right(<Product>[]));
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent(
        token: token,
        category: query,
      )),
      expect: () => <ProductState>[
        ProductLoading(),
        ProductEmpty(),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductConnectionError] when GetProductEvent is added but connection is not established',
      build: () {
        when(mockGetProductByCategory.execute(
          token: token,
          query: query,
        )).thenAnswer((_) async => const Left(ConnectionFailure(
              'You seem to be offline. Please check your internet connection and try again.',
            )));
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent(
        token: token,
        category: query,
      )),
      expect: () => <ProductState>[
        ProductLoading(),
        ProductConnectionError(
          message:
              'You seem to be offline. Please check your internet connection and try again.',
        ),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductTokenError] when GetProductEvent is added but token is expired',
      build: () {
        when(mockGetProductByCategory.execute(
          token: token,
          query: query,
        )).thenAnswer((_) async => const Left(TokenFailure(
              'Token is Expired',
            )));
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent(
        token: token,
        category: query,
      )),
      expect: () => <ProductState>[
        ProductLoading(),
        ProductTokenError(
          message: 'Token is Expired',
        ),
      ],
    );

    blocTest<ProductBloc, ProductState>(
      'emits [ProductError] when GetProductEvent is added but failure',
      build: () {
        when(mockGetProductByCategory.execute(
          token: token,
          query: query,
        )).thenAnswer((_) async => const Left(ServerFailure(
              'Response Failure',
            )));
        return productBloc;
      },
      act: (bloc) => bloc.add(const GetProductEvent(
        token: token,
        category: query,
      )),
      expect: () => <ProductState>[
        ProductLoading(),
        ProductError(
          message: 'Response Failure',
        ),
      ],
    );
  });
}
