import 'package:mobile_flutter/domain/repositories/repository.dart';

class GetStatusOnboarding {
  final Repository repository;

  GetStatusOnboarding(this.repository);

  Future<bool> execute() {
    return repository.getStatusOnboarding();
  }
}
