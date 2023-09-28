import 'package:equatable/equatable.dart';

class UserLogin extends Equatable {
  final String username;
  final String password;

  const UserLogin({
    required this.username,
    required this.password,
  });

  @override
  List<Object> get props => [
        username,
        password,
      ];
}
