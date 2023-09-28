import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/product_category.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class GetProductCategory {
  final Repository repository;

  GetProductCategory(this.repository);

  Future<Either<Failure, List<ProductCategory>>> execute({
    required String token,
  }) {
    return repository.getProductCategory(token: token);
  }
}
