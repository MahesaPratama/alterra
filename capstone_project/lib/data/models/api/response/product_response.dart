import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/data/models/api/meta_model.dart';
import 'package:mobile_flutter/data/models/api/product_model.dart';

part 'product_response.g.dart';

@JsonSerializable()
class ProductResponse extends Equatable {
  final MetaModel? meta;
  final List<DataProductResponse>? data;

  const ProductResponse({
    this.meta,
    this.data,
  });

  factory ProductResponse.fromJson(Map<String, dynamic> json) =>
      _$ProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ProductResponseToJson(this);

  @override
  List<Object?> get props => [meta, data];
}

@JsonSerializable()
class DataProductResponse extends Equatable {
  @JsonKey(name: 'category_name')
  final String categoryName;
  final List<ProductModel> products;

  const DataProductResponse({
    required this.categoryName,
    required this.products,
  });

  factory DataProductResponse.fromJson(Map<String, dynamic> json) =>
      _$DataProductResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataProductResponseToJson(this);

  @override
  List<Object?> get props => [categoryName, products];
}
