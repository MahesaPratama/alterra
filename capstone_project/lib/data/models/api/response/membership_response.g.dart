// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'membership_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

MembershipResponse _$MembershipResponseFromJson(Map<String, dynamic> json) =>
    MembershipResponse(
      meta: json['meta'] == null
          ? null
          : MetaModel.fromJson(json['meta'] as Map<String, dynamic>),
      data: json['data'] == null
          ? null
          : DataMembershipResponse.fromJson(
              json['data'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$MembershipResponseToJson(MembershipResponse instance) =>
    <String, dynamic>{
      'meta': instance.meta,
      'data': instance.data,
    };

DataMembershipResponse _$DataMembershipResponseFromJson(
        Map<String, dynamic> json) =>
    DataMembershipResponse(
      id: json['id'] as int,
      name: json['name'] as String,
      memberCode: json['member_code'] as String,
    );

Map<String, dynamic> _$DataMembershipResponseToJson(
        DataMembershipResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'member_code': instance.memberCode,
    };
