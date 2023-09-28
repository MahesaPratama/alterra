import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/data/models/api/post/product_checkout_model.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';

part 'checkout_model.g.dart';

@JsonSerializable()
class CheckoutModel extends Equatable {
  final String name;
  @JsonKey(name: 'member_code')
  final String? memberCode;
  @JsonKey(name: 'order_option')
  final String orderOption;
  @JsonKey(name: 'number_table')
  final int numberTable;
  final String payment;
  final List<ProductCheckoutModel> items;

  const CheckoutModel({
    required this.name,
    this.memberCode,
    required this.orderOption,
    required this.numberTable,
    required this.payment,
    required this.items,
  });

  factory CheckoutModel.fromEntity(UserCheckout userCheckout) => CheckoutModel(
        name: userCheckout.name,
        memberCode: userCheckout.memberCode,
        orderOption: userCheckout.orderOption,
        numberTable: userCheckout.numberTable,
        payment: userCheckout.payment,
        items: userCheckout.items
            .map((e) => ProductCheckoutModel.fromEntity(e))
            .toList(),
      );

  factory CheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$CheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutModelToJson(this);

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
