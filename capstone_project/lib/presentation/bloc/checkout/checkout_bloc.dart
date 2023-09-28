import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/domain/usecases/post_checkout_product.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

part 'checkout_event.dart';
part 'checkout_state.dart';

class CheckoutBloc extends Bloc<CheckoutEvent, CheckoutState> {
  final PostCheckoutProduct postCheckoutProduct;
  CheckoutBloc(this.postCheckoutProduct) : super(CheckoutInitial()) {
    on<CreateCheckoutEvent>((event, emit) async {
      emit(CheckoutLoading());
      final result = await postCheckoutProduct.execute(
        token: event.token,
        userCheckout: event.userCheckout,
      );
      result.fold((failure) async {
        if (failure is ConnectionFailure) {
          emit(CheckoutConnectionErrorState(message: failure.message));
        } else if (failure is TokenFailure) {
          emit(CheckoutTokenError(message: failure.message));
        } else {
          emit(CheckoutError(message: failure.message));
        }
      }, (success) {
        emit(CheckoutSuccess());
      });
    });
  }
}
