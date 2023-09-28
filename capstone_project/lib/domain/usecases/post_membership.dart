import 'package:dartz/dartz.dart';
import 'package:mobile_flutter/domain/entities/membership.dart';
import 'package:mobile_flutter/domain/repositories/repository.dart';
import 'package:mobile_flutter/utils/error/failure.dart';

class PostMembership {
  final Repository repository;

  PostMembership(this.repository);

  Future<Either<Failure, String>> execute({
    required String token,
    required Membership membership,
  }) {
    return repository.postMembership(
      token: token,
      membership: membership,
    );
  }
}
