import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';

void main() {
  group('UserLogin Entity Test', () {
    const userLogin = UserLogin(
      username: 'mintox',
      password: '123456',
    );
    test('should have correct parameters', () {
      expect(userLogin.username, isA<String>());
      expect(userLogin.password, isA<String>());
    });

    test("should extends equatable", () {
      expect(userLogin.props, userLogin.props);
    });
  });
}
