import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/domain/usecases/get_user_local.dart';
import 'package:mobile_flutter/domain/usecases/post_login.dart';
import 'package:mobile_flutter/domain/usecases/post_logout.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

part 'login_event.dart';
part 'login_state.dart';

class LoginBloc extends Bloc<LoginEvent, LoginState> {
  final PostLogin postLogin;
  final GetUserLocal getUserLocal;
  final PostLogout postLogout;
  LoginBloc(
    this.postLogin,
    this.getUserLocal,
    this.postLogout,
  ) : super(LoginInitial()) {
    on<PostLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await postLogin.execute(userLogin: event.userLogin);
      result.fold((failure) {
        if (failure is ConnectionFailure) {
          emit(LoginConnectionErrorState(message: failure.message));
        } else {
          emit(LoginError(message: failure.message));
        }
      }, (success) {
        emit(LoginLoaded());
      });
    });

    on<AutoLoginEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await getUserLocal.execute();
      result.fold((failure) {
        emit(LoginError(message: failure.message));
      }, (success) {
        emit(AutoLogin(userLogin: success));
      });
    });

    on<LogoutEvent>((event, emit) async {
      emit(LoginLoading());
      final result = await postLogout.execute();
      if (result) {
        emit(LogoutState());
      }
    });
  }
}
