part of 'token_bloc.dart';

class TokenState extends Equatable {
  final String token;

  const TokenState({
    required this.token,
  });

  factory TokenState.initial() {
    return const TokenState(token: '');
  }

  TokenState copyWith({
    String? token,
  }) {
    return TokenState(token: token ?? this.token);
  }

  @override
  List<Object> get props => [token];
}
