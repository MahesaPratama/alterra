import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class GetUserLocal {
  final Repository repository;

  GetUserLocal(this.repository);
  Future<Either<Failure, UserLogin>> execute() {
    return repository.getUserLocal();
  }
}
