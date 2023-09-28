import 'dart:convert';

import 'package:flutter_test/flutter_test.dart';
import 'package:mobile_flutter/data/models/api/meta_model.dart';

import '../../../fixtures/fixture_reader.dart';

void main() {
  group('Meta Model Test', () {
    const metaModel = MetaModel(
      code: 200,
      status: 'OK',
      message: 'Success',
    );
    dynamic response = json.decode(fixture('meta_model.json'));
    final fromJson = MetaModel.fromJson(response);
    test('should have correct parameters', () {
      expect(metaModel.code, isA<num>());
      expect(metaModel.status, isA<String>());
      expect(metaModel.message, isA<String>());
    });

    test('should have return valid model from json', () {
      expect(fromJson.code, response['code']);
      expect(fromJson.status, response['status']);
      expect(fromJson.message, response['message']);
    });

    test('should have return valid model from json', () {
      expect(fromJson.code, response['code']);
      expect(fromJson.status, response['status']);
      expect(fromJson.message, response['message']);
    });

    test("should extends equatable", () {
      expect(metaModel.props, metaModel.props);
    });
  });
}
