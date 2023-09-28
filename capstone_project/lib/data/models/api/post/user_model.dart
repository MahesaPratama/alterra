import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';

part 'user_model.g.dart';

@JsonSerializable()
class UserModel extends Equatable {
  final String username;
  final String password;

  const UserModel({
    required this.username,
    required this.password,
  });

  factory UserModel.fromEntity(UserLogin userLogin) => UserModel(
        username: userLogin.username,
        password: userLogin.password,
      );

  factory UserModel.fromJson(Map<String, dynamic> json) =>
      _$UserModelFromJson(json);

  UserLogin toEntity() {
    return UserLogin(
      username: username,
      password: password,
    );
  }

  Map<String, dynamic> toJson() => _$UserModelToJson(this);

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
