import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/domain/usecases/get_product_by_category.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

part 'product_event.dart';
part 'product_state.dart';

class ProductBloc extends Bloc<ProductEvent, ProductState> {
  final GetProductByCategory getProductByCategory;
  ProductBloc(
    this.getProductByCategory,
  ) : super(ProductInitial()) {
    on<GetProductEvent>((event, emit) async {
      emit(ProductLoading());
      final result = await getProductByCategory.execute(
        token: event.token,
        query: event.category,
      );
      result.fold((failure) async {
        if (failure is ConnectionFailure) {
          emit(ProductConnectionError(message: failure.message));
        } else if (failure is TokenFailure) {
          emit(ProductTokenError(message: failure.message));
        } else {
          emit(ProductError(message: failure.message));
        }
      }, (success) {
        if (success.isEmpty) {
          emit(ProductEmpty());
        } else {
          emit(ProductLoaded(products: success));
        }
      });
    });
  }
}
