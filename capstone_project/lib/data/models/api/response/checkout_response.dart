import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/data/models/api/meta_model.dart';

part 'checkout_response.g.dart';

@JsonSerializable()
class CheckoutResponse extends Equatable {
  final MetaModel? meta;

  const CheckoutResponse({
    this.meta,
  });

  factory CheckoutResponse.fromJson(Map<String, dynamic> json) =>
      _$CheckoutResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CheckoutResponseToJson(this);

  @override
  List<Object?> get props => [
        meta,
      ];
}
