import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/domain/entities/product_checkout.dart';

abstract class CreateOrderEvent extends Equatable {
  const CreateOrderEvent();
}

class NameOrderEvent extends CreateOrderEvent {
  final String name;
  final String takeOrder;
  final int? tableNumber;

  const NameOrderEvent({
    required this.name,
    required this.takeOrder,
    this.tableNumber,
  });

  @override
  List<Object?> get props => [name, takeOrder, tableNumber];
}

class ProductOrderEvent extends CreateOrderEvent {
  final ProductCheckout productCheckout;

  const ProductOrderEvent({
    required this.productCheckout,
  });

  @override
  List<Object?> get props => [productCheckout];
}

class PaymentOrderEvent extends CreateOrderEvent {
  final String payment;

  const PaymentOrderEvent({
    required this.payment,
  });

  @override
  List<Object?> get props => [payment];
}

class MemberOrderEvent extends CreateOrderEvent {
  final String memberCode;

  const MemberOrderEvent({
    required this.memberCode,
  });

  @override
  List<Object?> get props => [memberCode];
}

class ClearOrderEvent extends CreateOrderEvent {
  @override
  List<Object?> get props => [];
}
