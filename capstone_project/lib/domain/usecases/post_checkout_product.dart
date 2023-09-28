import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class PostCheckoutProduct {
  final Repository repository;

  PostCheckoutProduct(this.repository);

  Future<Either<Failure, String>> execute({
    required String token,
    required UserCheckout userCheckout,
  }) {
    return repository.postCheckout(
      token: token,
      userCheckout: userCheckout,
    );
  }
}
