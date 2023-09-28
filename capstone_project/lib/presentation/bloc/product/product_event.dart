part of 'product_bloc.dart';

abstract class ProductEvent extends Equatable {
  const ProductEvent();
}

class GetProductEvent extends ProductEvent {
  final String token;
  final String category;

  const GetProductEvent({
    required this.token,
    required this.category,
  });
  @override
  List<Object> get props => [token, category];
}
