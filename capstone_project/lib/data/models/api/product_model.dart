import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/domain/entities/product.dart';

part 'product_model.g.dart';

@JsonSerializable()
class ProductModel extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'image_url')
  final String imageUrl;
  final String description;
  final num price;
  final bool status;

  const ProductModel({
    required this.id,
    required this.name,
    required this.imageUrl,
    required this.description,
    required this.price,
    required this.status,
  });
  factory ProductModel.fromJson(Map<String, dynamic> json) =>
      _$ProductModelFromJson(json);

  Product toEntity() {
    return Product(
      id: id,
      name: name,
      image: "http://128.199.206.32:8000/api/v1/$imageUrl",
      description: description,
      price: price,
      status: status,
    );
  }

  @override
  List<Object> get props => [
        id,
        name,
        imageUrl,
        description,
        price,
        status,
      ];
}
