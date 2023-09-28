import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/data/models/api/meta_model.dart';

part 'membership_response.g.dart';

@JsonSerializable()
class MembershipResponse extends Equatable {
  final MetaModel? meta;
  final DataMembershipResponse? data;

  const MembershipResponse({
    required this.meta,
    required this.data,
  });

  factory MembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$MembershipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipResponseToJson(this);

  @override
  List<Object?> get props => [meta, data];
}

@JsonSerializable()
class DataMembershipResponse extends Equatable {
  final int id;
  final String name;
  @JsonKey(name: 'member_code')
  final String memberCode;

  const DataMembershipResponse({
    required this.id,
    required this.name,
    required this.memberCode,
  });

  factory DataMembershipResponse.fromJson(Map<String, dynamic> json) =>
      _$DataMembershipResponseFromJson(json);

  Map<String, dynamic> toJson() => _$DataMembershipResponseToJson(this);

  @override
  List<Object?> get props => [id, name, memberCode];
}
