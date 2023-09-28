part of 'product_category_bloc.dart';

abstract class ProductCategoryState extends Equatable {}

class ProductCategoryInitial extends ProductCategoryState {
  @override
  List<Object?> get props => [];
}

class ProductCategoryLoading extends ProductCategoryState {
  @override
  List<Object?> get props => [];
}

class ProductCategoryEmpty extends ProductCategoryState {
  @override
  List<Object?> get props => [];
}

class ProductCategoryLoaded extends ProductCategoryState {
  final List<ProductCategory> categories;

  ProductCategoryLoaded({required this.categories});

  @override
  List<Object> get props => [categories];
}

class ProductCategoryConnectionError extends ProductCategoryState {
  final String message;

  ProductCategoryConnectionError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductCategoryTokenError extends ProductCategoryState {
  final String message;

  ProductCategoryTokenError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductCategoryError extends ProductCategoryState {
  final String message;

  ProductCategoryError({required this.message});

  @override
  List<Object> get props => [message];
}
