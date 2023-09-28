import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';
import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/domain/entities/user_checkout.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/utils/error/failure.dart';
import 'package:mobile_flutter/domain/entities/sales_report.dart';

abstract class Repository {
  Future<bool> getStatusOnboarding();
  Future<bool> setStatusOnboarding(bool status);
  Future<Either<Failure, SalesReport>> getSalesReport({required String query});
  Future<Either<Failure, String>> postLogin({required UserLogin userLogin});
  Future<bool> postLogout();
  Future<Either<Failure, UserLogin>> getUserLocal();
  Future<Either<Failure, String>> getUserToken();
  Future<Either<Failure, List<ProductCategory>>> getProductCategory({
    required String token,
  });
  Future<Either<Failure, List<Product>>> getProductByCategory({
    required String token,
    required String categoryName,
  });
  Future<Either<Failure, String>> postMembership({
    required String token,
    required Membership membership,
  });
  Future<Either<Failure, String>> postCheckout({
    required String token,
    required UserCheckout userCheckout,
  });
}
