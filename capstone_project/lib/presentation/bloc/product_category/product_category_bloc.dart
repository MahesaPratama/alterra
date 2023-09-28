import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';
import 'package:mobile_flutter/domain/usecases/get_product_category.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

part 'product_category_event.dart';
part 'product_category_state.dart';

class ProductCategoryBloc
    extends Bloc<ProductCategoryEvent, ProductCategoryState> {
  final GetProductCategory getProductCategory;
  ProductCategoryBloc(
    this.getProductCategory,
  ) : super(ProductCategoryInitial()) {
    on<GetProductCategoryEvent>((event, emit) async {
      emit(ProductCategoryLoading());
      final result = await getProductCategory.execute(token: event.token);
      result.fold((failure) async {
        if (failure is ConnectionFailure) {
          emit(ProductCategoryConnectionError(message: failure.message));
        } else if (failure is TokenFailure) {
          emit(ProductCategoryTokenError(message: failure.message));
        } else {
          emit(ProductCategoryError(message: failure.message));
        }
      }, (success) {
        if (success.isEmpty) {
          emit(ProductCategoryEmpty());
        } else {
          emit(ProductCategoryLoaded(categories: success));
        }
      });
    });
  }
}
