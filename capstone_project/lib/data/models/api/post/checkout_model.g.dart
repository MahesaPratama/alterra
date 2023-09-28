// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'checkout_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CheckoutModel _$CheckoutModelFromJson(Map<String, dynamic> json) =>
    CheckoutModel(
      name: json['name'] as String,
      memberCode: json['member_code'] as String?,
      orderOption: json['order_option'] as String,
      numberTable: json['number_table'] as int,
      payment: json['payment'] as String,
      items: (json['items'] as List<dynamic>)
          .map((e) => ProductCheckoutModel.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$CheckoutModelToJson(CheckoutModel instance) =>
    <String, dynamic>{
      'name': instance.name,
      'member_code': instance.memberCode,
      'order_option': instance.orderOption,
      'number_table': instance.numberTable,
      'payment': instance.payment,
      'items': instance.items,
    };
