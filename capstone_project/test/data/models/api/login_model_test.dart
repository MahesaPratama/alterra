import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/data/models/api/login_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('Login Model Test', () {
    const loginModel = LoginModel(
      username: 'KASIR-123',
      userCode: 'KASIR-123',
      token: 'Token 1',
    );
    dynamic responseValid = json.decode(fixture('login_model.json'));
    final fromJson = LoginModel.fromJson(responseValid);
    dynamic toJson = loginModel.toJson();
    final body = json.encode(toJson);

    test('should have correct parameters', () {
      expect(loginModel.username, isA<String>());
      expect(loginModel.userCode, isA<String>());
      expect(loginModel.token, isA<String>());
    });

    test('should have return valid model from json', () {
      expect(fromJson.username, responseValid['username']);
      expect(fromJson.userCode, responseValid['user_code']);
      expect(fromJson.token, responseValid['token']);
    });

    test('should have return valid model to json', () {
      expect(body,
          '{"username":"KASIR-123","user_code":"KASIR-123","token":"Token 1"}');
    });

    test("should extends equatable", () {
      expect(loginModel.props, loginModel.props);
    });
  });
}
