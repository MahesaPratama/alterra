class ServerException implements Exception {
  final String message;

  ServerException({required this.message});
}

class TokenException implements Exception {
  final String message;

  TokenException({required this.message});
}

class DatabaseException implements Exception {}

class MockServerException implements Exception {}
