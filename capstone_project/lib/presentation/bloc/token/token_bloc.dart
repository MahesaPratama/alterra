import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/usecases/get_user_token.dart';

part 'token_event.dart';
part 'token_state.dart';

class TokenBloc extends Bloc<TokenEvent, TokenState> {
  final GetUserToken getUserToken;
  TokenBloc(this.getUserToken) : super(TokenState.initial()) {
    on<GetTokenEvent>((event, emit) async {
      final result = await getUserToken.execute();
      result.fold((failure) {
        emit(state.copyWith(token: failure.message));
      }, (token) async {
        emit(state.copyWith(token: token));
      });
    });
  }
}
