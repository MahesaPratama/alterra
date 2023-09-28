part of 'login_bloc.dart';

abstract class LoginEvent extends Equatable {
  const LoginEvent();
}

class AutoLoginEvent extends LoginEvent {
  @override
  List<Object?> get props => [];
}

class PostLoginEvent extends LoginEvent {
  final UserLogin userLogin;

  const PostLoginEvent({required this.userLogin});

  @override
  List<Object> get props => [userLogin];
}

class LogoutEvent extends LoginEvent {
  @override
  List<Object> get props => [];
}
