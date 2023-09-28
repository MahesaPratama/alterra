import 'package:mobile_flutter/domain/repositories/repository.dart';

class PostLogout {
  final Repository repository;

  PostLogout(this.repository);

  Future<bool> execute() {
    return repository.postLogout();
  }
}
