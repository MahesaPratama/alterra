import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/product.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class GetProductByCategory {
  final Repository repository;

  GetProductByCategory(this.repository);

  Future<Either<Failure, List<Product>>> execute({
    required String token,
    required String query,
  }) {
    return repository.getProductByCategory(
      token: token,
      categoryName: query,
    );
  }
}
