part of 'token_bloc.dart';

abstract class TokenEvent extends Equatable {
  const TokenEvent();
}

class GetTokenEvent extends TokenEvent {
  @override
  List<Object?> get props => [];
}
