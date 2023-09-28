// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product_checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

ProductCheckoutModel _$ProductCheckoutModelFromJson(
        Map<String, dynamic> json) =>
    ProductCheckoutModel(
      productId: json['product_id'] as int,
      quantity: json['quantity'] as int,
      note: json['note'] as String,
    );

Map<String, dynamic> _$ProductCheckoutModelToJson(
        ProductCheckoutModel instance) =>
    <String, dynamic>{
      'product_id': instance.productId,
      'quantity': instance.quantity,
      'note': instance.note,
    };
