import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/domain/entities/product_checkout.dart';

class CreateOrderState extends Equatable {
  final String name;
  final String memberCode;
  final String takeOrder;
  final int tableNumber;
  final String payment;
  final List<ProductCheckout> productsCheckout;
  final num subTotal;
  final num grandTotal;

  const CreateOrderState({
    required this.name,
    required this.memberCode,
    required this.takeOrder,
    required this.tableNumber,
    required this.payment,
    required this.productsCheckout,
    required this.subTotal,
    required this.grandTotal,
  });

  factory CreateOrderState.initial() {
    return const CreateOrderState(
      name: '',
      memberCode: '',
      takeOrder: '',
      tableNumber: 0,
      payment: '',
      productsCheckout: [],
      subTotal: 0,
      grandTotal: 0,
    );
  }

  CreateOrderState copyWith({
    String? name,
    String? memberCode,
    String? takeOrder,
    int? tableNumber,
    String? payment,
    List<ProductCheckout>? productsCheckout,
    num? subTotal,
    num? grandTotal,
  }) {
    return CreateOrderState(
      name: name ?? this.name,
      memberCode: memberCode ?? this.memberCode,
      takeOrder: takeOrder ?? this.takeOrder,
      tableNumber: tableNumber ?? this.tableNumber,
      payment: payment ?? this.payment,
      productsCheckout: productsCheckout ?? this.productsCheckout,
      subTotal: subTotal ?? this.subTotal,
      grandTotal: grandTotal ?? this.grandTotal,
    );
  }

  @override
  List<Object?> get props => [
        name,
        memberCode,
        takeOrder,
        tableNumber,
        payment,
        productsCheckout,
        subTotal,
        grandTotal,
      ];
}
