import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';

part 'membership_model.g.dart';

@JsonSerializable()
class MembershipModel extends Equatable {
  final String name;
  final String email;
  final int phone;
  @JsonKey(name: 'birth_day')
  final String birthDay;

  const MembershipModel({
    required this.name,
    required this.email,
    required this.phone,
    required this.birthDay,
  });

  factory MembershipModel.fromEntity(Membership membership) => MembershipModel(
        name: membership.name,
        email: membership.email,
        phone: membership.phone,
        birthDay: membership.birthDay,
      );

  factory MembershipModel.fromJson(Map<String, dynamic> json) =>
      _$MembershipModelFromJson(json);

  Map<String, dynamic> toJson() => _$MembershipModelToJson(this);

  @override
  List<Object?> get props => [name, email, phone, birthDay];
}
