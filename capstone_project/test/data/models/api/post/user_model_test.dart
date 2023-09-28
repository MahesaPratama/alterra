import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/data/models/api/post/user_model.dart';
import 'package:mobile_flutter/domain/entities/user_login.dart';

import '../../../../fixtures/fixture_reader.dart';

void main() {
  group('User Model Test', () {
    const userModel = UserModel(
      username: 'AMD-4214',
      password: 'testing-kasir',
    );
    const userLogin = UserLogin(
      username: 'AMD-4214',
      password: 'testing-kasir',
    );
    final fromEntity = UserModel.fromEntity(userLogin);
    dynamic response = json.decode(fixture('user_model.json'));
    final fromJson = UserModel.fromJson(response);

    dynamic toJson = fromEntity.toJson();
    final body = json.encode(toJson);

    final toEntity = userModel.toEntity();
    test('should have correct parameters', () {
      expect(userModel.username, isA<String>());
      expect(userModel.password, isA<String>());
    });

    test('should have return valid model from entity', () {
      expect(userModel.username, fromEntity.username);
      expect(userModel.password, fromEntity.password);
    });

    test('should have return valid model from json', () {
      expect(fromJson.username, response['username']);
      expect(fromJson.password, response['password']);
    });

    test('should have return valid model to entity', () {
      expect(userModel.username, toEntity.username);
      expect(userModel.password, toEntity.password);
    });

    test('should have return valid model to json', () {
      expect(body, '{"username":"AMD-4214","password":"testing-kasir"}');
    });

    test("should extends equatable", () {
      expect(userModel.props, userModel.props);
    });
  });
}
