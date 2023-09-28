part of 'product_bloc.dart';

abstract class ProductState extends Equatable {}

class ProductInitial extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoading extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductEmpty extends ProductState {
  @override
  List<Object?> get props => [];
}

class ProductLoaded extends ProductState {
  final List<Product> products;

  ProductLoaded({required this.products});

  @override
  List<Object> get props => [products];
}

class ProductConnectionError extends ProductState {
  final String message;

  ProductConnectionError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductTokenError extends ProductState {
  final String message;

  ProductTokenError({required this.message});

  @override
  List<Object> get props => [message];
}

class ProductError extends ProductState {
  final String message;

  ProductError({required this.message});

  @override
  List<Object> get props => [message];
}
