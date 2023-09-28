part of 'checkout_bloc.dart';

abstract class CheckoutEvent extends Equatable {
  const CheckoutEvent();
}

class CreateCheckoutEvent extends CheckoutEvent {
  final String token;
  final UserCheckout userCheckout;

  const CreateCheckoutEvent({
    required this.token,
    required this.userCheckout,
  });

  @override
  List<Object?> get props => [token, userCheckout];
}
