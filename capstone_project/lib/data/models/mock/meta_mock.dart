import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'meta_mock.g.dart';

@JsonSerializable()
class MetaMock extends Equatable {
  final num code;
  final String status;
  final String message;

  const MetaMock({
    required this.code,
    required this.status,
    required this.message,
  });

  factory MetaMock.fromJson(Map<String, dynamic> json) =>
      _$MetaMockFromJson(json);

  @override
  List<Object> get props => [
        code,
        status,
        message,
      ];
}
