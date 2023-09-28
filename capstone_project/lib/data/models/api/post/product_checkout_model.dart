import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';

part 'product_checkout_model.g.dart';

@JsonSerializable()
class ProductCheckoutModel extends Equatable {
  @JsonKey(name: 'product_id')
  final int productId;
  final int quantity;
  final String note;

  const ProductCheckoutModel({
    required this.productId,
    required this.quantity,
    required this.note,
  });

  factory ProductCheckoutModel.fromEntity(
          UserProductCheckout userProductCheckout) =>
      ProductCheckoutModel(
        productId: userProductCheckout.productId,
        quantity: userProductCheckout.quantity,
        note: userProductCheckout.note,
      );

  factory ProductCheckoutModel.fromJson(Map<String, dynamic> json) =>
      _$ProductCheckoutModelFromJson(json);

  Map<String, dynamic> toJson() => _$ProductCheckoutModelToJson(this);

  @override
  List<Object?> get props => [
        productId,
        quantity,
        note,
      ];
}
