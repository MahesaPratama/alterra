part of 'login_bloc.dart';

abstract class LoginState extends Equatable {}

class LoginInitial extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginLoading extends LoginState {
  @override
  List<Object?> get props => [];
}

class AutoLogin extends LoginState {
  final UserLogin userLogin;

  AutoLogin({required this.userLogin});

  @override
  List<Object?> get props => [userLogin];
}

class LoginLoaded extends LoginState {
  @override
  List<Object?> get props => [];
}

class LoginConnectionErrorState extends LoginState {
  final String message;

  LoginConnectionErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class LoginError extends LoginState {
  final String message;

  LoginError({required this.message});

  @override
  List<Object> get props => [message];
}

class LogoutState extends LoginState {
  @override
  List<Object?> get props => [];
}
