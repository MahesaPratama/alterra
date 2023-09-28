import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_model.g.dart';

@JsonSerializable()
class MetaModel extends Equatable {
  final num code;
  final String status;
  final String message;

  const MetaModel({
    required this.code,
    required this.status,
    required this.message,
  });

  factory MetaModel.fromJson(Map<String, dynamic> json) =>
      _$MetaModelFromJson(json);

  @override
  List<Object> get props => [
        code,
        status,
        message,
      ];
}
