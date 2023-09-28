part of 'checkout_bloc.dart';

abstract class CheckoutState extends Equatable {}

class CheckoutInitial extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutLoading extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutSuccess extends CheckoutState {
  @override
  List<Object?> get props => [];
}

class CheckoutConnectionErrorState extends CheckoutState {
  final String message;

  CheckoutConnectionErrorState({required this.message});

  @override
  List<Object> get props => [message];
}

class CheckoutTokenError extends CheckoutState {
  final String message;

  CheckoutTokenError({required this.message});

  @override
  List<Object> get props => [message];
}

class CheckoutError extends CheckoutState {
  final String message;

  CheckoutError({required this.message});

  @override
  List<Object> get props => [message];
}
