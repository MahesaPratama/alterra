import 'package:equatable/equatable.dart';
import 'package:mobile_flutter/domain/entities/product_checkout.dart';

class UserCheckout extends Equatable {
  final String name;
  final String? memberCode;
  final String orderOption;
  final int numberTable;
  final String payment;
  final List<UserProductCheckout> items;

  const UserCheckout({
    required this.name,
    this.memberCode,
    required this.orderOption,
    required this.numberTable,
    required this.payment,
    required this.items,
  });

  @override
  List<Object?> get props => [
        name,
        memberCode,
        orderOption,
        numberTable,
        payment,
        items,
      ];
}

class UserProductCheckout extends Equatable {
  final int productId;
  final int quantity;
  final String note;

  const UserProductCheckout({
    required this.productId,
    required this.quantity,
    required this.note,
  });

  factory UserProductCheckout.fromProductCheckout(
          ProductCheckout productCheckout) =>
      UserProductCheckout(
        productId: productCheckout.productId,
        quantity: productCheckout.quantity,
        note: productCheckout.notes,
      );

  @override
  List<Object?> get props => [
        productId,
        quantity,
        note,
      ];
}
