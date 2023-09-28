import 'package:equatable/equatable.dart';
import 'package:json_annotation/json_annotation.dart';

part 'login_model.g.dart';

@JsonSerializable()
class LoginModel extends Equatable {
  final String username;
  @JsonKey(name: 'user_code')
  final String userCode;
  final String token;

  const LoginModel({
    required this.username,
    required this.userCode,
    required this.token,
  });

  factory LoginModel.fromJson(Map<String, dynamic> json) =>
      _$LoginModelFromJson(json);

  Map<String, dynamic> toJson() => _$LoginModelToJson(this);

  @override
  List<Object> get props => [
        username,
        userCode,
        token,
      ];
}
