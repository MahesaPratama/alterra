import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/data/models/api/category_model.dart';
import 'package:mobile_flutter/data/models/api/meta_model.dart';

part 'category_response.g.dart';

@JsonSerializable()
class CategoryResponse extends Equatable {
  final MetaModel? meta;
  final List<CategoryModel>? data;

  const CategoryResponse({
    this.meta,
    this.data,
  });

  factory CategoryResponse.fromJson(Map<String, dynamic> json) =>
      _$CategoryResponseFromJson(json);

  Map<String, dynamic> toJson() => _$CategoryResponseToJson(this);

  @override
  List<Object?> get props => [meta, data];
}
