import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class GetUserToken {
  final Repository repository;

  GetUserToken(this.repository);
  Future<Either<Failure, String>> execute() {
    return repository.getUserToken();
  }
}
