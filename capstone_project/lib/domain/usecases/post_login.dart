import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class PostLogin {
  final Repository repository;

  PostLogin(this.repository);
  Future<Either<Failure, String>> execute({required UserLogin userLogin}) {
    return repository.postLogin(userLogin: userLogin);
  }
}
