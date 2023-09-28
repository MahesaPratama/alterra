import 'package:mobile_flutter/domain/repositories/repository.dart';

class SetStatusOnboarding {
  final Repository repository;

  SetStatusOnboarding(this.repository);

  Future<bool> execute(bool status) {
    return repository.setStatusOnboarding(status);
  }
}
