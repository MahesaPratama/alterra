part of 'product_category_bloc.dart';

abstract class ProductCategoryEvent extends Equatable {
  const ProductCategoryEvent();
}

class GetProductCategoryEvent extends ProductCategoryEvent {
  final String token;

  const GetProductCategoryEvent({required this.token});
  @override
  List<Object> get props => [token];
}
